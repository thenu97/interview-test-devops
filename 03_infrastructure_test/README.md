# Infrastructure Test

## Brief
Build out some basic Infrastructure for AWS, Azure or GCP using tooling like Terraform that can be used in a repeatable way. Bonus points for the following:

* Clearly explaining why you're doing things a certain way.
* Providing a PNG diagram of your infrastructure.

## Solution
My solution was to build an ec2 instance in a public subnet in a VPC.

## Rolling Changes


## Improvements
+ challenge myself further

## Setup
+ clone this repo `git clone https://github.com/thenu97/interview-test-devops.git`
+ cd into `interview-test-devops`
+ navigate to dev branch `git checkout dev`
+ cd into the `eu-west-1` directory e.g: `cd ./03_infrastructure_test/environments/eu-west-1`
+ run `aws configure (--profile bink)`
+ proceed to configure your aws keys
+ create a keypair called `bink` in your aws region
+ run `terraform init`
+ if you want to check what you're creating run `terraform plan -var="profile=bink"`
+ run `terraform apply -var="profile=bink"`