# Configure the Cloudflare provider using the required_providers stanza
# required with Terraform 0.13 and beyond. You may optionally use version
# directive to prevent breaking changes occurring unannounced.
terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.0"
    }
  }

  backend "local" {
    path = "C:/terraform/state/terraform.tfstate"
  }

}

provider "cloudflare" {
  api_token = var.token
}

resource "cloudflare_record" "terraform-add" {
  zone_id = var.zone_id
  name    = "new"
  value   = "192.0.2.1"
  type    = "A"
  ttl     = 3600
}