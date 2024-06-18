// Code generated by smithy-go-codegen DO NOT EDIT.


package types

type AvailabilityZoneOfCreateFirewallGroupRequest string

// Enum values for AvailabilityZoneOfCreateFirewallGroupRequest
const (
	AvailabilityZoneOfCreateFirewallGroupRequestEast11 AvailabilityZoneOfCreateFirewallGroupRequest = "east-11"
	AvailabilityZoneOfCreateFirewallGroupRequestEast12 AvailabilityZoneOfCreateFirewallGroupRequest = "east-12"
	AvailabilityZoneOfCreateFirewallGroupRequestEast13 AvailabilityZoneOfCreateFirewallGroupRequest = "east-13"
	AvailabilityZoneOfCreateFirewallGroupRequestEast14 AvailabilityZoneOfCreateFirewallGroupRequest = "east-14"
	AvailabilityZoneOfCreateFirewallGroupRequestEast31 AvailabilityZoneOfCreateFirewallGroupRequest = "east-31"
	AvailabilityZoneOfCreateFirewallGroupRequestWest12 AvailabilityZoneOfCreateFirewallGroupRequest = "west-12"
	AvailabilityZoneOfCreateFirewallGroupRequestWest13 AvailabilityZoneOfCreateFirewallGroupRequest = "west-13"
	AvailabilityZoneOfCreateFirewallGroupRequestJpWest21 AvailabilityZoneOfCreateFirewallGroupRequest = "jp-west-21"
)

// Values returns all known values for
// AvailabilityZoneOfCreateFirewallGroupRequest. Note that this can be expanded in
// the future, and so it is only as up to date as the client. The ordering of this
// slice is not guaranteed to be stable across updates.
func (AvailabilityZoneOfCreateFirewallGroupRequest) Values() []AvailabilityZoneOfCreateFirewallGroupRequest {
	return []AvailabilityZoneOfCreateFirewallGroupRequest{
		"east-11",
		"east-12",
		"east-13",
		"east-14",
		"east-31",
		"west-12",
		"west-13",
		"jp-west-21",
	}
}

type AvailabilityZoneOfCreateInstanceRequest string

// Enum values for AvailabilityZoneOfCreateInstanceRequest
const (
	AvailabilityZoneOfCreateInstanceRequestEast11 AvailabilityZoneOfCreateInstanceRequest = "east-11"
	AvailabilityZoneOfCreateInstanceRequestEast12 AvailabilityZoneOfCreateInstanceRequest = "east-12"
	AvailabilityZoneOfCreateInstanceRequestEast13 AvailabilityZoneOfCreateInstanceRequest = "east-13"
	AvailabilityZoneOfCreateInstanceRequestEast14 AvailabilityZoneOfCreateInstanceRequest = "east-14"
	AvailabilityZoneOfCreateInstanceRequestEast31 AvailabilityZoneOfCreateInstanceRequest = "east-31"
	AvailabilityZoneOfCreateInstanceRequestWest12 AvailabilityZoneOfCreateInstanceRequest = "west-12"
	AvailabilityZoneOfCreateInstanceRequestWest13 AvailabilityZoneOfCreateInstanceRequest = "west-13"
	AvailabilityZoneOfCreateInstanceRequestJpWest21 AvailabilityZoneOfCreateInstanceRequest = "jp-west-21"
)

// Values returns all known values for AvailabilityZoneOfCreateInstanceRequest.
// Note that this can be expanded in the future, and so it is only as up to date as
// the client. The ordering of this slice is not guaranteed to be stable across
// updates.
func (AvailabilityZoneOfCreateInstanceRequest) Values() []AvailabilityZoneOfCreateInstanceRequest {
	return []AvailabilityZoneOfCreateInstanceRequest{
		"east-11",
		"east-12",
		"east-13",
		"east-14",
		"east-31",
		"west-12",
		"west-13",
		"jp-west-21",
	}
}

type AvailabilityZoneOfRestoreInstanceRequest string

