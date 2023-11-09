# vCenter configuration-specific

##################################################################################
# VARIABLES
##################################################################################

# Credentials

vcenter_username = "administrator@vsphere.local"
vcenter_password = "dD;<ealUc:;jhFDJMh2"

# vSphere Objects

vcenter_insecure_connection = true
vcenter_server              = "10.200.200.67"
vcenter_datacenter          = "Datacenter Lab"
vcenter_host                = "10.200.200.167"
vcenter_datastore           = "DS-STX-LAB-ESXi-1"
vcenter_network             = "VM Network"
vcenter_folder              = "Templates"

# ISO Objects

//iso_path = "[DS-STX-LAB-ESXi-1] OS/ubuntu-22.04.3-live-server-amd64.iso"
iso_path = "OS/debian-8.11.1-amd64-DVD-1.iso"