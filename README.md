# AWS Fortinet FGCP Active/Passive HA Lab
A lab environment for learning/configuring flows through FortiGates deployed in the Active/Passive TGW Architecture. This is a common reference architecture and the lab serves as practice area to familiarise yourself with all the components.

Primarily for use in lab environments. Use at your own risk.

# Purpose

This environment is used by [Fortinet FGCP Active/Passive HA Lab](https://ukilab-cloud.github.io/lab-tgw-fgcp/)

## Requirements
- [Terraform](https://learn.hashicorp.com/terraform/getting-started/install.html) >= 1.6.0
- An SSH Client.
- An AWS account with EC2, VPC and IAM write permissions.


## Deployment Overview
![FGCP-Active-Passive-TGW](.images/FGCP-Active-Passive-TGW.png?raw=true "FGCP-Active-Passive-TGW")

### Included in the deployment
 - AWS Transit Gateway 
 - 1x FortiGate VPC (Public)
        - IGW
 - 2x FortiGate
        - 4x NIC each (recommended)
 - 2x EIP for FortiGate Management Interfaces
 - 1x EIP for FortiGate Cluster
 - 2x Spoke VPC (Private)
 - 2x Ubuntu 20.04 LTS Hosts as spoke devices for testing
 - SSH Key Pair for accessing the FortiGates or Ubuntu Host

## Assumptions
- FortiGate [PAYG/On Demand](https://aws.amazon.com/marketplace/pp/prodview-wory773oau6wq) or [BYOL](https://aws.amazon.com/marketplace/pp/prodview-lvfwuztjwe5b2) Marketplace subscription has already been authorised
- Permission to create IAM Roles require by the FortiGates for HA
- This template will not be used in production! Use a basis for your own environment.
- This lab has been tested using the [AWS Jumpbox](https://github.com/ukilab-cloud/aws-jumpbox) template.
- This has not been tested with Graviton Instances yet (although it should work provided the appropriate AWS Marketplace listing has been authorised)

## Deployment
- Clone the repository.
- Copy `terraform.tfvars.example`  to `terraform.tfvars`
- If not using Jumpbox
  - Change ACCESS_KEY and SECRET_KEY values in terraform.tfvars or use environment variables or SSO profiles
- Modify the "cidr_for_mgmt_access" variable in the variables.tf to restrict acesss to FortiGate managmenet interfaces. Default is "0.0.0.0/0"
* Initialize the providers and modules:
  ```sh
  $ terraform init
  ```
* Submit the Terraform plan:
  ```sh
  $ terraform plan
  ```
* Verify output.
* Confirm and apply the plan:
  ```sh
  $ terraform apply
  ```
* If output is satisfactory, type `yes`.

Output will include the information necessary to log in to the FortiGates:
```sh
Outputs:

FGT_A_MGMT_Public_IP = "<mgmtEIP1>"
FGT_B_MGMT_Public_IP = "<mgmtEIP2>"
FGT_Cluster_Public_IP = "<clusterEIP>"
FGT_Password = "<instanceID>"
FGT_Username = "admin"
SSH_to_FGT_A = "ssh -i ./sshkey-aplab-ssh-priv.pem admin@<mgmtEIP1>"
SSH_to_FGT_B = "ssh -i ./sshkey-aplab-ssh-priv.pem admin@<mgmtEIP2>"
TransitGwy_ID = "tgw-ID"
fortigate_image_id = "ami-ID"
```
There is no password login to the Ubuntu hosts - please use the SSH Key created by the template

## Destroy the environment
To destroy the environment, use the command:
```sh
$ terraform destroy
```

## TODO/Changelog/Caveats

- Changed to latest 7.4.5 as default. Only 7.4.5 and latest 7.6.x have been tested.
- Basic support for FortiFlex tokens added, however only the Primary node **FGT-A** will get licensed. The secondary node will fail to license due to no EIP and no internet access.
  - Find a resolution/amend
- If *fos_architecture* is set to **ARM** the terraform data resource that resolved the AMI will fail. 
  - Rework/Add a filter for the new ARM based AMI naming schem. 

# Disclaimer
This is a community project, the of this project are offered "as is". The authors make no representations or warranties of any kind, express or implied, as to the use or operation of content and materials included on this site. To the full extent permissible by applicable law, the authors disclaim all warranties, express or implied, including, but not limited to, implied warranties of merchantability and fitness for a particular purpose. You acknowledge, by your use of the site, that your use of the site is at your sole risk. 

If you break it, it is on you.