// Enum values for AvailabilityZoneOfRestoreInstanceRequest
const (
	AvailabilityZoneOfRestoreInstanceRequestEast11 AvailabilityZoneOfRestoreInstanceRequest = "east-11"
	AvailabilityZoneOfRestoreInstanceRequestEast12 AvailabilityZoneOfRestoreInstanceRequest = "east-12"
	AvailabilityZoneOfRestoreInstanceRequestEast13 AvailabilityZoneOfRestoreInstanceRequest = "east-13"
	AvailabilityZoneOfRestoreInstanceRequestEast14 AvailabilityZoneOfRestoreInstanceRequest = "east-14"
	AvailabilityZoneOfRestoreInstanceRequestEast31 AvailabilityZoneOfRestoreInstanceRequest = "east-31"
	AvailabilityZoneOfRestoreInstanceRequestWest12 AvailabilityZoneOfRestoreInstanceRequest = "west-12"
	AvailabilityZoneOfRestoreInstanceRequestWest13 AvailabilityZoneOfRestoreInstanceRequest = "west-13"
	AvailabilityZoneOfRestoreInstanceRequestJpWest21 AvailabilityZoneOfRestoreInstanceRequest = "jp-west-21"
)

// Values returns all known values for AvailabilityZoneOfRestoreInstanceRequest.
// Note that this can be expanded in the future, and so it is only as up to date as
// the client. The ordering of this slice is not guaranteed to be stable across
// updates.
func (AvailabilityZoneOfRestoreInstanceRequest) Values() []AvailabilityZoneOfRestoreInstanceRequest {
	return []AvailabilityZoneOfRestoreInstanceRequest{
		"east-11",
		"east-12",
		"east-13",
		"east-14",
		"east-31",
		"west-12",
		"west-13",
		"jp-west-21",
	}
}

type CidrIpOfrulesForAuthorizeFirewallRules string

// Enum values for CidrIpOfrulesForAuthorizeFirewallRules
const (
	CidrIpOfrulesForAuthorizeFirewallRulesIpv4ip CidrIpOfrulesForAuthorizeFirewallRules = "IPv4IP"
	CidrIpOfrulesForAuthorizeFirewallRulesCidr CidrIpOfrulesForAuthorizeFirewallRules = "CIDR"
)

// Values returns all known values for CidrIpOfrulesForAuthorizeFirewallRules.
// Note that this can be expanded in the future, and so it is only as up to date as
// the client. The ordering of this slice is not guaranteed to be stable across
// updates.
func (CidrIpOfrulesForAuthorizeFirewallRules) Values() []CidrIpOfrulesForAuthorizeFirewallRules {
	return []CidrIpOfrulesForAuthorizeFirewallRules{
		"IPv4IP",
		"CIDR",
	}
}

type InstanceTypeOfCreateInstanceRequest string

