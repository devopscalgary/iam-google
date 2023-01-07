/* 

Version: 0.0.1
*/


variable "projects_iam_bindings" {
  type = map(object({
    projects = list(string)
    bindings = map(list(string))
    conditional_bindings = list(object({
      role        = string
      title       = string
      description = string
      expression  = string
      members     = list(string)
    }))
  }))
  default = {}
}

variable "billing_account_iam" {
  type = map(object({
    billing_account_ids = list(string)
    bindings            = map(list(string))
  }))
  default = {}
}

variable "custom_roles" {
  type = map(object({
    target_level         = string
    target_id            = string
    role_id              = string
    title                = string
    description          = string
    base_roles           = list(string)
    permissions          = list(string)
    excluded_permissions = list(string)
    members              = list(string)
  }))
  default = {}
}


variable "folder_iam" {
  type = map(object({
    folders  = list(string)
    bindings = map(list(string))
    conditional_bindings = list(object({
      role        = string
      title       = string
      description = string
      expression  = string
      members     = list(string)
    }))
  }))
  default = {}
}


variable "organization_iam_bindings" {
  type = map(object({
    organizations = list(string)
    bindings      = map(list(string))
    conditional_bindings = list(object({
      role        = string
      title       = string
      description = string
      expression  = string
      members     = list(string)
    }))

  }))
  default = {}
}

variable "secret_manager_iam" {
  type = map(object({
    project  = string
    secrets  = list(string)
    bindings = map(list(string))
    conditional_bindings = list(object({
      role        = string
      title       = string
      description = string
      expression  = string
      members     = list(string)
    }))
  }))
  default = {}
}


variable "project_service_account" {
  type = map(object({
    project_id    = string
    prefix        = string
    sa_names      = list(string)
    project_roles = list(string)
  }))
  default = {}
}


variable "storage_bucket_iam" {
  type = map(object({
    storage_buckets = list(string)
    bindings        = map(list(string))
    conditional_bindings = list(object({
      role        = string
      title       = string
      description = string
      expression  = string
      members     = list(string)
    }))

  }))
  default = {}
}


variable "subnet_iam" {
  type = map(object({
    project        = string
    subnets_region = string
    subnets        = list(string)
    bindings       = map(list(string))
    conditional_bindings = list(object({
      role        = string
      title       = string
      description = string
      expression  = string
      members     = list(string)
    }))
  }))
  default = {}
}



# variable "groups" {
#   type = object({
#     groups = map(any)
#   })
#   default = {}
# }

variable "org_id" {
  description = "GCP Organization ID"
  type        = string
}

variable "groups" {
  type    = map(any)
  default = {}
}

variable "initial_group_config" {
  description = "Define the group configuration when it are initialized. Valid values are: WITH_INITIAL_OWNER, EMPTY and INITIAL_GROUP_CONFIG_UNSPECIFIED."
  type        = string
  default     = "WITH_INITIAL_OWNER" #"EMPTY" # "INITIAL_GROUP_CONFIG_UNSPECIFIED"
}