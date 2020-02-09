terraform {
  backend "s3" {
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    endpoint                    = "https://fra1.digitaloceanspaces.com"
    region                      = "us-east-1" // needed
    bucket                      = "<THE NAME OF YOUR SPACE>" // name of your space
    key                         = "infrastructure/terraform.tfstate"
  }
}