// Enum values for InstanceTypeOfCreateInstanceRequest
const (
	InstanceTypeOfCreateInstanceRequestCLarge InstanceTypeOfCreateInstanceRequest = "c-large"
	InstanceTypeOfCreateInstanceRequestCLarge8 InstanceTypeOfCreateInstanceRequest = "c-large8"
	InstanceTypeOfCreateInstanceRequestELarge InstanceTypeOfCreateInstanceRequest = "e-large"
	InstanceTypeOfCreateInstanceRequestELarge8 InstanceTypeOfCreateInstanceRequest = "e-large8"
	InstanceTypeOfCreateInstanceRequestELarge16 InstanceTypeOfCreateInstanceRequest = "e-large16"
	InstanceTypeOfCreateInstanceRequestELarge24 InstanceTypeOfCreateInstanceRequest = "e-large24"
	InstanceTypeOfCreateInstanceRequestELarge32 InstanceTypeOfCreateInstanceRequest = "e-large32"
	InstanceTypeOfCreateInstanceRequestEExtraLarge8 InstanceTypeOfCreateInstanceRequest = "e-extra-large8"
	InstanceTypeOfCreateInstanceRequestEExtraLarge16 InstanceTypeOfCreateInstanceRequest = "e-extra-large16"
	InstanceTypeOfCreateInstanceRequestEExtraLarge24 InstanceTypeOfCreateInstanceRequest = "e-extra-large24"
	InstanceTypeOfCreateInstanceRequestEExtraLarge32 InstanceTypeOfCreateInstanceRequest = "e-extra-large32"
	InstanceTypeOfCreateInstanceRequestEExtraLarge48 InstanceTypeOfCreateInstanceRequest = "e-extra-large48"
	InstanceTypeOfCreateInstanceRequestEDoubleLarge16 InstanceTypeOfCreateInstanceRequest = "e-double-large16"
	InstanceTypeOfCreateInstanceRequestEDoubleLarge24 InstanceTypeOfCreateInstanceRequest = "e-double-large24"
	InstanceTypeOfCreateInstanceRequestEDoubleLarge32 InstanceTypeOfCreateInstanceRequest = "e-double-large32"
	InstanceTypeOfCreateInstanceRequestEDoubleLarge48 InstanceTypeOfCreateInstanceRequest = "e-double-large48"
	InstanceTypeOfCreateInstanceRequestEDoubleLarge64 InstanceTypeOfCreateInstanceRequest = "e-double-large64"
	InstanceTypeOfCreateInstanceRequestEDoubleLarge96 InstanceTypeOfCreateInstanceRequest = "e-double-large96"
	InstanceTypeOfCreateInstanceRequestH2Large InstanceTypeOfCreateInstanceRequest = "h2-large"
	InstanceTypeOfCreateInstanceRequestH2Large8 InstanceTypeOfCreateInstanceRequest = "h2-large8"
	InstanceTypeOfCreateInstanceRequestH2Large16 InstanceTypeOfCreateInstanceRequest = "h2-large16"
	InstanceTypeOfCreateInstanceRequestH2Large24 InstanceTypeOfCreateInstanceRequest = "h2-large24"
	InstanceTypeOfCreateInstanceRequestH2Large32 InstanceTypeOfCreateInstanceRequest = "h2-large32"
	InstanceTypeOfCreateInstanceRequestH2ExtraLarge8 InstanceTypeOfCreateInstanceRequest = "h2-extra-large8"
	InstanceTypeOfCreateInstanceRequestH2ExtraLarge16 InstanceTypeOfCreateInstanceRequest = "h2-extra-large16"
	InstanceTypeOfCreateInstanceRequestH2ExtraLarge24 InstanceTypeOfCreateInstanceRequest = "h2-extra-large24"
	InstanceTypeOfCreateInstanceRequestH2ExtraLarge32 InstanceTypeOfCreateInstanceRequest = "h2-extra-large32"
	InstanceTypeOfCreateInstanceRequestH2ExtraLarge48 InstanceTypeOfCreateInstanceRequest = "h2-extra-large48"
	InstanceTypeOfCreateInstanceRequestH2DoubleLarge16 InstanceTypeOfCreateInstanceRequest = "h2-double-large16"
	InstanceTypeOfCreateInstanceRequestH2DoubleLarge24 InstanceTypeOfCreateInstanceRequest = "h2-double-large24"
	InstanceTypeOfCreateInstanceRequestH2DoubleLarge32 InstanceTypeOfCreateInstanceRequest = "h2-double-large32"
	InstanceTypeOfCreateInstanceRequestH2DoubleLarge48 InstanceTypeOfCreateInstanceRequest = "h2-double-large48"
	InstanceTypeOfCreateInstanceRequestH2DoubleLarge64 InstanceTypeOfCreateInstanceRequest = "h2-double-large64"
	InstanceTypeOfCreateInstanceRequestH2DoubleLarge96 InstanceTypeOfCreateInstanceRequest = "h2-double-large96"
)

