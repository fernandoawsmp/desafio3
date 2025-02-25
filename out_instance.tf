resource "aws_instance" "bia_dev" {
  ami                                  = "ami-05b10e08d247fb927"
  associate_public_ip_address          = true
  availability_zone                    = "us-east-1a"
  disable_api_stop                     = false
  disable_api_termination              = false
  ebs_optimized                        = true
  enable_primary_ipv6                  = null
  get_password_data                    = false
  hibernation                          = false
  host_id                              = null
  host_resource_group_arn              = null
  iam_instance_profile                 = aws_iam_role.role_acesso_ssm.name
  instance_initiated_shutdown_behavior = "stop"
  instance_type                        = "t3.micro"
  key_name                             = "fernando-2025"
  monitoring                           = false
  placement_group                      = null
  placement_partition_number           = 0
  secondary_private_ips                = []
  security_groups                      = [aws_security_group.bia_dev.id]
  source_dest_check                    = true
  subnet_id                            = local.subnet_zona_a
  tags = {
    Name = "bia-dev"
  }
  tags_all = {
    Name = "bia-dev"
  }
  tenancy                     = "default"
  user_data                   = "${file("userdata.sh")}"
  user_data_base64            = null
  user_data_replace_on_change = null
  volume_tags                 = null
  vpc_security_group_ids      = [aws_security_group.bia_dev.id]
  capacity_reservation_specification {
    capacity_reservation_preference = "open"
  }
  cpu_options {
    amd_sev_snp      = null
    core_count       = 1
    threads_per_core = 2
  }
  credit_specification {
    cpu_credits = "unlimited"
  }
  enclave_options {
    enabled = false
  }
  maintenance_options {
    auto_recovery = "default"
  }
  metadata_options {
    http_endpoint               = "enabled"
    http_protocol_ipv6          = "disabled"
    http_put_response_hop_limit = 2
    http_tokens                 = "required"
    instance_metadata_tags      = "disabled"
  }
  private_dns_name_options {
    enable_resource_name_dns_a_record    = true
    enable_resource_name_dns_aaaa_record = false
    hostname_type                        = "ip-name"
  }
  root_block_device {
    delete_on_termination = true
    encrypted             = false
    iops                  = 3000
    kms_key_id            = null
    tags                  = {}
    tags_all              = {}
    throughput            = 125
    volume_size           = 13
    volume_type           = "gp3"
  }
}
