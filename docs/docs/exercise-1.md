---
hide:
  - toc
---
# Exercise 1 - Ingress with SNAT

### Ingress Traffic flow from Jumpbox to WorkloadA with SNAT enabled on the policy


!!! Success "Success Requirement"
    1. SSH to Workload A using `ssh -i sshkey-aplab-ssh-priv.pem ubuntu@` whatever the IP/Port you are using
    3. `ss -nat` on Workload A and confirm the source is the FortiGate


![Ingress with SNAT](./images/ingress.png "Ingress with SNAT")

!!! Warning
    Either use port translation or change the FortiGate SSH listening listening address on Port1

!!! Danger
    Multiple failed login attempts to the FortiGate SSH CLI will result in a 5+ minute lockout. Any failed login should be carefully considered before attempting again.

!!! Tip
    FortiGate offers powerful diagnostic tools. Try some of the following when connecting  
    `diag sniffer packet any ‘tcp and port 22’ 4 0 1`   
    `diag sniffer packet any ‘tcp and port 2222’ 4 0 1` - if using a tcp port translation  
    `diag sniffer packet any ‘host <ip>’ 4 0 1` - if you want to focus on a specific IP