// Values returns all known values for InstanceTypeOfCreateInstanceRequest. Note
// that this can be expanded in the future, and so it is only as up to date as the
// client. The ordering of this slice is not guaranteed to be stable across
// updates.
func (InstanceTypeOfCreateInstanceRequest) Values() []InstanceTypeOfCreateInstanceRequest {
	return []InstanceTypeOfCreateInstanceRequest{
		"c-large",
		"c-large8",
		"e-large",
		"e-large8",
		"e-large16",
		"e-large24",
		"e-large32",
		"e-extra-large8",
		"e-extra-large16",
		"e-extra-large24",
		"e-extra-large32",
		"e-extra-large48",
		"e-double-large16",
		"e-double-large24",
		"e-double-large32",
		"e-double-large48",
		"e-double-large64",
		"e-double-large96",
		"h2-large",
		"h2-large8",
		"h2-large16",
		"h2-large24",
		"h2-large32",
		"h2-extra-large8",
		"h2-extra-large16",
		"h2-extra-large24",
		"h2-extra-large32",
		"h2-extra-large48",
		"h2-double-large16",
		"h2-double-large24",
		"h2-double-large32",
		"h2-double-large48",
		"h2-double-large64",
		"h2-double-large96",
	}
}

type InstanceTypeOfRestoreInstanceRequest string

// Enum values for InstanceTypeOfRestoreInstanceRequest
const (
	InstanceTypeOfRestoreInstanceRequestCLarge InstanceTypeOfRestoreInstanceRequest = "c-large"
	InstanceTypeOfRestoreInstanceRequestCLarge8 InstanceTypeOfRestoreInstanceRequest = "c-large8"
	InstanceTypeOfRestoreInstanceRequestELarge InstanceTypeOfRestoreInstanceRequest = "e-large"
	InstanceTypeOfRestoreInstanceRequestELarge8 InstanceTypeOfRestoreInstanceRequest = "e-large8"
	InstanceTypeOfRestoreInstanceRequestELarge16 InstanceTypeOfRestoreInstanceRequest = "e-large16"
	InstanceTypeOfRestoreInstanceRequestELarge24 InstanceTypeOfRestoreInstanceRequest = "e-large24"
	InstanceTypeOfRestoreInstanceRequestELarge32 InstanceTypeOfRestoreInstanceRequest = "e-large32"
	InstanceTypeOfRestoreInstanceRequestEExtraLarge8 InstanceTypeOfRestoreInstanceRequest = "e-extra-large8"
	InstanceTypeOfRestoreInstanceRequestEExtraLarge16 InstanceTypeOfRestoreInstanceRequest = "e-extra-large16"
	InstanceTypeOfRestoreInstanceRequestEExtraLarge24 InstanceTypeOfRestoreInstanceRequest = "e-extra-large24"
	InstanceTypeOfRestoreInstanceRequestEExtraLarge32 InstanceTypeOfRestoreInstanceRequest = "e-extra-large32"
	InstanceTypeOfRestoreInstanceRequestEExtraLarge48 InstanceTypeOfRestoreInstanceRequest = "e-extra-large48"
	InstanceTypeOfRestoreInstanceRequestEDoubleLarge16 InstanceTypeOfRestoreInstanceRequest = "e-double-large16"
	InstanceTypeOfRestoreInstanceRequestEDoubleLarge24 InstanceTypeOfRestoreInstanceRequest = "e-double-large24"
	InstanceTypeOfRestoreInstanceRequestEDoubleLarge32 InstanceTypeOfRestoreInstanceRequest = "e-double-large32"
	InstanceTypeOfRestoreInstanceRequestEDoubleLarge48 InstanceTypeOfRestoreInstanceRequest = "e-double-large48"
	InstanceTypeOfRestoreInstanceRequestEDoubleLarge64 InstanceTypeOfRestoreInstanceRequest = "e-double-large64"
	InstanceTypeOfRestoreInstanceRequestEDoubleLarge96 InstanceTypeOfRestoreInstanceRequest = "e-double-large96"
	InstanceTypeOfRestoreInstanceRequestH2Large InstanceTypeOfRestoreInstanceRequest = "h2-large"
	InstanceTypeOfRestoreInstanceRequestH2Large8 InstanceTypeOfRestoreInstanceRequest = "h2-large8"
	InstanceTypeOfRestoreInstanceRequestH2Large16 InstanceTypeOfRestoreInstanceRequest = "h2-large16"
	InstanceTypeOfRestoreInstanceRequestH2Large24 InstanceTypeOfRestoreInstanceRequest = "h2-large24"
	InstanceTypeOfRestoreInstanceRequestH2Large32 InstanceTypeOfRestoreInstanceRequest = "h2-large32"
	InstanceTypeOfRestoreInstanceRequestH2ExtraLarge8 InstanceTypeOfRestoreInstanceRequest = "h2-extra-large8"
	InstanceTypeOfRestoreInstanceRequestH2ExtraLarge16 InstanceTypeOfRestoreInstanceRequest = "h2-extra-large16"
	InstanceTypeOfRestoreInstanceRequestH2ExtraLarge24 InstanceTypeOfRestoreInstanceRequest = "h2-extra-large24"
	InstanceTypeOfRestoreInstanceRequestH2ExtraLarge32 InstanceTypeOfRestoreInstanceRequest = "h2-extra-large32"
	InstanceTypeOfRestoreInstanceRequestH2ExtraLarge48 InstanceTypeOfRestoreInstanceRequest = "h2-extra-large48"
	InstanceTypeOfRestoreInstanceRequestH2DoubleLarge16 InstanceTypeOfRestoreInstanceRequest = "h2-double-large16"
	InstanceTypeOfRestoreInstanceRequestH2DoubleLarge24 InstanceTypeOfRestoreInstanceRequest = "h2-double-large24"
	InstanceTypeOfRestoreInstanceRequestH2DoubleLarge32 InstanceTypeOfRestoreInstanceRequest = "h2-double-large32"
	InstanceTypeOfRestoreInstanceRequestH2DoubleLarge48 InstanceTypeOfRestoreInstanceRequest = "h2-double-large48"
	InstanceTypeOfRestoreInstanceRequestH2DoubleLarge64 InstanceTypeOfRestoreInstanceRequest = "h2-double-large64"
	InstanceTypeOfRestoreInstanceRequestH2DoubleLarge96 InstanceTypeOfRestoreInstanceRequest = "h2-double-large96"
)

