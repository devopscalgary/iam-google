/* 

Version: 0.0.1
*/


# organization_iam_bindings = {
#   eg-one = {
#     organizations = ["270228063442"]
#     bindings = {
#       "roles/resourcemanager.organizationViewer" = [
#         # "serviceAccount:my-sa@my-project.iam.gserviceaccount.com",
#         "group:group_ex_seven@80slz.com",
#         "user:slzuserone@80slz.com",
#       ]
#       "roles/resourcemanager.projectDeleter" = [
#         # "serviceAccount:my-sa@my-project.iam.gserviceaccount.com",
#         "group:group_ex_eight@80slz.com",
#         "user:slzusertwo@80slz.com",
#       ]
#     }

#     conditional_bindings = [
#       {
#         role        = "roles/resourcemanager.folderViewer"
#         title       = "expires_after_2023_12_31"
#         description = "Expiring at midnight of 2023-12-31"
#         expression  = "request.time < timestamp(\"2023-01-01T00:00:00Z\")"
#         members     = ["user:slzuserthree@80slz.com"]
#       }
#     ]
#   }
# }