# ======================== #
# VMware VMs configuration #
# ======================== #

vm-count = 2
vm-name = "ubuntu2204"
vm-template-name = "temp-vm-ubuntu-22-04"
vm-cpu = 2
vm-ram = 4096
vm-guest-id = "ubuntu64Guest"

# ============================ #
# VMware vSphere configuration #
# ============================ #

# VMware vCenter IP/FQDN
vsphere-vcenter = "10.200.200.67"

# vSphere host name where the infrastructure will be deployed
vsphere-host  = "10.200.200.167"

# VMware vSphere username used to deploy the infrastructure
vsphere-user = "administrator@vsphere.local"

# VMware vSphere password used to deploy the infrastructure
vsphere-password = "dD;<ealUc:;jhFDJMh2"

# Skip the verification of the vCenter SSL certificate (true/false)
vsphere-unverified-ssl = "true"

# vSphere datacenter name where the infrastructure will be deployed
vsphere-datacenter = "Datacenter Lab"

# vSphere cluster name where the infrastructure will be deployed
# vsphere-cluster = "Cluster01"

# vSphere Datastore used to deploy VMs 
vm-datastore = "DS-STX-LAB-ESXi-1"

# vSphere Network used to deploy VMs 
vm-network = "VM Network"

# Linux virtual machine domain name
vm-domain = "ubuntu"
