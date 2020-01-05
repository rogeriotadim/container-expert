provider "google" {
  credentials = file("./credentials/credentials.json")
  region      = var.region
}
