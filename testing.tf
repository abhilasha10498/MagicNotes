# Configure the Google Cloud provider
provider "google" {
  project = "sps-abhilasha" # Or use your project number: "119314789570"
}

# Define the Google Cloud Storage bucket
resource "google_storage_bucket" "testing_bucket" {
  name          = "testing_bucket_abhilasha_sps"
  project       = "sps-abhilasha"
  location      = "EU" # Required by customConstraints/custom.fixedBucketLocation5bb08ae9
  # Optional: Set a storage class, e.g., "STANDARD"
  storage_class = "STANDARD"

  # Optional: Enable uniform bucket-level access
  uniform_bucket_level_access = true

  # Optional: Prevent accidental deletion if the bucket contains objects
  force_destroy = false
}

output "bucket_self_link" {
  description = "The self link of the created bucket"
  value       = google_storage_bucket.testing_bucket.self_link
}

output "bucket_url" {
  description = "The URL of the created bucket"
  value       = google_storage_bucket.testing_bucket.url
}
# command to create resource : gcloud storage buckets create gs://testing_bucket_abhilasha_sps --location=EU --project=sps-abhilasha
