provider "aws" {
  profile                  = var.profile
  shared_credentials_files = ["~/.aws/credentials/"]
  region                   = var.region
}
