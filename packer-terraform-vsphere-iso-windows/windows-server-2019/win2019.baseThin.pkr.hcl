#Principal file for Packer

packer {
  required_plugins {
    vsphere = {
      version = ">= 1.1.1"
      source  = "github.com/hashicorp/vsphere"
    }
  }
}


##################################################################################
# VARIABLES
##################################################################################

# Virtual Machine Settings

variable "vm_name" {
  type        = string
  description = "The template vm name"
  default     = ""
}

variable "vm_guest_os_type" {
  type        = string
  description = "The guest operating system type, also know as guestid."
  default     = ""
}

variable "vm_cpu_sockets" {
  type        = number
  description = "The number of virtual CPUs sockets."
}

variable "vm_disk_size" {
  type        = number
  description = "The size for the virtual disk in MB."
}

variable "vm_mem_size" {
  type        = number
  description = "The size for the virtual memory in MB."
}

variable "vm_disk_controller_type" {
  type        = list(string)
  description = "The virtual disk controller types in sequence."
  default     = []
}

variable "vm_network_card" {
  type        = string
  description = "The virtual network card type."
  default     = ""
}

variable "thin_provision" {
  type        = bool
  description = "Thin or Thick provisioning of the disk"
  default     = true
}


# vSphere Objects

variable "vcenter_cluster" {
  type        = string
  description = "The cluster where target VM is created."
  default     = ""
}

variable "vcenter_datacenter" {
  type        = string
  description = "Required if there is more than one datacenter in vCenter."
  default     = ""
}

variable "vcenter_datastore" {
  type        = string
  description = "Required for clusters, or if the target host has multiple datastores."
  default     = ""
}

variable "vcenter_insecure_connection" {
  type        = bool
  description = "If true, does not validate the vCenter server's TLS certificate."
  default     = true
}

variable "vcenter_folder" {
  type    = string
  default = "Templates"
}

variable "vcenter_network" {
  type        = string
  description = "The network segment or port group name to which the primary virtual network adapter will be connected."
  default     = ""
}

variable "vcenter_password" {
  type        = string
  description = "The plaintext password for authenticating to vCenter."
  default     = ""
  sensitive   = true
}

variable "vcenter_server" {
  type        = string
  description = "The fully qualified domain name or IP address of the vCenter Server instance."
  default     = ""
}

variable "vcenter_username" {
  type        = string
  description = "The username for authenticating to vCenter."
  default     = ""
  sensitive   = true
}

variable "vcenter_host" {
  type        = string
  description = "The ESXi host where target VM is created."
  default     = ""
}

variable "winadmin_password" {
  type      = string
  default   = ""
  sensitive = true
}

variable "winadmin_username" {
  type      = string
  default   = ""
  sensitive = true
}

# ISO Objects

variable "iso_path" {
  type        = string
  description = "The path on the source vSphere datastore for ISO images."
  default     = ""

  //default = "[Datastore2_NonSSD] SourcePrograms/Windows/Windows_Server_2019_2021_12_07_17763.737.190906-2324.rs5_release_svc_refresh_SERVER_EVAL_x64FRE_en-us_1.iso"
}

variable "iso_url" {
  type        = string
  description = "The url to retrieve the iso image"
  default     = ""
}

variable "iso_file" {
  type        = string
  description = "The file name of the guest operating system ISO image installation media."
  default     = ""
}

variable "iso_checksum" {
  type        = string
  description = "The checksum of the ISO image."
  default     = ""
}

variable "iso_checksum_type" {
  type        = string
  description = "The checksum type of the ISO image. Ex: sha256"
  default     = ""
}

##################################################################################
# SOURCE 
##################################################################################

source "vsphere-iso" "windows-2019-server" {
  username             = var.vcenter_username
  vcenter_server       = var.vcenter_server
  host                 = var.vcenter_host
  vm_name              = var.vm_name
  winrm_username       = var.winadmin_username
  winrm_password       = var.winadmin_password
  password             = var.vcenter_password
  CPUs                 = var.vm_cpu_sockets
  RAM                  = var.vm_mem_size
  cluster              = var.vcenter_cluster
  RAM_reserve_all      = true
  remove_cdrom         = true
  convert_to_template  = true
  datacenter           = var.vcenter_datacenter
  datastore            = var.vcenter_datastore
  disk_controller_type = var.vm_disk_controller_type
  firmware             = "bios"
  communicator         = "winrm"
  floppy_files = [
    "autounattend.xml",
    "../scripts/enable-rdp.cmd",
    "../scripts/enable-winrm.ps1",
    "../scripts/install-vm-tools.cmd",
    "../scripts/set-temp.ps1"
  ]

  folder              = var.vcenter_folder
  guest_os_type       = var.vm_guest_os_type
  insecure_connection = var.vcenter_insecure_connection
  ip_wait_timeout     = "20m"
  iso_paths           = ["[${var.vcenter_datastore}] /${var.iso_path}/${var.iso_file}"]
  # iso_url             = var.iso_url
  iso_checksum        = "${var.iso_checksum_type}:${var.iso_checksum}"
  network_adapters {
    network      = var.vcenter_network
    network_card = var.vm_network_card
  }
  storage {
    disk_size             = var.vm_disk_size
    disk_thin_provisioned = var.thin_provision
  }

}

##################################################################################
# BUILD
##################################################################################

build {
  sources = ["source.vsphere-iso.windows-2019-server"]

  provisioner "windows-shell" {
    inline = ["ipconfig"]
  }

}
