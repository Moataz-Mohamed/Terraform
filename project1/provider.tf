provider "aws" {
  region = var.region
}
# The above code is a Terraform configuration file that defines a provider block for AWS.
# The provider block specifies the AWS region to be used for the resources defined in the configuration.
# In this case, the region is set to "us-east-1", which is the US East (N. Virginia) region.
# The provider block is necessary for Terraform to know which cloud provider to interact with and where to create the resources.
# The provider block is a fundamental part of any Terraform configuration, as it establishes the connection to the cloud provider's API.