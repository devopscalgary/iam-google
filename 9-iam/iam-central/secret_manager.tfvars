/* 

Version: 0.0.1
*/


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