// VM configuration-specific

##################################################################################
# VARIABLES
##################################################################################

// HTTP Settings

# http_directory = "http"

// Virtual Machine Settings

vm_name                 = "temp-centos-7"
vm_guest_os_type        = "centos7_64Guest"
vm_version              = 7
# vm_firmware             = "bios"
vm_firmware             = "efi-secure"
vm_cdrom_type           = "sata"
vm_cpu_sockets          = 2
vm_cpu_cores            = 2
vm_mem_size             = 4096
vm_disk_size            = 30720
thin_provision          = true
disk_eagerly_scrub      = false
vm_disk_controller_type = ["pvscsi"]
vm_network_card         = "vmxnet3"
vm_boot_wait            = "5s"
ssh_username            = "cedric"
ssh_password            = "123456789"

//  ISO Objects

iso_file = "CentOS-7-x86_64-DVD-2009.iso"
iso_checksum      = "e33d7b1ea7a9e2f38c8f693215dd85254c3a4fe446f93f563279715b68d07987"
iso_checksum_type = "sha256"
iso_url           = "http://mirror.aptus.co.tz/pub/centos/7.9.2009/isos/x86_64/CentOS-7-x86_64-DVD-2009.iso"
// iso_url = "[DS-STX-LAB-ESXi-1] OS/CentOS-7-x86_64-DVD-2009.iso"

//  Scripts

# shell_scripts = ["./scripts/scripts-test.sh"]
