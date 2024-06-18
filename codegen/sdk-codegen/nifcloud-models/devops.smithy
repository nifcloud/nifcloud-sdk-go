namespace com.nifcloud.api.devops

use aws.auth#sigv4
use aws.api#service
use aws.protocols#restJson1
use aws.protocols#restXml
use aws.protocols#awsQuery
use aws.protocols#ec2Query
use smithy.waiters#waitable
use aws.protocols#ec2QueryName


structure ListInstancesRequest {}

list ListOfInstances {
    member: Instances,
}

structure Instances {
    @jsonName("availabilityZone")
    AvailabilityZone: String,
    @jsonName("createTime")
    CreateTime: String,
    @jsonName("description")
    Description: String,
    @jsonName("diskSize")
    DiskSize: Integer,
    @jsonName("firewallGroupName")
    FirewallGroupName: String,
    @jsonName("gitlabUrl")
    GitlabUrl: String,
    @jsonName("gitlabVersion")
    GitlabVersion: String,
    @jsonName("instanceId")
    InstanceId: String,
    @jsonName("instanceType")
    InstanceType: String,
    @jsonName("networkConfig")
    NetworkConfig: NetworkConfig,
    @jsonName("objectStorageConfig")
    ObjectStorageConfig: ObjectStorageConfig,
    @jsonName("parameterGroupName")
    ParameterGroupName: String,
    @jsonName("publicIpAddress")
    PublicIpAddress: String,
    @jsonName("region")
    Region: String,
    @jsonName("registryUrl")
    RegistryUrl: String,
    @jsonName("state")
    State: String,
    @jsonName("status")
    Status: Status,
    @jsonName("to")
    To: String,
    @jsonName("upgradableGitlabVersions")
    UpgradableGitlabVersions: ListOfUpgradableGitlabVersions,
}

list ListOfUpgradableGitlabVersions {
    member: String,
}

structure NetworkConfig {
    @jsonName("networkId")
    NetworkId: String,
    @jsonName("privateAddress")
    PrivateAddress: String,
}

structure ObjectStorageConfig {
    @jsonName("account")
    Account: String,
    @jsonName("bucketUseObjects")
    BucketUseObjects: BucketUseObjects,
    @jsonName("region")
    Region: String,
}

structure BucketUseObjects {
    @jsonName("containerRegistry")
    ContainerRegistry: String,
    @jsonName("lfs")
    Lfs: String,
    @jsonName("packages")
    Packages: String,
}

structure Status {
    @jsonName("code")
    Code: Integer,
    @jsonName("name")
    Name: String,
}

structure ListInstancesResult {
    @jsonName("instances")
    Instances: ListOfInstances,
}

@enum([
  {
      name: "C_LARGE",
      value: "c-large",
  },
  {
      name: "C_LARGE8",
      value: "c-large8",
  },
  {
      name: "E_LARGE",
      value: "e-large",
  },
  {
      name: "E_LARGE8",
      value: "e-large8",
  },
  {
      name: "E_LARGE16",
      value: "e-large16",
  },
  {
      name: "E_LARGE24",
      value: "e-large24",
  },
  {
      name: "E_LARGE32",
      value: "e-large32",
  },
  {
      name: "E_EXTRA_LARGE8",
      value: "e-extra-large8",
  },
  {
      name: "E_EXTRA_LARGE16",
      value: "e-extra-large16",
  },
  {
      name: "E_EXTRA_LARGE24",
      value: "e-extra-large24",
  },
  {
      name: "E_EXTRA_LARGE32",
      value: "e-extra-large32",
  },
  {
      name: "E_EXTRA_LARGE48",
      value: "e-extra-large48",
  },
  {
      name: "E_DOUBLE_LARGE16",
      value: "e-double-large16",
  },
  {
      name: "E_DOUBLE_LARGE24",
      value: "e-double-large24",
  },
  {
      name: "E_DOUBLE_LARGE32",
      value: "e-double-large32",
  },
  {
      name: "E_DOUBLE_LARGE48",
      value: "e-double-large48",
  },
  {
      name: "E_DOUBLE_LARGE64",
      value: "e-double-large64",
  },
  {
      name: "E_DOUBLE_LARGE96",
      value: "e-double-large96",
  },
  {
      name: "H2_LARGE",
      value: "h2-large",
  },
  {
      name: "H2_LARGE8",
      value: "h2-large8",
  },
  {
      name: "H2_LARGE16",
      value: "h2-large16",
  },
  {
      name: "H2_LARGE24",
      value: "h2-large24",
  },
  {
      name: "H2_LARGE32",
      value: "h2-large32",
  },
  {
      name: "H2_EXTRA_LARGE8",
      value: "h2-extra-large8",
  },
  {
      name: "H2_EXTRA_LARGE16",
      value: "h2-extra-large16",
  },
  {
      name: "H2_EXTRA_LARGE24",
      value: "h2-extra-large24",
  },
  {
      name: "H2_EXTRA_LARGE32",
      value: "h2-extra-large32",
  },
  {
      name: "H2_EXTRA_LARGE48",
      value: "h2-extra-large48",
  },
  {
      name: "H2_DOUBLE_LARGE16",
      value: "h2-double-large16",
  },
  {
      name: "H2_DOUBLE_LARGE24",
      value: "h2-double-large24",
  },
  {
      name: "H2_DOUBLE_LARGE32",
      value: "h2-double-large32",
  },
  {
      name: "H2_DOUBLE_LARGE48",
      value: "h2-double-large48",
  },
  {
      name: "H2_DOUBLE_LARGE64",
      value: "h2-double-large64",
  },
  {
      name: "H2_DOUBLE_LARGE96",
      value: "h2-double-large96",
  },
])
string InstanceTypeOfCreateInstanceRequest

