/* 

*/


terraform {
  backend "gcs" {
    bucket  = "gc-somadri"
    prefix  = "terraform/state"
  }
}
