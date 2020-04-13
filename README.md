# Selenoid

Creates AWS EC2 instance with selenoid service.

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12 |
| aws | >= 2.50 |

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12 |
| aws | >= 2.50 |

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12 |
| aws | >= 2.50 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 2.50 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| add\_users\_in\_docker\_group | n/a | `list` | `[]` | no |
| ami | n/a | `string` | `""` | no |
| associate\_public\_ip\_address | n/a | `any` | `null` | no |
| availability\_zone | n/a | `any` | `null` | no |
| cm\_selenoid\_update\_args | n/a | `list` | <pre>[<br>  "--vnc"<br>]</pre> | no |
| cm\_selenoid\_update\_ui | n/a | `bool` | `true` | no |
| cm\_selenoid\_update\_ui\_args | n/a | `list` | `[]` | no |
| cpu\_core\_count | n/a | `any` | `null` | no |
| cpu\_credits | n/a | `string` | `"standard"` | no |
| cpu\_threads\_per\_core | n/a | `any` | `null` | no |
| default\_user | n/a | `any` | n/a | yes |
| disable\_api\_termination | n/a | `bool` | `false` | no |
| ebs\_optimized | n/a | `any` | `null` | no |
| hibernation | n/a | `bool` | `false` | no |
| host\_id | n/a | `any` | `null` | no |
| iam\_instance\_profile | n/a | `any` | `null` | no |
| install\_docker | n/a | `bool` | `true` | no |
| instance\_initiated\_shutdown\_behavior | n/a | `string` | `"terminate"` | no |
| instance\_type | n/a | `string` | `"t3.small"` | no |
| instances | n/a | `number` | `1` | no |
| ipv6\_address\_count | n/a | `any` | `null` | no |
| ipv6\_addresses | n/a | `any` | `null` | no |
| key\_name | n/a | `any` | `null` | no |
| metadata\_http\_endpoint | n/a | `string` | `"enabled"` | no |
| metadata\_http\_put\_response\_hop\_limit | n/a | `number` | `1` | no |
| metadata\_http\_tokens | n/a | `string` | `"optional"` | no |
| monitoring | n/a | `bool` | `false` | no |
| name | n/a | `string` | `"selenoid"` | no |
| package\_update | n/a | `bool` | `false` | no |
| package\_upgrade | n/a | `bool` | `true` | no |
| packages | n/a | `list` | `[]` | no |
| placement\_group | n/a | `any` | `null` | no |
| private\_ip | n/a | `any` | `null` | no |
| runcmd | n/a | `list` | `[]` | no |
| security\_groups | n/a | `any` | `null` | no |
| source\_dest\_check | n/a | `bool` | `true` | no |
| subnet\_id | n/a | `any` | `null` | no |
| tags | n/a | `map` | `{}` | no |
| tenancy | n/a | `any` | `null` | no |
| users | n/a | `list` | `[]` | no |
| volume\_delete\_on\_termination | n/a | `bool` | `true` | no |
| volume\_encrypted | n/a | `bool` | `false` | no |
| volume\_iops | n/a | `any` | `null` | no |
| volume\_kms\_key\_id | n/a | `any` | `null` | no |
| volume\_size | n/a | `number` | `8` | no |
| volume\_type | n/a | `string` | `"standard"` | no |
| vpc\_security\_group\_ids | n/a | `any` | `null` | no |
| write\_files | n/a | `list` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| arn | n/a |
| id | n/a |
| instance\_state | n/a |
| ipv6\_addresses | n/a |
| private\_dns | n/a |
| private\_ip | n/a |
| public\_dns | n/a |
| public\_ip | n/a |