@enum([
  {
      name: "EAST_11",
      value: "east-11",
  },
  {
      name: "EAST_12",
      value: "east-12",
  },
  {
      name: "EAST_13",
      value: "east-13",
  },
  {
      name: "EAST_14",
      value: "east-14",
  },
  {
      name: "EAST_31",
      value: "east-31",
  },
  {
      name: "WEST_12",
      value: "west-12",
  },
  {
      name: "WEST_13",
      value: "west-13",
  },
  {
      name: "JP_WEST_21",
      value: "jp-west-21",
  },
])
string AvailabilityZoneOfCreateInstanceRequest

structure RequestNetworkConfig {
    @jsonName("networkId")
    NetworkId: String,
    @jsonName("privateAddress")
    PrivateAddress: String,
}

structure RequestObjectStorageConfig {
    @jsonName("account")
    Account: String,
    @jsonName("region")
    Region: RegionOfobjectStorageConfigForCreateInstance,
    @jsonName("bucketUseObjects")
    RequestBucketUseObjects: RequestBucketUseObjects,
}

@enum([
  {
      name: "JP_EAST_1",
      value: "jp-east-1",
  },
  {
      name: "JP_WEST_2",
      value: "jp-west-2",
  },
])
string RegionOfobjectStorageConfigForCreateInstance

structure RequestBucketUseObjects {
    @jsonName("containerRegistry")
    ContainerRegistry: String,
    @jsonName("lfs")
    Lfs: String,
    @jsonName("packages")
    Packages: String,
}

structure CreateInstanceRequest {
    @jsonName("availabilityZone")
    AvailabilityZone: AvailabilityZoneOfCreateInstanceRequest,
    @jsonName("description")
    Description: String,
    @required
    @jsonName("diskSize")
    DiskSize: Integer,
    @required
    @jsonName("firewallGroupName")
    FirewallGroupName: String,
    @required
    @jsonName("initialRootPassword")
    InitialRootPassword: String,
    @required
    @jsonName("instanceId")
    InstanceId: String,
    @required
    @jsonName("instanceType")
    InstanceType: InstanceTypeOfCreateInstanceRequest,
    @jsonName("networkConfig")
    NetworkConfig: RequestNetworkConfig,
    @jsonName("objectStorageConfig")
    ObjectStorageConfig: RequestObjectStorageConfig,
    @required
    @jsonName("parameterGroupName")
    ParameterGroupName: String,
}

structure Instance {
    @jsonName("availabilityZone")
    AvailabilityZone: String,
    @jsonName("createTime")
    CreateTime: String,
    @jsonName("description")
    Description: String,
    @jsonName("diskSize")
    DiskSize: Integer,
    @jsonName("firewallGroupName")
    FirewallGroupName: String,
    @jsonName("gitlabUrl")
    GitlabUrl: String,
    @jsonName("gitlabVersion")
    GitlabVersion: String,
    @jsonName("instanceId")
    InstanceId: String,
    @jsonName("instanceType")
    InstanceType: String,
    @jsonName("networkConfig")
    NetworkConfig: NetworkConfig,
    @jsonName("objectStorageConfig")
    ObjectStorageConfig: ObjectStorageConfig,
    @jsonName("parameterGroupName")
    ParameterGroupName: String,
    @jsonName("publicIpAddress")
    PublicIpAddress: String,
    @jsonName("region")
    Region: String,
    @jsonName("registryUrl")
    RegistryUrl: String,
    @jsonName("state")
    State: String,
    @jsonName("status")
    Status: Status,
    @jsonName("to")
    To: String,
    @jsonName("upgradableGitlabVersions")
    UpgradableGitlabVersions: ListOfUpgradableGitlabVersions,
}

structure CreateInstanceResult {
    @jsonName("instance")
    Instance: Instance,
}

structure GetInstanceRequest {
    @required
    @httpLabel
    @jsonName("InstanceId")
    InstanceId: String,
}

structure GetInstanceResult {
    @jsonName("instance")
    Instance: Instance,
}

