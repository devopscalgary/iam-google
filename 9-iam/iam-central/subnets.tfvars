/* 

Version: 0.0.1
*/

subnet_iam = {
  # eg-one = {
  #   project        = "my-project"
  #   subnets_region = "my-region"
  #   subnets        = ["my-subnet_one", "my-subnet_two"]
  #   bindings = {
  #     "roles/compute.networkUser" = [
  #       "serviceAccount:my-sa@my-project.iam.gserviceaccount.com",
  #       "group:my-group@my-org.com",
  #       "user:my-user@my-org.com",
  #     ]
  #     "roles/compute.networkViewer" = [
  #       "serviceAccount:my-sa@my-project.iam.gserviceaccount.com",
  #       "group:my-group@my-org.com",
  #       "user:my-user@my-org.com",
  #     ]
  #   }
  #   conditional_bindings = [
  #     {
  #       role        = "roles/compute.networkAdmin"
  #       title       = "expires_after_2019_12_31"
  #       description = "Expiring at midnight of 2019-12-31"
  #       expression  = "request.time < timestamp(\"2020-01-01T00:00:00Z\")"
  #       members     = ["user:my-user@my-org.com"]
  #     }
  #   ]
  # }
}