// Values returns all known values for InstanceTypeOfRestoreInstanceRequest. Note
// that this can be expanded in the future, and so it is only as up to date as the
// client. The ordering of this slice is not guaranteed to be stable across
// updates.
func (InstanceTypeOfRestoreInstanceRequest) Values() []InstanceTypeOfRestoreInstanceRequest {
	return []InstanceTypeOfRestoreInstanceRequest{
		"c-large",
		"c-large8",
		"e-large",
		"e-large8",
		"e-large16",
		"e-large24",
		"e-large32",
		"e-extra-large8",
		"e-extra-large16",
		"e-extra-large24",
		"e-extra-large32",
		"e-extra-large48",
		"e-double-large16",
		"e-double-large24",
		"e-double-large32",
		"e-double-large48",
		"e-double-large64",
		"e-double-large96",
		"h2-large",
		"h2-large8",
		"h2-large16",
		"h2-large24",
		"h2-large32",
		"h2-extra-large8",
		"h2-extra-large16",
		"h2-extra-large24",
		"h2-extra-large32",
		"h2-extra-large48",
		"h2-double-large16",
		"h2-double-large24",
		"h2-double-large32",
		"h2-double-large48",
		"h2-double-large64",
		"h2-double-large96",
	}
}

type InstanceTypeOfUpdateInstanceRequest string

