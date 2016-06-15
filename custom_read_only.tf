resource "aws_iam_policy" "custom_read_only" {
    name = "CUSTOM_READ_ONLY"
    path = "/"
    description = "Provides read only access to Amazon services for audit purposes"
    policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "ec2:Describe*"
      ],
      "Resource": "*"
    },
	{
      "Effect": "Allow",
      "Action": [
	    "s3:Get*",
        "s3:List*"
      ],
      "Resource":"*"
    },
    {
      "Effect": "Allow",
      "Action": [
        "rds:Describe*",
		"rds:List*"
      ],
      "Resource": "*"
    },
    {
      "Effect": "Allow",
      "Action": [
        "sdb:GetAttributes",
        "sdb:List*",
        "sdb:Select*"
      ],
      "Resource": "*"
    },
    {
      "Effect": "Allow",
      "Action": [
        "sns:Get*",
        "sns:List*"
      ],
      "Resource": "*"
    },
    {
      "Effect": "Allow",
      "Action": [
        "sqs:ListQueues",
        "sqs:GetQueueAttributes",
        "sqs:ReceiveMessage"
      ],
      "Resource": "*"
    },
    {
      "Effect": "Allow",
      "Action": [
        "autoscaling:Describe*"
      ],
      "Resource": "*"
    },
    {
      "Effect": "Allow",
      "Action": [
        "elasticloadbalancing:Describe*"
      ],
      "Resource": "*"
    },
    {
      "Effect": "Allow",
      "Action": [
        "cloudwatch:Describe*",
        "cloudwatch:List*",
        "cloudwatch:Get*"
      ],
      "Resource": "*"
    },
    {
      "Effect": "Allow",
      "Action": [
        "iam:Get*",
        "iam:List*"
      ],
      "Resource": "*"
    }
  ]
}
EOF
}

resource "aws_iam_policy_attachment" "custom_read_only_attach" {
  name = "custom_read_only_attach"
  groups = ["${aws_iam_group.custom_read_only.name}", "${aws_iam_group.custom_emr_spike.name}"]
  policy_arn = "${aws_iam_policy.custom_read_only.arn}"
}

resource "aws_iam_group" "custom_read_only" {
    name = "CUSTOM_READ_ONLY"
    path = "/"
}