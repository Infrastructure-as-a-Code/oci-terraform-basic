# Copyright (c) 2020, Oracle and/or its affiliates. All rights reserved.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.


# Arquivo com declaração de variáveis que serão utilizadas na criação de recursos no OCI


      variable "compartment_ocid" {
	     default = "ocid1.compartment.oc1..aaaaaaaavllwdhbl3jpazw4ckb32agn62vfar6kj6ppzytupqo2fpjmjv57q"
	  }
      variable "tenancy_ocid" {
	  	 default = "ocid1.tenancy.oc1..aaaaaaaaaglzoboyofrba7mf665o6v46psebbf4gzdf3c5eo74ywvr56oieq"
	  }
      variable "region" {
	  	 default = "us-phoenix-1"
	  }
	  
      variable "instance_display_name" {
	  	 default = "testCompute"
	  }
      variable "ipxe_script" {
	  	 default = ""
	  }
      variable "preserve_boot_volume" {
	  	 default = "false"
	  }
      variable "boot_volume_size_in_gbs" {
	  	 default = "50"
	  }
      variable "shape" {
	  	 default = "VM.Standard.E3.Flex"
	  }
      variable "assign_public_ip" {
	  	 default = "true"
	  }
      variable "vnic_name" {
	  	 default = "primaryVNIC"
	  }
      variable "hostname_label" {
	  	 default = "myHost"
	  }
      variable "private_ip" {
	  	 default = "18.0.0.5"
	  }
      variable "skip_source_dest_check" {
	  	 default = "false"
	  }
      variable "subnet_ocid" {
	  	 default = "ocid1.subnet.oc1.phx.aaaaaaaadogywnhkdc3sr3dfzhsmtkkqzyq5arw7s6yed3uz5ufvez7tqeya"
	  }
      variable "ssh_public_key" {
	  	 default = "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAtsSdcoihHGnkLpIGVuiVflW1pWQzdlOSWVJSEEzRWDsHvbQWF2OSNw5m/4VPo7av/U72AtAuriS71y+BxpfzoB9uzGS1yOvz9feiR6FnzUZ4alandpCK+zI39l/xSz5B2tY2xid7W2yc6REt9jDTY62nGvPkSfvkmNk44o4o4EQHnGgQGUUkn6ymcsb9v14dUUHZL+uKDcovduMzTt2xiMfJLVZTohS/Hf8kWsSZaR2U2EcV3azKW64O2SK5q1O1Z5JvBhr2Wr+eVWV/StXITgOwjo19bHyalHk3AVkmZrUkhjfEjxbvLKROSX3c5xgj+nK2KsKC9sklUpxQL1Fw5w== rsa-key-20210921"
	  }
      variable "user_data" {
	  	 default = ""
	  }
      variable "instance_timeout" {
	  	 default = "25m"
	  }
      variable "block_storage_size_in_gbs" {
	  	 default = "50"
	  }
      variable "attachment_type" {
	  	 default = "iscsi"
	  }
      variable "use_chap" {
	  	 default = "true"
	  }
      variable "resource_platform" {
	  	 default = "linux"
	  }
      
      variable "instance_os" {
        description = "Operating system for compute instances"
        default     = "Oracle Linux"
      }

      variable "linux_os_version" {
        description = "Operating system version for all Linux instances"
        default     = "7.9"
      }
	  
      variable "instance_ocpus" {
        default = 1
      }

      variable "instance_shape_config_memory_in_gbs" {
        default = 2
      }
	  
      provider "oci" {
        tenancy_ocid     = var.tenancy_ocid
        region           = var.region
      }
    