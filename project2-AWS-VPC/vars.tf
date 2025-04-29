variable "region" {
  default     = "us-east-1"
  description = "The AWS region to create resources in."
}

variable "zone1" {
  default     = "us-east-1a"
  description = "The first availability zone to create resources in."

}

variable "ZONE1" {
  default     = "us-east-1a"
  description = "The first availability zone to create resources in."

}
variable "ZONE2" {
  default     = "us-east-1b"
  description = "The first availability zone to create resources in."

}

variable "ZONE3" {
  default     = "us-east-1c"
  description = "The first availability zone to create resources in."

}

variable "webuser" {
  default = "ubuntu"
}

variable "amiID" {
  type = map(any)
  default = {
    us-east-2 = "ami-04f167a56786e4b09"
    us-east-1 = "ami-084568db4383264d4"
  }
}