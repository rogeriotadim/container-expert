provider "google" {
  credentials = "${file("./credentials/credentials.json")}"
  project     = "container-expert"
  region      = var.region
}
