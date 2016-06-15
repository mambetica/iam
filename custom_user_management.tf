resource "aws_iam_policy" "custom_user_management" {
    name = "CUSTOM_USER_MANAGEMENT"
    path = "/"
    description = "Allows user creation and removal, but not group, role or policy administration, as they are managed via Terraform"
    policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "iam:AddUserToGroup",
        "iam:CreateLoginProfile",
        "iam:CreateUser",
        "iam:CreateVirtualMFADevice",
        "iam:DeactivateMFADevice",
        "iam:DeleteLoginProfile",
        "iam:DeleteUser",
        "iam:DeleteVirtualMFADevice",
        "iam:EnableMFADevice",
        "iam:GenerateCredentialReport",
        "iam:GetCredentialReport",
        "iam:GetAccountSummary",
        "iam:GetGroup",
        "iam:GetLoginProfile",
        "iam:GetUser",
        "iam:GetUserPolicy",
        "iam:ListAccessKeys",
        "iam:ListAccountAliases",
        "iam:ListAttachedGroupPolicies",
        "iam:ListAttachedUserPolicies",
        "iam:ListGroupPolicies",
        "iam:ListGroups",
        "iam:ListGroupsForUser",
        "iam:ListMFADevices",
        "iam:ListSigningCertificates",
        "iam:ListSSHPublicKeys",
        "iam:ListUserPolicies",
        "iam:ListUsers",
        "iam:ListVirtualMFADevices",
        "iam:RemoveUserFromGroup",
        "iam:ResyncMFADevice",
        "iam:UpdateAccessKey",
        "iam:UpdateLoginProfile",
        "iam:UpdateUser"
      ],
      "Resource": "*"
    }
  ]
}
EOF
}

resource "aws_iam_policy_attachment" "custom_user_management_attach" {
  name = "custom_user_management_attach"
  groups = ["${aws_iam_group.custom_user_management.name}"]
  policy_arn = "${aws_iam_policy.custom_user_management.arn}"
}

resource "aws_iam_group" "custom_user_management" {
    name = "CUSTOM_USER_MANAGEMENT"
    path = "/"
}