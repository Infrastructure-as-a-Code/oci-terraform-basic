# Copyright (c) 2020, Oracle and/or its affiliates. All rights reserved.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.


# Arquivo utilizado para extrair os valores de variáveis e exibir na saída


output "instance_id" {
  description = "OCID das instâncias criadas. "
  value       = [oci_core_instance.this.id]
}

output "private_ip" {
  description = "IPs privados das instâncias criadas. "
  value       = [oci_core_instance.this.private_ip]
}

output "public_ip" {
  description = "IPs públicos das instâncias criadas. "
  value       = [oci_core_instance.this.public_ip]
}
