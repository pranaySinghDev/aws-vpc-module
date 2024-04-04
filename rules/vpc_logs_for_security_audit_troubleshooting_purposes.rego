package rules.vpc_logs_for_security_audit_troubleshooting_purposes
import data.fugue

__rego__metadoc__ := {
	"custom": {
		"controls": {
			"VPC": [
				"VPC_1.0"
			]
		},
		"severity": "Medium"
	},
	"description": "Document: Technology Engineering - VPC - Best Practice - Version: 1",
	"id": "1.0",
	"title": "VPC logs shall be enabled  for security, audit, and troubleshooting purposes.",
}

# Please write your OPA rule here

resource_type = "MULTIPLE"

# every flow log in the template
flow_logs = fugue.resources("aws_flow_log")

# every VPC in the template
vpcs = fugue.resources("aws_vpc")

# VPC is valid if there is an associated flow log
is_valid_vpc(vpc) {
	vpc.id == flow_logs[_].vpc_id
}

is_valid_vpc(vpc) {
	vpcid = regex.split("/", vpc.arn)[1]
	vpcid == flow_logs[_].vpc_id
}

policy[p] {
	resource = vpcs[_]
	not is_valid_vpc(resource)
	p = fugue.deny_resource(resource)
}

policy[p] {
	resource = vpcs[_]
	is_valid_vpc(resource)
	p = fugue.allow_resource(resource)
}
