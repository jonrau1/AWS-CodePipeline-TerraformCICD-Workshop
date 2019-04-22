# AWS-TerraformRemoteState-Workshop
#### Proof of Concept demonstrating how to build resources to store Terraform State and provide State Locking on AWS via S3 (Object Storage) and DynamoDB (Managed NoSQL DB)
These Terraform scripts will allow you to build the needed resources to store your Terraform State Files in a versioned, durable backend (AWS S3) as well as provide State Locking via a Manged NoSQL Database (AWS DynamoDB). This allows you to share your Terraform States, as well as lock the state to prevent unapproved changes or overwrites to your codified infrastructure.
The sub-repo's will allow you to build out the backend infrastructure locally, then initiate the new backend and migrate your local *.tfstate into a path and file you specifiy

## Getting Started

### Set up Terraform
**The following steps are done to mirror how you would install Terraform on Ubuntu 18.04 LTS on an EC2 Instance, Ensure you Follow / Skip These Steps dependent on where you have / need to have Terraform installed**
1. Update Your Instance
`sudo apt-get update && sudo apt-get upgrade -y`
2. Install Unzip
`sudo apt-get install unzip`
3. Grab the Latest Version of Terraform (https://www.terraform.io/downloads.html)
`wget https://releases.hashicorp.com/terraform/0.11.13/terraform_0.11.13_linux_amd64.zip`
4. Unzip Terraform Installation
`unzip terraform_0.11.13_linux_amd64.zip`
5. Move to /local/bin (or otherwise add it to your PATH)
`sudo mv terraform /usr/local/bin/`
6. Ensure that Terraform is Installed Correctly
`terraform --version`
7. Ensure your EC2 Instances have an Instance Profile that allows permissions for AT LEAST S3 and DynamoDB (https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use_switch-role-ec2_instance-profiles.html)

### Prepare your Remote Infrastructure
1. Clone This Repository
`git clone https://github.com/jonrau1/AWS-TerraformRemoteState-Workshop.git`
2. Navigate to the Remotes Directory
`cd remotes`
3. Enter a Unique DNS Compliant Name for your S3 Bucket && A Unique Name for your DynamoDB Table
`nano remotes.tf`
4. Initialize Terraform & Download AWS Provider
`terraform init`
5. Create a Terraform Execution Plan (https://www.terraform.io/docs/commands/plan.html)
`terraform plan` 
6. Apply the Terraform Execution Plan (https://www.terraform.io/docs/commands/apply.html)
`terraform apply`