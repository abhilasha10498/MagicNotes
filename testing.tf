provider "google" {
  project = "disablevpcinternalipv6"
  region  = "us-east1"
}

resource "google_compute_subnetwork" "good_subnetwork_ipv4_only_with_external_access" {
  name          = "good-subnetwork-ipv4-only-with-external-access"

  ip_cidr_range = "10.0.0.0/22"
  region        = "us-west2"

  stack_type       = "IPV4_ONLY"
  ipv6_access_type = "EXTERNAL"

  network       = google_compute_network.custom-test.id
}

resource "google_compute_subnetwork" "bad_subnetwork_ipv6_with_external_access" {
  name          = "bad-subnetwork-ipv6-with-external-access"

  ip_cidr_range = "10.0.0.0/22"
  region        = "us-west2"

  stack_type       = "IPV4_IPV6"
  ipv6_access_type = "INTERNAL"

  network       = google_compute_network.custom-test.id
}

resource "google_compute_network" "custom-test" {
  name                    = "ipv6-test-network"
  auto_create_subnetworks = false
}
