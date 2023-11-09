# =================== #
# Deploying VMware VM #
# =================== #

# Connect to VMware vSphere vCenter

terraform {
  required_providers {
    vsphere = {
      source = "hashicorp/vsphere"
      version = "2.5.1"
    }
  }
}

provider "vsphere" {
  vim_keep_alive = 30
  user           = var.vsphere-user
  password       = var.vsphere-password
  vsphere_server = var.vsphere-vcenter

  # If you have a self-signed cert
  allow_unverified_ssl = var.vsphere-unverified-ssl
}

# Define VMware vSphere 
data "vsphere_datacenter" "dc" {
  name = var.vsphere-datacenter
}

data "vsphere_datastore" "datastore" {
  name          = var.vm-datastore
  datacenter_id = data.vsphere_datacenter.dc.id
}

# data "vsphere_compute_cluster" "cluster" {
#   name          = var.vsphere-cluster
#   datacenter_id = data.vsphere_datacenter.dc.id
# }

data "vsphere_host" "host" {
  name          = var.vsphere-host
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "network" {
  name          = var.vm-network
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_virtual_machine" "template" {
  name          = "/${var.vsphere-datacenter}/vm/${var.vsphere-template-folder}/${var.vm-template-name}"
  datacenter_id = data.vsphere_datacenter.dc.id
}

# Create VMs
resource "vsphere_virtual_machine" "vm" {
  count = var.vm-count

  name             = "${var.vm-name}-${count.index + 1}"
  resource_pool_id = data.vsphere_host.host.resource_pool_id
  datastore_id     = data.vsphere_datastore.datastore.id

  num_cpus = var.vm-cpu
  memory   = var.vm-ram
  guest_id = var.vm-guest-id

  network_interface {
    network_id = data.vsphere_network.network.id
    adapter_type = "vmxnet3"
  }

  disk {
    label = "${var.vm-name}-${count.index + 1}-disk"
    thin_provisioned = false
    eagerly_scrub = true
    size  = 50
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.template.id
    customize {
      linux_options {
        host_name = "${var.vm-name}-${count.index + 1}"
        domain    = var.vm-domain
      }     
      network_interface {
        ipv4_address = "10.200.200.11"
        # ipv4_netmask = "255.255.255.0"
        # ipv4_gateway = "10.200.200.250"
        dns_server_list = ["10.200.200.10", "10.210.210.10"]
      }
      timeout = 5
    }
  }
}