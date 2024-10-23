
# terraform_proxmox


# Explanation of Terraform Configuration for Proxmox VM

This document provides a detailed explanation of the Terraform configuration used for provisioning a virtual machine (VM) on Proxmox. The VM is configured to clone an existing VM named "test" and is set up to utilize cloud-init for initialization.

## Overview

Terraform is an Infrastructure as Code (IaC) tool that allows you to define and provision infrastructure using a declarative configuration language. In this configuration, we are using the Proxmox provider to manage virtual machines in a Proxmox environment.

### Key Components of the Configuration

1. **Resource Definition**:
   - The `resource "proxmox_vm_qemu" "demo"` block defines the VM to be created.
   - **Key Attributes**:
     - `target_node`: Specifies the Proxmox node where the VM will be created (e.g., "bitcloud").
     - `vmid`: Unique identifier for the VM (e.g., "102").
     - `name`: The name of the VM (e.g., "demo").
     - `desc`: A description of the VM (currently set to "none").
     - `onboot`: Indicates whether the VM should start on boot (set to `true`).

2. **OS Settings**:
   - The `clone` attribute specifies the VM to clone from (in this case, "test"). This requires that the base VM exists in the Proxmox environment.

3. **System Settings**:
   - The `agent` attribute is set to `1`, enabling the QEMU guest agent for better management and interaction with the VM.

4. **CPU Settings**:
   - `cores`: Defines the number of CPU cores assigned to the VM (set to `1`).
   - `sockets`: Specifies the number of CPU sockets (set to `1`).
   - `cpu`: Indicates the CPU model to use (set to "host" for better performance).

5. **Memory Settings**:
   - `memory`: Allocates memory to the VM (set to `2024` MB).

6. **Network Settings**:
   - The `network` block configures the VM's network interface:
     - `bridge`: Specifies the network bridge to use (e.g., "vmbr0").
     - `model`: Defines the network interface model (set to "virtio" for better performance).

7. **OS Type**:
   - `os_type`: Indicates the operating system type for the VM (set to "cloud-init" for cloud initialization).

### Terraform Block

The `terraform` block specifies the required Terraform version and the providers needed for the configuration.

- **required_version**: Ensures that Terraform version 0.13.0 or higher is used.
- **required_providers**: Specifies the Proxmox provider, including the source and version.

### Variables

Variables are defined to allow for flexible configuration:

- `proxmox_api_url`: The URL for the Proxmox API.
- `proxmox_api_token_id`: The API token ID for authentication.
- `proxmox_api_token_secret`: The API token secret for authentication.

### Provider Configuration

The `provider "proxmox"` block configures the Proxmox provider with the necessary API credentials:

- `pm_api_url`: The URL to access the Proxmox API.
- `pm_api_token_id`: The token ID for API authentication.
- `pm_api_token_secret`: The token secret for API authentication.
- `pm_tls_insecure`: Set to `true` to allow insecure TLS connections (use with caution).

### Example Variable Values

This section provides example values for the variables, which should be replaced with your actual Proxmox API credentials before running the Terraform commands.

hcl
proxmox_api_url = "https://proxmox_ip:8006/api2/json" 
proxmox_api_token_id = "root@pam!Terraform-2"  
proxmox_api_token_secret = "your proxmox token"


### Usage Instructions

To use this Terraform configuration:

1. **Initialize Terraform**: Run the following command to initialize the working directory:
    
    bash
    
    VerifyOpen In EditorEditCopy code
    
    `1terraform init`
    
2. **Plan the Deployment**: Generate an execution plan to see what actions Terraform will take:
    
    bash
    
    VerifyOpen In EditorEditCopy code
    
    `1terraform plan`
    
3. **Apply the Configuration**: Create the VM by applying the configuration:
    
    bash
    
    VerifyOpen In EditorEditCopy code
    
    ``1terraform apply``
    

### Important Notes

- Ensure that the base VM named "test" exists in your Proxmox environment before applying the configuration.
- Replace example variable values with your actual
