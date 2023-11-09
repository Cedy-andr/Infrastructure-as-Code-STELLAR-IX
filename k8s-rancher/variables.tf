# Input variables

## Node Template 

# Node template to clone from
variable "image" { 
	// default = "/Datacenter Lab/Templates/temp-vm-centos-07"
	default = "/Datacenter Lab/vm/Templates/temp-vm-centos-08"
}

# Node disk size in MB
variable "disksize" {
	default = 65536
}

# Node number of CPUs
variable "cpucount" {
	default = 2
}

# Node memory size in MB
variable "memory" {
	default = 4096
}

## Cluster Template

# Kubernetes version
variable "k8version" {
	default = "v1.26.8-rancher1-1"
}

# Docker version
variable "dockerurl" {
	default = "https://releases.rancher.com/install-docker/19.03.sh"
}

## Node pool

# Number of nodes
variable "numnodes" {
	default = 1
}

## Logging and Monitoring

# Monitoring chart
variable "monchart" {
	default = "9.4.202"
}

# Logging chart
variable "logchart" {
	default = "3.8.201"
}

# Time to wait for Kubernetes to deploy before installing
variable "delaysec" {
	// default = 780
	default = 3000
}

## VMware

# VMware vCenter
variable "vcenter-server" {
	default = "10.200.200.67"
}

# VMware Datastore
variable "vcenter-datastore" {
	default = "DS-STX-LAB-ESXi-1-1"
}

# VMware Datacenter
variable "vcenter-datacenter" {
	default = "Datacenter Lab"
}

# VMware Resource Pool
variable "vcenter-pool" {
	default = "/Datacenter Lab/host/10.200.200.167/Resources/pool-resources-vSphere"
}

# VMware Folder
variable "vcenter-folder" {
	default = "Kubernetes"
}

# VMware Network
variable "vcenter-network" {
	default = "VM Network"
}

## Defined elsewhere

variable "rancher-url" { 
    default = "https://10.200.200.3/v3"
}

variable "rancher-token" {
    default = "token-7xdh5:9zctvs2769djw92cgc9lbg85d48cxtkfr8t2xq7djcmqzfqc88vn5v"
 }

variable "vcenter-user" { 
    default = "administrator@vsphere.local"
}

variable "vcenter-pass" {
    default = "dD;<ealUc:;jhFDJMh2"
 }
