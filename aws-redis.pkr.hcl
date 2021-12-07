packer {
  required_plugins {
    amazon = {
      version = ">= 0.0.2"
      source  = "github.com/hashicorp/amazon"
    }
  }
}



source "amazon-ebs" "redis" {
  ami_name      = "redis-enterprise-6.0.20"
  instance_type = "t2.micro"
  region        = "us-east-1"
  source_ami    = "ami-06cf02a98a61f9f5e"
  ssh_username = "centos"
  subnet_id = "subnet-0fa2ceb6846a4b867"
}

build {
  sources = [
    "source.amazon-ebs.redis"
  ]
  provisioner "file"  {
    source = "redislabs-6.0.20-69-rhel7-x86_64.tar"
    destination = "/tmp/redislabs-6.0.20-69-rhel7-x86_64.tar"
  }

}

