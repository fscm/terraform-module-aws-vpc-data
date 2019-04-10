#
# Outputs for the default VPC terraform module.
#
# Copyright 2016-2019, Frederico Martins
#   Author: Frederico Martins <http://github.com/fscm>
#
# SPDX-License-Identifier: MIT
#
# This program is free software. You can use it and/or modify it under the
# terms of the MIT License.
#

output "cidr" {
  description = "The CIDR block of the VPC."
  sensitive   = false
  value       = "${data.aws_vpc.default.cidr_block}"
}

output "default_network_acl_id" {
  description = "The ID of the network ACL created by default on VPC creation."
  sensitive   = false
  value       = "${aws_default_vpc.default.default_network_acl_id}"
}

output "default_route_table_id" {
  description = "The ID of the route table created by default on VPC creation."
  sensitive   = false
  value       = "${aws_default_vpc.default.default_route_table_id}"
}

output "default_security_group_id" {
  description = "The ID of the security group created by default on VPC creation."
  sensitive   = false
  value       = "${aws_default_vpc.default.default_security_group_id}"
}

output "dns_resolvers" {
  description = "List of the private resolvers of the VPC."
  sensitive   = false
  value       = "${data.aws_vpc_dhcp_options.default.domain_name_servers}"
}

output "domain_name" {
  description = "The suffix domain name to use by default when resolving non Fully Qualified Domain Names."
  sensitive   = false
  value       = "${data.aws_vpc_dhcp_options.default.domain_name}"
}

output "id" {
  description = "The ID of the VPC."
  sensitive   = false
  value       = "${data.aws_vpc.default.id}"
}

output "igw_id" {
  description = "The ID of the Internet Gateway."
  sensitive   = false
  value       = "${data.aws_internet_gateway.default.internet_gateway_id}"
}

output "ipv6_association_id" {
  description = "The association ID for the IPv6 CIDR block."
  sensitive   = false
  value       = "${aws_default_vpc.default.ipv6_association_id}"
}

output "ipv6_cidr_block" {
  description = "The IPv6 CIDR block."
  sensitive   = false
  value       = "${aws_default_vpc.default.ipv6_cidr_block}"
}

output "main_route_table_id" {
  description = "The ID of the main route table associated with this VPC."
  sensitive   = false
  value       = "${aws_default_vpc.default.main_route_table_id}"
}

output "name" {
  description = "The VPC name."
  sensitive = false
  value     = "${var.name}"
}

output "nat_eip" {
  description = "List of the NATs public IP addresses."
  sensitive   = false
  value       = "${list()}"
}

output "nat_gw_id" {
  description = "List of the NATs."
  sensitive   = false
  value       = "${list()}"
}

output "prefix" {
  description = "The VPC prefix."
  sensitive   = false
  value       = "${var.prefix}"
}

output "private_route_table_id" {
  description = "List of the private routing table IDs."
  sensitive   = false
  value       = "${list()}"
}

output "private_subnets" {
  description = "List of the private subnet IDs."
  sensitive   = false
  value       = "${list()}"
}

output "public_route_table_id" {
  description = "List of the public routing table IDs."
  sensitive   = false
  value       = "${data.aws_route_tables.public.ids}"
}

output "public_subnets" {
  description = "List of the public subnet IDs."
  sensitive   = false
  value       = "${data.aws_subnet_ids.public.ids}"
}

output "s3_endpoint_id" {
  description = "The ID of the S3 endpoint."
  sensitive   = false
  value       = "${element(concat(aws_vpc_endpoint.s3.*.id, list("")), 0)}"
}

output "s3_endpoint_state" {
  description = "The state of the VPC endpoint."
  sensitive   = false
  value       = "${element(concat(aws_vpc_endpoint.s3.*.state, list("")), 0)}"
}
