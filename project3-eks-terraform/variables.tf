variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1" # changed from us-east-2 to us-east-1
}

variable "clusterName" {
  description = "Name of the EKS cluster"
  type        = string
  default     = "IaC-eks" # name changing 
}
