# HCL Language

Reference: 
- [OpenTofu Language Reference](https://opentofu.org/docs/language/)
- [Terraform Language Reference](https://developer.hashicorp.com/terraform/language)

# AWS

> [Documentation for AWS Terraform Provider](https://search.opentofu.org/provider/opentofu/aws/latest)

## [[CloudInit]]

> [Documentation on Cloud Init with Terraform](https://developer.hashicorp.com/terraform/tutorials/provision/cloud-init)

Basic example of an EC2 instance with Security Group and CloudInit.

> `main.tf`
```hcl
provider "aws" {
  region = "eu-central-1"
}

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

resource "aws_security_group" "sg_example_ssh" {
  name = "sg_example_ssh"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "example" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.sg_example_ssh.id]
  user_data              = file("./cloudinit/main.yaml")


  tags = {
    Name = "Example IC2 Instance"
  }
}

output "instance_ip_addr" {
  value = aws_instance.example.public_ip
}

output "instance_dns_addr" {
  value = aws_instance.example.public_dns
}
```

> `cloudinit/main.yaml`
```yaml
#cloud-config

users:
  - name: r.hoffmann
    uid: "1128"
    groups: sudo
    shell: /bin/bash
    lock_passwd: false
    passwd: *****
    ssh_authorized_keys:
      - ssh-ed25519 ...
package_update: true
package_upgrade: true
package_reboot_if_required: true
packages:
  - tree
  - zip
  - unzip
  - screenfetch
  - neofetch
  - iperf3
  - vnstat
  - nload
  - tmux
  - unattended-upgrades
  - msmtp
  - msmtp-mta
  - mailutils
  - jq
  - file
  - uuid
  - fio
write_files:
  - path: /etc/ssh/sshd_config.d/base.conf
    permissions: "0640"
    owner: root:root
    content: |
      Port 22

      PermitRootLogin no
      PasswordAuthentication no

      AllowGroups sshlogin

      HostKey /etc/ssh/ssh_host_ed25519_key

      KexAlgorithms curve25519-sha256,curve25519-sha256@libssh.org
      Ciphers chacha20-poly1305@openssh.com,aes256-gcm@openssh.com,aes256-ctr,aes192-ctr
      MACs hmac-sha2-256-etm@openssh.com,hmac-sha2-512-etm@openssh.com,umac-128-etm@openssh.com
      HostKeyAlgorithms ssh-ed25519,ssh-ed25519-cert-v01@openssh.com,sk-ssh-ed25519@openssh.com,sk-ssh-ed25519-cert-v01@openssh.com,rsa-sha2-256,rsa-sha2-512,rsa-sha2-256-cert-v01@openssh.com,rsa-sha2-512-cert-v01@openssh.com
runcmd:
  - addgroup --system sshlogin
  - usermod -aG sshlogin r.hoffmann

```

# Read and Write JSON data

Reading data from a JSON file is done as following.

```hcl
locals {
	instances = jsondecode(file("./instances.json"))
}
```

Output can be written to a JSON file using the [`opentofu/local`](https://search.opentofu.org/provider/opentofu/local/latest) provider.

```hcl
resource "local_file" "deployed_instances" {
  filename = "deployed_instances.json"
  content = jsonencode({
    for instance in aws_instance.web_server :
    instance.tags.Key => {
      "id"            = instance.id
      "name"          = instance.tags.Name
      "public_ip"     = instance.public_ip
      "public_dns"    = instance.public_dns
    }
  })
}
```

# Resources

- https://youtu.be/Q4n5VUNo-l4
- https://github.com/hashicorp/learn-terraform-provisioning
- https://g.co/gemini/share/68b50a6bb8f2
- https://stackoverflow.com/questions/49393405/terraform-how-to-attach-volumes-from-previous-ec2-instance
