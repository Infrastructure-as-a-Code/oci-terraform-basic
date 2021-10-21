# Copyright (c) 2020, Oracle and/or its affiliates. All rights reserved.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.


# Arquivo utilizado para extrair os valores de variáveis e exibir na saída


output "vcn_id" {
  description = "OCID da VCN criada. "
  value       = oci_core_vcn.this.id
}

output "default_security_list_id" {
  description = "OCID da Security List. "
  value       = oci_core_security_list.this.id
}

output "default_dhcp_options_id" {
  description = "OCID da default DHCP options. "
  value       = oci_core_vcn.this.default_dhcp_options_id
}

output "default_route_table_id" {
  description = "OCID da Route Table. "
  value       = oci_core_vcn.this.default_route_table_id
}

output "internet_gateway_id" {
  description = "OCID do Internet Gateway. "
  value       = oci_core_internet_gateway.this.id
}

output "subnet_id" {
  description = "ocid da Subnet id. "
  value       = oci_core_subnet.this.*.id
}
