# Copyright (c) 2020, Oracle and/or its affiliates. All rights reserved.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.


# Arquivo com declaração de variáveis que serão utilizadas na criação de recursos no OCI


##### Variáveis com informações do Tenant #####

# OCID do Tenant
variable "tenancy_ocid" {
  default = "ocid1.tenancy.oc1..aaaaaaaaaglzoboyofrba7mf665o6v46psebbf4gzdf3c5eo74ywvr56oieq"   
}

# Região do Tenant
variable "region" {
  default = "us-phoenix-1"
}

# OCID do compartimento onde o recurso será criado
variable "compartment_ocid" {
  default = "ocid1.compartment.oc1..aaaaaaaavllwdhbl3jpazw4ckb32agn62vfar6kj6ppzytupqo2fpjmjv57q"
}

# Fonte de dados para a conexão do Terraform com o OCI
provider "oci" {
  tenancy_ocid = var.tenancy_ocid
  region     = var.region
}


##### Variáveis com informações da VCN #####

# Nome da VCN
variable "vcn_display_name" {
  default = "testVCN2"
}
 
# Bloco CIDR da VCN
variable "vcn_cidr" {
  default = "18.0.0.0/16"
}

# Nome a ser utilizado no DNS Domain
# ex.: [vcn_dns_label].oraclevcn.com
variable "vcn_dns_label" {
  default = "vcnteste2"
}

# Nome da Subnet
variable "subnet_display_name" {
  default = "subnet"
}

# Bloco CIDR da Subnet
variable "subnet_cidr" {
  default = "18.0.0.0/24"
}

# Nome a ser utilizado no DNS Domain da Subnet
# ex.: [subnet_dns_label].[vcn_dns_label].oraclevcn.com
variable "subnet_dns_label" {
  default = "subnet"
}