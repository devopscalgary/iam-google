/* 

Version: 0.0.1
*/


storage_bucket_iam = {
  # eg-one = {
  #   storage_buckets = ["my-storage_bucket_one", "my-storage_bucket_two"]
  #   bindings = {
  #     "roles/storage.legacyBucketReader" = [
  #       "serviceAccount:my-sa@my-project.iam.gserviceaccount.com",
  #       "group:my-group@my-org.com",
  #       "user:my-user@my-org.com",
  #     ]
  #     "roles/storage.legacyBucketWriter" = [
  #       "serviceAccount:my-sa@my-project.iam.gserviceaccount.com",
  #       "group:my-group@my-org.com",
  #       "user:my-user@my-org.com",
  #     ]
  #   }
  #   conditional_bindings = [
  #     {
  #       role        = "roles/storage.admin"
  #       title       = "expires_after_2019_12_31"
  #       description = "Expiring at midnight of 2019-12-31"
  #       expression  = "request.time < timestamp(\"2020-01-01T00:00:00Z\")"
  #       members     = ["user:my-user@my-org.com"]
  #     }
  #   ]
  # }
}