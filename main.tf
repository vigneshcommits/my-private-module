provider "google" {
    project = "calyptia-playground-371615"
    credentials = var.gcp_credentials
    region = "us-east1"
    zone = "us-east1-b"
}

terraform {
  cloud {
    organization = "calyptia"
    hostname     = "app.terraform.io" # Optional; defaults to app.terraform.io

    workspaces {
      name = "my-private-module"
    }
  }
}

module "vm" {
  source  = "app.terraform.io/calyptia/vm/gcp"
  version = "1.3.0"
  gcp_credentials = var.gcp_credentials
}
