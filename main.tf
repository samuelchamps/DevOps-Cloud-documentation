# Create the Developers group	
resource "aws_iam_group" "developers" {	
  name = "Developers"	
}	
	
# Create the DevOps group	
resource "aws_iam_group" "devops" {	
  name = "DevOps"	
}	
	
# Create the Interns group	
resource "aws_iam_group" "interns" {	
  name = "Interns"	
}	
	
	
# Create 3 developer users	
resource "aws_iam_user" "dev_alice" {	
  name = var.developer_user_1	
}	
	
# Create dev-bob and dev-charlie	
resource "aws_iam_user" "dev_bob" {	
  name = var.developer_user_2	
}

resource "aws_iam_user" "dev_charlie" {	
  name = var.developer_user_3	
}	
# Create 2 DevOps users	
resource "aws_iam_user" "dev_david" {	
  name = var.devops_user_1	
}	
resource "aws_iam_user" "dev_eve" {	
  name = var.devops_user_2	
}	
	
# Attach PowerUserAccess to Developers group	
resource "aws_iam_group_policy_attachment" "developers_policy" {	
  group      = aws_iam_group.developers.name	
  policy_arn = "arn:aws:iam::aws:policy/PowerUserAccess"	
}	
	
# Attach AdministratorAccess to DevOps group	
resource "aws_iam_group_policy_attachment" "devops_policy" {	
  group      = aws_iam_group.devops.name	
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"	
}	
	
# Attach ReadOnlyAccess to Interns group	
resource "aws_iam_group_policy_attachment" "interns_policy" {	
  group      = aws_iam_group.interns.name	
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"	
}
# Add users to groups	
resource "aws_iam_group_membership" "developers_members" {	
  name = "developers-membership"	
  group = aws_iam_group.developers.name	
  users = [	
    aws_iam_user.dev_alice.name,	
    aws_iam_user.dev_bob.name,	
    aws_iam_user.dev_charlie.name	
  ]	
}	
	
# Add DevOps users to DevOps group	
resource "aws_iam_group_membership" "devops_members" {	
  name = "devops-membership"	
  group = aws_iam_group.devops.name	
  users = [	
    aws_iam_user.dev_david.name,	
    aws_iam_user.dev_eve.name	
  ]	
}
# Add interns (none yet, but structure it for future)	
resource "aws_iam_group_membership" "interns_members" {	
  name = "interns-membership"	
  group = aws_iam_group.interns.name	
  users = []  # empty for now	
}	
