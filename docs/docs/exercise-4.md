---
hide:
  - toc
---
# Exercise 4 - East-West

### Egress traffic to the Internet from the Spoke VPCs

!!! Success "Success Requirement"
    1. From Workload A - ping AND ssh to Workload B


!!! Info
    SSH in AWS Requires SSH keys unless you do additional bootstrap activities to override this. SSH-Agent has not been enabled on Workload A and Workload B. To accommodate SSH from Workload A to Workload B you will need to get the key from the Jumphost to Workload A. While on the Jumphost:
    ```sh
    scp sshkey-aplab-ssh-priv.pem ubuntu@10.99.98.10:.
    ```
    This will copy the SSH key to the home directory of Workload A and you can initiate the session from there.

![East-West](./images/eastwest.png "East-West")

!!! Tip
    FortiGate offers powerful diagnostic tools. Try some of the following when connecting  
    `diag sniffer packet any ‘icmp’ 4 0 1`   
    `diag sniffer packet port2 ‘tcp and port 2’ 4 0 1`   
    `diag sniffer packet any ‘host 10.99.98.10’ 4 0 1` - one of the spokes
