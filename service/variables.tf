variable "env" {
  description = "short and unique environment name"
}

variable "service" {
  description = "unique service name"
}



locals {

  common_tags = {
    Environment = var.env
    Managed-By  = "terraform"
    Service     = var.srvice
  }
}
