/* 

Version: 0.0.1
*/


custom_roles = {
  org-01-role = {
    target_level         = "org"
    target_id            = "270228063442"
    role_id              = "custom_role_test1"
    title                = "custom_role_test1"
    description          = "Custom Role Created by 80 for reference"
    base_roles           = ["roles/iam.serviceAccountAdmin"]
    permissions          = ["iam.roles.list", "iam.roles.create", "iam.roles.delete"]
    excluded_permissions = ["iam.serviceAccounts.setIamPolicy"]
    members              = ["user:slzuserone@80slz.com", "group:group_ex_seven@80slz.com"]
  },
}