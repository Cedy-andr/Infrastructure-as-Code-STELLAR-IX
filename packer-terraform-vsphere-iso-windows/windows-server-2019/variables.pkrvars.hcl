# VM configuration-specific

##################################################################################
# VARIABLES
##################################################################################

# HTTP Settings

# http_directory = "http"

# Virtual Machine Settings

vm_name          = "Win2019-Template-Base-Thin"
vm_guest_os_type = "windows9Server64Guest"
//vm_version              = 14
//vm_firmware             = "bios"
//vm_cdrom_type           = "sata"
vm_cpu_sockets = 2
//vm_cpu_cores            = 2
vm_mem_size    = 4096
vm_disk_size   = 40960
thin_provision = true
//disk_eagerly_scrub      = false
vm_disk_controller_type = ["lsilogic-sas"]
vm_network_card         = "vmxnet3"
//vm_boot_wait            = "5s"
winadmin_username = "cedric"
winadmin_password = "123456789"

# ISO Objects

iso_file          = "windows_2019.rs5_release_svc_refresh_SERVER__x64_fr-fr.iso"
iso_checksum      = "24640a5e0795d5865bc8a4632043d4693007e3a5c25d9fb03d12253a077848d7" 
iso_checksum_type = "sha256"
#iso_url           = "https://www.microsoft.com/fr-fr/evalcenter/download-windows-server-2019"

# Scripts

//shell_scripts = ["./scripts/setup_ubuntu2204_withDocker.sh"]
