# Terraform Infrastructure as Code for AWS Cloud

![Terraform](https://img.shields.io/badge/Terraform-IaC-blue?style=for-the-badge&logo=terraform)
![AWS](https://img.shields.io/badge/AWS-Cloud-orange?style=for-the-badge&logo=amazon-aws)

This repository contains Terraform scripts for provisioning infrastructure on AWS. The Terraform code in this project launches an EC2 instance, creates an EBS volume, formats the EBS volume, attaches it to the EC2 instance, installs an Apache HTTP server, starts the web services, and captures the public IP of the EC2 instance for further use.

## Table of Contents

- [Overview](#overview)
- [Prerequisites](#prerequisites)
- [Getting Started](#getting-started)
- [Terraform Configuration](#terraform-configuration)
- [Usage](#usage)
- [Example](#example)


## Overview

This project demonstrates the use of Terraform for Infrastructure as Code (IaC) on AWS. The Terraform scripts define the infrastructure, including EC2 instance creation, EBS volume management, and web server deployment.

## Prerequisites

Before using these Terraform scripts, ensure you have the following prerequisites:

- Terraform installed on your local machine.
- AWS account credentials configured on your machine.

## Getting Started

1. **Clone the repository:**

    ```bash
    git clone https://github.com/Umang746/terraform_code_for_aws_cloud.git
    cd terraform_code_for_aws_cloud

    ```

2. **Configuration:**

   Review and customize the Terraform configuration files based on your AWS infrastructure requirements.

## Terraform Configuration
EC2 Instance Configuration (resources_ec2.tf)
```hcl
resource "aws_instance" "os1" {
  ami           = var.amiId
  instance_type = lookup(var.instance_type , terraform.workspace)
  key_name = "terraformkey"
  vpc_security_group_ids = [ "sg-01c943070298c5166" ]

  tags = {
    Name = "webos1"
  }

}



resource "aws_ebs_volume" "myvol1" {
  availability_zone = aws_instance.os1.availability_zone
  size              = 1

  tags = {
    Name = "myebsvol1"
  }
}



resource "aws_volume_attachment" "my_ebs_attach_ec2" {
  force_detach = true
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.myvol1.id
  instance_id = aws_instance.os1.id
}

```

## Usage
1. **Initialize Terraform:**

    ```bash
    terraform init
    ```

2. **Review Terraform Plan:**

   ```bash
   terraform plan

    ```
3. **Apply Terraform Configuration:**

   ```bash
   terraform apply

    ```
4. **Access Web App:**
   After Terraform applies the configuration, open a browser to the public IP of the EC2 instance.

5. **Destroy Infrastructure (Optional):**
6.  ```bash
     terraform destroy

    ```
## Example

### Scenario: Deploying a Web Server on AWS EC2 Instance

In this example, we'll deploy a simple web server on an AWS EC2 instance using the provided Terraform scripts.

#### Steps:

1. **Clone the repository:**

    ```bash
    git clone https://github.com/Umang746/terraform_code_for_aws_cloud.git
    cd terraform_code_for_aws_cloud
    ```

2. **Review and Customize Configuration:**

    Open the `terraform.tfvars` file and update the variables, such as `key_name` and any other configurations based on your preferences.

3. **Initialize Terraform:**

    ```bash
    terraform init
    ```

4. **Review Terraform Plan:**

    ```bash
    terraform plan
    ```

    Ensure that the plan includes the expected resources and configurations.

5. **Apply Terraform Configuration:**

    ```bash
    terraform apply
    ```

    Confirm the application of the Terraform configuration.

6. **Access Web App:**

    Once the Terraform apply is complete, open a web browser and navigate to the public IP address of the deployed EC2 instance.

    ```plaintext
    http://<public_ip>
    ```

    Replace `<public_ip>` with the actual public IP address displayed in the Terraform outputs.

7. **Destroy Infrastructure (Optional):**

    If needed, you can destroy the deployed infrastructure after testing.

    ```bash
    terraform destroy
    ```

    Confirm the destruction when prompted.

This example demonstrates a basic scenario of deploying a web server on an AWS EC2 instance using Terraform. Customize the configurations and resources in the Terraform scripts based on your specific infrastructure requirements.

