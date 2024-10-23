resource "proxmox_vm_qemu" "demo"{
    
target_node = "bitcloud"
    vmid = "102"
    name = "demo"
    desc = "none"

    # VM Advanced General Settings
    onboot = true 

    # VM OS Settings
    clone = "test"

    # VM System Settings
    agent = 1
    
    # VM CPU Settings
    cores = 1
    sockets = 1
    cpu = "host"    
    
    # VM Memory Settings
    memory = 2024

    # VM Network Settings
    network {
        bridge = "vmbr0"
        model  = "virtio"
    }
    os_type = "cloud-init"
}
