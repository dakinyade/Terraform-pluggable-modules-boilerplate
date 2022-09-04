
# data "aws_key_pair" "example" {
#    key_name           = "test-deployer-key"
#   # include_public_key = true

#   # filter {
#   #   name   = "tag:Component"
#   #   values = ["web"]
#   # }
# }

# output "fingerprint" {
#   value = data.aws_key_pair.example.fingerprint
# }

# output "name" {
#   value = data.aws_key_pair.example.key_name
# }

# output "id" {
#   value = data.aws_key_pair.example.id
# }


# data "aws_vpc" "selected" {
#     filter {
#     name   = "tag:Name"
#     values = ["main_10.10.0.0/20"]
#   }
# }
# output "vpc_name" {
#   value = data.aws_vpc.selected
# }