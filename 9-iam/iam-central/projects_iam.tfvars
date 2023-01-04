/* 

Version: 0.0.1
*/


projects_iam_bindings = {
  dev-project = {
    projects = ["107304640167", "510292847043"]
    bindings = {
      "roles/storage.admin" = [
        "group:group_ex_eight@80slz.com",
        "user:slzuserone@80slz.com",
      ]

      "roles/compute.networkAdmin" = [
        "group:group_ex_eight@80slz.com",
        "user:slzusertwo@80slz.com",
      ]

      "roles/compute.imageUser" = [
        "user:slzuserthree@80slz.com",
      ]
    }

    conditional_bindings = [
      {
        role        = "roles/secretmanager.admin"
        title       = "expires_after_2023_12_31"
        description = "Expiring at midnight of 2023-12-31"
        expression  = "request.time < timestamp(\"2023-01-01T00:00:00Z\")"
        members     = ["user:slzusertwo@80slz.com"]
      }
    ]
  },

  prod-project = {
    projects = ["639803075795", ]
    bindings = {
      "roles/storage.admin" = [
        "group:group_ex_eight@80slz.com",
        "user:slzuserone@80slz.com",
      ]

      "roles/compute.networkAdmin" = [
        "group:group_ex_eight@80slz.com",
        "user:slzusertwo@80slz.com",
      ]

      "roles/compute.imageUser" = [
        "user:slzuserthree@80slz.com",
      ]
    }

    conditional_bindings = [
      {
        role        = "roles/secretmanager.admin"
        title       = "expires_after_2023_12_31"
        description = "Expiring at midnight of 2023-12-31"
        expression  = "request.time < timestamp(\"2023-01-01T00:00:00Z\")"
        members     = ["user:slzuserthree@80slz.com"]
      }
    ]
  },

}