# defines the GCP project and default region
provider "google" {
  project = "tf-test-202208030156"
  region  = "europe-west2"
}

# enable Cloud Resource Manager API
# do not disable the service when the Terraform resource is destroyed
resource "google_project_service" "enable-cloudresourcemanager" {
  project = "tf-test-202208030156"
  service = "cloudresourcemanager.googleapis.com"
  disable_on_destroy = false
}

# enable Compute API
resource "google_project_service" "enable-compute" {
  project = "tf-test-202208030156"
  service = "compute.googleapis.com"
  disable_on_destroy = false
} 

# GCE instance
resource "google_compute_instance" "test_vm" {
  name         = "tf-test-vm"
  machine_type = "f1-micro"
  zone         = "europe-west2-b"
  
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }
  
  # attach the instance to the default GCP network
  network_interface {
    network = "default"
    access_config {}
  }
}