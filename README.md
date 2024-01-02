# Echo Server Deployment

## Docker

1. Build the Docker image:
   cd docker
   docker build -t public.ecr.aws/z8r9g7l9/omprakash_echo/echo-server:latest 

2.Push the Docker image to your registry:
docker push public.ecr.aws/z8r9g7l9/omprakash_echo/echo-server:latest

3.Deploy the Helm chart:
cd helm/echo-server
helm install echo-server

4.Access the deployed application.

5.Deploy the Terraform infrastructure:
cd terraform
terragrunt init
terragrunt apply

6.Update the Helm deployment with the new environment variable value.

7.Access the deployed EKS cluster and the Echo Server application.

