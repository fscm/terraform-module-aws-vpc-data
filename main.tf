#
# Terraform module to use the default VPC.
#
# Copyright 2016-2019, Frederico Martins
#   Author: Frederico Martins <http://github.com/fscm>
#
# SPDX-License-Identifier: MIT
#
# This program is free software. You can use it and/or modify it under the
# terms of the MIT License.
#

#
# VPC for the infrastructure.
#
data "aws_vpc" "default" {
  default = true
}

resource "aws_default_vpc" "default" {
  enable_dns_hostnames = "${var.enable_dns_hostnames}"
  enable_dns_support   = "${var.enable_dns_support}"
  tags {
    Name = "${var.prefix}${var.name}"
  }
}

#
# Gateway (internet access).
#
data "aws_internet_gateway" "default" {
  filter {
    name   = "attachment.vpc-id"
    values = ["${data.aws_vpc.default.id}"]
  }
}

#
# DHCP configurations.
#
data "aws_vpc_dhcp_options" "default" {
  dhcp_options_id = "${data.aws_vpc.default.dhcp_options_id}"
}

#
# Base VPC network routing.
#
data "aws_route_tables" "public" {
  vpc_id = "${data.aws_vpc.default.id}"
}

#
# Base VPC subnets.
#
data "aws_subnet_ids" "public" {
  vpc_id = "${data.aws_vpc.default.id}"
}

data "aws_subnet" "public" {
  count = "${length(data.aws_subnet_ids.public.ids)}"
  id    = "${element(data.aws_subnet_ids.public.ids, count.index)}"
}

#
# S3 endpoint service.
#
data "aws_vpc_endpoint_service" "s3" {
  service = "s3"
}

#
# S3 endpoint.
#
resource "aws_vpc_endpoint" "s3" {
  count             = "${var.enable_s3_endpoint ? 1 : 0}"
  vpc_endpoint_type = "Gateway"
  vpc_id            = "${data.aws_vpc.default.id}"
  service_name      = "${data.aws_vpc_endpoint_service.s3.service_name}"
}

#
# S3 network routing association.
#
resource "aws_vpc_endpoint_route_table_association" "s3" {
  count           = "${var.enable_s3_endpoint ? length(data.aws_route_tables.public.ids) : 0}"
  route_table_id  = "${element(data.aws_route_tables.public.ids, count.index)}"
  vpc_endpoint_id = "${aws_vpc_endpoint.s3.id}"
}