@enum([
  {
      name: "C_LARGE",
      value: "c-large",
  },
  {
      name: "C_LARGE8",
      value: "c-large8",
  },
  {
      name: "E_LARGE",
      value: "e-large",
  },
  {
      name: "E_LARGE8",
      value: "e-large8",
  },
  {
      name: "E_LARGE16",
      value: "e-large16",
  },
  {
      name: "E_LARGE24",
      value: "e-large24",
  },
  {
      name: "E_LARGE32",
      value: "e-large32",
  },
  {
      name: "E_EXTRA_LARGE8",
      value: "e-extra-large8",
  },
  {
      name: "E_EXTRA_LARGE16",
      value: "e-extra-large16",
  },
  {
      name: "E_EXTRA_LARGE24",
      value: "e-extra-large24",
  },
  {
      name: "E_EXTRA_LARGE32",
      value: "e-extra-large32",
  },
  {
      name: "E_EXTRA_LARGE48",
      value: "e-extra-large48",
  },
  {
      name: "E_DOUBLE_LARGE16",
      value: "e-double-large16",
  },
  {
      name: "E_DOUBLE_LARGE24",
      value: "e-double-large24",
  },
  {
      name: "E_DOUBLE_LARGE32",
      value: "e-double-large32",
  },
  {
      name: "E_DOUBLE_LARGE48",
      value: "e-double-large48",
  },
  {
      name: "E_DOUBLE_LARGE64",
      value: "e-double-large64",
  },
  {
      name: "E_DOUBLE_LARGE96",
      value: "e-double-large96",
  },
  {
      name: "H2_LARGE",
      value: "h2-large",
  },
  {
      name: "H2_LARGE8",
      value: "h2-large8",
  },
  {
      name: "H2_LARGE16",
      value: "h2-large16",
  },
  {
      name: "H2_LARGE24",
      value: "h2-large24",
  },
  {
      name: "H2_LARGE32",
      value: "h2-large32",
  },
  {
      name: "H2_EXTRA_LARGE8",
      value: "h2-extra-large8",
  },
  {
      name: "H2_EXTRA_LARGE16",
      value: "h2-extra-large16",
  },
  {
      name: "H2_EXTRA_LARGE24",
      value: "h2-extra-large24",
  },
  {
      name: "H2_EXTRA_LARGE32",
      value: "h2-extra-large32",
  },
  {
      name: "H2_EXTRA_LARGE48",
      value: "h2-extra-large48",
  },
  {
      name: "H2_DOUBLE_LARGE16",
      value: "h2-double-large16",
  },
  {
      name: "H2_DOUBLE_LARGE24",
      value: "h2-double-large24",
  },
  {
      name: "H2_DOUBLE_LARGE32",
      value: "h2-double-large32",
  },
  {
      name: "H2_DOUBLE_LARGE48",
      value: "h2-double-large48",
  },
  {
      name: "H2_DOUBLE_LARGE64",
      value: "h2-double-large64",
  },
  {
      name: "H2_DOUBLE_LARGE96",
      value: "h2-double-large96",
  },
])
string InstanceTypeOfUpdateInstanceRequest

structure UpdateInstanceRequest {
    @jsonName("description")
    Description: String,
    @jsonName("firewallGroupName")
    FirewallGroupName: String,
    @required
    @httpLabel
    @jsonName("InstanceId")
    InstanceId: String,
    @jsonName("instanceType")
    InstanceType: InstanceTypeOfUpdateInstanceRequest,
}

structure UpdateInstanceResult {
    @jsonName("instance")
    Instance: Instance,
}

structure DeleteInstanceRequest {
    @required
    @httpLabel
    @jsonName("InstanceId")
    InstanceId: String,
}

structure DeleteInstanceResult {
    @jsonName("instance")
    Instance: Instance,
}

structure GetInstanceMetricsRequest {
    @required
    @httpQuery("endTime")
    @jsonName("endTime")
    EndTime: String,
    @required
    @httpLabel
    @jsonName("InstanceId")
    InstanceId: String,
    @required
    @httpLabel
    @jsonName("MetricsName")
    MetricsName: String,
    @required
    @httpQuery("startTime")
    @jsonName("startTime")
    StartTime: String,
}

list ListOfMetrics {
    member: Metrics,
}

structure Metrics {
    @jsonName("maxValue")
    MaxValue: Double,
    @jsonName("minValue")
    MinValue: Double,
    @jsonName("timestamp")
    Timestamp: String,
    @jsonName("timezone")
    Timezone: String,
    @jsonName("value")
    Value: Double,
}

structure GetInstanceMetricsResult {
    @jsonName("metrics")
    Metrics: ListOfMetrics,
}

structure UpdateNetworkInterfaceRequest {
    @required
    @httpLabel
    @jsonName("InstanceId")
    InstanceId: String,
    @jsonName("networkConfig")
    NetworkConfig: RequestNetworkConfig,
}

structure UpdateNetworkInterfaceResult {
    @jsonName("instance")
    Instance: Instance,
}

structure ExtendDiskRequest {
    @required
    @httpLabel
    @jsonName("InstanceId")
    InstanceId: String,
}

structure ExtendDiskResult {
    @jsonName("instance")
    Instance: Instance,
}

structure UpgradeInstanceRequest {
    @jsonName("gitlabVersion")
    GitlabVersion: String,
    @required
    @httpLabel
    @jsonName("InstanceId")
    InstanceId: String,
}

structure UpgradeInstanceResult {
    @jsonName("instance")
    Instance: Instance,
}

structure RebootInstanceRequest {
    @required
    @httpLabel
    @jsonName("InstanceId")
    InstanceId: String,
}

structure RebootInstanceResult {
    @jsonName("instance")
    Instance: Instance,
}

structure SetupAlertRequest {
    @required
    @httpLabel
    @jsonName("InstanceId")
    InstanceId: String,
    @required
    @jsonName("to")
    To: String,
}

structure SetupAlertResult {
    @jsonName("instance")
    Instance: Instance,
}

