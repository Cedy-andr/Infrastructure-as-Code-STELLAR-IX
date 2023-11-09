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
//vcenter_cluster   = "Cluster01"

# ISO Objects

iso_path = "[DS-STX-LAB-ESXi-1] OS/windows_2019.rs5_release_svc_refresh_SERVER__x64_fr-fr.iso"

//iso_path = "OS/ubuntu-22.04.3-live-server-amd64.iso"