// Enum values for InstanceTypeOfUpdateInstanceRequest
const (
	InstanceTypeOfUpdateInstanceRequestCLarge InstanceTypeOfUpdateInstanceRequest = "c-large"
	InstanceTypeOfUpdateInstanceRequestCLarge8 InstanceTypeOfUpdateInstanceRequest = "c-large8"
	InstanceTypeOfUpdateInstanceRequestELarge InstanceTypeOfUpdateInstanceRequest = "e-large"
	InstanceTypeOfUpdateInstanceRequestELarge8 InstanceTypeOfUpdateInstanceRequest = "e-large8"
	InstanceTypeOfUpdateInstanceRequestELarge16 InstanceTypeOfUpdateInstanceRequest = "e-large16"
	InstanceTypeOfUpdateInstanceRequestELarge24 InstanceTypeOfUpdateInstanceRequest = "e-large24"
	InstanceTypeOfUpdateInstanceRequestELarge32 InstanceTypeOfUpdateInstanceRequest = "e-large32"
	InstanceTypeOfUpdateInstanceRequestEExtraLarge8 InstanceTypeOfUpdateInstanceRequest = "e-extra-large8"
	InstanceTypeOfUpdateInstanceRequestEExtraLarge16 InstanceTypeOfUpdateInstanceRequest = "e-extra-large16"
	InstanceTypeOfUpdateInstanceRequestEExtraLarge24 InstanceTypeOfUpdateInstanceRequest = "e-extra-large24"
	InstanceTypeOfUpdateInstanceRequestEExtraLarge32 InstanceTypeOfUpdateInstanceRequest = "e-extra-large32"
	InstanceTypeOfUpdateInstanceRequestEExtraLarge48 InstanceTypeOfUpdateInstanceRequest = "e-extra-large48"
	InstanceTypeOfUpdateInstanceRequestEDoubleLarge16 InstanceTypeOfUpdateInstanceRequest = "e-double-large16"
	InstanceTypeOfUpdateInstanceRequestEDoubleLarge24 InstanceTypeOfUpdateInstanceRequest = "e-double-large24"
	InstanceTypeOfUpdateInstanceRequestEDoubleLarge32 InstanceTypeOfUpdateInstanceRequest = "e-double-large32"
	InstanceTypeOfUpdateInstanceRequestEDoubleLarge48 InstanceTypeOfUpdateInstanceRequest = "e-double-large48"
	InstanceTypeOfUpdateInstanceRequestEDoubleLarge64 InstanceTypeOfUpdateInstanceRequest = "e-double-large64"
	InstanceTypeOfUpdateInstanceRequestEDoubleLarge96 InstanceTypeOfUpdateInstanceRequest = "e-double-large96"
	InstanceTypeOfUpdateInstanceRequestH2Large InstanceTypeOfUpdateInstanceRequest = "h2-large"
	InstanceTypeOfUpdateInstanceRequestH2Large8 InstanceTypeOfUpdateInstanceRequest = "h2-large8"
	InstanceTypeOfUpdateInstanceRequestH2Large16 InstanceTypeOfUpdateInstanceRequest = "h2-large16"
	InstanceTypeOfUpdateInstanceRequestH2Large24 InstanceTypeOfUpdateInstanceRequest = "h2-large24"
	InstanceTypeOfUpdateInstanceRequestH2Large32 InstanceTypeOfUpdateInstanceRequest = "h2-large32"
	InstanceTypeOfUpdateInstanceRequestH2ExtraLarge8 InstanceTypeOfUpdateInstanceRequest = "h2-extra-large8"
	InstanceTypeOfUpdateInstanceRequestH2ExtraLarge16 InstanceTypeOfUpdateInstanceRequest = "h2-extra-large16"
	InstanceTypeOfUpdateInstanceRequestH2ExtraLarge24 InstanceTypeOfUpdateInstanceRequest = "h2-extra-large24"
	InstanceTypeOfUpdateInstanceRequestH2ExtraLarge32 InstanceTypeOfUpdateInstanceRequest = "h2-extra-large32"
	InstanceTypeOfUpdateInstanceRequestH2ExtraLarge48 InstanceTypeOfUpdateInstanceRequest = "h2-extra-large48"
	InstanceTypeOfUpdateInstanceRequestH2DoubleLarge16 InstanceTypeOfUpdateInstanceRequest = "h2-double-large16"
	InstanceTypeOfUpdateInstanceRequestH2DoubleLarge24 InstanceTypeOfUpdateInstanceRequest = "h2-double-large24"
	InstanceTypeOfUpdateInstanceRequestH2DoubleLarge32 InstanceTypeOfUpdateInstanceRequest = "h2-double-large32"
	InstanceTypeOfUpdateInstanceRequestH2DoubleLarge48 InstanceTypeOfUpdateInstanceRequest = "h2-double-large48"
	InstanceTypeOfUpdateInstanceRequestH2DoubleLarge64 InstanceTypeOfUpdateInstanceRequest = "h2-double-large64"
	InstanceTypeOfUpdateInstanceRequestH2DoubleLarge96 InstanceTypeOfUpdateInstanceRequest = "h2-double-large96"
)

