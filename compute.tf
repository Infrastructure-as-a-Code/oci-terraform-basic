# Copyright (c) 2020, Oracle and/or its affiliates. All rights reserved.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.


# Arquivo com as instruções para a criação da instância computacional


# Validação da versão do terraform
terraform {
  required_version = ">= 0.12.0"
}

# OCID da Subnet onde a instância será criada
data "oci_core_subnet" "this" {
  subnet_id = var.subnet_ocid
}

# Listagem de imagens do sistema operacional
data "oci_core_images" "this" {
  compartment_id           = var.compartment_ocid
  operating_system         = var.instance_os
  operating_system_version = var.linux_os_version

  shape      = var.shape
  sort_by    = "TIMECREATED"
  sort_order = "DESC"
}

# Listagem de Availability Domain (AD) da região
data "oci_identity_availability_domain" "ad" {
    compartment_id = "${var.tenancy_ocid}"
    ad_number      = 1
}

# Criação da instância computacional
resource "oci_core_instance" "this" {
  # availability_domain  = data.oci_core_subnet.this.availability_domain
  availability_domain  = "${data.oci_core_subnet.this.availability_domain != null ? data.oci_core_subnet.this.availability_domain : data.oci_identity_availability_domain.ad.name}"
  compartment_id       = var.compartment_ocid
  display_name         = var.instance_display_name
  ipxe_script          = var.ipxe_script
  preserve_boot_volume = var.preserve_boot_volume
  shape                = var.shape
  
  # Informações do shape da instância
  shape_config {
    ocpus         = var.instance_ocpus
    memory_in_gbs = var.instance_shape_config_memory_in_gbs
  }
  
  # Informações para a criação da VNIC
  create_vnic_details {
    assign_public_ip       = var.assign_public_ip
    display_name           = var.vnic_name
    hostname_label         = var.hostname_label
    private_ip             = var.private_ip
    skip_source_dest_check = var.skip_source_dest_check
    subnet_id              = var.subnet_ocid
  }
  
  # Public key para acesso remoto (ssh) à instância
  metadata = {
    ssh_authorized_keys = var.ssh_public_key
    user_data           = var.user_data
  }
  
  # Informação do boot volume e imagem da instância
  source_details {
    boot_volume_size_in_gbs = var.boot_volume_size_in_gbs
    source_type = "image"
    source_id   = data.oci_core_images.this.images[0].id
  }
  
  # Tempo limite para a criação da instância
  timeouts {
    create = var.instance_timeout
  }
}

# Criação de volume para armazenamento
resource "oci_core_volume" "this" {
  availability_domain = oci_core_instance.this.availability_domain
  compartment_id      = var.compartment_ocid
  display_name        = "${oci_core_instance.this.display_name}_volume_0"
  size_in_gbs         = var.block_storage_size_in_gbs
}

# Anexando volume à instância
resource "oci_core_volume_attachment" "this" {
  attachment_type = var.attachment_type
  instance_id     = oci_core_instance.this.id
  volume_id       = oci_core_volume.this.id
  use_chap        = var.use_chap
}
