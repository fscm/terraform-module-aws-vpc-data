#
# Variables for the default VPC terraform module.
#
# Copyright 2016-2022, Frederico Martins
#   Author: Frederico Martins <http://github.com/fscm>
#
# SPDX-License-Identifier: MIT
#
# This program is free software. You can use it and/or modify it under the
# terms of the MIT License.
#

variable "enable_dns_hostnames" {
  description = "Should be true if you want to have custom DNS hostnames within the VPC."
  default     = true
  type        = "string"
}

variable "enable_dns_support" {
  description = "Should be true if you want to have DNS support whitin the VPC."
  default     = true
  type        = "string"
}

variable "enable_s3_endpoint" {
  description = "Should be true if you want to provision an S3 endpoint within the VPC."
  default     = false
  type        = "string"
}

variable "name" {
  description = "The name for the VPC."
  default     = "default"
  type        = "string"
}

variable "prefix" {
  description = "A prefix to prepend to the VPC name."
  default     = ""
  type        = "string"
}
