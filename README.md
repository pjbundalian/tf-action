# Crescendo-DevOps-Exam

## Project Description
Crescendo-DevOps-exam is a GitHub repository structured for a DevOps lead role exam at Crescendo, automating AWS infrastructure with Terraform and GitHub Actions. The setup includes configurations for VPC, EC2, ALB, and CloudFront to demonstrate infrastructure as code (IaC) deployment and management.

## Architecture
The infrastructure is structured into several main components:
- **VPC** with public and private subnets, an Internet Gateway, and a NAT Gateway.
- **EC2 Instances** within the private subnets, configured with Nginx to serve web content.
- **Application Load Balancer (ALB)** routing traffic to the EC2 instances.
- **CloudFront Distribution** designed to deliver content quickly and securely to users, with cache invalidation capabilities to refresh content globally.

## GitHub Actions Workflows
This repository uses GitHub Actions to automate the following Terraform operations:
- **Plan**: Review proposed changes to the infrastructure.
- **Apply**: Execute changes to deploy or update the infrastructure.
- **Destroy**: Remove the deployed infrastructure.
- **Invalidate Cache**: Manually trigger cache invalidation in CloudFront when updates need to be reflected globally immediately.

## How to Run Using GitHub Actions

### Plan
The `terraform_plan.yml` workflow is triggered automatically on pull requests to the main branch, providing an opportunity to review changes before they are applied:
1. Create or update your Terraform configurations.
2. Push your changes to a feature branch.
3. Open a pull request to the main branch.
4. Navigate to the **Actions** tab in GitHub to see the execution of the plan.

### Apply
The `terraform_apply.yml` workflow must be triggered manually when you decide to apply changes:
1. Navigate to the **Actions** tab in GitHub.
2. Select the **Terraform Apply** workflow.
3. Click on **Run workflow**, choose the branch, and confirm to start the deployment.

### Destroy
The `terraform_destroy.yml` workflow is also triggered manually to safely remove all resources when they are no longer needed:
1. Navigate to the **Actions** tab in GitHub.
2. Select the **Terraform Destroy** workflow.
3. Click on **Run workflow**, choose the branch, and confirm to destroy the infrastructure.

### Invalidate Cache
When you need to ensure that updates are immediately visible globally, trigger the cache invalidation process:
1. Navigate to the **Actions** tab in GitHub.
2. Select the custom workflow for CloudFront cache invalidation.
3. Click on **Run workflow** to start the invalidation process.

## Caution
Ensure to review all changes thoroughly and understand the impact, especially when running the destroy command or invalidating the CloudFront cache, as these actions can have significant effects on the availability and performance of your application.


