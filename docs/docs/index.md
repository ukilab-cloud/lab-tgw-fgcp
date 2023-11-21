---
title: Guidance (Start Here)
hide:
  - toc
---

# Welcome to the Fortinet FGCP Active-Passive HA in AWS Lab Guide

This is an interactive lab aimed at learning how to deploy and do post deployment basic configuration.
The lab will provide some exercises that are challenges and not step-by-step sequences. Ideally work together and solve the challenges. 

!!! Warning

    This lab guide does not provide solutions. Only challenges with hints and tips and is designed to be used in an interactive session.

This guide assumes basic Linux skills and competency with command line editors. Neovim (nvim) and Micro are included as well as Vi

There are 2 modes to deploy the lab.

1.  With a Jumphost with all the tools necessary for deployment and access to the resources
     
     - The Jumphost

2.  Without a Jumphost and directly deploying the environment and then working through the exercises from anywhere. 

The assumption is that this lab will be deployed by the Jumphost. The Jumphost has already been deployed for you, however if it you are doing this lab unattended then please deploy the following template [AWS Jumphost Template](https://github.com/ukilab-cloud/aws-jumpbox) if you intend to use the exact environment.

**No changes are required in AWS all exercises are preformed on the FortiGate, Ubuntu hosts and Jumpbox exclusively.**

Once you are ready proceed to [Environment Overview](environment.md)

!!! note

    Only internet access, a browser and an SSH client will be required for this lab.