@enum([
  {
      name: "C_LARGE",
      value: "c-large",
  },
  {
      name: "C_LARGE8",
      value: "c-large8",
  },
  {
      name: "E_LARGE",
      value: "e-large",
  },
  {
      name: "E_LARGE8",
      value: "e-large8",
  },
  {
      name: "E_LARGE16",
      value: "e-large16",
  },
  {
      name: "E_LARGE24",
      value: "e-large24",
  },
  {
      name: "E_LARGE32",
      value: "e-large32",
  },
  {
      name: "E_EXTRA_LARGE8",
      value: "e-extra-large8",
  },
  {
      name: "E_EXTRA_LARGE16",
      value: "e-extra-large16",
  },
  {
      name: "E_EXTRA_LARGE24",
      value: "e-extra-large24",
  },
  {
      name: "E_EXTRA_LARGE32",
      value: "e-extra-large32",
  },
  {
      name: "E_EXTRA_LARGE48",
      value: "e-extra-large48",
  },
  {
      name: "E_DOUBLE_LARGE16",
      value: "e-double-large16",
  },
  {
      name: "E_DOUBLE_LARGE24",
      value: "e-double-large24",
  },
  {
      name: "E_DOUBLE_LARGE32",
      value: "e-double-large32",
  },
  {
      name: "E_DOUBLE_LARGE48",
      value: "e-double-large48",
  },
  {
      name: "E_DOUBLE_LARGE64",
      value: "e-double-large64",
  },
  {
      name: "E_DOUBLE_LARGE96",
      value: "e-double-large96",
  },
  {
      name: "H2_LARGE",
      value: "h2-large",
  },
  {
      name: "H2_LARGE8",
      value: "h2-large8",
  },
  {
      name: "H2_LARGE16",
      value: "h2-large16",
  },
  {
      name: "H2_LARGE24",
      value: "h2-large24",
  },
  {
      name: "H2_LARGE32",
      value: "h2-large32",
  },
  {
      name: "H2_EXTRA_LARGE8",
      value: "h2-extra-large8",
  },
  {
      name: "H2_EXTRA_LARGE16",
      value: "h2-extra-large16",
  },
  {
      name: "H2_EXTRA_LARGE24",
      value: "h2-extra-large24",
  },
  {
      name: "H2_EXTRA_LARGE32",
      value: "h2-extra-large32",
  },
  {
      name: "H2_EXTRA_LARGE48",
      value: "h2-extra-large48",
  },
  {
      name: "H2_DOUBLE_LARGE16",
      value: "h2-double-large16",
  },
  {
      name: "H2_DOUBLE_LARGE24",
      value: "h2-double-large24",
  },
  {
      name: "H2_DOUBLE_LARGE32",
      value: "h2-double-large32",
  },
  {
      name: "H2_DOUBLE_LARGE48",
      value: "h2-double-large48",
  },
  {
      name: "H2_DOUBLE_LARGE64",
      value: "h2-double-large64",
  },
  {
      name: "H2_DOUBLE_LARGE96",
      value: "h2-double-large96",
  },
])
string InstanceTypeOfRestoreInstanceRequest

@enum([
  {
      name: "EAST_11",
      value: "east-11",
  },
  {
      name: "EAST_12",
      value: "east-12",
  },
  {
      name: "EAST_13",
      value: "east-13",
  },
  {
      name: "EAST_14",
      value: "east-14",
  },
  {
      name: "EAST_31",
      value: "east-31",
  },
  {
      name: "WEST_12",
      value: "west-12",
  },
  {
      name: "WEST_13",
      value: "west-13",
  },
  {
      name: "JP_WEST_21",
      value: "jp-west-21",
  },
])
string AvailabilityZoneOfRestoreInstanceRequest

structure RequestObjectStorageConfigOfRestoreInstance {
    @jsonName("account")
    Account: String,
    @jsonName("region")
    Region: RegionOfobjectStorageConfigForRestoreInstance,
    @jsonName("bucketUseObjects")
    RequestBucketUseObjects: RequestBucketUseObjects,
}

@enum([
  {
      name: "JP_EAST_1",
      value: "jp-east-1",
  },
  {
      name: "JP_WEST_2",
      value: "jp-west-2",
  },
])
string RegionOfobjectStorageConfigForRestoreInstance

structure RestoreInstanceRequest {
    @jsonName("availabilityZone")
    AvailabilityZone: AvailabilityZoneOfRestoreInstanceRequest,
    @required
    @jsonName("backupId")
    BackupId: String,
    @jsonName("description")
    Description: String,
    @required
    @jsonName("diskSize")
    DiskSize: Integer,
    @required
    @jsonName("firewallGroupName")
    FirewallGroupName: String,
    @required
    @jsonName("instanceId")
    InstanceId: String,
    @required
    @jsonName("instanceType")
    InstanceType: InstanceTypeOfRestoreInstanceRequest,
    @jsonName("networkConfig")
    NetworkConfig: RequestNetworkConfig,
    @jsonName("objectStorageConfig")
    ObjectStorageConfig: RequestObjectStorageConfigOfRestoreInstance,
    @required
    @jsonName("parameterGroupName")
    ParameterGroupName: String,
}

structure RestoreInstanceResult {
    @jsonName("instance")
    Instance: Instance,
}

structure ListParameterGroupsRequest {}

list ListOfParameterGroups {
    member: ParameterGroups,
}

structure ParameterGroups {
    @jsonName("description")
    Description: String,
    @jsonName("instanceId")
    InstanceId: String,
    @jsonName("parameterGroupName")
    ParameterGroupName: String,
    @jsonName("parameters")
    Parameters: ListOfParameters,
    @jsonName("region")
    Region: String,
}

list ListOfParameters {
    member: Parameters,
}

structure Parameters {
    @jsonName("allowed_values")
    AllowedValues: ListOfAllowedValues,
    @jsonName("data_type")
    DataType: String,
    @jsonName("description")
    Description: String,
    @jsonName("is_modifiable")
    IsModifiable: Boolean,
    @jsonName("is_secret")
    IsSecret: Boolean,
    @jsonName("name")
    Name: String,
    @jsonName("value")
    Value: String,
}

