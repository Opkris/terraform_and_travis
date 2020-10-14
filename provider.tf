terraform {
  backend "gcs" {
    bucket = "opkristerraformdemo"
    prefix = "terraformstate"
    credentials = "terraform.json.enc"
  }
}
provider "google-beta" {
  credentials = file("terraform.json.enc")
  project     = "terraform-demo-opkris"
  region      = "us-central1"
  zone        = "us-central1-c"
}