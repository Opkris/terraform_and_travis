resource "google_storage_bucket" "static-site" {
  project = "terraform-demo-opkris"
  name = "opkristerraformdemo"
  location = "EU"
}