list ListOfAllowedValues {
    member: String,
}

structure ListParameterGroupsResult {
    @jsonName("parameterGroups")
    ParameterGroups: ListOfParameterGroups,
}

structure CreateParameterGroupRequest {
    @jsonName("description")
    Description: String,
    @required
    @jsonName("parameterGroupName")
    ParameterGroupName: String,
}

structure ParameterGroup {
    @jsonName("description")
    Description: String,
    @jsonName("instanceId")
    InstanceId: String,
    @jsonName("parameterGroupName")
    ParameterGroupName: String,
    @jsonName("parameters")
    Parameters: ListOfParameters,
    @jsonName("region")
    Region: String,
}

structure CreateParameterGroupResult {
    @jsonName("parameterGroup")
    ParameterGroup: ParameterGroup,
}

structure GetParameterGroupRequest {
    @required
    @httpLabel
    @jsonName("ParameterGroupName")
    ParameterGroupName: String,
}

structure GetParameterGroupResult {
    @jsonName("parameterGroup")
    ParameterGroup: ParameterGroup,
}

structure RequestParameters {
    @jsonName("gitlab_email_from")
    GitlabEmailFrom: String,
    @jsonName("gitlab_email_reply_to")
    GitlabEmailReplyTo: String,
    @jsonName("ldap_enabled")
    LdapEnabled: String,
    @jsonName("ldap_servers_active_directory")
    LdapServersActiveDirectory: String,
    @jsonName("ldap_servers_allow_username_or_email_login")
    LdapServersAllowUsernameOrEmailLogin: String,
    @jsonName("ldap_servers_attributes_email")
    LdapServersAttributesEmail: String,
    @jsonName("ldap_servers_attributes_first_name")
    LdapServersAttributesFirstName: String,
    @jsonName("ldap_servers_attributes_last_name")
    LdapServersAttributesLastName: String,
    @jsonName("ldap_servers_attributes_name")
    LdapServersAttributesName: String,
    @jsonName("ldap_servers_attributes_username")
    LdapServersAttributesUsername: String,
    @jsonName("ldap_servers_base")
    LdapServersBase: String,
    @jsonName("ldap_servers_bind_dn")
    LdapServersBindDn: String,
    @jsonName("ldap_servers_block_auto_created_users")
    LdapServersBlockAutoCreatedUsers: String,
    @jsonName("ldap_servers_encryption")
    LdapServersEncryption: String,
    @jsonName("ldap_servers_host")
    LdapServersHost: String,
    @jsonName("ldap_servers_label")
    LdapServersLabel: String,
    @jsonName("ldap_servers_lowercase_usernames")
    LdapServersLowercaseUsernames: String,
    @jsonName("ldap_servers_name")
    LdapServersName: String,
    @jsonName("ldap_servers_password")
    LdapServersPassword: String,
    @jsonName("ldap_servers_port")
    LdapServersPort: String,
    @jsonName("ldap_servers_timeout")
    LdapServersTimeout: String,
    @jsonName("ldap_servers_uid")
    LdapServersUid: String,
    @jsonName("ldap_servers_user_filter")
    LdapServersUserFilter: String,
    @jsonName("ldap_servers_verify_certificates")
    LdapServersVerifyCertificates: String,
    @jsonName("omniauth_allow_single_sign_on")
    OmniauthAllowSingleSignOn: String,
    @jsonName("omniauth_auto_link_saml_user")
    OmniauthAutoLinkSamlUser: String,
    @jsonName("omniauth_auto_sign_in_with_provider")
    OmniauthAutoSignInWithProvider: String,
    @jsonName("omniauth_block_auto_created_users")
    OmniauthBlockAutoCreatedUsers: String,
    @jsonName("omniauth_providers_saml_admin_groups")
    OmniauthProvidersSamlAdminGroups: String,
    @jsonName("omniauth_providers_saml_assertion_consumer_service_url")
    OmniauthProvidersSamlAssertionConsumerServiceUrl: String,
    @jsonName("omniauth_providers_saml_auditor_groups")
    OmniauthProvidersSamlAuditorGroups: String,
    @jsonName("omniauth_providers_saml_external_groups")
    OmniauthProvidersSamlExternalGroups: String,
    @jsonName("omniauth_providers_saml_groups_attribute")
    OmniauthProvidersSamlGroupsAttribute: String,
    @jsonName("omniauth_providers_saml_idp_cert_fingerprint")
    OmniauthProvidersSamlIdpCertFingerprint: String,
    @jsonName("omniauth_providers_saml_idp_sso_target_url")
    OmniauthProvidersSamlIdpSsoTargetUrl: String,
    @jsonName("omniauth_providers_saml_issuer")
    OmniauthProvidersSamlIssuer: String,
    @jsonName("omniauth_providers_saml_label")
    OmniauthProvidersSamlLabel: String,
    @jsonName("omniauth_providers_saml_name")
    OmniauthProvidersSamlName: String,
    @jsonName("omniauth_providers_saml_name_identifier_format")
    OmniauthProvidersSamlNameIdentifierFormat: String,
    @jsonName("omniauth_providers_saml_required_groups")
    OmniauthProvidersSamlRequiredGroups: String,
    @jsonName("smtp_password")
    SmtpPassword: String,
    @jsonName("smtp_user_name")
    SmtpUserName: String,
}

