# terraform_sample
This is a sample project about EKS using Terraform

This project was created with the help of the tutorial [Learn EKS](https://learn.hashicorp.com/tutorials/terraform/eks)
We will be create the EKS cluster using the available module in terraform [eks](https://registry.terraform.io/modules/terraform-aws-modules/eks/aws/latest) and [vpc](https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/latest)
 
## Steps
- Clone this repository and also install terraform using the [link](https://learn.hashicorp.com/tutorials/terraform/install-cli)
- Then navigate to the repository directory and initialize the terrform directory to download the provider and modules
```terraform init```
- As we are working with AWS, we need a AWS account to allow terraform to create the resources
```aws configure```
- Then run the plan command to know the changes that would be applied on AWS
```terraform plan```
- After validating the changes, apply the configuration using the below command
```terraform apply```
- After the EKS cluster is created, the output should contain the kubeconfig which can be used to connect to the EKS cluster
- For the ingress, we will deploy the nginx ingress controller.
- ```kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v0.43.0/deploy/static/provider/aws/deploy.yaml```