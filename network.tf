# Copyright (c) 2020, Oracle and/or its affiliates. All rights reserved.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.


# Arquivo com as instruções para a criação da rede


# Validação da versão do terraform
terraform {
  required_version = ">= 0.12.0"
}
  
# Criação do recurso VCN
resource oci_core_vcn this {
  dns_label    = var.vcn_dns_label
  cidr_block    = var.vcn_cidr
  compartment_id = var.compartment_ocid
  display_name  = var.vcn_display_name
}
  
# Criação do Internet Gateway
resource oci_core_internet_gateway this {
  compartment_id = var.compartment_ocid
  vcn_id      = oci_core_vcn.this.id
}   

# Criação da Route Table
# Saída liberada para a internet (0.0.0.0/0)
# Entrada é bloqueada por padrão
resource "oci_core_default_route_table" "this" {
  manage_default_resource_id = oci_core_vcn.this.default_route_table_id
  route_rules {
    destination     = "0.0.0.0/0"
    network_entity_id = oci_core_internet_gateway.this.id
  }
}

# Criação de Security List para permitir acesso à internet
resource "oci_core_security_list" "this" {
  compartment_id = var.compartment_ocid
  display_name  = "security-list"
  vcn_id      = oci_core_vcn.this.id
  
  # Regra de segurança para Saída
  egress_security_rules {
    destination = "0.0.0.0/0"
    protocol   = "6"
  }
  
  # Regra de segurança para Entrada
  #ingress_security_rules {
  #
  #  protocol = "6"
  #  source  = "0.0.0.0/0"
  #
  #  tcp_options {
  #  max = 22
  #  min = 22
  #  }
  #}
  
  #ingress_security_rules {
  #  protocol = "6"
  #  source  = "0.0.0.0/0"
  #
  #  tcp_options {
  #  max = 80
  #  min = 80
  #  }
  #}
  }

# Criação de Subnet Regional
resource "oci_core_subnet" "this" {
  cidr_block      = var.subnet_cidr
  display_name    = var.subnet_display_name
  compartment_id   = var.compartment_ocid
  dns_label      = var.subnet_dns_label
  vcn_id        = oci_core_vcn.this.id
  dhcp_options_id  = oci_core_vcn.this.default_dhcp_options_id
  route_table_id   = oci_core_default_route_table.this.id
  security_list_ids = [oci_core_security_list.this.id]
}