structure UpdateParameterGroupRequest {
    @jsonName("changedParameterGroupName")
    ChangedParameterGroupName: String,
    @jsonName("description")
    Description: String,
    @required
    @httpLabel
    @jsonName("ParameterGroupName")
    ParameterGroupName: String,
    @jsonName("parameters")
    Parameters: RequestParameters,
}

structure UpdateParameterGroupResult {
    @jsonName("parameterGroup")
    ParameterGroup: ParameterGroup,
}

structure DeleteParameterGroupRequest {
    @required
    @httpLabel
    @jsonName("ParameterGroupName")
    ParameterGroupName: String,
}

structure ListFirewallGroupsRequest {}

list ListOfFirewallGroups {
    member: FirewallGroups,
}

structure FirewallGroups {
    @jsonName("availabilityZone")
    AvailabilityZone: String,
    @jsonName("description")
    Description: String,
    @jsonName("firewallGroupName")
    FirewallGroupName: String,
    @jsonName("region")
    Region: String,
    @jsonName("rules")
    Rules: ListOfRules,
    @jsonName("state")
    State: String,
}

list ListOfRules {
    member: Rules,
}

structure Rules {
    @jsonName("cidrIp")
    CidrIp: String,
    @jsonName("description")
    Description: String,
    @jsonName("id")
    Id: String,
    @jsonName("port")
    Port: Integer,
    @jsonName("protocol")
    Protocol: String,
    @jsonName("state")
    State: String,
}

structure ListFirewallGroupsResult {
    @jsonName("firewallGroups")
    FirewallGroups: ListOfFirewallGroups,
}

@enum([
  {
      name: "EAST_11",
      value: "east-11",
  },
  {
      name: "EAST_12",
      value: "east-12",
  },
  {
      name: "EAST_13",
      value: "east-13",
  },
  {
      name: "EAST_14",
      value: "east-14",
  },
  {
      name: "EAST_31",
      value: "east-31",
  },
  {
      name: "WEST_12",
      value: "west-12",
  },
  {
      name: "WEST_13",
      value: "west-13",
  },
  {
      name: "JP_WEST_21",
      value: "jp-west-21",
  },
])
string AvailabilityZoneOfCreateFirewallGroupRequest

structure CreateFirewallGroupRequest {
    @jsonName("availabilityZone")
    AvailabilityZone: AvailabilityZoneOfCreateFirewallGroupRequest,
    @jsonName("description")
    Description: String,
    @required
    @jsonName("firewallGroupName")
    FirewallGroupName: String,
}

structure FirewallGroup {
    @jsonName("availabilityZone")
    AvailabilityZone: String,
    @jsonName("description")
    Description: String,
    @jsonName("firewallGroupName")
    FirewallGroupName: String,
    @jsonName("region")
    Region: String,
    @jsonName("rules")
    Rules: ListOfRules,
    @jsonName("state")
    State: String,
}

structure CreateFirewallGroupResult {
    @jsonName("firewallGroup")
    FirewallGroup: FirewallGroup,
}

structure GetFirewallGroupRequest {
    @required
    @httpLabel
    @jsonName("FirewallGroupName")
    FirewallGroupName: String,
}

structure GetFirewallGroupResult {
    @jsonName("firewallGroup")
    FirewallGroup: FirewallGroup,
}

structure UpdateFirewallGroupRequest {
    @jsonName("changedFirewallGroupName")
    ChangedFirewallGroupName: String,
    @jsonName("description")
    Description: String,
    @required
    @httpLabel
    @jsonName("FirewallGroupName")
    FirewallGroupName: String,
}

structure UpdateFirewallGroupResult {
    @jsonName("firewallGroup")
    FirewallGroup: FirewallGroup,
}

structure DeleteFirewallGroupRequest {
    @required
    @httpLabel
    @jsonName("FirewallGroupName")
    FirewallGroupName: String,
}

structure DeleteFirewallGroupResult {
    @jsonName("firewallGroup")
    FirewallGroup: FirewallGroup,
}

@enum([
  {
      name: "TCP",
      value: "TCP",
  },
  {
      name: "ICMP",
      value: "ICMP",
  },
])
string ProtocolOfrulesForAuthorizeFirewallRules

structure RequestRules {
    @required
    @jsonName("cidrIp")
    CidrIp: CidrIpOfrulesForAuthorizeFirewallRules,
    @jsonName("description")
    Description: String,
    @jsonName("port")
    Port: Integer,
    @required
    @jsonName("protocol")
    Protocol: ProtocolOfrulesForAuthorizeFirewallRules,
}

list ListOfRequestRules {
    member: RequestRules,
}

@enum([
  {
      name: "IPV4IP",
      value: "IPv4IP",
  },
  {
      name: "CIDR",
      value: "CIDR",
  },
])
string CidrIpOfrulesForAuthorizeFirewallRules

structure AuthorizeFirewallRulesRequest {
    @required
    @httpLabel
    @jsonName("FirewallGroupName")
    FirewallGroupName: String,
    @required
    @jsonName("rules")
    Rules: ListOfRequestRules,
}

structure AuthorizeFirewallRulesResult {
    @jsonName("firewallGroup")
    FirewallGroup: FirewallGroup,
}

structure RevokeFirewallRulesRequest {
    @required
    @httpLabel
    @jsonName("FirewallGroupName")
    FirewallGroupName: String,
    @required
    @httpQuery("ids")
    @jsonName("ids")
    Ids: String,
}

