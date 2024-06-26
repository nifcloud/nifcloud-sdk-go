// Code generated by smithy-go-codegen DO NOT EDIT.


package types

import (
	smithydocument "github.com/aws/smithy-go/document"
)

type Backup struct {
	
	BackupId *string
	
	CreateTime *string
	
	FileName *string
	
	FileSize *int32
	
	InstanceId *string
	
	Region *string
	
	noSmithyDocumentSerde
}

type BackupRule struct {
	
	BackupRuleName *string
	
	BackupTime *string
	
	Description *string
	
	Generation *int32
	
	InstanceId *string
	
	noSmithyDocumentSerde
}

type BackupRules struct {
	
	BackupRuleName *string
	
	BackupTime *string
	
	Description *string
	
	Generation *int32
	
	InstanceId *string
	
	noSmithyDocumentSerde
}

type Backups struct {
	
	BackupId *string
	
	CreateTime *string
	
	FileName *string
	
	FileSize *int32
	
	InstanceId *string
	
	Region *string
	
	noSmithyDocumentSerde
}

type FirewallGroup struct {
	
	AvailabilityZone *string
	
	Description *string
	
	FirewallGroupName *string
	
	Region *string
	
	Rules []Rules
	
	State *string
	
	noSmithyDocumentSerde
}

type FirewallGroups struct {
	
	AvailabilityZone *string
	
	Description *string
	
	FirewallGroupName *string
	
	Region *string
	
	Rules []Rules
	
	State *string
	
	noSmithyDocumentSerde
}

type Instance struct {
	
	AvailabilityZone *string
	
	CreateTime *string
	
	Description *string
	
	DiskSize *int32
	
	FirewallGroupName *string
	
	GitlabUrl *string
	
	GitlabVersion *string
	
	InstanceId *string
	
	InstanceType *string
	
	NetworkConfig *NetworkConfig
	
	ParameterGroupName *string
	
	PublicIpAddress *string
	
	Region *string
	
	RegistryUrl *string
	
	State *string
	
	Status *Status
	
	UpgradableGitlabVersions []string
	
	noSmithyDocumentSerde
}

type Instances struct {
	
	AvailabilityZone *string
	
	CreateTime *string
	
	Description *string
	
	DiskSize *int32
	
	FirewallGroupName *string
	
	GitlabUrl *string
	
	GitlabVersion *string
	
	InstanceId *string
	
	InstanceType *string
	
	NetworkConfig *NetworkConfig
	
	ParameterGroupName *string
	
	PublicIpAddress *string
	
	Region *string
	
	RegistryUrl *string
	
	State *string
	
	Status *Status
	
	UpgradableGitlabVersions []string
	
	noSmithyDocumentSerde
}

type NetworkConfig struct {
	
	NetworkId *string
	
	PrivateAddress *string
	
	noSmithyDocumentSerde
}

type ParameterGroup struct {
	
	Description *string
	
	InstanceId *string
	
	ParameterGroupName *string
	
	Parameters []Parameters
	
	Region *string
	
	noSmithyDocumentSerde
}

type ParameterGroups struct {
	
	Description *string
	
	InstanceId *string
	
	ParameterGroupName *string
	
	Parameters []Parameters
	
	Region *string
	
	noSmithyDocumentSerde
}

type Parameters struct {
	
	AllowedValues []string
	
	DataType *string
	
	Description *string
	
	IsModifiable *bool
	
	IsSecret *bool
	
	Name *string
	
	Value *string
	
	noSmithyDocumentSerde
}

type RequestNetworkConfig struct {
	
	NetworkId *string
	
	PrivateAddress *string
	
	noSmithyDocumentSerde
}

type RequestParameters struct {
	
	GitlabEmailFrom *string
	
	GitlabEmailReplyTo *string
	
	LdapEnabled *string
	
	LdapServersActiveDirectory *string
	
	LdapServersAllowUsernameOrEmailLogin *string
	
	LdapServersAttributesEmail *string
	
	LdapServersAttributesFirstName *string
	
	LdapServersAttributesLastName *string
	
	LdapServersAttributesName *string
	
	LdapServersAttributesUsername *string
	
	LdapServersBase *string
	
	LdapServersBindDn *string
	
	LdapServersBlockAutoCreatedUsers *string
	
	LdapServersEncryption *string
	
	LdapServersHost *string
	
	LdapServersLabel *string
	
	LdapServersLowercaseUsernames *string
	
	LdapServersName *string
	
	LdapServersPassword *string
	
	LdapServersPort *string
	
	LdapServersTimeout *string
	
	LdapServersUid *string
	
	LdapServersUserFilter *string
	
	LdapServersVerifyCertificates *string
	
	OmniauthAllowSingleSignOn *string
	
	OmniauthAutoLinkSamlUser *string
	
	OmniauthAutoSignInWithProvider *string
	
	OmniauthBlockAutoCreatedUsers *string
	
	OmniauthProvidersSamlAdminGroups *string
	
	OmniauthProvidersSamlAssertionConsumerServiceUrl *string
	
	OmniauthProvidersSamlAuditorGroups *string
	
	OmniauthProvidersSamlExternalGroups *string
	
	OmniauthProvidersSamlGroupsAttribute *string
	
	OmniauthProvidersSamlIdpCertFingerprint *string
	
	OmniauthProvidersSamlIdpSsoTargetUrl *string
	
	OmniauthProvidersSamlIssuer *string
	
	OmniauthProvidersSamlLabel *string
	
	OmniauthProvidersSamlName *string
	
	OmniauthProvidersSamlNameIdentifierFormat *string
	
	OmniauthProvidersSamlRequiredGroups *string
	
	SmtpPassword *string
	
	SmtpUserName *string
	
	noSmithyDocumentSerde
}

type RequestRules struct {
	
	// This member is required.
	CidrIp CidrIpOfrulesForAuthorizeFirewallRules
	
	// This member is required.
	Protocol ProtocolOfrulesForAuthorizeFirewallRules
	
	Description *string
	
	Port *int32
	
	noSmithyDocumentSerde
}

type Rules struct {
	
	CidrIp *string
	
	Description *string
	
	Id *string
	
	Port *int32
	
	Protocol *string
	
	State *string
	
	noSmithyDocumentSerde
}

type Status struct {
	
	Code *int32
	
	Name *string
	
	noSmithyDocumentSerde
}

type noSmithyDocumentSerde = smithydocument.NoSerde
