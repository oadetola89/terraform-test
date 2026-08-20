variable "cidr_block" {
  description = "CIDR for subnet data source"
  type = string
}

variable "ami_id" {
  description = "AMI use fir creating the instances"
  type = string
}

variable "instance_type" {
  description = "Instance type"
  type = string
}

variable "ssh_key" {
  description = "ssh key"
  type = string
}

variable "instance_count" {
  description = " Number of instances"
  type = number
}

variable "iam_instance_profile" {
  description = "IAM Role for instances"
  type = string
}

variable "http_endpoint" {
  description = "imds endpoint"
  type = string
}

variable "http_put_response_hop_limit" {
  description = "http_put_response_hop_limit"
  type = number
}

variable "volume_size" {
  description = "Size of root volume"
  type = number
}

variable "volume_type" {
  description = "Volume type"
  type = string
}

variable "iops" {
  description = "Volume iops"
  type = number
}

variable "throughput" {
  description = "Volume throughput"
  type = number
}

variable "encrypted" {
  description = "Volume type"
  type = string
}

variable "kms_id" {
  description = "Volume type"
  type = string
}

variable "security_groups" {
  description = "Instance security groups"
  type = list(string)
}
