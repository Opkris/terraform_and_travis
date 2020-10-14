terraform {
  backend "gcs" {
    bucket = "opkristerraformdemo"
    prefix = "terraformstate"
    credentials = "terraform.json"
  }
}
provider "google-beta" {
  credentials = file("terraform.json")
  project     = "terraform-demo-opkris"
  region      = "us-central1"
  zone        = "us-central1-c"
}