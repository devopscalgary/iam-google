/* 

*/


terraform {
  backend "gcs" {
    bucket  = "somaterraform"
    prefix  = "terraform/state"
  }
}
