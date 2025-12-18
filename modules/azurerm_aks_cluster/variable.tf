variable "location" {}
variable "aks_name" {}
variable "rg_name" {}
variable "tags" {}
variable "dns_prefix" {}
variable "node_count" {
default = 1
}
variable "vm_size" {

default = "Standard_D2_v2"
}
