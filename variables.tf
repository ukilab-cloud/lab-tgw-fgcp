######################################
### All variables are defined here ###
######################################

###  Access and secret keys to your environment - Uncomment if using tfvars and not using AWS CLI
###  for authentication
# variable "access_key" {}
# variable "secret_key" {}

# Uncomment if using AWS SSO:
# variable "token"      {}
# variable "profile" {}
# References of your environment

# Prefix for all resources created for this deployment in AWS
variable "tag_name_prefix" {
  description = "Provide a common tag prefix value that will be used in the name tag for all resources"
  default     = "aplab"
}

variable "region" {
  description = "Provide the region to deploy the VPC in"
  default     = "eu-west-2"
}

variable "availability_zone1" {
  description = "Provide the first availability zone to create the subnets in"
  default     = "eu-west-2a"
}

variable "availability_zone2" {
  description = "Provide the second availability zone to create the subnets in"
  default     = "eu-west-2b"
}
### Ubuntu Version

variable "ubumajor" {
  description = "Ubuntu Version - Using the AMI Description"
  type        = string
  default     = "ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server"
}

variable "ubudate" {
  description = "Ubuntu Version - Date"
  type        = string
  default     = "20240927"
}
### Key Pair Name 

variable "keypair" {
  description = "Provide a keypair for accessing the FortiGate instances"
  default     = "aplab"
}

### FortiGate Variables

# Licensing is either "payg" or "byol" - see variable "fos_license_type"
# If using BYOL either use licenses (.lic) files or flex tokens but not both
# If using PAYG (default for the template) all license/tokebn defaults must be ""
# 
// license file for the fgtA - Mutually exclusive with flex
# Place license file in terraform root
variable "format" {
  description = "If BYOL specify either token or file"
  type        = string
  default     = "file"
}

variable "license" {
  description = "lic file eg. lic1.txt - BYOL ONLY"
  type        = string
  default     = ""
}

// license file for the fgtB - Mutually exclusive with flex 
# Place license file in terraform root
variable "license2" {
  description = "lic file eg. lic2.txt - BYOL ONLY"
  type        = string
  default     = ""
}

// flex token  for the fgtA - Mutually exclusive with "license"
variable "flex_token" {
  description = "Insert flex token - DO NOT USE WITH PAYG"
  type        = string
  default     = ""
}

// flex token  for the fgtB - Mutually exclusive with "license"
variable "flex_token2" {
  description = "Insert flex token - DO NOT USE WITH PAYG"
  type        = string
  default     = ""
}

//Fortigate AWS AMI Variables
variable "fos_version" {
  default = "7.6.2"
  type    = string
}

variable "fos_architecture" {
  default = "x86_64"
  # x86_64 or ARM are valid entries
}

// Provide the license type for FortiGate-VM Instances, either byol or payg.
// Use byol for flex
variable "fos_license_type" {
  default = "payg"
}

// instance type needs to match the architect
// c5n.xlarge is x86_64
// c6g.xlarge is arm
// For detail, refer to https://aws.amazon.com/ec2/instance-types/
variable "instance_type" {
  description = "Provide the instance type for the FortiGate instances"
  default     = "c6in.xlarge"
}

variable "scenario" {
  default = "ap-tgw"
}

// password for FortiGate HA configuration
variable "password" {
  default = "fortinet"
}

# References to your Networks
# fortinet VPC
variable "fortinet_vpc_cidr" {
  description = "Provide the network CIDR for the VPC"
  default     = "10.99.99.0/24"
}

#### public subnets
variable "fortinet_vpc_public_a_subnet_cidr" {
  description = "Provide the network CIDR for Public A in fortinet vpc"
  default     = "10.99.99.80/28"
}

variable "fortinet_vpc_public_a_gw" {
  description = "Provide the default local router IP for the Public B subnet"
  default     = "10.99.99.81/28"
}

variable "fortinet_vpc_public_b_subnet_cidr" {
  description = "Provide the network CIDR for the Public B subnet in fortinet vpc"
  default     = "10.99.99.0/28"
}

