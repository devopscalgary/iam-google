/* 

*/


terraform {
  backend "gcs" {
    bucket  = "gcp-somadri"
    prefix  = "terraform/state"
  }
}