structure RevokeFirewallRulesResult {
    @jsonName("firewallGroup")
    FirewallGroup: FirewallGroup,
}

structure ListBackupsRequest {}

list ListOfBackups {
    member: Backups,
}

structure Backups {
    @jsonName("backupId")
    BackupId: String,
    @jsonName("createTime")
    CreateTime: String,
    @jsonName("fileName")
    FileName: String,
    @jsonName("fileSize")
    FileSize: Integer,
    @jsonName("instanceId")
    InstanceId: String,
    @jsonName("region")
    Region: String,
}

structure ListBackupsResult {
    @jsonName("backups")
    Backups: ListOfBackups,
}

structure GetBackupRequest {
    @required
    @httpLabel
    @jsonName("BackupId")
    BackupId: String,
}

structure Backup {
    @jsonName("backupId")
    BackupId: String,
    @jsonName("createTime")
    CreateTime: String,
    @jsonName("fileName")
    FileName: String,
    @jsonName("fileSize")
    FileSize: Integer,
    @jsonName("instanceId")
    InstanceId: String,
    @jsonName("region")
    Region: String,
}

structure GetBackupResult {
    @jsonName("backup")
    Backup: Backup,
}

structure DeleteBackupRequest {
    @required
    @httpLabel
    @jsonName("BackupId")
    BackupId: String,
}

structure ListBackupRulesRequest {}

list ListOfBackupRules {
    member: BackupRules,
}

structure BackupRules {
    @jsonName("backupRuleName")
    BackupRuleName: String,
    @jsonName("backupTime")
    BackupTime: String,
    @jsonName("description")
    Description: String,
    @jsonName("generation")
    Generation: Integer,
    @jsonName("instanceId")
    InstanceId: String,
}

structure ListBackupRulesResult {
    @jsonName("backupRules")
    BackupRules: ListOfBackupRules,
}

structure CreateBackupRuleRequest {
    @required
    @jsonName("backupRuleName")
    BackupRuleName: String,
    @jsonName("description")
    Description: String,
    @required
    @jsonName("instanceId")
    InstanceId: String,
}

structure BackupRule {
    @jsonName("backupRuleName")
    BackupRuleName: String,
    @jsonName("backupTime")
    BackupTime: String,
    @jsonName("description")
    Description: String,
    @jsonName("generation")
    Generation: Integer,
    @jsonName("instanceId")
    InstanceId: String,
}

structure CreateBackupRuleResult {
    @jsonName("backupRule")
    BackupRule: BackupRule,
}

structure GetBackupRuleRequest {
    @required
    @httpLabel
    @jsonName("BackupRuleName")
    BackupRuleName: String,
}

structure GetBackupRuleResult {
    @jsonName("backupRule")
    BackupRule: BackupRule,
}

structure UpdateBackupRuleRequest {
    @required
    @httpLabel
    @jsonName("BackupRuleName")
    BackupRuleName: String,
    @jsonName("changedBackupRuleName")
    ChangedBackupRuleName: String,
    @jsonName("description")
    Description: String,
}

structure UpdateBackupRuleResult {
    @jsonName("backupRule")
    BackupRule: BackupRule,
}

structure DeleteBackupRuleRequest {
    @required
    @httpLabel
    @jsonName("BackupRuleName")
    BackupRuleName: String,
}

@restJson1
@sigv4(name: "devops")
@service(
    sdkId: "devops",
    arnNamespace: "devops",
    endpointPrefix: "devops"
)
service DevOpswithGitLab {
    version: "v1",
    operations: [
        ListInstances,
        CreateInstance,
        GetInstance,
        UpdateInstance,
        DeleteInstance,
        GetInstanceMetrics,
        UpdateNetworkInterface,
        ExtendDisk,
        UpgradeInstance,
        RebootInstance,
        SetupAlert,
        RestoreInstance,
        ListParameterGroups,
        CreateParameterGroup,
        GetParameterGroup,
        UpdateParameterGroup,
        DeleteParameterGroup,
        ListFirewallGroups,
        CreateFirewallGroup,
        GetFirewallGroup,
        UpdateFirewallGroup,
        DeleteFirewallGroup,
        AuthorizeFirewallRules,
        RevokeFirewallRules,
        ListBackups,
        GetBackup,
        DeleteBackup,
        ListBackupRules,
        CreateBackupRule,
        GetBackupRule,
        UpdateBackupRule,
        DeleteBackupRule,
    ],
}


@http(method: "GET", uri: "/v1/instances" )
@readonly
operation ListInstances {
    input: ListInstancesRequest,
    output: ListInstancesResult,
}

@http(method: "POST", uri: "/v1/instances" )
operation CreateInstance {
    input: CreateInstanceRequest,
    output: CreateInstanceResult,
}

@http(method: "GET", uri: "/v1/instances/{InstanceId}" )
@readonly
operation GetInstance {
    input: GetInstanceRequest,
    output: GetInstanceResult,
}

@http(method: "PUT", uri: "/v1/instances/{InstanceId}" )
@idempotent
operation UpdateInstance {
    input: UpdateInstanceRequest,
    output: UpdateInstanceResult,
}

@http(method: "DELETE", uri: "/v1/instances/{InstanceId}" )
@idempotent
operation DeleteInstance {
    input: DeleteInstanceRequest,
    output: DeleteInstanceResult,
}

@http(method: "GET", uri: "/v1/instances/{InstanceId}/metrics/{MetricsName}" )
@readonly
operation GetInstanceMetrics {
    input: GetInstanceMetricsRequest,
    output: GetInstanceMetricsResult,
}

