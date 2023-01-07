/* 

Version: 0.0.1
*/


/*
Create Groups
*/

locals {
  more_groups_to_create = {
    for key, value in var.groups : key => value
  }
}

data "google_organization" "org" {
  organization = var.org_id
}

module "group" {
  for_each = local.more_groups_to_create
  source   = "terraform-google-modules/group/google"
  version  = "~> 0.4.0"

  id                   = each.value
  display_name         = each.key
  description          = each.key
  initial_group_config = var.initial_group_config
  customer_id          = data.google_organization.org.directory_customer_id
}

/*
Project Level IAM
*/
module "projects_iam_bindings" {
  source               = "terraform-google-modules/iam/google//modules/projects_iam"
  version              = "~> 7.4.1"
  for_each             = var.projects_iam_bindings
  mode                 = "additive"
  projects             = each.value.projects
  bindings             = each.value.bindings
  conditional_bindings = each.value.conditional_bindings
}

/*
Billing Account IAM
*/

module "billing-account-iam" {
  source              = "terraform-google-modules/iam/google//modules/billing_accounts_iam"
  version             = "~> 7.4.1"
  depends_on          = [module.group]
  for_each            = var.billing_account_iam
  billing_account_ids = each.value.billing_account_ids
  mode                = "additive"
  bindings            = each.value.bindings
}

/*
Custom Roles IAM
*/

module "custom-roles" {
  source               = "terraform-google-modules/iam/google//modules/custom_role_iam"
  version              = "~> 7.4.1"
  depends_on           = [module.group]
  for_each             = var.custom_roles
  target_level         = each.value.target_level
  target_id            = each.value.target_id
  role_id              = each.value.role_id
  title                = each.value.title
  description          = each.value.description
  base_roles           = each.value.base_roles
  permissions          = each.value.permissions
  excluded_permissions = each.value.excluded_permissions
  members              = each.value.members
}

/*
Folders IAM
*/

module "folder-iam" {
  source               = "terraform-google-modules/iam/google//modules/folders_iam"
  version              = "~> 7.4.1"
  depends_on           = [module.group]
  for_each             = var.folder_iam
  folders              = each.value.folders
  mode                 = "additive"
  bindings             = each.value.bindings
  conditional_bindings = each.value.conditional_bindings
}

/*
Organizations IAM
*/


module "organization-iam-bindings" {
  source        = "terraform-google-modules/iam/google//modules/organizations_iam"
  version       = "~> 7.4.1"
  depends_on    = [module.group]
  for_each      = var.organization_iam_bindings
  organizations = each.value.organizations
  mode          = "additive"

  bindings             = each.value.bindings
  conditional_bindings = each.value.conditional_bindings
}


/*
Secret Manager IAM
*/

module "secret_manager_iam" {
  source               = "terraform-google-modules/iam/google//modules/secret_manager_iam"
  version              = "~> 7.4.1"
  depends_on           = [module.group]
  for_each             = var.secret_manager_iam
  project              = each.value.project
  secrets              = each.value.secrets
  mode                 = "additive"
  bindings             = each.value.bindings
  conditional_bindings = each.value.conditional_bindings
}


/*
Service Account IAM
*/

module "service_accounts" {
  source        = "terraform-google-modules/service-accounts/google"
  version       = "~> 4.1.1"
  depends_on    = [module.group]
  for_each      = var.project_service_account
  project_id    = each.value.project_id
  prefix        = each.value.prefix
  names         = each.value.sa_names
  project_roles = each.value.project_roles
}


# /*
# Storage Bucket IAM
# */

module "storage_bucket-iam-bindings" {
  source               = "terraform-google-modules/iam/google//modules/storage_buckets_iam"
  version              = "~> 7.4.1"
  depends_on           = [module.group]
  for_each             = var.storage_bucket_iam
  storage_buckets      = each.value.storage_buckets
  mode                 = "additive"
  bindings             = each.value.bindings
  conditional_bindings = each.value.conditional_bindings
}



# /*
# Subnets IAM
# */

module "subnet-iam-bindings" {
  source               = "terraform-google-modules/iam/google//modules/subnets_iam"
  version              = "~> 7.4.1"
  depends_on           = [module.group]
  for_each             = var.subnet_iam
  subnets              = each.value.subnets
  subnets_region       = each.value.subnets_region
  project              = each.value.project
  mode                 = "additive"
  bindings             = each.value.bindings
  conditional_bindings = each.value.conditional_bindings
}

provider "google" {
  project = "My First Project"
  region = "us-central1"
  zone = "us-central1-b"
}

resource "google_storage_bucket" "bucket" {
  name          = "gcp-support"
  location      = "ASIA-SOUTH1"
}