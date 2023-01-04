# IAM CENTRAL

Using IAM Central you can manage the following resources, 

1. Billing Account 
2. Custom Roles at Org or Folder Level
3. Folders Level Permission 
4. Organization Level Permission 
5. Project Level Permission 
6. Secret Manager
7. Service Account
8. Storage Buckets
9. Subnet
10. groups


### Best Practice
1. Separate all tfvar files as per the usecase. This helps separation and easy audit. 


1. Billing Account 

### Example 
```
billing_account_iam = {
  purpose-one = {
    billing_account_ids = ["01A26E-F5A54C-83E700"]
    bindings = {
      "roles/billing.viewer" = [
        # "serviceAccount:my-sa@my-project.iam.gserviceaccount.com",
        "group:group_ex_seven@66slz.com",
      ]

      "roles/billing.user" = [
        "user:slzuserone@66slz.com",
      ]
    }
  },
}
```
2. Custom Roles at org level  
### Example 
```
custom_roles = {
  org-01-role = {
    target_level         = "org"
    target_id            = "270228063442"
    role_id              = "custom_role_test1"
    title                = "custom_role_test1"
    description          = "Custom Role Created by 66degrees for reference"
    base_roles           = ["roles/iam.serviceAccountAdmin"]
    permissions          = ["iam.roles.list", "iam.roles.create", "iam.roles.delete"]
    excluded_permissions = ["iam.serviceAccounts.setIamPolicy"]
    members              = ["user:slzuserone@66slz.com", "group:group_ex_seven@66slz.com"]
  },
}
```
3. Folder Level Permissions
### Example 
```
folder_iam = {
  ex-one-dev-folder = {
    folders = ["324407477481"]
    bindings = {
      "roles/resourcemanager.folderEditor" = [
        # "serviceAccount:my-sa@my-project.iam.gserviceaccount.com",
        "group:group_ex_seven@66slz.com",
        "user:slzuserone@66slz.com",
      ]

      "roles/resourcemanager.folderViewer" = [
        "user:slzusertwo@66slz.com",
      ]
    }
    conditional_bindings = [
      {
        role        = "roles/resourcemanager.folderViewer"
        title       = "expires_after_2023_12_31"
        description = "Expiring at midnight of 2023-12-31"
        expression  = "request.time < timestamp(\"2023-01-01T00:00:00Z\")"
        members     = ["user:slzuserthree@66slz.com"]
      }
    ]
  }
}
```   
4. Organization Level Permissions
### Example 
```
organization_iam_bindings = {
  eg-one = {
    organizations = ["270228063442"]
    bindings = {
      "roles/resourcemanager.organizationViewer" = [
        # "serviceAccount:my-sa@my-project.iam.gserviceaccount.com",
        "group:group_ex_seven@66slz.com",
        "user:slzuserone@66slz.com",
      ]
      "roles/resourcemanager.projectDeleter" = [
        # "serviceAccount:my-sa@my-project.iam.gserviceaccount.com",
        "group:group_ex_eight@66slz.com",
        "user:slzusertwo@66slz.com",
      ]
    }

    conditional_bindings = [
      {
        role        = "roles/resourcemanager.folderViewer"
        title       = "expires_after_2023_12_31"
        description = "Expiring at midnight of 2023-12-31"
        expression  = "request.time < timestamp(\"2023-01-01T00:00:00Z\")"
        members     = ["user:slzuserthree@66slz.com"]
      }
    ]
  }
}
```
5. Project Lavel Permissions
### Example 
```
projects_iam_bindings = {
  dev-project = {
    projects = ["107304640167", "510292847043"]
    bindings = {
      "roles/storage.admin" = [
        "group:group_ex_eight@66slz.com",
        "user:slzuserone@66slz.com",
      ]

      "roles/compute.networkAdmin" = [
        "group:group_ex_eight@66slz.com",
        "user:slzusertwo@66slz.com",
      ]

      "roles/compute.imageUser" = [
        "user:slzuserthree@66slz.com",
      ]
    }

    conditional_bindings = [
      {
        role        = "roles/secretmanager.admin"
        title       = "expires_after_2023_12_31"
        description = "Expiring at midnight of 2023-12-31"
        expression  = "request.time < timestamp(\"2023-01-01T00:00:00Z\")"
        members     = ["user:slzusertwo@66slz.com"]
      }
    ]
  },

}
```
6. Secret Manager
### Example 
```
secret_manager_iam = {
  eg-one = {
    project = "gcp-project-id"
    secrets = ["my-secret"]
    bindings = {
      "roles/secretmanager.secretAccessor" = [
        "serviceAccount:my-sa@my-project.iam.gserviceaccount.com",
        "group:my-group@my-org.com"
      ]

      "roles/secretmanager.viewer" = [
        "user:my-user@my-org.com"
      ]
    }
    conditional_bindings = [
      {
        role        = "roles/secretmanager.admin"
        title       = "expires_after_2021_12_31"
        description = "Expiring at midnight of 2021-12-31"
        expression  = "request.time < timestamp(\"2022-01-01T00:00:00Z\")"
        members     = ["user:my-user@my-org.com"]
      }
    ]
  }
}
```
7. Service Account 
### Example 
```
project_service_account = {
  wif-sa = {
    project_id = "fufi"
    prefix     = ""
    sa_names = [
      "wif-sa",
      "sa-two",
    ]
    project_roles = []
  },
}


```
8. Storage Buckets
### Example 
```
storage_bucket_iam = {
  eg-one = {
    storage_buckets = ["my-storage_bucket_one", "my-storage_bucket_two"]
    bindings = {
      "roles/storage.legacyBucketReader" = [
        "serviceAccount:my-sa@my-project.iam.gserviceaccount.com",
        "group:my-group@my-org.com",
        "user:my-user@my-org.com",
      ]
      "roles/storage.legacyBucketWriter" = [
        "serviceAccount:my-sa@my-project.iam.gserviceaccount.com",
        "group:my-group@my-org.com",
        "user:my-user@my-org.com",
      ]
    }
    conditional_bindings = [
      {
        role        = "roles/storage.admin"
        title       = "expires_after_2019_12_31"
        description = "Expiring at midnight of 2019-12-31"
        expression  = "request.time < timestamp(\"2020-01-01T00:00:00Z\")"
        members     = ["user:my-user@my-org.com"]
      }
    ]
  }
}
```
9.  Subnets
### Example 
```
subnet_iam = {
  eg-one = {
    project        = "my-project"
    subnets_region = "my-region"
    subnets        = ["my-subnet_one", "my-subnet_two"]
    bindings = {
      "roles/compute.networkUser" = [
        "serviceAccount:my-sa@my-project.iam.gserviceaccount.com",
        "group:my-group@my-org.com",
        "user:my-user@my-org.com",
      ]
      "roles/compute.networkViewer" = [
        "serviceAccount:my-sa@my-project.iam.gserviceaccount.com",
        "group:my-group@my-org.com",
        "user:my-user@my-org.com",
      ]
    }
    conditional_bindings = [
      {
        role        = "roles/compute.networkAdmin"
        title       = "expires_after_2019_12_31"
        description = "Expiring at midnight of 2019-12-31"
        expression  = "request.time < timestamp(\"2020-01-01T00:00:00Z\")"
        members     = ["user:my-user@my-org.com"]
      }
    ]
  }
}
```


### Example 
Groups

```
org_id = "270228063442"

groups = {
  "gcp_group_ex_7" = "group_ex_seven@66slz.com"
  "gcp_group_ex_8" = "group_ex_eight@66slz.com"
  "gcp_group_ex_9" = "group_ex_nine@66slz.com"
  "gcp_group_ex_10" = "group_ex_ten@66slz.com"
  "gcp_group_ex_11" = "group_ex_eleven@66slz.com"
  "gcp_group_ex_12" = "group_ex_twelve@66slz.com"
} 
```