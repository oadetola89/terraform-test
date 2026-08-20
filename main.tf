data "aws_subnet" "example" {
  cidr_block = var.cidr_block
}

resource "aws_instance" "example" {
  ami = var.ami_id
  instance_type = var.instance_type
  key_name = var.ssh_key
  count = var.instance_count
  iam_instance_profile = var.iam_instance_profile
  
  metadata_options {
    http_endpoint = var.http_endpoint
    http_put_response_hop_limit = var.http_put_response_hop_limit
    http_tokens = "required"
    instance_metadata_tags = "enabled"
  }

  root_block_device {
    volume_size = var.volume_size
    volume_type = var.volume_type
    iops = var.iops
    throughput = var.throughput
    encrypted = var.encrypted
    kms_key_id = var.kms_id
  }

  tags = {
    Name = "testserver-${count.index + 1}"
    auto-delete = "false"
  }

  primary_network_interface {
    network_interface_id = aws_network_interface.example[count.index].id
  }
}

resource "aws_network_interface" "example" {
   count = var.instance_count
   subnet_id = data.aws_subnet.example.id
   security_groups = var.security_groups
   tags = {
     auto-delete = "false"
   }
}

resource "aws_ebs_volume" "datavol" {
  availability_zone = var.az_name
  size = var.datavol_size
  encrypted = var.encrypted
  kms_key_id = var.kms_id
  type = var.volume_type
  iops = var.iops
  throughput = var.throughput
  count = var.instance_count

  tags = {
    auto-delete = "false"
  }
}

resource "aws_volume_attachment" "ebs_assignment" {
  device_name = "/dev/sdf"
  count = var.instance_count
  volume_id = aws_ebs_volume.datavol[count.index].id
  instance_id = aws_instance.example[count.index].id
}
