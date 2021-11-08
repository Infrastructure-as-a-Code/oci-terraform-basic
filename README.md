# Oracle Cloud Infrastructure Terraform Arquitetura Simples

## Introdução
Módulo terraform para provisionar uma arquitetura simples com uma rede e uma instância computacional no OCI.

## Recursos
Lista de recursos que serão criados com a execução do módulo terraform.

- Virtual Cloud Network (VCN)
  - Subnet
  - Internet Gateway
  - Route Table
  - Security List
- Compute

## Arquitetura
INCLUIR DESENHO

## Instruções/Passo a passo/Como executar?
### Cloud Shell
Passo a passo para executar o módulo no Cloud Shell

1 - Instalação terraform

2 - Configuração terraform

3 - Clone projeto git

4 - Execução do módulo

No diretório /oci-terraform-basic executar os comandos abaixo
```
$ terraform init
$ terraform plan
$ terraform apply
```

### Resource Manager
Passo a passo para executar o módulo no Resource Manager

## URLs
Incluir os endereços para consulta de:
- Regiões: https://docs.oracle.com/en-us/iaas/Content/General/Concepts/regions.htm
- Shapes: https://docs.oracle.com/en-us/iaas/Content/Compute/References/computeshapes.htm
- Imagens: https://docs.oracle.com/en-us/iaas/Content/Compute/References/images.htm
  - Todas as imagens: https://docs.oracle.com/en-us/iaas/images/