variable "fortinet_vpc_public_b_gw" {
  description = "Provide the default local router IP for the Public B subnet"
  default     = "10.99.99.1/28"
}

#### private subnets
variable "fortinet_vpc_private_a_subnet_cidr" {
  description = "Provide the network CIDR for private A in fortinet vpc"
  default     = "10.99.99.96/28"
}

variable "fortinet_vpc_private_a_gw" {
  description = "Provide the default local router IP for the Private B subnet"
  default     = "10.99.99.97/28"
}

variable "fortinet_vpc_private_b_subnet_cidr" {
  description = "Provide the network CIDR for the Private B subnet in fortinet vpc"
  default     = "10.99.99.16/28"
}

variable "fortinet_vpc_private_b_gw" {
  description = "Provide the default local router IP for the Private B subnet"
  default     = "10.99.99.17/28"
}

#### transit subnets
variable "fortinet_vpc_transit_a_subnet_cidr" {
  description = "Provide the network CIDR for the Transit A subnet in fortinet vpc"
  default     = "10.99.99.144/28"
}

variable "fortinet_vpc_transit_b_subnet_cidr" {
  description = "Provide the network CIDR for the Transit B subnet in fortinet vpc"
  default     = "10.99.99.64/28"
}

#### mgmt subnets
variable "fortinet_vpc_mgmt_a_subnet_cidr" {
  description = "Provide the network CIDR for the Mgmt A subnet in fortinet vpc"
  default     = "10.99.99.112/28"
}

variable "fortinet_vpc_mgmt_a_gw" {
  description = "Provide the default local router IP for the Mgmt A subnet"
  default     = "10.99.99.113/28"
}

variable "fortinet_vpc_mgmt_b_subnet_cidr" {
  description = "Provide the network CIDR for the Mgmt B subnet in fortinet vpc"
  default     = "10.99.99.32/28"
}

variable "fortinet_vpc_mgmt_b_gw" {
  description = "Provide the default local router IP for the Mgmt B subnet"
  default     = "10.99.99.33/28"
}

#### Hasync subnets
variable "fortinet_vpc_hasync_a_subnet_cidr" {
  description = "Provide the network CIDR for the HASync A subnet in fortinet vpc"
  default     = "10.99.99.128/28"
}

variable "fortinet_vpc_hasync_b_subnet_cidr" {
  description = "Provide the network CIDR for the HASync B subnet in fortinet vpc"
  default     = "10.99.99.48/28"
}

# spoke-a VPC
variable "spoke_vpc_a_cidr" {
  description = "Provide the network CIDR for the Spoke A VPC"
  default     = "10.99.98.0/24"
}

variable "spoke_vpc_a_workload_a_subnet_cidr" {
  description = "Provide the network CIDR for the Workload A subnet in spoke vpc a"
  default     = "10.99.98.0/26"
}

variable "spoke_vpc_a_transit_a_subnet_cidr" {
  description = "Provide the network CIDR for the Transit A subnet in spoke vpc a"
  default     = "10.99.98.64/26"
}

# spoke2 VPC
variable "spoke_vpc_b_cidr" {
  description = "Provide the network CIDR for the Spoke B VPC"
  default     = "10.99.97.0/24"
}

variable "spoke_vpc_b_workload_b_subnet_cidr" {
  description = "Provide the network CIDR for the Workload B subnet in spoke vpc b"
  default     = "10.99.97.0/26"
}

variable "spoke_vpc_b_transit_b_subnet_cidr" {
  description = "Provide the network CIDR for the Transit B subnet in spoke vpc b"
  default     = "10.99.97.64/26"
}

variable "cidr_for_access" {
  description = "Provide a network CIDR for accessing the FortiGate instances"
  default     = "0.0.0.0/0"
}

variable "cidr_for_mgmt_access" {
  description = "Provide a network CIDR for accessing the FortiGate instances,don't forget the /32"
  default     = "0.0.0.0/0"
}
