
packer {
  required_plugins {
    vsphere = {
      source  = "github.com/hashicorp/vsphere"
      version = "~> 1"
    }
  }
}


variable "os_iso_path" {
  type    = string
  default = "[Datastore2_NonSSD] SourcePrograms/Windows/Windows_Server_2016_Datacenter_EVAL_en-us_14393_refresh2.iso"
}

variable "vm-cpu-num" {
  type    = string
  default = "2"
}

variable "vm-disk-size" {
  type    = string
  default = "40960"
}

variable "vm-mem-size" {
  type    = string
  default = "4096"
}

variable "vm-name" {
  type    = string
  default = "Win2016-Template-Base-Thick"
}

variable "vsphere-cluster" {
  type    = string
  default = "Cluster01"
}

variable "vsphere-datacenter" {
  type    = string
  default = "Datacenter"
}

variable "vsphere-datastore" {
  type    = string
  default = "Datastore2_NonSSD"
}

variable "vsphere-folder" {
  type    = string
  default = "Templates"
}

variable "vsphere-network" {
  type    = string
  default = "VM Network"
}

variable "vsphere-password" {
  type    = string
  default = ""
}

variable "vsphere-server" {
  type    = string
  default = ""
}

variable "vsphere-user" {
  type    = string
  default = ""
}

variable "winadmin-password" {
  type    = string
  default = "S3cr3t0!"
}


source "vsphere-iso" "autogenerated_1" {
  CPUs                 = "${var.vm-cpu-num}"
  RAM                  = "${var.vm-mem-size}"
  RAM_reserve_all      = true
  cluster              = "${var.vsphere-cluster}"
  communicator         = "winrm"
  convert_to_template  = "true"
  datacenter           = "${var.vsphere-datacenter}"
  datastore            = "${var.vsphere-datastore}"
  disk_controller_type = "lsilogic-sas"
  firmware             = "bios"
  floppy_files         = ["autounattend.xml", "../scripts/disable-network-discovery.cmd", "../scripts/disable-winrm.ps1", "../scripts/enable-rdp.cmd", "../scripts/enable-winrm.ps1", "../scripts/install-vm-tools.cmd", "../scripts/set-temp.ps1"]
  folder               = "${var.vsphere-folder}"
  guest_os_type        = "windows9Server64Guest"
  insecure_connection  = "true"
  ip_wait_timeout      = "1h"
  iso_paths            = ["${var.os_iso_path}", "[] /vmimages/tools-isoimages/windows.iso"]
  network_adapters {
    network      = "${var.vsphere-network}"
    network_card = "vmxnet3"
  }
  notes    = "Build via Packer"
  password = "${var.vsphere-password}"
  storage {
    disk_size             = "${var.vm-disk-size}"
    disk_thin_provisioned = false
  }
  username       = "${var.vsphere-user}"
  vcenter_server = "${var.vsphere-server}"
  vm_name        = "${var.vm-name}"
  winrm_password = "${var.winadmin-password}"
  winrm_username = "Administrator"
}


build {
  sources = ["source.vsphere-iso.autogenerated_1"]

  provisioner "windows-shell" {
    inline = ["ipconfig"]
  }

}
