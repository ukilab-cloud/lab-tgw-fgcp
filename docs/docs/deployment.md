# Deployment Guide

- Log in to AWS Console
- SSH to Jumpbox 
- Clone the repository with:
 ``` sh
 git clone https://github.com/ukilab-cloud/lab-tgw-fgcp
 ```
- Prepare for deployment
``` sh
cd lab-tgw-fgcp
cp terraform.tfvars.example terraform.tfvars
```
- Initialise terraform
```sh
terraform init
```
- Confirm everything is ready to go
```sh
terraform plan
```
- If satisfied
```sh
terraform apply
```
!!! Tip
    Save the terraform output . You will be using these details through the lab.


- Go to AWS Console and see what has been deployed in:  
    - EC2
        - Instances
        - Elastic IPs
        - Security Groups
        - Key Pairs
        - Network Interfaces
    - VPC
        - VPCs
        - Route Tables
        - Internet Gateways
        - Endpoint
        - Transit Gateway (Attachment and Route Tables)

- Log in to the FortiGate active management interface in a web browser and confirm the cluster is in Sync (this may take a ew minutes) once the cluster is in sync begin [Exercise 1](exercise-1.md)




