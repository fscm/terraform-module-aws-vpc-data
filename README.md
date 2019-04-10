# VPC Terraform Module

A terraform module to use the default VPC in AWS.

## Prerequisites

Terraform and AWS Command Line Interface tools need to be installed on your
local computer.

### Terraform

Terraform version 0.10.3 or higher is required.

Terraform installation instructions can be found
[here](https://www.terraform.io/intro/getting-started/install.html).

### AWS Command Line Interface

AWS Command Line Interface installation instructions can be found [here](http://docs.aws.amazon.com/cli/latest/userguide/installing.html).

## Module Input Variables

- `enable_dns_hostnames` - Should be true if you want to have custom DNS hostnames within the VPC. *[default value: true]*
- `enable_dns_support` - Should be true if you want to have DNS support within the VPC. *[default value: true]*
- `enable_s3_endpoint` - Should be true if you want to provision an S3 endpoint within the VPC. *[default value: false]*
- `name` - The name for the VPC. *[default value: 'default']*
- `prefix` - A prefix to prepend to the VPC name. *[default value: '']*

## Usage

Example:

```hcl
module "my_default_vpc" {
  source               = "github.com/fscm/terraform-module-aws-vpc-data"
  enable_dns_hostnames = false
  enable_dns_support   = false
  enable_s3_endpoint   = false
  name                 = "vpc"
  prefix               = "mycompany-"
}
```

## Outputs

- `cidr` - **[type: string]** The CIDR block of the VPC.
- `default_network_acl_id` - **[type: string]** The ID of the network ACL created by default on VPC creation.
- `default_route_table_id` - **[type: string]** The ID of the route table created by default on VPC creation.
- `default_security_group_id` - **[type: string]** The ID of the security group created by default on VPC creation.
- `dns_resolvers` - **[type: list]** List of the private resolvers of the VPC.
- `domain_name` - **[type: string]** The suffix domain name to use by default when resolving non Fully Qualified Domain Names.
- `id` - **[type: string]** The ID of the VPC.
- `igw_id` - **[type: string]** The ID of the Internet Gateway.
- `ipv6_association_id` - **[type: string]** The association ID for the IPv6 CIDR block.
- `ipv6_cidr_block` - **[type: string]** The IPv6 CIDR block.
- `main_route_table_id` - **[type: string]** The ID of the main route table associated with this VPC.
- `name` - **[type: string]** The VPC name.
- `nat_eip` - **[type: list]** List of the NATs public IP addresses.
- `nat_gw_id`- **[type: list]** List of the NATs.
- `prefix` - **[type: string]** The VPC prefix.
- `private_route_table_id` - **[type: list]** List of the private routing table IDs.
- `private_subnets` - **[type: list]** List of the private subnet IDs.
- `public_route_table_id` - **[type: list]** List of the public routing table IDs.
- `public_subnets` - **[type: list]** List of the public subnet IDs.
- `s3_endpoint_id` - **[type: string]** The ID of the S3 endpoint.
- `s3_endpoint_state` - **[type: string]** The state of the VPC endpoint.

## VPC Access

This modules provides a security group that will allow access between the VPC
instances on all ports and protocols.

To obtain the ID of that group use the value of the output variable
`default_security_group_id`.

## Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request

Please read the [CONTRIBUTING.md](CONTRIBUTING.md) file for more details on how
to contribute to this project.

## Versioning

This project uses [SemVer](http://semver.org/) for versioning. For the versions
available, see the [tags on this repository](https://github.com/fscm/terraform-module-aws-vpc-data/tags).

## Authors

* **Frederico Martins** - [fscm](https://github.com/fscm)

See also the list of [contributors](https://github.com/fscm/terraform-module-aws-vpc-data/contributors)
who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE)
file for details