@http(method: "POST", uri: "/v1/instances/{InstanceId}/:updateNetworkInterface" )
operation UpdateNetworkInterface {
    input: UpdateNetworkInterfaceRequest,
    output: UpdateNetworkInterfaceResult,
}

@http(method: "POST", uri: "/v1/instances/{InstanceId}/:extendDisk" )
operation ExtendDisk {
    input: ExtendDiskRequest,
    output: ExtendDiskResult,
}

@http(method: "POST", uri: "/v1/instances/{InstanceId}/:upgrade" )
operation UpgradeInstance {
    input: UpgradeInstanceRequest,
    output: UpgradeInstanceResult,
}

@http(method: "POST", uri: "/v1/instances/{InstanceId}/:reboot" )
operation RebootInstance {
    input: RebootInstanceRequest,
    output: RebootInstanceResult,
}

@http(method: "POST", uri: "/v1/instances/{InstanceId}/:setupAlert" )
operation SetupAlert {
    input: SetupAlertRequest,
    output: SetupAlertResult,
}

@http(method: "POST", uri: "/v1/instances:restore" )
operation RestoreInstance {
    input: RestoreInstanceRequest,
    output: RestoreInstanceResult,
}

@http(method: "GET", uri: "/v1/parameterGroups" )
@readonly
operation ListParameterGroups {
    input: ListParameterGroupsRequest,
    output: ListParameterGroupsResult,
}

@http(method: "POST", uri: "/v1/parameterGroups" )
operation CreateParameterGroup {
    input: CreateParameterGroupRequest,
    output: CreateParameterGroupResult,
}

@http(method: "GET", uri: "/v1/parameterGroups/{ParameterGroupName}" )
@readonly
operation GetParameterGroup {
    input: GetParameterGroupRequest,
    output: GetParameterGroupResult,
}

@http(method: "PUT", uri: "/v1/parameterGroups/{ParameterGroupName}" )
@idempotent
operation UpdateParameterGroup {
    input: UpdateParameterGroupRequest,
    output: UpdateParameterGroupResult,
}

@http(method: "DELETE", uri: "/v1/parameterGroups/{ParameterGroupName}" )
@idempotent
operation DeleteParameterGroup {
    input: DeleteParameterGroupRequest,
}

@http(method: "GET", uri: "/v1/firewallGroups" )
@readonly
operation ListFirewallGroups {
    input: ListFirewallGroupsRequest,
    output: ListFirewallGroupsResult,
}

@http(method: "POST", uri: "/v1/firewallGroups" )
operation CreateFirewallGroup {
    input: CreateFirewallGroupRequest,
    output: CreateFirewallGroupResult,
}

@http(method: "GET", uri: "/v1/firewallGroups/{FirewallGroupName}" )
@readonly
operation GetFirewallGroup {
    input: GetFirewallGroupRequest,
    output: GetFirewallGroupResult,
}

@http(method: "PUT", uri: "/v1/firewallGroups/{FirewallGroupName}" )
@idempotent
operation UpdateFirewallGroup {
    input: UpdateFirewallGroupRequest,
    output: UpdateFirewallGroupResult,
}

@http(method: "DELETE", uri: "/v1/firewallGroups/{FirewallGroupName}" )
@idempotent
operation DeleteFirewallGroup {
    input: DeleteFirewallGroupRequest,
    output: DeleteFirewallGroupResult,
}

@http(method: "POST", uri: "/v1/firewallGroups/{FirewallGroupName}/rules" )
operation AuthorizeFirewallRules {
    input: AuthorizeFirewallRulesRequest,
    output: AuthorizeFirewallRulesResult,
}

@http(method: "DELETE", uri: "/v1/firewallGroups/{FirewallGroupName}/rules" )
@idempotent
operation RevokeFirewallRules {
    input: RevokeFirewallRulesRequest,
    output: RevokeFirewallRulesResult,
}

@http(method: "GET", uri: "/v1/backups" )
@readonly
operation ListBackups {
    input: ListBackupsRequest,
    output: ListBackupsResult,
}

@http(method: "GET", uri: "/v1/backups/{BackupId}" )
@readonly
operation GetBackup {
    input: GetBackupRequest,
    output: GetBackupResult,
}

@http(method: "DELETE", uri: "/v1/backups/{BackupId}" )
@idempotent
operation DeleteBackup {
    input: DeleteBackupRequest,
}

@http(method: "GET", uri: "/v1/backupRules" )
@readonly
operation ListBackupRules {
    input: ListBackupRulesRequest,
    output: ListBackupRulesResult,
}

@http(method: "POST", uri: "/v1/backupRules" )
operation CreateBackupRule {
    input: CreateBackupRuleRequest,
    output: CreateBackupRuleResult,
}

@http(method: "GET", uri: "/v1/backupRules/{BackupRuleName}" )
@readonly
operation GetBackupRule {
    input: GetBackupRuleRequest,
    output: GetBackupRuleResult,
}

@http(method: "PUT", uri: "/v1/backupRules/{BackupRuleName}" )
@idempotent
operation UpdateBackupRule {
    input: UpdateBackupRuleRequest,
    output: UpdateBackupRuleResult,
}

@http(method: "DELETE", uri: "/v1/backupRules/{BackupRuleName}" )
@idempotent
operation DeleteBackupRule {
    input: DeleteBackupRuleRequest,
}
