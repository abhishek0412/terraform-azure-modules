variable "location" {}

variable "resource_group_name" {
  default     = ""
  description = "Resource group name"
}

variable "vnetwork_interface_id" {
  default     = ""
  description = "Virtual network interface ID"
}

variable "blob_storage_url" {
  default     = ""
  description = "Blob storage URL"
}

variable "admin_name" {
  default     = ""
  description = "VM Admin Username"
}

variable "admin_password" {
  default     = ""
  description = "VM Admin Password"
}

variable "environment" {
  default     = ""
  description = "CloudAcademy Environment"
}
