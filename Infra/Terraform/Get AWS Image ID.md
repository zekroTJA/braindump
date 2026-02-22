Simple [[Terraform]] snippet to get the ID of the latest AWS AMI of a specified distro.
```terraform
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

output "image_id" {
  value = data.aws_ami.ubuntu.id
}
```