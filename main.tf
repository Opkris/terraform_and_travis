resource "google_cloud_run_service" "hello" {
  project     = "terraform-demo-opkris"
  name        = "cloudrun-srv"
  location    = "us-central1"

  template {
    spec {
      containers {
        image = "gcr.io/cloudrun/hello"
      }
    }
  }
}

data "google_iam_policy" "noauth" {
  binding {
    role = "roles/run.invoker"
    members = [
      "allUsers",
    ]
  }
}

resource "google_cloud_run_service_iam_policy" "noauth" {
  location    = google_cloud_run_service.hello.location
  project     = google_cloud_run_service.hello.project
  service     = google_cloud_run_service.hello.name

  policy_data = data.google_iam_policy.noauth.policy_data
}