// Values returns all known values for InstanceTypeOfUpdateInstanceRequest. Note
// that this can be expanded in the future, and so it is only as up to date as the
// client. The ordering of this slice is not guaranteed to be stable across
// updates.
func (InstanceTypeOfUpdateInstanceRequest) Values() []InstanceTypeOfUpdateInstanceRequest {
	return []InstanceTypeOfUpdateInstanceRequest{
		"c-large",
		"c-large8",
		"e-large",
		"e-large8",
		"e-large16",
		"e-large24",
		"e-large32",
		"e-extra-large8",
		"e-extra-large16",
		"e-extra-large24",
		"e-extra-large32",
		"e-extra-large48",
		"e-double-large16",
		"e-double-large24",
		"e-double-large32",
		"e-double-large48",
		"e-double-large64",
		"e-double-large96",
		"h2-large",
		"h2-large8",
		"h2-large16",
		"h2-large24",
		"h2-large32",
		"h2-extra-large8",
		"h2-extra-large16",
		"h2-extra-large24",
		"h2-extra-large32",
		"h2-extra-large48",
		"h2-double-large16",
		"h2-double-large24",
		"h2-double-large32",
		"h2-double-large48",
		"h2-double-large64",
		"h2-double-large96",
	}
}

type ProtocolOfrulesForAuthorizeFirewallRules string

// Enum values for ProtocolOfrulesForAuthorizeFirewallRules
const (
	ProtocolOfrulesForAuthorizeFirewallRulesTcp ProtocolOfrulesForAuthorizeFirewallRules = "TCP"
	ProtocolOfrulesForAuthorizeFirewallRulesIcmp ProtocolOfrulesForAuthorizeFirewallRules = "ICMP"
)

// Values returns all known values for ProtocolOfrulesForAuthorizeFirewallRules.
// Note that this can be expanded in the future, and so it is only as up to date as
// the client. The ordering of this slice is not guaranteed to be stable across
// updates.
func (ProtocolOfrulesForAuthorizeFirewallRules) Values() []ProtocolOfrulesForAuthorizeFirewallRules {
	return []ProtocolOfrulesForAuthorizeFirewallRules{
		"TCP",
		"ICMP",
	}
}

type RegionOfobjectStorageConfigForCreateInstance string

// Enum values for RegionOfobjectStorageConfigForCreateInstance
const (
	RegionOfobjectStorageConfigForCreateInstanceJpEast1 RegionOfobjectStorageConfigForCreateInstance = "jp-east-1"
	RegionOfobjectStorageConfigForCreateInstanceJpWest2 RegionOfobjectStorageConfigForCreateInstance = "jp-west-2"
)

// Values returns all known values for
// RegionOfobjectStorageConfigForCreateInstance. Note that this can be expanded in
// the future, and so it is only as up to date as the client. The ordering of this
// slice is not guaranteed to be stable across updates.
func (RegionOfobjectStorageConfigForCreateInstance) Values() []RegionOfobjectStorageConfigForCreateInstance {
	return []RegionOfobjectStorageConfigForCreateInstance{
		"jp-east-1",
		"jp-west-2",
	}
}

type RegionOfobjectStorageConfigForRestoreInstance string

// Enum values for RegionOfobjectStorageConfigForRestoreInstance
const (
	RegionOfobjectStorageConfigForRestoreInstanceJpEast1 RegionOfobjectStorageConfigForRestoreInstance = "jp-east-1"
	RegionOfobjectStorageConfigForRestoreInstanceJpWest2 RegionOfobjectStorageConfigForRestoreInstance = "jp-west-2"
)

// Values returns all known values for
// RegionOfobjectStorageConfigForRestoreInstance. Note that this can be expanded in
// the future, and so it is only as up to date as the client. The ordering of this
// slice is not guaranteed to be stable across updates.
func (RegionOfobjectStorageConfigForRestoreInstance) Values() []RegionOfobjectStorageConfigForRestoreInstance {
	return []RegionOfobjectStorageConfigForRestoreInstance{
		"jp-east-1",
		"jp-west-2",
	}
}
