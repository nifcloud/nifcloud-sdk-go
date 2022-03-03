namespace com.nifcloud.api.computing

use aws.auth#sigv4
use aws.api#service
use aws.protocols#restJson1
use aws.protocols#restXml
use aws.protocols#awsQuery
use aws.protocols#ec2Query
use smithy.waiters#waitable
use aws.protocols#ec2QueryName


@enum([
  {
      name: "INSTANCE_TYPE",
      value: "instanceType",
  },
  {
      name: "DISABLE_API_TERMINATION",
      value: "disableApiTermination",
  },
  {
      name: "BLOCK_DEVICE_MAPPING",
      value: "blockDeviceMapping",
  },
  {
      name: "ACCOUNTING_TYPE",
      value: "accountingType",
  },
  {
      name: "NEXT_MONTH_ACCOUNTING_TYPE",
      value: "nextMonthAccountingType",
  },
  {
      name: "LOADBALANCING",
      value: "loadbalancing",
  },
  {
      name: "COPY_INFO",
      value: "copyInfo",
  },
  {
      name: "AUTOSCALING",
      value: "autoscaling",
  },
  {
      name: "IP_TYPE",
      value: "ipType",
  },
  {
      name: "NIFTY_PRIVATE_IP_TYPE",
      value: "niftyPrivateIpType",
  },
  {
      name: "GROUP_ID",
      value: "groupId",
  },
  {
      name: "DESCRIPTION",
      value: "description",
  },
  {
      name: "NETWORK_INTERFACE_SET",
      value: "networkInterfaceSet",
  },
  {
      name: "ELASTICLOADBALANCING",
      value: "elasticloadbalancing",
  },
])
string AttributeOfDescribeInstanceAttributeRequest

structure DescribeInstanceAttributeRequest {
    @xmlName("Attribute")
    @ec2QueryName("Attribute")
    Attribute: AttributeOfDescribeInstanceAttributeRequest,
    @required
    @xmlName("InstanceId")
    @ec2QueryName("InstanceId")
    InstanceId: String,
}

structure DescribeInstanceAttributeResult {
    @xmlName("accountingType")
    @ec2QueryName("accountingType")
    AccountingType: AccountingType,
    @xmlName("autoscaling")
    @ec2QueryName("autoscaling")
    Autoscaling: Autoscaling,
    @xmlName("blockDeviceMapping")
    @ec2QueryName("blockDeviceMapping")
    BlockDeviceMapping: ListOfBlockDeviceMapping,
    @xmlName("copyInfo")
    @ec2QueryName("copyInfo")
    CopyInfo: CopyInfo,
    @xmlName("description")
    @ec2QueryName("description")
    Description: Description,
    @xmlName("disableApiTermination")
    @ec2QueryName("disableApiTermination")
    DisableApiTermination: DisableApiTermination,
    @xmlName("groupId")
    @ec2QueryName("groupId")
    GroupId: GroupId,
    @xmlName("instanceId")
    @ec2QueryName("instanceId")
    InstanceId: String,
    @xmlName("instanceType")
    @ec2QueryName("instanceType")
    InstanceType: InstanceType,
    @xmlName("instanceUniqueId")
    @ec2QueryName("instanceUniqueId")
    InstanceUniqueId: String,
    @xmlName("ipType")
    @ec2QueryName("ipType")
    IpType: IpType,
    @xmlName("loadbalancing")
    @ec2QueryName("loadbalancing")
    Loadbalancing: ListOfLoadbalancing,
    @xmlName("networkInterfaceSet")
    @ec2QueryName("networkInterfaceSet")
    NetworkInterfaceSet: ListOfNetworkInterfaceSet,
    @xmlName("nextMonthAccountingType")
    @ec2QueryName("nextMonthAccountingType")
    NextMonthAccountingType: NextMonthAccountingType,
    @xmlName("niftyElasticLoadBalancing")
    @ec2QueryName("niftyElasticLoadBalancing")
    NiftyElasticLoadBalancing: ListOfNiftyElasticLoadBalancingOfNiftyDescribeAutoScalingGroups,
    @xmlName("niftyPrivateIpType")
    @ec2QueryName("niftyPrivateIpType")
    NiftyPrivateIpType: NiftyPrivateIpType,
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
}

structure InstanceType {
    @xmlName("value")
    @ec2QueryName("value")
    Value: String,
}

structure DisableApiTermination {
    @xmlName("value")
    @ec2QueryName("value")
    Value: Boolean,
}

list ListOfBlockDeviceMapping {
    @xmlName("item")
    member: BlockDeviceMapping,
}

structure BlockDeviceMapping {
    @xmlName("deviceName")
    @ec2QueryName("deviceName")
    DeviceName: String,
    @xmlName("ebs")
    @ec2QueryName("ebs")
    Ebs: Ebs,
}

structure Ebs {
    @xmlName("attachTime")
    @ec2QueryName("attachTime")
    AttachTime: Timestamp,
    @xmlName("deleteOnTermination")
    @ec2QueryName("deleteOnTermination")
    DeleteOnTermination: Boolean,
    @xmlName("status")
    @ec2QueryName("status")
    Status: String,
    @xmlName("volumeId")
    @ec2QueryName("volumeId")
    VolumeId: String,
}

structure AccountingType {
    @xmlName("value")
    @ec2QueryName("value")
    Value: String,
}

structure NextMonthAccountingType {
    @xmlName("value")
    @ec2QueryName("value")
    Value: String,
}

list ListOfLoadbalancing {
    @xmlName("item")
    member: Loadbalancing,
}

structure Loadbalancing {
    @xmlName("instancePort")
    @ec2QueryName("instancePort")
    InstancePort: Integer,
    @xmlName("loadBalancerName")
    @ec2QueryName("loadBalancerName")
    LoadBalancerName: String,
    @xmlName("loadBalancerPort")
    @ec2QueryName("loadBalancerPort")
    LoadBalancerPort: Integer,
    @xmlName("State")
    @ec2QueryName("State")
    State: String,
}

structure CopyInfo {
    @xmlName("value")
    @ec2QueryName("value")
    Value: String,
}

structure Autoscaling {
    @xmlName("autoScalingGroupName")
    @ec2QueryName("autoScalingGroupName")
    AutoScalingGroupName: String,
    @xmlName("expireTime")
    @ec2QueryName("expireTime")
    ExpireTime: Timestamp,
}

structure IpType {
    @xmlName("value")
    @ec2QueryName("value")
    Value: String,
}

structure NiftyPrivateIpType {
    @xmlName("value")
    @ec2QueryName("value")
    Value: String,
}

structure GroupId {
    @xmlName("value")
    @ec2QueryName("value")
    Value: String,
}

structure Description {
    @xmlName("value")
    @ec2QueryName("value")
    Value: String,
}

list ListOfNetworkInterfaceSet {
    @xmlName("item")
    member: NetworkInterfaceSet,
}

structure NetworkInterfaceSet {
    @xmlName("association")
    @ec2QueryName("association")
    Association: Association,
    @xmlName("attachment")
    @ec2QueryName("attachment")
    Attachment: Attachment,
    @xmlName("description")
    @ec2QueryName("description")
    Description: String,
    @xmlName("groupSet")
    @ec2QueryName("groupSet")
    GroupSet: String,
    @xmlName("macAddress")
    @ec2QueryName("macAddress")
    MacAddress: String,
    @xmlName("multiIpAddressesSet")
    @ec2QueryName("multiIpAddressesSet")
    MultiIpAddressesSet: ListOfMultiIpAddressesSet,
    @xmlName("networkInterfaceId")
    @ec2QueryName("networkInterfaceId")
    NetworkInterfaceId: String,
    @xmlName("niftyNetworkId")
    @ec2QueryName("niftyNetworkId")
    NiftyNetworkId: String,
    @xmlName("niftyNetworkName")
    @ec2QueryName("niftyNetworkName")
    NiftyNetworkName: String,
    @xmlName("ownerId")
    @ec2QueryName("ownerId")
    OwnerId: String,
    @xmlName("privateDnsName")
    @ec2QueryName("privateDnsName")
    PrivateDnsName: String,
    @xmlName("privateIpAddress")
    @ec2QueryName("privateIpAddress")
    PrivateIpAddress: String,
    @xmlName("privateIpAddressesSet")
    @ec2QueryName("privateIpAddressesSet")
    PrivateIpAddressesSet: String,
    @xmlName("privateIpAddressV6")
    @ec2QueryName("privateIpAddressV6")
    PrivateIpAddressV6: String,
    @xmlName("sourceDestCheck")
    @ec2QueryName("sourceDestCheck")
    SourceDestCheck: String,
    @xmlName("status")
    @ec2QueryName("status")
    Status: String,
    @xmlName("subnetId")
    @ec2QueryName("subnetId")
    SubnetId: String,
    @xmlName("vpcId")
    @ec2QueryName("vpcId")
    VpcId: String,
}

structure Attachment {
    @xmlName("attachmentId")
    @ec2QueryName("attachmentId")
    AttachmentId: String,
    @xmlName("attachTime")
    @ec2QueryName("attachTime")
    AttachTime: Timestamp,
    @xmlName("deleteOnTermination")
    @ec2QueryName("deleteOnTermination")
    DeleteOnTermination: Boolean,
    @xmlName("deviceIndex")
    @ec2QueryName("deviceIndex")
    DeviceIndex: Integer,
    @xmlName("status")
    @ec2QueryName("status")
    Status: String,
}

structure Association {
    @xmlName("ipOwnerId")
    @ec2QueryName("ipOwnerId")
    IpOwnerId: String,
    @xmlName("publicDnsName")
    @ec2QueryName("publicDnsName")
    PublicDnsName: String,
    @xmlName("publicIp")
    @ec2QueryName("publicIp")
    PublicIp: String,
    @xmlName("publicIpV6")
    @ec2QueryName("publicIpV6")
    PublicIpV6: String,
}

list ListOfMultiIpAddressesSet {
    @xmlName("item")
    member: MultiIpAddressesSet,
}

structure MultiIpAddressesSet {
    @xmlName("ipAddress")
    @ec2QueryName("ipAddress")
    IpAddress: String,
}

list ListOfNiftyElasticLoadBalancingOfNiftyDescribeAutoScalingGroups {
    @xmlName("item")
    member: NiftyElasticLoadBalancingOfNiftyDescribeAutoScalingGroups,
}

structure NiftyElasticLoadBalancingOfNiftyDescribeAutoScalingGroups {
    @xmlName("elasticLoadBalancerId")
    @ec2QueryName("elasticLoadBalancerId")
    ElasticLoadBalancerId: String,
    @xmlName("elasticLoadBalancerName")
    @ec2QueryName("elasticLoadBalancerName")
    ElasticLoadBalancerName: String,
    @xmlName("elasticLoadBalancerPort")
    @ec2QueryName("elasticLoadBalancerPort")
    ElasticLoadBalancerPort: Integer,
    @xmlName("instancePort")
    @ec2QueryName("instancePort")
    InstancePort: Integer,
    @xmlName("protocol")
    @ec2QueryName("protocol")
    Protocol: String,
}

list ListOfRequestInstanceId {
    member: String,
}

list ListOfRequestTenancy {
    member: String,
}

structure DescribeInstancesRequest {
    @xmlName("InstanceId")
    @ec2QueryName("InstanceId")
    InstanceId: ListOfRequestInstanceId,
    @xmlName("Tenancy")
    @ec2QueryName("Tenancy")
    Tenancy: ListOfRequestTenancy,
}

structure DescribeInstancesResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("reservationSet")
    @ec2QueryName("reservationSet")
    ReservationSet: ListOfReservationSet,
}

list ListOfReservationSet {
    @xmlName("item")
    member: ReservationSet,
}

structure ReservationSet {
    @xmlName("groupSet")
    @ec2QueryName("groupSet")
    GroupSet: ListOfGroupSet,
    @xmlName("instancesSet")
    @ec2QueryName("instancesSet")
    InstancesSet: ListOfInstancesSet,
    @xmlName("ownerId")
    @ec2QueryName("ownerId")
    OwnerId: String,
    @xmlName("reservationId")
    @ec2QueryName("reservationId")
    ReservationId: String,
}

list ListOfGroupSet {
    @xmlName("item")
    member: GroupSet,
}

structure GroupSet {
    @xmlName("groupId")
    @ec2QueryName("groupId")
    GroupId: String,
}

list ListOfInstancesSet {
    @xmlName("item")
    member: InstancesSet,
}

structure InstancesSet {
    @xmlName("accountingType")
    @ec2QueryName("accountingType")
    AccountingType: String,
    @xmlName("amiLaunchIndex")
    @ec2QueryName("amiLaunchIndex")
    AmiLaunchIndex: String,
    @xmlName("architecture")
    @ec2QueryName("architecture")
    Architecture: String,
    @xmlName("autoscaling")
    @ec2QueryName("autoscaling")
    Autoscaling: Autoscaling,
    @xmlName("blockDeviceMapping")
    @ec2QueryName("blockDeviceMapping")
    BlockDeviceMapping: ListOfBlockDeviceMapping,
    @xmlName("copyInfo")
    @ec2QueryName("copyInfo")
    CopyInfo: String,
    @xmlName("description")
    @ec2QueryName("description")
    Description: String,
    @xmlName("dnsName")
    @ec2QueryName("dnsName")
    DnsName: String,
    @xmlName("hotAdd")
    @ec2QueryName("hotAdd")
    HotAdd: String,
    @xmlName("imageId")
    @ec2QueryName("imageId")
    ImageId: String,
    @xmlName("imageName")
    @ec2QueryName("imageName")
    ImageName: String,
    @xmlName("instanceBackupRule")
    @ec2QueryName("instanceBackupRule")
    InstanceBackupRule: InstanceBackupRule,
    @xmlName("instanceId")
    @ec2QueryName("instanceId")
    InstanceId: String,
    @xmlName("instanceLifecycle")
    @ec2QueryName("instanceLifecycle")
    InstanceLifecycle: String,
    @xmlName("instanceState")
    @ec2QueryName("instanceState")
    InstanceState: InstanceState,
    @xmlName("instanceType")
    @ec2QueryName("instanceType")
    InstanceType: String,
    @xmlName("instanceUniqueId")
    @ec2QueryName("instanceUniqueId")
    InstanceUniqueId: String,
    @xmlName("ipAddress")
    @ec2QueryName("ipAddress")
    IpAddress: String,
    @xmlName("ipAddressV6")
    @ec2QueryName("ipAddressV6")
    IpAddressV6: String,
    @xmlName("ipType")
    @ec2QueryName("ipType")
    IpType: String,
    @xmlName("isoImageSet")
    @ec2QueryName("isoImageSet")
    IsoImageSet: ListOfIsoImageSet,
    @xmlName("kernelId")
    @ec2QueryName("kernelId")
    KernelId: String,
    @xmlName("keyName")
    @ec2QueryName("keyName")
    KeyName: String,
    @xmlName("launchTime")
    @ec2QueryName("launchTime")
    LaunchTime: Timestamp,
    @xmlName("loadbalancing")
    @ec2QueryName("loadbalancing")
    Loadbalancing: ListOfLoadbalancing,
    @xmlName("monitoring")
    @ec2QueryName("monitoring")
    Monitoring: Monitoring,
    @xmlName("multiIpAddressGroup")
    @ec2QueryName("multiIpAddressGroup")
    MultiIpAddressGroup: MultiIpAddressGroup,
    @xmlName("networkInterfaceSet")
    @ec2QueryName("networkInterfaceSet")
    NetworkInterfaceSet: ListOfNetworkInterfaceSetOfDescribeInstances,
    @xmlName("nextMonthAccountingType")
    @ec2QueryName("nextMonthAccountingType")
    NextMonthAccountingType: String,
    @xmlName("niftyElasticLoadBalancing")
    @ec2QueryName("niftyElasticLoadBalancing")
    NiftyElasticLoadBalancing: ListOfNiftyElasticLoadBalancingOfNiftyDescribeAutoScalingGroups,
    @xmlName("niftyPrivateIpType")
    @ec2QueryName("niftyPrivateIpType")
    NiftyPrivateIpType: String,
    @xmlName("niftyPrivateNetworkType")
    @ec2QueryName("niftyPrivateNetworkType")
    NiftyPrivateNetworkType: String,
    @xmlName("niftySnapshotting")
    @ec2QueryName("niftySnapshotting")
    NiftySnapshotting: ListOfNiftySnapshotting,
    @xmlName("placement")
    @ec2QueryName("placement")
    Placement: Placement,
    @xmlName("platform")
    @ec2QueryName("platform")
    Platform: String,
    @xmlName("privateDnsName")
    @ec2QueryName("privateDnsName")
    PrivateDnsName: String,
    @xmlName("privateIpAddress")
    @ec2QueryName("privateIpAddress")
    PrivateIpAddress: String,
    @xmlName("privateIpAddressV6")
    @ec2QueryName("privateIpAddressV6")
    PrivateIpAddressV6: String,
    @xmlName("productCodes")
    @ec2QueryName("productCodes")
    ProductCodes: ListOfProductCodes,
    @xmlName("ramdiskId")
    @ec2QueryName("ramdiskId")
    RamdiskId: String,
    @xmlName("reason")
    @ec2QueryName("reason")
    Reason: String,
    @xmlName("rootDeviceName")
    @ec2QueryName("rootDeviceName")
    RootDeviceName: String,
    @xmlName("rootDeviceType")
    @ec2QueryName("rootDeviceType")
    RootDeviceType: String,
    @xmlName("spotInstanceRequestId")
    @ec2QueryName("spotInstanceRequestId")
    SpotInstanceRequestId: String,
    @xmlName("stateReason")
    @ec2QueryName("stateReason")
    StateReason: StateReason,
    @xmlName("subnetId")
    @ec2QueryName("subnetId")
    SubnetId: String,
    @xmlName("tenancy")
    @ec2QueryName("tenancy")
    Tenancy: String,
    @xmlName("vmTools")
    @ec2QueryName("vmTools")
    VmTools: VmTools,
    @xmlName("vpcId")
    @ec2QueryName("vpcId")
    VpcId: String,
}

structure InstanceState {
    @xmlName("code")
    @ec2QueryName("code")
    Code: Integer,
    @xmlName("name")
    @ec2QueryName("name")
    Name: String,
}

list ListOfProductCodes {
    @xmlName("item")
    member: ProductCodes,
}

structure ProductCodes {
    @xmlName("productCode")
    @ec2QueryName("productCode")
    ProductCode: String,
}

structure Placement {
    @xmlName("availabilityZone")
    @ec2QueryName("availabilityZone")
    AvailabilityZone: String,
}

structure Monitoring {
    @xmlName("state")
    @ec2QueryName("state")
    State: String,
}

structure StateReason {
    @xmlName("code")
    @ec2QueryName("code")
    Code: String,
    @xmlName("message")
    @ec2QueryName("message")
    Message: String,
}

list ListOfNiftySnapshotting {
    @xmlName("item")
    member: NiftySnapshotting,
}

structure NiftySnapshotting {
    @xmlName("state")
    @ec2QueryName("state")
    State: String,
}

list ListOfNetworkInterfaceSetOfDescribeInstances {
    @xmlName("item")
    member: NetworkInterfaceSetOfDescribeInstances,
}

structure NetworkInterfaceSetOfDescribeInstances {
    @xmlName("association")
    @ec2QueryName("association")
    Association: Association,
    @xmlName("attachment")
    @ec2QueryName("attachment")
    Attachment: Attachment,
    @xmlName("description")
    @ec2QueryName("description")
    Description: String,
    @xmlName("groupSet")
    @ec2QueryName("groupSet")
    GroupSet: ListOfGroupSet,
    @xmlName("macAddress")
    @ec2QueryName("macAddress")
    MacAddress: String,
    @xmlName("multiIpAddressesSet")
    @ec2QueryName("multiIpAddressesSet")
    MultiIpAddressesSet: ListOfMultiIpAddressesSet,
    @xmlName("networkInterfaceId")
    @ec2QueryName("networkInterfaceId")
    NetworkInterfaceId: String,
    @xmlName("niftyNetworkId")
    @ec2QueryName("niftyNetworkId")
    NiftyNetworkId: String,
    @xmlName("niftyNetworkName")
    @ec2QueryName("niftyNetworkName")
    NiftyNetworkName: String,
    @xmlName("ownerId")
    @ec2QueryName("ownerId")
    OwnerId: String,
    @xmlName("privateDnsName")
    @ec2QueryName("privateDnsName")
    PrivateDnsName: String,
    @xmlName("privateIpAddress")
    @ec2QueryName("privateIpAddress")
    PrivateIpAddress: String,
    @xmlName("privateIpAddressesSet")
    @ec2QueryName("privateIpAddressesSet")
    PrivateIpAddressesSet: ListOfPrivateIpAddressesSet,
    @xmlName("privateIpAddressV6")
    @ec2QueryName("privateIpAddressV6")
    PrivateIpAddressV6: String,
    @xmlName("sourceDestCheck")
    @ec2QueryName("sourceDestCheck")
    SourceDestCheck: String,
    @xmlName("status")
    @ec2QueryName("status")
    Status: String,
    @xmlName("subnetId")
    @ec2QueryName("subnetId")
    SubnetId: String,
    @xmlName("vpcId")
    @ec2QueryName("vpcId")
    VpcId: String,
}

list ListOfPrivateIpAddressesSet {
    @xmlName("item")
    member: PrivateIpAddressesSet,
}

structure PrivateIpAddressesSet {
    @xmlName("association")
    @ec2QueryName("association")
    Association: Association,
    @xmlName("primary")
    @ec2QueryName("primary")
    Primary: Boolean,
    @xmlName("privateDnsName")
    @ec2QueryName("privateDnsName")
    PrivateDnsName: String,
    @xmlName("privateIpAddress")
    @ec2QueryName("privateIpAddress")
    PrivateIpAddress: String,
}

structure VmTools {
    @xmlName("state")
    @ec2QueryName("state")
    State: String,
    @xmlName("version")
    @ec2QueryName("version")
    Version: String,
}

structure InstanceBackupRule {
    @xmlName("instanceBackupRuleId")
    @ec2QueryName("instanceBackupRuleId")
    InstanceBackupRuleId: String,
    @xmlName("instanceBackupRuleName")
    @ec2QueryName("instanceBackupRuleName")
    InstanceBackupRuleName: String,
}

list ListOfIsoImageSet {
    @xmlName("item")
    member: IsoImageSet,
}

structure IsoImageSet {
    @xmlName("isoImageId")
    @ec2QueryName("isoImageId")
    IsoImageId: String,
    @xmlName("isoImageName")
    @ec2QueryName("isoImageName")
    IsoImageName: String,
}

structure MultiIpAddressGroup {
    @xmlName("multiIpAddressGroupId")
    @ec2QueryName("multiIpAddressGroupId")
    MultiIpAddressGroupId: String,
    @xmlName("multiIpAddressGroupName")
    @ec2QueryName("multiIpAddressGroupName")
    MultiIpAddressGroupName: String,
}

@enum([
  {
      name: "INSTANCE_TYPE",
      value: "instanceType",
  },
  {
      name: "DISABLE_API_TERMINATION",
      value: "disableApiTermination",
  },
  {
      name: "INSTANCE_NAME",
      value: "instanceName",
  },
  {
      name: "DESCRIPTION",
      value: "description",
  },
  {
      name: "IP_TYPE",
      value: "ipType",
  },
  {
      name: "GROUP_ID",
      value: "groupId",
  },
  {
      name: "ACCOUNTING_TYPE",
      value: "accountingType",
  },
])
string AttributeOfModifyInstanceAttributeRequest

@enum([
  {
      name: "FORCE",
      value: "force",
  },
  {
      name: "TRUE",
      value: "true",
  },
  {
      name: "FALSE",
      value: "false",
  },
])
string NiftyRebootOfModifyInstanceAttributeRequest

@enum([
  {
      name: "DAFAULT",
      value: "dafault",
  },
  {
      name: "DEDICATED",
      value: "dedicated",
  },
])
string TenancyOfModifyInstanceAttributeRequest

structure ModifyInstanceAttributeRequest {
    @required
    @xmlName("Attribute")
    @ec2QueryName("Attribute")
    Attribute: AttributeOfModifyInstanceAttributeRequest,
    @xmlName("Force")
    @ec2QueryName("Force")
    Force: Boolean,
    @required
    @xmlName("InstanceId")
    @ec2QueryName("InstanceId")
    InstanceId: String,
    @xmlName("NiftyReboot")
    @ec2QueryName("NiftyReboot")
    NiftyReboot: NiftyRebootOfModifyInstanceAttributeRequest,
    @xmlName("Tenancy")
    @ec2QueryName("Tenancy")
    Tenancy: TenancyOfModifyInstanceAttributeRequest,
    @required
    @xmlName("Value")
    @ec2QueryName("Value")
    Value: String,
}

structure ModifyInstanceAttributeResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("return")
    @ec2QueryName("return")
    Return: Boolean,
}

structure RequestUserData {
    @xmlName("Content")
    @ec2QueryName("Content")
    Content: String,
    @xmlName("Encoding")
    @ec2QueryName("Encoding")
    Encoding: String,
}

structure RebootInstancesRequest {
    @xmlName("Force")
    @ec2QueryName("Force")
    Force: Boolean,
    @required
    @xmlName("InstanceId")
    @ec2QueryName("InstanceId")
    InstanceId: ListOfRequestInstanceId,
    @xmlName("NiftyIsBios")
    @ec2QueryName("NiftyIsBios")
    NiftyIsBios: Boolean,
    @xmlName("Tenancy")
    @ec2QueryName("Tenancy")
    Tenancy: ListOfRequestTenancy,
    @xmlName("UserData")
    @ec2QueryName("UserData")
    UserData: RequestUserData,
}

structure RebootInstancesResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("return")
    @ec2QueryName("return")
    Return: Boolean,
}

list ListOfRequestSecurityGroup {
    member: String,
}

@enum([
  {
      name: "E_MINI",
      value: "e-mini",
  },
  {
      name: "H2_MINI",
      value: "h2-mini",
  },
  {
      name: "MINI",
      value: "mini",
  },
  {
      name: "C_SMALL",
      value: "c-small",
  },
  {
      name: "E_SMALL",
      value: "e-small",
  },
  {
      name: "H2_SMALL",
      value: "h2-small",
  },
  {
      name: "SMALL",
      value: "small",
  },
  {
      name: "C_SMALL2",
      value: "c-small2",
  },
  {
      name: "E_SMALL2",
      value: "e-small2",
  },
  {
      name: "H2_SMALL2",
      value: "h2-small2",
  },
  {
      name: "SMALL2",
      value: "small2",
  },
  {
      name: "C_SMALL4",
      value: "c-small4",
  },
  {
      name: "E_SMALL4",
      value: "e-small4",
  },
  {
      name: "H2_SMALL4",
      value: "h2-small4",
  },
  {
      name: "SMALL4",
      value: "small4",
  },
  {
      name: "E_SMALL8",
      value: "e-small8",
  },
  {
      name: "H2_SMALL8",
      value: "h2-small8",
  },
  {
      name: "SMALL8",
      value: "small8",
  },
  {
      name: "E_SMALL16",
      value: "e-small16",
  },
  {
      name: "H2_SMALL16",
      value: "h2-small16",
  },
  {
      name: "SMALL16",
      value: "small16",
  },
  {
      name: "C_MEDIUM",
      value: "c-medium",
  },
  {
      name: "E_MEDIUM",
      value: "e-medium",
  },
  {
      name: "H2_MEDIUM",
      value: "h2-medium",
  },
  {
      name: "MEDIUM",
      value: "medium",
  },
  {
      name: "C_MEDIUM4",
      value: "c-medium4",
  },
  {
      name: "E_MEDIUM4",
      value: "e-medium4",
  },
  {
      name: "H2_MEDIUM4",
      value: "h2-medium4",
  },
  {
      name: "MEDIUM4",
      value: "medium4",
  },
  {
      name: "C_MEDIUM8",
      value: "c-medium8",
  },
  {
      name: "E_MEDIUM8",
      value: "e-medium8",
  },
  {
      name: "H2_MEDIUM8",
      value: "h2-medium8",
  },
  {
      name: "MEDIUM8",
      value: "medium8",
  },
  {
      name: "E_MEDIUM16",
      value: "e-medium16",
  },
  {
      name: "H2_MEDIUM16",
      value: "h2-medium16",
  },
  {
      name: "MEDIUM16",
      value: "medium16",
  },
  {
      name: "E_MEDIUM24",
      value: "e-medium24",
  },
  {
      name: "H2_MEDIUM24",
      value: "h2-medium24",
  },
  {
      name: "MEDIUM24",
      value: "medium24",
  },
  {
      name: "C_LARGE",
      value: "c-large",
  },
  {
      name: "E_LARGE",
      value: "e-large",
  },
  {
      name: "H2_LARGE",
      value: "h2-large",
  },
  {
      name: "LARGE",
      value: "large",
  },
  {
      name: "C_LARGE8",
      value: "c-large8",
  },
  {
      name: "E_LARGE8",
      value: "e-large8",
  },
  {
      name: "H2_LARGE8",
      value: "h2-large8",
  },
  {
      name: "LARGE8",
      value: "large8",
  },
  {
      name: "E_LARGE16",
      value: "e-large16",
  },
  {
      name: "H2_LARGE16",
      value: "h2-large16",
  },
  {
      name: "LARGE16",
      value: "large16",
  },
  {
      name: "E_LARGE24",
      value: "e-large24",
  },
  {
      name: "H2_LARGE24",
      value: "h2-large24",
  },
  {
      name: "LARGE24",
      value: "large24",
  },
  {
      name: "E_LARGE32",
      value: "e-large32",
  },
  {
      name: "H2_LARGE32",
      value: "h2-large32",
  },
  {
      name: "LARGE32",
      value: "large32",
  },
  {
      name: "E_EXTRA_LARGE8",
      value: "e-extra-large8",
  },
  {
      name: "H2_EXTRA_LARGE8",
      value: "h2-extra-large8",
  },
  {
      name: "EXTRA_LARGE8",
      value: "extra-large8",
  },
  {
      name: "E_EXTRA_LARGE16",
      value: "e-extra-large16",
  },
  {
      name: "H2_EXTRA_LARGE16",
      value: "h2-extra-large16",
  },
  {
      name: "EXTRA_LARGE16",
      value: "extra-large16",
  },
  {
      name: "E_EXTRA_LARGE24",
      value: "e-extra-large24",
  },
  {
      name: "H2_EXTRA_LARGE24",
      value: "h2-extra-large24",
  },
  {
      name: "EXTRA_LARGE24",
      value: "extra-large24",
  },
  {
      name: "E_EXTRA_LARGE32",
      value: "e-extra-large32",
  },
  {
      name: "H2_EXTRA_LARGE32",
      value: "h2-extra-large32",
  },
  {
      name: "EXTRA_LARGE32",
      value: "extra-large32",
  },
  {
      name: "E_EXTRA_LARGE48",
      value: "e-extra-large48",
  },
  {
      name: "H2_EXTRA_LARGE48",
      value: "h2-extra-large48",
  },
  {
      name: "EXTRA_LARGE48",
      value: "extra-large48",
  },
  {
      name: "E_DOUBLE_LARGE16",
      value: "e-double-large16",
  },
  {
      name: "H2_DOUBLE_LARGE16",
      value: "h2-double-large16",
  },
  {
      name: "DOUBLE_LARGE16",
      value: "double-large16",
  },
  {
      name: "E_DOUBLE_LARGE24",
      value: "e-double-large24",
  },
  {
      name: "H2_DOUBLE_LARGE24",
      value: "h2-double-large24",
  },
  {
      name: "DOUBLE_LARGE24",
      value: "double-large24",
  },
  {
      name: "E_DOUBLE_LARGE32",
      value: "e-double-large32",
  },
  {
      name: "H2_DOUBLE_LARGE32",
      value: "h2-double-large32",
  },
  {
      name: "DOUBLE_LARGE32",
      value: "double-large32",
  },
  {
      name: "E_DOUBLE_LARGE48",
      value: "e-double-large48",
  },
  {
      name: "H2_DOUBLE_LARGE48",
      value: "h2-double-large48",
  },
  {
      name: "DOUBLE_LARGE48",
      value: "double-large48",
  },
  {
      name: "E_DOUBLE_LARGE64",
      value: "e-double-large64",
  },
  {
      name: "H2_DOUBLE_LARGE64",
      value: "h2-double-large64",
  },
  {
      name: "DOUBLE_LARGE64",
      value: "double-large64",
  },
  {
      name: "E_DOUBLE_LARGE96",
      value: "e-double-large96",
  },
  {
      name: "H2_DOUBLE_LARGE96",
      value: "h2-double-large96",
  },
  {
      name: "DOUBLE_LARGE96",
      value: "double-large96",
  },
  {
      name: "H2_TRIPLE_LARGE32",
      value: "h2-triple-large32",
  },
  {
      name: "TRIPLE_LARGE32",
      value: "triple-large32",
  },
  {
      name: "H2_TRIPLE_LARGE48",
      value: "h2-triple-large48",
  },
  {
      name: "TRIPLE_LARGE48",
      value: "triple-large48",
  },
  {
      name: "H2_TRIPLE_LARGE64",
      value: "h2-triple-large64",
  },
  {
      name: "TRIPLE_LARGE64",
      value: "triple-large64",
  },
  {
      name: "H2_TRIPLE_LARGE96",
      value: "h2-triple-large96",
  },
  {
      name: "TRIPLE_LARGE96",
      value: "triple-large96",
  },
  {
      name: "H2_TRIPLE_LARGE128",
      value: "h2-triple-large128",
  },
  {
      name: "TRIPLE_LARGE128",
      value: "triple-large128",
  },
  {
      name: "H2_QUAD_LARGE64",
      value: "h2-quad-large64",
  },
  {
      name: "QUAD_LARGE64",
      value: "quad-large64",
  },
  {
      name: "H2_QUAD_LARGE96",
      value: "h2-quad-large96",
  },
  {
      name: "QUAD_LARGE96",
      value: "quad-large96",
  },
  {
      name: "H2_QUAD_LARGE128",
      value: "h2-quad-large128",
  },
  {
      name: "QUAD_LARGE128",
      value: "quad-large128",
  },
  {
      name: "H2_SEPTA_LARGE128",
      value: "h2-septa-large128",
  },
  {
      name: "SEPTA_LARGE128",
      value: "septa-large128",
  },
])
string InstanceTypeOfRunInstancesRequest

structure RequestPlacement {
    @xmlName("AvailabilityZone")
    @ec2QueryName("AvailabilityZone")
    AvailabilityZone: String,
    @xmlName("GroupName")
    @ec2QueryName("GroupName")
    GroupName: String,
}

structure RequestBlockDeviceMapping {
    @xmlName("DeviceName")
    @ec2QueryName("DeviceName")
    DeviceName: String,
    @xmlName("Ebs")
    @ec2QueryName("Ebs")
    RequestEbs: RequestEbs,
    @xmlName("VirtualName")
    @ec2QueryName("VirtualName")
    VirtualName: String,
}

list ListOfRequestBlockDeviceMapping {
    member: RequestBlockDeviceMapping,
}

structure RequestEbs {
    @xmlName("DeleteOnTermination")
    @ec2QueryName("DeleteOnTermination")
    DeleteOnTermination: Boolean,
    @xmlName("NoDevice")
    @ec2QueryName("NoDevice")
    NoDevice: Boolean,
    @xmlName("SnapshotId")
    @ec2QueryName("SnapshotId")
    SnapshotId: String,
    @xmlName("VolumeSize")
    @ec2QueryName("VolumeSize")
    VolumeSize: Integer,
}

structure RequestMonitoring {
    @xmlName("Enabled")
    @ec2QueryName("Enabled")
    Enabled: Boolean,
}

@enum([
  {
      name: "MONTHLY",
      value: "1",
  },
  {
      name: "HOURLY",
      value: "2",
  },
])
string AccountingTypeOfRunInstancesRequest

@enum([
  {
      name: "STATIC",
      value: "static",
  },
  {
      name: "ELASTIC",
      value: "elastic",
  },
  {
      name: "NONE",
      value: "none",
  },
])
string IpTypeOfRunInstancesRequest

structure RequestNetworkInterface {
    @xmlName("DeviceIndex")
    @ec2QueryName("DeviceIndex")
    DeviceIndex: Integer,
    @xmlName("IpAddress")
    @ec2QueryName("IpAddress")
    IpAddress: String,
    @xmlName("SecurityGroupId")
    @ec2QueryName("SecurityGroupId")
    ListOfRequestSecurityGroupId: ListOfRequestSecurityGroupId,
    @xmlName("NetworkId")
    @ec2QueryName("NetworkId")
    NetworkId: String,
    @xmlName("NetworkName")
    @ec2QueryName("NetworkName")
    NetworkName: String,
}

list ListOfRequestNetworkInterface {
    member: RequestNetworkInterface,
}

list ListOfRequestSecurityGroupId {
    member: String,
}

@enum([
  {
      name: "RDS",
      value: "RDS",
  },
  {
      name: "MICROSOFT_OFFICE_STANDARD",
      value: "Office(Std)",
  },
  {
      name: "MICROSOFT_OFFICE_PROFESSIONAL_PLUS",
      value: "Office(Pro Plus)",
  },
])
string LicenseNameOfLicenseForRunInstances

structure RequestLicense {
    @xmlName("LicenseName")
    @ec2QueryName("LicenseName")
    LicenseName: LicenseNameOfLicenseForRunInstances,
    @xmlName("LicenseNum")
    @ec2QueryName("LicenseNum")
    LicenseNum: String,
}

list ListOfRequestLicense {
    member: RequestLicense,
}

structure RunInstancesRequest {
    @xmlName("AccountingType")
    @ec2QueryName("AccountingType")
    AccountingType: AccountingTypeOfRunInstancesRequest,
    @xmlName("AddressingType")
    @ec2QueryName("AddressingType")
    AddressingType: String,
    @xmlName("Admin")
    @ec2QueryName("Admin")
    Admin: String,
    @xmlName("Agreement")
    @ec2QueryName("Agreement")
    Agreement: Boolean,
    @xmlName("BlockDeviceMapping")
    @ec2QueryName("BlockDeviceMapping")
    BlockDeviceMapping: ListOfRequestBlockDeviceMapping,
    @xmlName("Description")
    @ec2QueryName("Description")
    Description: String,
    @xmlName("DisableApiTermination")
    @ec2QueryName("DisableApiTermination")
    DisableApiTermination: Boolean,
    @required
    @xmlName("ImageId")
    @ec2QueryName("ImageId")
    ImageId: String,
    @xmlName("InstanceId")
    @ec2QueryName("InstanceId")
    InstanceId: String,
    @xmlName("InstanceInitiatedShutdownBehavior")
    @ec2QueryName("InstanceInitiatedShutdownBehavior")
    InstanceInitiatedShutdownBehavior: String,
    @xmlName("InstanceType")
    @ec2QueryName("InstanceType")
    InstanceType: InstanceTypeOfRunInstancesRequest,
    @xmlName("IpType")
    @ec2QueryName("IpType")
    IpType: IpTypeOfRunInstancesRequest,
    @xmlName("KernelId")
    @ec2QueryName("KernelId")
    KernelId: String,
    @xmlName("KeyName")
    @ec2QueryName("KeyName")
    KeyName: String,
    @xmlName("License")
    @ec2QueryName("License")
    License: ListOfRequestLicense,
    @xmlName("MaxCount")
    @ec2QueryName("MaxCount")
    MaxCount: Integer,
    @xmlName("MinCount")
    @ec2QueryName("MinCount")
    MinCount: Integer,
    @xmlName("Monitoring")
    @ec2QueryName("Monitoring")
    Monitoring: RequestMonitoring,
    @xmlName("NetworkInterface")
    @ec2QueryName("NetworkInterface")
    NetworkInterface: ListOfRequestNetworkInterface,
    @xmlName("Password")
    @ec2QueryName("Password")
    Password: String,
    @xmlName("Placement")
    @ec2QueryName("Placement")
    Placement: RequestPlacement,
    @xmlName("PublicIp")
    @ec2QueryName("PublicIp")
    PublicIp: String,
    @xmlName("RamdiskId")
    @ec2QueryName("RamdiskId")
    RamdiskId: String,
    @xmlName("SecurityGroup")
    @ec2QueryName("SecurityGroup")
    SecurityGroup: ListOfRequestSecurityGroup,
    @xmlName("SubnetId")
    @ec2QueryName("SubnetId")
    SubnetId: String,
    @xmlName("UserData")
    @ec2QueryName("UserData")
    UserData: RequestUserData,
}

structure RunInstancesResult {
    @xmlName("groupSet")
    @ec2QueryName("groupSet")
    GroupSet: ListOfGroupSet,
    @xmlName("instancesSet")
    @ec2QueryName("instancesSet")
    InstancesSet: ListOfInstancesSetOfRunInstances,
    @xmlName("ownerId")
    @ec2QueryName("ownerId")
    OwnerId: String,
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("reservationId")
    @ec2QueryName("reservationId")
    ReservationId: String,
}

list ListOfInstancesSetOfRunInstances {
    @xmlName("item")
    member: InstancesSetOfRunInstances,
}

structure InstancesSetOfRunInstances {
    @xmlName("accountingType")
    @ec2QueryName("accountingType")
    AccountingType: String,
    @xmlName("admin")
    @ec2QueryName("admin")
    Admin: String,
    @xmlName("architecture")
    @ec2QueryName("architecture")
    Architecture: String,
    @xmlName("blockDeviceMapping")
    @ec2QueryName("blockDeviceMapping")
    BlockDeviceMapping: ListOfBlockDeviceMappingOfRunInstances,
    @xmlName("description")
    @ec2QueryName("description")
    Description: String,
    @xmlName("dnsName")
    @ec2QueryName("dnsName")
    DnsName: String,
    @xmlName("imageId")
    @ec2QueryName("imageId")
    ImageId: String,
    @xmlName("instanceId")
    @ec2QueryName("instanceId")
    InstanceId: String,
    @xmlName("instanceState")
    @ec2QueryName("instanceState")
    InstanceState: InstanceState,
    @xmlName("instanceType")
    @ec2QueryName("instanceType")
    InstanceType: String,
    @xmlName("instanceUniqueId")
    @ec2QueryName("instanceUniqueId")
    InstanceUniqueId: String,
    @xmlName("ipAddress")
    @ec2QueryName("ipAddress")
    IpAddress: String,
    @xmlName("ipAddressV6")
    @ec2QueryName("ipAddressV6")
    IpAddressV6: String,
    @xmlName("ipType")
    @ec2QueryName("ipType")
    IpType: String,
    @xmlName("isoImage")
    @ec2QueryName("isoImage")
    IsoImage: ListOfIsoImage,
    @xmlName("keyName")
    @ec2QueryName("keyName")
    KeyName: String,
    @xmlName("launchTime")
    @ec2QueryName("launchTime")
    LaunchTime: Timestamp,
    @xmlName("monitoring")
    @ec2QueryName("monitoring")
    Monitoring: Monitoring,
    @xmlName("networkInterfaceSet")
    @ec2QueryName("networkInterfaceSet")
    NetworkInterfaceSet: ListOfNetworkInterfaceSetOfRunInstances,
    @xmlName("niftyPrivateIpType")
    @ec2QueryName("niftyPrivateIpType")
    NiftyPrivateIpType: String,
    @xmlName("placement")
    @ec2QueryName("placement")
    Placement: Placement,
    @xmlName("platform")
    @ec2QueryName("platform")
    Platform: String,
    @xmlName("privateDnsName")
    @ec2QueryName("privateDnsName")
    PrivateDnsName: String,
    @xmlName("privateIpAddress")
    @ec2QueryName("privateIpAddress")
    PrivateIpAddress: String,
    @xmlName("privateIpAddressV6")
    @ec2QueryName("privateIpAddressV6")
    PrivateIpAddressV6: String,
    @xmlName("reason")
    @ec2QueryName("reason")
    Reason: String,
    @xmlName("rootDeviceType")
    @ec2QueryName("rootDeviceType")
    RootDeviceType: String,
}

list ListOfBlockDeviceMappingOfRunInstances {
    @xmlName("item")
    member: BlockDeviceMappingOfRunInstances,
}

structure BlockDeviceMappingOfRunInstances {
    @xmlName("deviceName")
    @ec2QueryName("deviceName")
    DeviceName: String,
    @xmlName("ebs")
    @ec2QueryName("ebs")
    Ebs: EbsOfRunInstances,
}

structure EbsOfRunInstances {
    @xmlName("deleteOnTermination")
    @ec2QueryName("deleteOnTermination")
    DeleteOnTermination: Boolean,
    @xmlName("status")
    @ec2QueryName("status")
    Status: String,
    @xmlName("volumeId")
    @ec2QueryName("volumeId")
    VolumeId: String,
}

list ListOfNetworkInterfaceSetOfRunInstances {
    @xmlName("item")
    member: NetworkInterfaceSetOfRunInstances,
}

structure NetworkInterfaceSetOfRunInstances {
    @xmlName("association")
    @ec2QueryName("association")
    Association: AssociationOfRunInstances,
    @xmlName("attachment")
    @ec2QueryName("attachment")
    Attachment: AttachmentOfRunInstances,
    @xmlName("description")
    @ec2QueryName("description")
    Description: String,
    @xmlName("groupSet")
    @ec2QueryName("groupSet")
    GroupSet: ListOfGroupSet,
    @xmlName("networkInterfaceId")
    @ec2QueryName("networkInterfaceId")
    NetworkInterfaceId: String,
    @xmlName("niftyNetworkId")
    @ec2QueryName("niftyNetworkId")
    NiftyNetworkId: String,
    @xmlName("niftyNetworkName")
    @ec2QueryName("niftyNetworkName")
    NiftyNetworkName: String,
    @xmlName("ownerId")
    @ec2QueryName("ownerId")
    OwnerId: String,
    @xmlName("privateDnsName")
    @ec2QueryName("privateDnsName")
    PrivateDnsName: String,
    @xmlName("privateIpAddressesSet")
    @ec2QueryName("privateIpAddressesSet")
    PrivateIpAddressesSet: ListOfPrivateIpAddressesSetOfRunInstances,
    @xmlName("sourceDestCheck")
    @ec2QueryName("sourceDestCheck")
    SourceDestCheck: String,
    @xmlName("status")
    @ec2QueryName("status")
    Status: String,
    @xmlName("subnetId")
    @ec2QueryName("subnetId")
    SubnetId: String,
    @xmlName("vpcId")
    @ec2QueryName("vpcId")
    VpcId: String,
}

structure AttachmentOfRunInstances {
    @xmlName("attachmentID")
    @ec2QueryName("attachmentID")
    AttachmentID: String,
    @xmlName("attachTime")
    @ec2QueryName("attachTime")
    AttachTime: String,
    @xmlName("deleteOnTermination")
    @ec2QueryName("deleteOnTermination")
    DeleteOnTermination: Boolean,
    @xmlName("deviceIndex")
    @ec2QueryName("deviceIndex")
    DeviceIndex: Integer,
    @xmlName("status")
    @ec2QueryName("status")
    Status: String,
}

structure AssociationOfRunInstances {
    @xmlName("ipOwnerId")
    @ec2QueryName("ipOwnerId")
    IpOwnerId: String,
    @xmlName("publicDnsName")
    @ec2QueryName("publicDnsName")
    PublicDnsName: String,
    @xmlName("publicIp")
    @ec2QueryName("publicIp")
    PublicIp: String,
}

list ListOfPrivateIpAddressesSetOfRunInstances {
    @xmlName("item")
    member: PrivateIpAddressesSetOfRunInstances,
}

structure PrivateIpAddressesSetOfRunInstances {
    @xmlName("association")
    @ec2QueryName("association")
    Association: AssociationOfRunInstances,
    @xmlName("primary")
    @ec2QueryName("primary")
    Primary: Boolean,
    @xmlName("privateDnsName")
    @ec2QueryName("privateDnsName")
    PrivateDnsName: String,
    @xmlName("privateIpAddress")
    @ec2QueryName("privateIpAddress")
    PrivateIpAddress: String,
}

list ListOfIsoImage {
    @xmlName("item")
    member: IsoImage,
}

structure IsoImage {
    @xmlName("isoImageId")
    @ec2QueryName("isoImageId")
    IsoImageId: String,
    @xmlName("isoImageName")
    @ec2QueryName("isoImageName")
    IsoImageName: String,
}

list ListOfRequestInstanceType {
    member: String,
}

list ListOfRequestAccountingType {
    member: String,
}

structure StartInstancesRequest {
    @xmlName("AccountingType")
    @ec2QueryName("AccountingType")
    AccountingType: ListOfRequestAccountingType,
    @required
    @xmlName("InstanceId")
    @ec2QueryName("InstanceId")
    InstanceId: ListOfRequestInstanceId,
    @xmlName("InstanceType")
    @ec2QueryName("InstanceType")
    InstanceType: ListOfRequestInstanceType,
    @xmlName("NiftyIsBios")
    @ec2QueryName("NiftyIsBios")
    NiftyIsBios: Boolean,
    @xmlName("Tenancy")
    @ec2QueryName("Tenancy")
    Tenancy: ListOfRequestTenancy,
    @xmlName("UserData")
    @ec2QueryName("UserData")
    UserData: RequestUserData,
}

structure StartInstancesResult {
    @xmlName("instancesSet")
    @ec2QueryName("instancesSet")
    InstancesSet: ListOfInstancesSetOfStartInstances,
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
}

list ListOfInstancesSetOfStartInstances {
    @xmlName("item")
    member: InstancesSetOfStartInstances,
}

structure InstancesSetOfStartInstances {
    @xmlName("currentState")
    @ec2QueryName("currentState")
    CurrentState: CurrentState,
    @xmlName("instanceId")
    @ec2QueryName("instanceId")
    InstanceId: String,
    @xmlName("instanceUniqueId")
    @ec2QueryName("instanceUniqueId")
    InstanceUniqueId: String,
    @xmlName("previousState")
    @ec2QueryName("previousState")
    PreviousState: PreviousState,
    @xmlName("tenancy")
    @ec2QueryName("tenancy")
    Tenancy: String,
}

structure CurrentState {
    @xmlName("code")
    @ec2QueryName("code")
    Code: Integer,
    @xmlName("name")
    @ec2QueryName("name")
    Name: String,
}

structure PreviousState {
    @xmlName("code")
    @ec2QueryName("code")
    Code: Integer,
    @xmlName("name")
    @ec2QueryName("name")
    Name: String,
}

structure StopInstancesRequest {
    @xmlName("Force")
    @ec2QueryName("Force")
    Force: Boolean,
    @required
    @xmlName("InstanceId")
    @ec2QueryName("InstanceId")
    InstanceId: ListOfRequestInstanceId,
    @xmlName("Tenancy")
    @ec2QueryName("Tenancy")
    Tenancy: ListOfRequestTenancy,
}

structure StopInstancesResult {
    @xmlName("instancesSet")
    @ec2QueryName("instancesSet")
    InstancesSet: ListOfInstancesSetOfStopInstances,
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
}

list ListOfInstancesSetOfStopInstances {
    @xmlName("item")
    member: InstancesSetOfStopInstances,
}

structure InstancesSetOfStopInstances {
    @xmlName("currentState")
    @ec2QueryName("currentState")
    CurrentState: CurrentState,
    @xmlName("instanceId")
    @ec2QueryName("instanceId")
    InstanceId: String,
    @xmlName("instanceUniqueId")
    @ec2QueryName("instanceUniqueId")
    InstanceUniqueId: String,
    @xmlName("previousState")
    @ec2QueryName("previousState")
    PreviousState: PreviousState,
    @xmlName("tenancy")
    @ec2QueryName("tenancy")
    Tenancy: String,
}

structure TerminateInstancesRequest {
    @required
    @xmlName("InstanceId")
    @ec2QueryName("InstanceId")
    InstanceId: ListOfRequestInstanceId,
}

structure TerminateInstancesResult {
    @xmlName("instancesSet")
    @ec2QueryName("instancesSet")
    InstancesSet: ListOfInstancesSetOfTerminateInstances,
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
}

list ListOfInstancesSetOfTerminateInstances {
    @xmlName("item")
    member: InstancesSetOfTerminateInstances,
}

structure InstancesSetOfTerminateInstances {
    @xmlName("currentState")
    @ec2QueryName("currentState")
    CurrentState: CurrentState,
    @xmlName("instanceId")
    @ec2QueryName("instanceId")
    InstanceId: String,
    @xmlName("instanceUniqueId")
    @ec2QueryName("instanceUniqueId")
    InstanceUniqueId: String,
    @xmlName("previousState")
    @ec2QueryName("previousState")
    PreviousState: PreviousState,
}

structure RequestCopyInstance {
    @xmlName("AccountingType")
    @ec2QueryName("AccountingType")
    AccountingType: AccountingTypeOfCopyInstanceForCopyInstances,
    @required
    @xmlName("InstanceName")
    @ec2QueryName("InstanceName")
    InstanceName: String,
    @xmlName("InstanceType")
    @ec2QueryName("InstanceType")
    InstanceType: InstanceTypeOfCopyInstanceForCopyInstances,
    @xmlName("IpType")
    @ec2QueryName("IpType")
    IpType: IpTypeOfCopyInstanceForCopyInstances,
    @xmlName("LoadBalancers")
    @ec2QueryName("LoadBalancers")
    ListOfRequestLoadBalancers: ListOfRequestLoadBalancers,
    @xmlName("SecurityGroup")
    @ec2QueryName("SecurityGroup")
    ListOfRequestSecurityGroup: ListOfRequestSecurityGroup,
    @xmlName("Placement")
    @ec2QueryName("Placement")
    RequestPlacement: RequestPlacementOfCopyInstances,
}

@enum([
  {
      name: "E_MINI",
      value: "e-mini",
  },
  {
      name: "H2_MINI",
      value: "h2-mini",
  },
  {
      name: "MINI",
      value: "mini",
  },
  {
      name: "C_SMALL",
      value: "c-small",
  },
  {
      name: "E_SMALL",
      value: "e-small",
  },
  {
      name: "H2_SMALL",
      value: "h2-small",
  },
  {
      name: "SMALL",
      value: "small",
  },
  {
      name: "C_SMALL2",
      value: "c-small2",
  },
  {
      name: "E_SMALL2",
      value: "e-small2",
  },
  {
      name: "H2_SMALL2",
      value: "h2-small2",
  },
  {
      name: "SMALL2",
      value: "small2",
  },
  {
      name: "C_SMALL4",
      value: "c-small4",
  },
  {
      name: "E_SMALL4",
      value: "e-small4",
  },
  {
      name: "H2_SMALL4",
      value: "h2-small4",
  },
  {
      name: "SMALL4",
      value: "small4",
  },
  {
      name: "E_SMALL8",
      value: "e-small8",
  },
  {
      name: "H2_SMALL8",
      value: "h2-small8",
  },
  {
      name: "SMALL8",
      value: "small8",
  },
  {
      name: "E_SMALL16",
      value: "e-small16",
  },
  {
      name: "H2_SMALL16",
      value: "h2-small16",
  },
  {
      name: "SMALL16",
      value: "small16",
  },
  {
      name: "C_MEDIUM",
      value: "c-medium",
  },
  {
      name: "E_MEDIUM",
      value: "e-medium",
  },
  {
      name: "H2_MEDIUM",
      value: "h2-medium",
  },
  {
      name: "MEDIUM",
      value: "medium",
  },
  {
      name: "C_MEDIUM4",
      value: "c-medium4",
  },
  {
      name: "E_MEDIUM4",
      value: "e-medium4",
  },
  {
      name: "H2_MEDIUM4",
      value: "h2-medium4",
  },
  {
      name: "MEDIUM4",
      value: "medium4",
  },
  {
      name: "C_MEDIUM8",
      value: "c-medium8",
  },
  {
      name: "E_MEDIUM8",
      value: "e-medium8",
  },
  {
      name: "H2_MEDIUM8",
      value: "h2-medium8",
  },
  {
      name: "MEDIUM8",
      value: "medium8",
  },
  {
      name: "E_MEDIUM16",
      value: "e-medium16",
  },
  {
      name: "H2_MEDIUM16",
      value: "h2-medium16",
  },
  {
      name: "MEDIUM16",
      value: "medium16",
  },
  {
      name: "E_MEDIUM24",
      value: "e-medium24",
  },
  {
      name: "H2_MEDIUM24",
      value: "h2-medium24",
  },
  {
      name: "MEDIUM24",
      value: "medium24",
  },
  {
      name: "C_LARGE",
      value: "c-large",
  },
  {
      name: "E_LARGE",
      value: "e-large",
  },
  {
      name: "H2_LARGE",
      value: "h2-large",
  },
  {
      name: "LARGE",
      value: "large",
  },
  {
      name: "C_LARGE8",
      value: "c-large8",
  },
  {
      name: "E_LARGE8",
      value: "e-large8",
  },
  {
      name: "H2_LARGE8",
      value: "h2-large8",
  },
  {
      name: "LARGE8",
      value: "large8",
  },
  {
      name: "E_LARGE16",
      value: "e-large16",
  },
  {
      name: "H2_LARGE16",
      value: "h2-large16",
  },
  {
      name: "LARGE16",
      value: "large16",
  },
  {
      name: "E_LARGE24",
      value: "e-large24",
  },
  {
      name: "H2_LARGE24",
      value: "h2-large24",
  },
  {
      name: "LARGE24",
      value: "large24",
  },
  {
      name: "E_LARGE32",
      value: "e-large32",
  },
  {
      name: "H2_LARGE32",
      value: "h2-large32",
  },
  {
      name: "LARGE32",
      value: "large32",
  },
  {
      name: "E_EXTRA_LARGE8",
      value: "e-extra-large8",
  },
  {
      name: "H2_EXTRA_LARGE8",
      value: "h2-extra-large8",
  },
  {
      name: "EXTRA_LARGE8",
      value: "extra-large8",
  },
  {
      name: "E_EXTRA_LARGE16",
      value: "e-extra-large16",
  },
  {
      name: "H2_EXTRA_LARGE16",
      value: "h2-extra-large16",
  },
  {
      name: "EXTRA_LARGE16",
      value: "extra-large16",
  },
  {
      name: "E_EXTRA_LARGE24",
      value: "e-extra-large24",
  },
  {
      name: "H2_EXTRA_LARGE24",
      value: "h2-extra-large24",
  },
  {
      name: "EXTRA_LARGE24",
      value: "extra-large24",
  },
  {
      name: "E_EXTRA_LARGE32",
      value: "e-extra-large32",
  },
  {
      name: "H2_EXTRA_LARGE32",
      value: "h2-extra-large32",
  },
  {
      name: "EXTRA_LARGE32",
      value: "extra-large32",
  },
  {
      name: "E_EXTRA_LARGE48",
      value: "e-extra-large48",
  },
  {
      name: "H2_EXTRA_LARGE48",
      value: "h2-extra-large48",
  },
  {
      name: "EXTRA_LARGE48",
      value: "extra-large48",
  },
  {
      name: "E_DOUBLE_LARGE16",
      value: "e-double-large16",
  },
  {
      name: "H2_DOUBLE_LARGE16",
      value: "h2-double-large16",
  },
  {
      name: "DOUBLE_LARGE16",
      value: "double-large16",
  },
  {
      name: "E_DOUBLE_LARGE24",
      value: "e-double-large24",
  },
  {
      name: "H2_DOUBLE_LARGE24",
      value: "h2-double-large24",
  },
  {
      name: "DOUBLE_LARGE24",
      value: "double-large24",
  },
  {
      name: "E_DOUBLE_LARGE32",
      value: "e-double-large32",
  },
  {
      name: "H2_DOUBLE_LARGE32",
      value: "h2-double-large32",
  },
  {
      name: "DOUBLE_LARGE32",
      value: "double-large32",
  },
  {
      name: "E_DOUBLE_LARGE48",
      value: "e-double-large48",
  },
  {
      name: "H2_DOUBLE_LARGE48",
      value: "h2-double-large48",
  },
  {
      name: "DOUBLE_LARGE48",
      value: "double-large48",
  },
  {
      name: "E_DOUBLE_LARGE64",
      value: "e-double-large64",
  },
  {
      name: "H2_DOUBLE_LARGE64",
      value: "h2-double-large64",
  },
  {
      name: "DOUBLE_LARGE64",
      value: "double-large64",
  },
  {
      name: "E_DOUBLE_LARGE96",
      value: "e-double-large96",
  },
  {
      name: "H2_DOUBLE_LARGE96",
      value: "h2-double-large96",
  },
  {
      name: "DOUBLE_LARGE96",
      value: "double-large96",
  },
  {
      name: "H2_TRIPLE_LARGE32",
      value: "h2-triple-large32",
  },
  {
      name: "TRIPLE_LARGE32",
      value: "triple-large32",
  },
  {
      name: "H2_TRIPLE_LARGE48",
      value: "h2-triple-large48",
  },
  {
      name: "TRIPLE_LARGE48",
      value: "triple-large48",
  },
  {
      name: "H2_TRIPLE_LARGE64",
      value: "h2-triple-large64",
  },
  {
      name: "TRIPLE_LARGE64",
      value: "triple-large64",
  },
  {
      name: "H2_TRIPLE_LARGE96",
      value: "h2-triple-large96",
  },
  {
      name: "TRIPLE_LARGE96",
      value: "triple-large96",
  },
  {
      name: "H2_TRIPLE_LARGE128",
      value: "h2-triple-large128",
  },
  {
      name: "TRIPLE_LARGE128",
      value: "triple-large128",
  },
  {
      name: "H2_QUAD_LARGE64",
      value: "h2-quad-large64",
  },
  {
      name: "QUAD_LARGE64",
      value: "quad-large64",
  },
  {
      name: "H2_QUAD_LARGE96",
      value: "h2-quad-large96",
  },
  {
      name: "QUAD_LARGE96",
      value: "quad-large96",
  },
  {
      name: "H2_QUAD_LARGE128",
      value: "h2-quad-large128",
  },
  {
      name: "QUAD_LARGE128",
      value: "quad-large128",
  },
  {
      name: "H2_SEPTA_LARGE128",
      value: "h2-septa-large128",
  },
  {
      name: "SEPTA_LARGE128",
      value: "septa-large128",
  },
])
string InstanceTypeOfCopyInstanceForCopyInstances

@enum([
  {
      name: "MONTHLY",
      value: "1",
  },
  {
      name: "HOURLY",
      value: "2",
  },
])
string AccountingTypeOfCopyInstanceForCopyInstances

@enum([
  {
      name: "STATIC",
      value: "static",
  },
  {
      name: "NONE",
      value: "none",
  },
])
string IpTypeOfCopyInstanceForCopyInstances

structure RequestLoadBalancers {
    @xmlName("InstancePort")
    @ec2QueryName("InstancePort")
    InstancePort: Integer,
    @xmlName("LoadBalancerName")
    @ec2QueryName("LoadBalancerName")
    LoadBalancerName: String,
    @xmlName("LoadBalancerPort")
    @ec2QueryName("LoadBalancerPort")
    LoadBalancerPort: Integer,
}

list ListOfRequestLoadBalancers {
    member: RequestLoadBalancers,
}

structure RequestPlacementOfCopyInstances {
    @xmlName("AvailabilityZone")
    @ec2QueryName("AvailabilityZone")
    AvailabilityZone: String,
    @xmlName("RegionName")
    @ec2QueryName("RegionName")
    RegionName: String,
}

structure CopyInstancesRequest {
    @xmlName("CopyCount")
    @ec2QueryName("CopyCount")
    CopyCount: Integer,
    @required
    @xmlName("CopyInstance")
    @ec2QueryName("CopyInstance")
    CopyInstance: RequestCopyInstance,
    @required
    @xmlName("InstanceId")
    @ec2QueryName("InstanceId")
    InstanceId: String,
    @xmlName("NetworkInterface")
    @ec2QueryName("NetworkInterface")
    NetworkInterface: ListOfRequestNetworkInterface,
}

structure CopyInstancesResult {
    @xmlName("copyInstanceSet")
    @ec2QueryName("copyInstanceSet")
    CopyInstanceSet: ListOfCopyInstanceSet,
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
}

list ListOfCopyInstanceSet {
    @xmlName("item")
    member: CopyInstanceSet,
}

structure CopyInstanceSet {
    @xmlName("instanceId")
    @ec2QueryName("instanceId")
    InstanceId: String,
    @xmlName("instanceState")
    @ec2QueryName("instanceState")
    InstanceState: String,
    @xmlName("instanceUniqueId")
    @ec2QueryName("instanceUniqueId")
    InstanceUniqueId: String,
}

structure CancelCopyInstancesRequest {
    @required
    @xmlName("InstanceId")
    @ec2QueryName("InstanceId")
    InstanceId: String,
}

structure CancelCopyInstancesResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
}

structure RequestUserDataOfImportInstance {
    @xmlName("Content")
    @ec2QueryName("Content")
    Content: String,
}

@enum([
  {
      name: "E_MINI",
      value: "e-mini",
  },
  {
      name: "H2_MINI",
      value: "h2-mini",
  },
  {
      name: "MINI",
      value: "mini",
  },
  {
      name: "C_SMALL",
      value: "c-small",
  },
  {
      name: "E_SMALL",
      value: "e-small",
  },
  {
      name: "H2_SMALL",
      value: "h2-small",
  },
  {
      name: "SMALL",
      value: "small",
  },
  {
      name: "C_SMALL2",
      value: "c-small2",
  },
  {
      name: "E_SMALL2",
      value: "e-small2",
  },
  {
      name: "H2_SMALL2",
      value: "h2-small2",
  },
  {
      name: "SMALL2",
      value: "small2",
  },
  {
      name: "C_SMALL4",
      value: "c-small4",
  },
  {
      name: "E_SMALL4",
      value: "e-small4",
  },
  {
      name: "H2_SMALL4",
      value: "h2-small4",
  },
  {
      name: "SMALL4",
      value: "small4",
  },
  {
      name: "E_SMALL8",
      value: "e-small8",
  },
  {
      name: "H2_SMALL8",
      value: "h2-small8",
  },
  {
      name: "SMALL8",
      value: "small8",
  },
  {
      name: "E_SMALL16",
      value: "e-small16",
  },
  {
      name: "H2_SMALL16",
      value: "h2-small16",
  },
  {
      name: "SMALL16",
      value: "small16",
  },
  {
      name: "C_MEDIUM",
      value: "c-medium",
  },
  {
      name: "E_MEDIUM",
      value: "e-medium",
  },
  {
      name: "H2_MEDIUM",
      value: "h2-medium",
  },
  {
      name: "MEDIUM",
      value: "medium",
  },
  {
      name: "C_MEDIUM4",
      value: "c-medium4",
  },
  {
      name: "E_MEDIUM4",
      value: "e-medium4",
  },
  {
      name: "H2_MEDIUM4",
      value: "h2-medium4",
  },
  {
      name: "MEDIUM4",
      value: "medium4",
  },
  {
      name: "C_MEDIUM8",
      value: "c-medium8",
  },
  {
      name: "E_MEDIUM8",
      value: "e-medium8",
  },
  {
      name: "H2_MEDIUM8",
      value: "h2-medium8",
  },
  {
      name: "MEDIUM8",
      value: "medium8",
  },
  {
      name: "E_MEDIUM16",
      value: "e-medium16",
  },
  {
      name: "H2_MEDIUM16",
      value: "h2-medium16",
  },
  {
      name: "MEDIUM16",
      value: "medium16",
  },
  {
      name: "E_MEDIUM24",
      value: "e-medium24",
  },
  {
      name: "H2_MEDIUM24",
      value: "h2-medium24",
  },
  {
      name: "MEDIUM24",
      value: "medium24",
  },
  {
      name: "C_LARGE",
      value: "c-large",
  },
  {
      name: "E_LARGE",
      value: "e-large",
  },
  {
      name: "H2_LARGE",
      value: "h2-large",
  },
  {
      name: "LARGE",
      value: "large",
  },
  {
      name: "C_LARGE8",
      value: "c-large8",
  },
  {
      name: "E_LARGE8",
      value: "e-large8",
  },
  {
      name: "H2_LARGE8",
      value: "h2-large8",
  },
  {
      name: "LARGE8",
      value: "large8",
  },
  {
      name: "E_LARGE16",
      value: "e-large16",
  },
  {
      name: "H2_LARGE16",
      value: "h2-large16",
  },
  {
      name: "LARGE16",
      value: "large16",
  },
  {
      name: "E_LARGE24",
      value: "e-large24",
  },
  {
      name: "H2_LARGE24",
      value: "h2-large24",
  },
  {
      name: "LARGE24",
      value: "large24",
  },
  {
      name: "E_LARGE32",
      value: "e-large32",
  },
  {
      name: "H2_LARGE32",
      value: "h2-large32",
  },
  {
      name: "LARGE32",
      value: "large32",
  },
  {
      name: "E_EXTRA_LARGE8",
      value: "e-extra-large8",
  },
  {
      name: "H2_EXTRA_LARGE8",
      value: "h2-extra-large8",
  },
  {
      name: "EXTRA_LARGE8",
      value: "extra-large8",
  },
  {
      name: "E_EXTRA_LARGE16",
      value: "e-extra-large16",
  },
  {
      name: "H2_EXTRA_LARGE16",
      value: "h2-extra-large16",
  },
  {
      name: "EXTRA_LARGE16",
      value: "extra-large16",
  },
  {
      name: "E_EXTRA_LARGE24",
      value: "e-extra-large24",
  },
  {
      name: "H2_EXTRA_LARGE24",
      value: "h2-extra-large24",
  },
  {
      name: "EXTRA_LARGE24",
      value: "extra-large24",
  },
  {
      name: "E_EXTRA_LARGE32",
      value: "e-extra-large32",
  },
  {
      name: "H2_EXTRA_LARGE32",
      value: "h2-extra-large32",
  },
  {
      name: "EXTRA_LARGE32",
      value: "extra-large32",
  },
  {
      name: "E_EXTRA_LARGE48",
      value: "e-extra-large48",
  },
  {
      name: "H2_EXTRA_LARGE48",
      value: "h2-extra-large48",
  },
  {
      name: "EXTRA_LARGE48",
      value: "extra-large48",
  },
  {
      name: "E_DOUBLE_LARGE16",
      value: "e-double-large16",
  },
  {
      name: "H2_DOUBLE_LARGE16",
      value: "h2-double-large16",
  },
  {
      name: "DOUBLE_LARGE16",
      value: "double-large16",
  },
  {
      name: "E_DOUBLE_LARGE24",
      value: "e-double-large24",
  },
  {
      name: "H2_DOUBLE_LARGE24",
      value: "h2-double-large24",
  },
  {
      name: "DOUBLE_LARGE24",
      value: "double-large24",
  },
  {
      name: "E_DOUBLE_LARGE32",
      value: "e-double-large32",
  },
  {
      name: "H2_DOUBLE_LARGE32",
      value: "h2-double-large32",
  },
  {
      name: "DOUBLE_LARGE32",
      value: "double-large32",
  },
  {
      name: "E_DOUBLE_LARGE48",
      value: "e-double-large48",
  },
  {
      name: "H2_DOUBLE_LARGE48",
      value: "h2-double-large48",
  },
  {
      name: "DOUBLE_LARGE48",
      value: "double-large48",
  },
  {
      name: "E_DOUBLE_LARGE64",
      value: "e-double-large64",
  },
  {
      name: "H2_DOUBLE_LARGE64",
      value: "h2-double-large64",
  },
  {
      name: "DOUBLE_LARGE64",
      value: "double-large64",
  },
  {
      name: "E_DOUBLE_LARGE96",
      value: "e-double-large96",
  },
  {
      name: "H2_DOUBLE_LARGE96",
      value: "h2-double-large96",
  },
  {
      name: "DOUBLE_LARGE96",
      value: "double-large96",
  },
  {
      name: "H2_TRIPLE_LARGE32",
      value: "h2-triple-large32",
  },
  {
      name: "TRIPLE_LARGE32",
      value: "triple-large32",
  },
  {
      name: "H2_TRIPLE_LARGE48",
      value: "h2-triple-large48",
  },
  {
      name: "TRIPLE_LARGE48",
      value: "triple-large48",
  },
  {
      name: "H2_TRIPLE_LARGE64",
      value: "h2-triple-large64",
  },
  {
      name: "TRIPLE_LARGE64",
      value: "triple-large64",
  },
  {
      name: "H2_TRIPLE_LARGE96",
      value: "h2-triple-large96",
  },
  {
      name: "TRIPLE_LARGE96",
      value: "triple-large96",
  },
  {
      name: "H2_TRIPLE_LARGE128",
      value: "h2-triple-large128",
  },
  {
      name: "TRIPLE_LARGE128",
      value: "triple-large128",
  },
  {
      name: "H2_QUAD_LARGE64",
      value: "h2-quad-large64",
  },
  {
      name: "QUAD_LARGE64",
      value: "quad-large64",
  },
  {
      name: "H2_QUAD_LARGE96",
      value: "h2-quad-large96",
  },
  {
      name: "QUAD_LARGE96",
      value: "quad-large96",
  },
  {
      name: "H2_QUAD_LARGE128",
      value: "h2-quad-large128",
  },
  {
      name: "QUAD_LARGE128",
      value: "quad-large128",
  },
  {
      name: "H2_SEPTA_LARGE128",
      value: "h2-septa-large128",
  },
  {
      name: "SEPTA_LARGE128",
      value: "septa-large128",
  },
])
string InstanceTypeOfImportInstanceRequest

structure RequestPlacementOfImportInstance {
    @xmlName("AvailabilityZone")
    @ec2QueryName("AvailabilityZone")
    AvailabilityZone: String,
}

structure RequestMonitoringOfImportInstance {
    @xmlName("Enabled")
    @ec2QueryName("Enabled")
    Enabled: String,
}

structure RequestImage {
    @xmlName("Bytes")
    @ec2QueryName("Bytes")
    Bytes: Integer,
    @xmlName("Format")
    @ec2QueryName("Format")
    Format: String,
    @xmlName("ImportManifestUrl")
    @ec2QueryName("ImportManifestUrl")
    ImportManifestUrl: String,
}

structure RequestDiskImage {
    @xmlName("Description")
    @ec2QueryName("Description")
    Description: String,
    @xmlName("Image")
    @ec2QueryName("Image")
    RequestImage: RequestImage,
    @xmlName("Volume")
    @ec2QueryName("Volume")
    RequestVolume: RequestVolume,
}

list ListOfRequestDiskImage {
    member: RequestDiskImage,
}

structure RequestVolume {
    @xmlName("Size")
    @ec2QueryName("Size")
    Size: Integer,
}

@enum([
  {
      name: "MONTHLY",
      value: "1",
  },
  {
      name: "HOURLY",
      value: "2",
  },
])
string AccountingTypeOfImportInstanceRequest

@enum([
  {
      name: "STATIC",
      value: "static",
  },
  {
      name: "ELASTIC",
      value: "elastic",
  },
  {
      name: "NONE",
      value: "none",
  },
])
string IpTypeOfImportInstanceRequest

structure ImportInstanceRequest {
    @xmlName("AccountingType")
    @ec2QueryName("AccountingType")
    AccountingType: AccountingTypeOfImportInstanceRequest,
    @xmlName("Architecture")
    @ec2QueryName("Architecture")
    Architecture: String,
    @xmlName("Description")
    @ec2QueryName("Description")
    Description: String,
    @xmlName("DiskImage")
    @ec2QueryName("DiskImage")
    DiskImage: ListOfRequestDiskImage,
    @xmlName("InstanceId")
    @ec2QueryName("InstanceId")
    InstanceId: String,
    @xmlName("InstanceInitiatedShutdownBehavior")
    @ec2QueryName("InstanceInitiatedShutdownBehavior")
    InstanceInitiatedShutdownBehavior: String,
    @xmlName("InstanceType")
    @ec2QueryName("InstanceType")
    InstanceType: InstanceTypeOfImportInstanceRequest,
    @xmlName("IpType")
    @ec2QueryName("IpType")
    IpType: IpTypeOfImportInstanceRequest,
    @xmlName("Monitoring")
    @ec2QueryName("Monitoring")
    Monitoring: RequestMonitoringOfImportInstance,
    @xmlName("NetworkInterface")
    @ec2QueryName("NetworkInterface")
    NetworkInterface: ListOfRequestNetworkInterface,
    @required
    @xmlName("Ovf")
    @ec2QueryName("Ovf")
    Ovf: String,
    @xmlName("Placement")
    @ec2QueryName("Placement")
    Placement: RequestPlacementOfImportInstance,
    @xmlName("Platform")
    @ec2QueryName("Platform")
    Platform: String,
    @xmlName("PrivateIpAddress")
    @ec2QueryName("PrivateIpAddress")
    PrivateIpAddress: String,
    @xmlName("PublicIp")
    @ec2QueryName("PublicIp")
    PublicIp: String,
    @xmlName("SecurityGroup")
    @ec2QueryName("SecurityGroup")
    SecurityGroup: ListOfRequestSecurityGroup,
    @xmlName("SubnetId")
    @ec2QueryName("SubnetId")
    SubnetId: String,
    @xmlName("UserData")
    @ec2QueryName("UserData")
    UserData: RequestUserDataOfImportInstance,
}

structure ImportInstanceResult {
    @xmlName("conversionTask")
    @ec2QueryName("conversionTask")
    ConversionTask: ConversionTask,
}

structure ConversionTask {
    @xmlName("conversionTaskId")
    @ec2QueryName("conversionTaskId")
    ConversionTaskId: String,
    @xmlName("expirationTime")
    @ec2QueryName("expirationTime")
    ExpirationTime: String,
    @xmlName("importInstance")
    @ec2QueryName("importInstance")
    ImportInstance: ImportInstance,
    @xmlName("networkInterfaceSet")
    @ec2QueryName("networkInterfaceSet")
    NetworkInterfaceSet: ListOfNetworkInterfaceSetOfImportInstance,
    @xmlName("state")
    @ec2QueryName("state")
    State: String,
}

structure ImportInstance {
    @xmlName("description")
    @ec2QueryName("description")
    Description: String,
    @xmlName("instanceId")
    @ec2QueryName("instanceId")
    InstanceId: String,
    @xmlName("instanceUniqueId")
    @ec2QueryName("instanceUniqueId")
    InstanceUniqueId: String,
    @xmlName("volumes")
    @ec2QueryName("volumes")
    Volumes: ListOfVolumes,
}

list ListOfVolumes {
    @xmlName("item")
    member: Volumes,
}

structure Volumes {
    @xmlName("availabilityZone")
    @ec2QueryName("availabilityZone")
    AvailabilityZone: String,
    @xmlName("bytesConverted")
    @ec2QueryName("bytesConverted")
    BytesConverted: Integer,
    @xmlName("image")
    @ec2QueryName("image")
    Image: Image,
    @xmlName("status")
    @ec2QueryName("status")
    Status: String,
}

structure Image {
    @xmlName("format")
    @ec2QueryName("format")
    Format: String,
    @xmlName("size")
    @ec2QueryName("size")
    Size: Integer,
}

list ListOfNetworkInterfaceSetOfImportInstance {
    @xmlName("item")
    member: NetworkInterfaceSetOfImportInstance,
}

structure NetworkInterfaceSetOfImportInstance {
    @xmlName("association")
    @ec2QueryName("association")
    Association: AssociationOfImportInstance,
    @xmlName("attachment")
    @ec2QueryName("attachment")
    Attachment: AttachmentOfImportInstance,
    @xmlName("description")
    @ec2QueryName("description")
    Description: String,
    @xmlName("groupSet")
    @ec2QueryName("groupSet")
    GroupSet: String,
    @xmlName("networkInterfaceId")
    @ec2QueryName("networkInterfaceId")
    NetworkInterfaceId: String,
    @xmlName("niftyNetworkId")
    @ec2QueryName("niftyNetworkId")
    NiftyNetworkId: String,
    @xmlName("niftyNetworkName")
    @ec2QueryName("niftyNetworkName")
    NiftyNetworkName: String,
    @xmlName("ownerId")
    @ec2QueryName("ownerId")
    OwnerId: String,
    @xmlName("privateDnsName")
    @ec2QueryName("privateDnsName")
    PrivateDnsName: String,
    @xmlName("privateIpAddressesSet")
    @ec2QueryName("privateIpAddressesSet")
    PrivateIpAddressesSet: String,
    @xmlName("sourceDestCheck")
    @ec2QueryName("sourceDestCheck")
    SourceDestCheck: String,
    @xmlName("status")
    @ec2QueryName("status")
    Status: String,
    @xmlName("subnetId")
    @ec2QueryName("subnetId")
    SubnetId: String,
    @xmlName("vpcId")
    @ec2QueryName("vpcId")
    VpcId: String,
}

structure AttachmentOfImportInstance {
    @xmlName("attachmentID")
    @ec2QueryName("attachmentID")
    AttachmentID: String,
    @xmlName("attachTime")
    @ec2QueryName("attachTime")
    AttachTime: String,
    @xmlName("deleteOnTermination")
    @ec2QueryName("deleteOnTermination")
    DeleteOnTermination: Boolean,
    @xmlName("deviceIndex")
    @ec2QueryName("deviceIndex")
    DeviceIndex: Integer,
    @xmlName("status")
    @ec2QueryName("status")
    Status: String,
}

structure AssociationOfImportInstance {
    @xmlName("ipOwnerId")
    @ec2QueryName("ipOwnerId")
    IpOwnerId: String,
    @xmlName("publicDnsName")
    @ec2QueryName("publicDnsName")
    PublicDnsName: String,
}

structure NiftyCreateInstanceSnapshotRequest {
    @xmlName("Description")
    @ec2QueryName("Description")
    Description: String,
    @required
    @xmlName("InstanceId")
    @ec2QueryName("InstanceId")
    InstanceId: String,
    @required
    @xmlName("SnapshotName")
    @ec2QueryName("SnapshotName")
    SnapshotName: String,
}

structure NiftyCreateInstanceSnapshotResult {
    @xmlName("instanceSet")
    @ec2QueryName("instanceSet")
    InstanceSet: ListOfInstanceSet,
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("snapshotName")
    @ec2QueryName("snapshotName")
    SnapshotName: String,
}

list ListOfInstanceSet {
    @xmlName("item")
    member: InstanceSet,
}

structure InstanceSet {
    @xmlName("instanceId")
    @ec2QueryName("instanceId")
    InstanceId: String,
    @xmlName("instanceState")
    @ec2QueryName("instanceState")
    InstanceState: String,
    @xmlName("instanceUniqueId")
    @ec2QueryName("instanceUniqueId")
    InstanceUniqueId: String,
}

@enum([
  {
      name: "DESCRIPTION",
      value: "description",
  },
])
string AttributeOfNiftyModifyInstanceSnapshotAttributeRequest

structure NiftyModifyInstanceSnapshotAttributeRequest {
    @required
    @xmlName("Attribute")
    @ec2QueryName("Attribute")
    Attribute: AttributeOfNiftyModifyInstanceSnapshotAttributeRequest,
    @xmlName("InstanceSnapshotId")
    @ec2QueryName("InstanceSnapshotId")
    InstanceSnapshotId: String,
    @xmlName("SnapshotName")
    @ec2QueryName("SnapshotName")
    SnapshotName: String,
    @required
    @xmlName("Value")
    @ec2QueryName("Value")
    Value: String,
}

structure NiftyModifyInstanceSnapshotAttributeResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("return")
    @ec2QueryName("return")
    Return: Boolean,
}

list ListOfRequestInstanceSnapshotId {
    member: String,
}

list ListOfRequestSnapshotName {
    member: String,
}

structure NiftyDescribeInstanceSnapshotsRequest {
    @xmlName("InstanceSnapshotId")
    @ec2QueryName("InstanceSnapshotId")
    InstanceSnapshotId: ListOfRequestInstanceSnapshotId,
    @xmlName("SnapshotName")
    @ec2QueryName("SnapshotName")
    SnapshotName: ListOfRequestSnapshotName,
}

structure NiftyDescribeInstanceSnapshotsResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("snapshotInfoSet")
    @ec2QueryName("snapshotInfoSet")
    SnapshotInfoSet: ListOfSnapshotInfoSet,
}

list ListOfSnapshotInfoSet {
    @xmlName("item")
    member: SnapshotInfoSet,
}

structure SnapshotInfoSet {
    @xmlName("createdTime")
    @ec2QueryName("createdTime")
    CreatedTime: String,
    @xmlName("difference")
    @ec2QueryName("difference")
    Difference: String,
    @xmlName("expiredTime")
    @ec2QueryName("expiredTime")
    ExpiredTime: String,
    @xmlName("instanceId")
    @ec2QueryName("instanceId")
    InstanceId: String,
    @xmlName("instanceSnapshotId")
    @ec2QueryName("instanceSnapshotId")
    InstanceSnapshotId: String,
    @xmlName("memo")
    @ec2QueryName("memo")
    Memo: String,
    @xmlName("powerStatus")
    @ec2QueryName("powerStatus")
    PowerStatus: String,
    @xmlName("snapshotName")
    @ec2QueryName("snapshotName")
    SnapshotName: String,
    @xmlName("status")
    @ec2QueryName("status")
    Status: String,
    @xmlName("updatedTime")
    @ec2QueryName("updatedTime")
    UpdatedTime: String,
}

structure NiftyDeleteInstanceSnapshotRequest {
    @xmlName("InstanceSnapshotId")
    @ec2QueryName("InstanceSnapshotId")
    InstanceSnapshotId: String,
    @xmlName("SnapshotName")
    @ec2QueryName("SnapshotName")
    SnapshotName: String,
}

structure NiftyDeleteInstanceSnapshotResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("snapshotInfoSet")
    @ec2QueryName("snapshotInfoSet")
    SnapshotInfoSet: ListOfSnapshotInfoSet,
}

structure NiftyRestoreInstanceSnapshotRequest {
    @xmlName("InstanceSnapshotId")
    @ec2QueryName("InstanceSnapshotId")
    InstanceSnapshotId: String,
    @xmlName("SnapshotName")
    @ec2QueryName("SnapshotName")
    SnapshotName: String,
}

structure NiftyRestoreInstanceSnapshotResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("return")
    @ec2QueryName("return")
    Return: Boolean,
}

structure NiftyRetryImportInstanceRequest {
    @xmlName("InstanceId")
    @ec2QueryName("InstanceId")
    InstanceId: String,
    @xmlName("InstanceUniqueId")
    @ec2QueryName("InstanceUniqueId")
    InstanceUniqueId: String,
}

structure NiftyRetryImportInstanceResult {
    @xmlName("instanceId")
    @ec2QueryName("instanceId")
    InstanceId: String,
    @xmlName("instanceState")
    @ec2QueryName("instanceState")
    InstanceState: String,
    @xmlName("instanceUniqueId")
    @ec2QueryName("instanceUniqueId")
    InstanceUniqueId: String,
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
}

@enum([
  {
      name: "FORCE",
      value: "force",
  },
  {
      name: "TRUE",
      value: "true",
  },
  {
      name: "FALSE",
      value: "false",
  },
])
string NiftyRebootOfNiftyUpdateInstanceNetworkInterfacesRequest

structure NiftyUpdateInstanceNetworkInterfacesRequest {
    @required
    @xmlName("InstanceId")
    @ec2QueryName("InstanceId")
    InstanceId: String,
    @xmlName("NetworkInterface")
    @ec2QueryName("NetworkInterface")
    NetworkInterface: ListOfRequestNetworkInterface,
    @xmlName("NiftyReboot")
    @ec2QueryName("NiftyReboot")
    NiftyReboot: NiftyRebootOfNiftyUpdateInstanceNetworkInterfacesRequest,
}

structure NiftyUpdateInstanceNetworkInterfacesResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("return")
    @ec2QueryName("return")
    Return: Boolean,
}

structure AttachVolumeRequest {
    @xmlName("Device")
    @ec2QueryName("Device")
    Device: String,
    @required
    @xmlName("InstanceId")
    @ec2QueryName("InstanceId")
    InstanceId: String,
    @required
    @xmlName("VolumeId")
    @ec2QueryName("VolumeId")
    VolumeId: String,
}

structure AttachVolumeResult {
    @xmlName("attachTime")
    @ec2QueryName("attachTime")
    AttachTime: Timestamp,
    @xmlName("device")
    @ec2QueryName("device")
    Device: String,
    @xmlName("instanceId")
    @ec2QueryName("instanceId")
    InstanceId: String,
    @xmlName("instanceUniqueId")
    @ec2QueryName("instanceUniqueId")
    InstanceUniqueId: String,
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("status")
    @ec2QueryName("status")
    Status: String,
    @xmlName("volumeId")
    @ec2QueryName("volumeId")
    VolumeId: String,
}

@enum([
  {
      name: "STANDARD_STORAGE",
      value: "2",
  },
  {
      name: "HIGH_SPEED_STORAGE_A",
      value: "3",
  },
  {
      name: "HIGH_SPEED_STORAGE_B",
      value: "4",
  },
  {
      name: "FLASH_DRIVE",
      value: "5",
  },
  {
      name: "STANDARD_FLASH_STORAGE_A",
      value: "6",
  },
  {
      name: "STANDARD_FLASH_STORAGE_B",
      value: "7",
  },
  {
      name: "HIGH_SPEED_FLASH_STORAGE_A",
      value: "8",
  },
  {
      name: "HIGH_SPEED_FLASH_STORAGE_B",
      value: "9",
  },
])
string DiskTypeOfCreateVolumeRequest

@enum([
  {
      name: "MONTHLY",
      value: "1",
  },
  {
      name: "HOURLY",
      value: "2",
  },
])
string AccountingTypeOfCreateVolumeRequest

structure CreateVolumeRequest {
    @xmlName("AccountingType")
    @ec2QueryName("AccountingType")
    AccountingType: AccountingTypeOfCreateVolumeRequest,
    @xmlName("Description")
    @ec2QueryName("Description")
    Description: String,
    @xmlName("DiskType")
    @ec2QueryName("DiskType")
    DiskType: DiskTypeOfCreateVolumeRequest,
    @xmlName("InstanceId")
    @ec2QueryName("InstanceId")
    InstanceId: String,
    @xmlName("InstanceUniqueId")
    @ec2QueryName("InstanceUniqueId")
    InstanceUniqueId: String,
    @required
    @xmlName("Size")
    @ec2QueryName("Size")
    Size: Integer,
    @xmlName("VolumeId")
    @ec2QueryName("VolumeId")
    VolumeId: String,
}

structure CreateVolumeResult {
    @xmlName("accountingType")
    @ec2QueryName("accountingType")
    AccountingType: String,
    @xmlName("availabilityZone")
    @ec2QueryName("availabilityZone")
    AvailabilityZone: String,
    @xmlName("createTime")
    @ec2QueryName("createTime")
    CreateTime: Timestamp,
    @xmlName("description")
    @ec2QueryName("description")
    Description: String,
    @xmlName("diskType")
    @ec2QueryName("diskType")
    DiskType: String,
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("size")
    @ec2QueryName("size")
    Size: Integer,
    @xmlName("snapshotId")
    @ec2QueryName("snapshotId")
    SnapshotId: String,
    @xmlName("status")
    @ec2QueryName("status")
    Status: String,
    @xmlName("volumeId")
    @ec2QueryName("volumeId")
    VolumeId: String,
}

structure DeleteVolumeRequest {
    @required
    @xmlName("VolumeId")
    @ec2QueryName("VolumeId")
    VolumeId: String,
}

structure DeleteVolumeResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("return")
    @ec2QueryName("return")
    Return: Boolean,
}

list ListOfRequestVolumeId {
    member: String,
}

structure DescribeVolumesRequest {
    @xmlName("VolumeId")
    @ec2QueryName("VolumeId")
    VolumeId: ListOfRequestVolumeId,
}

structure DescribeVolumesResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("volumeSet")
    @ec2QueryName("volumeSet")
    VolumeSet: ListOfVolumeSet,
}

list ListOfVolumeSet {
    @xmlName("item")
    member: VolumeSet,
}

structure VolumeSet {
    @xmlName("accountingType")
    @ec2QueryName("accountingType")
    AccountingType: String,
    @xmlName("attachmentSet")
    @ec2QueryName("attachmentSet")
    AttachmentSet: ListOfAttachmentSet,
    @xmlName("availabilityZone")
    @ec2QueryName("availabilityZone")
    AvailabilityZone: String,
    @xmlName("createTime")
    @ec2QueryName("createTime")
    CreateTime: Timestamp,
    @xmlName("description")
    @ec2QueryName("description")
    Description: String,
    @xmlName("diskType")
    @ec2QueryName("diskType")
    DiskType: String,
    @xmlName("nextMonthAccountingType")
    @ec2QueryName("nextMonthAccountingType")
    NextMonthAccountingType: String,
    @xmlName("size")
    @ec2QueryName("size")
    Size: String,
    @xmlName("snapshotId")
    @ec2QueryName("snapshotId")
    SnapshotId: String,
    @xmlName("status")
    @ec2QueryName("status")
    Status: String,
    @xmlName("volumeId")
    @ec2QueryName("volumeId")
    VolumeId: String,
}

list ListOfAttachmentSet {
    @xmlName("item")
    member: AttachmentSet,
}

structure AttachmentSet {
    @xmlName("attachTime")
    @ec2QueryName("attachTime")
    AttachTime: Timestamp,
    @xmlName("deleteOnTermination")
    @ec2QueryName("deleteOnTermination")
    DeleteOnTermination: Boolean,
    @xmlName("device")
    @ec2QueryName("device")
    Device: String,
    @xmlName("instanceId")
    @ec2QueryName("instanceId")
    InstanceId: String,
    @xmlName("instanceUniqueId")
    @ec2QueryName("instanceUniqueId")
    InstanceUniqueId: String,
    @xmlName("status")
    @ec2QueryName("status")
    Status: String,
    @xmlName("volumeId")
    @ec2QueryName("volumeId")
    VolumeId: String,
}

structure DetachVolumeRequest {
    @xmlName("Agreement")
    @ec2QueryName("Agreement")
    Agreement: Boolean,
    @xmlName("Device")
    @ec2QueryName("Device")
    Device: String,
    @xmlName("Force")
    @ec2QueryName("Force")
    Force: Boolean,
    @xmlName("InstanceId")
    @ec2QueryName("InstanceId")
    InstanceId: String,
    @required
    @xmlName("VolumeId")
    @ec2QueryName("VolumeId")
    VolumeId: String,
}

structure DetachVolumeResult {
    @xmlName("attachTime")
    @ec2QueryName("attachTime")
    AttachTime: Timestamp,
    @xmlName("device")
    @ec2QueryName("device")
    Device: String,
    @xmlName("instanceId")
    @ec2QueryName("instanceId")
    InstanceId: String,
    @xmlName("instanceUniqueId")
    @ec2QueryName("instanceUniqueId")
    InstanceUniqueId: String,
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("status")
    @ec2QueryName("status")
    Status: String,
    @xmlName("volumeId")
    @ec2QueryName("volumeId")
    VolumeId: String,
}

@enum([
  {
      name: "ACCOUNTING_TYPE",
      value: "accountingType",
  },
  {
      name: "VOLUME_NAME",
      value: "volumeName",
  },
  {
      name: "DESCRIPTION",
      value: "description",
  },
])
string AttributeOfModifyVolumeAttributeRequest

structure ModifyVolumeAttributeRequest {
    @xmlName("Attribute")
    @ec2QueryName("Attribute")
    Attribute: AttributeOfModifyVolumeAttributeRequest,
    @xmlName("Value")
    @ec2QueryName("Value")
    Value: String,
    @required
    @xmlName("VolumeId")
    @ec2QueryName("VolumeId")
    VolumeId: String,
}

structure ModifyVolumeAttributeResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("return")
    @ec2QueryName("return")
    Return: Boolean,
}

@enum([
  {
      name: "FORCE",
      value: "force",
  },
  {
      name: "TRUE",
      value: "true",
  },
  {
      name: "FALSE",
      value: "false",
  },
])
string NiftyRebootOfExtendVolumeSizeRequest

structure ExtendVolumeSizeRequest {
    @xmlName("NiftyReboot")
    @ec2QueryName("NiftyReboot")
    NiftyReboot: NiftyRebootOfExtendVolumeSizeRequest,
    @required
    @xmlName("VolumeId")
    @ec2QueryName("VolumeId")
    VolumeId: String,
}

structure ExtendVolumeSizeResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("return")
    @ec2QueryName("return")
    Return: String,
}

structure CreateKeyPairRequest {
    @xmlName("Description")
    @ec2QueryName("Description")
    Description: String,
    @required
    @xmlName("KeyName")
    @ec2QueryName("KeyName")
    KeyName: String,
    @required
    @xmlName("Password")
    @ec2QueryName("Password")
    Password: String,
}

structure CreateKeyPairResult {
    @xmlName("description")
    @ec2QueryName("description")
    Description: String,
    @xmlName("keyFingerprint")
    @ec2QueryName("keyFingerprint")
    KeyFingerprint: String,
    @xmlName("keyMaterial")
    @ec2QueryName("keyMaterial")
    KeyMaterial: String,
    @xmlName("keyName")
    @ec2QueryName("keyName")
    KeyName: String,
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
}

structure DeleteKeyPairRequest {
    @required
    @xmlName("KeyName")
    @ec2QueryName("KeyName")
    KeyName: String,
}

structure DeleteKeyPairResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("return")
    @ec2QueryName("return")
    Return: Boolean,
}

list ListOfRequestKeyName {
    member: String,
}

structure DescribeKeyPairsRequest {
    @xmlName("KeyName")
    @ec2QueryName("KeyName")
    KeyName: ListOfRequestKeyName,
}

structure DescribeKeyPairsResult {
    @xmlName("keySet")
    @ec2QueryName("keySet")
    KeySet: ListOfKeySet,
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
}

list ListOfKeySet {
    @xmlName("item")
    member: KeySet,
}

structure KeySet {
    @xmlName("description")
    @ec2QueryName("description")
    Description: String,
    @xmlName("instancesSet")
    @ec2QueryName("instancesSet")
    InstancesSet: ListOfInstancesSetOfDescribeKeyPairs,
    @xmlName("keyFingerprint")
    @ec2QueryName("keyFingerprint")
    KeyFingerprint: String,
    @xmlName("keyName")
    @ec2QueryName("keyName")
    KeyName: String,
}

list ListOfInstancesSetOfDescribeKeyPairs {
    @xmlName("item")
    member: InstancesSetOfDescribeKeyPairs,
}

structure InstancesSetOfDescribeKeyPairs {
    @xmlName("instanceId")
    @ec2QueryName("instanceId")
    InstanceId: String,
    @xmlName("regionName")
    @ec2QueryName("regionName")
    RegionName: String,
}

@enum([
  {
      name: "DESCRIPTION",
      value: "description",
  },
])
string AttributeOfNiftyModifyKeyPairAttributeRequest

structure NiftyModifyKeyPairAttributeRequest {
    @required
    @xmlName("Attribute")
    @ec2QueryName("Attribute")
    Attribute: AttributeOfNiftyModifyKeyPairAttributeRequest,
    @required
    @xmlName("KeyName")
    @ec2QueryName("KeyName")
    KeyName: String,
    @required
    @xmlName("Value")
    @ec2QueryName("Value")
    Value: String,
}

structure NiftyModifyKeyPairAttributeResult {
    @xmlName("attribute")
    @ec2QueryName("attribute")
    Attribute: String,
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("return")
    @ec2QueryName("return")
    Return: Boolean,
    @xmlName("value")
    @ec2QueryName("value")
    Value: String,
}

structure ImportKeyPairRequest {
    @xmlName("Description")
    @ec2QueryName("Description")
    Description: String,
    @required
    @xmlName("KeyName")
    @ec2QueryName("KeyName")
    KeyName: String,
    @required
    @xmlName("PublicKeyMaterial")
    @ec2QueryName("PublicKeyMaterial")
    PublicKeyMaterial: String,
}

structure ImportKeyPairResult {
    @xmlName("keyFingerprint")
    @ec2QueryName("keyFingerprint")
    KeyFingerprint: String,
    @xmlName("keyName")
    @ec2QueryName("keyName")
    KeyName: String,
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
}

list ListOfRequestExecutableBy {
    member: String,
}

list ListOfRequestImageId {
    member: String,
}

list ListOfRequestImageName {
    member: String,
}

list ListOfRequestOwner {
    member: String,
}

structure DescribeImagesRequest {
    @xmlName("ExecutableBy")
    @ec2QueryName("ExecutableBy")
    ExecutableBy: ListOfRequestExecutableBy,
    @xmlName("ImageId")
    @ec2QueryName("ImageId")
    ImageId: ListOfRequestImageId,
    @xmlName("ImageName")
    @ec2QueryName("ImageName")
    ImageName: ListOfRequestImageName,
    @xmlName("Owner")
    @ec2QueryName("Owner")
    Owner: ListOfRequestOwner,
}

structure DescribeImagesResult {
    @xmlName("imagesSet")
    @ec2QueryName("imagesSet")
    ImagesSet: ListOfImagesSet,
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
}

list ListOfImagesSet {
    @xmlName("item")
    member: ImagesSet,
}

structure ImagesSet {
    @xmlName("architecture")
    @ec2QueryName("architecture")
    Architecture: String,
    @xmlName("blockDeviceMapping")
    @ec2QueryName("blockDeviceMapping")
    BlockDeviceMapping: ListOfBlockDeviceMappingOfDescribeImages,
    @xmlName("description")
    @ec2QueryName("description")
    Description: String,
    @xmlName("detailDescription")
    @ec2QueryName("detailDescription")
    DetailDescription: String,
    @xmlName("imageId")
    @ec2QueryName("imageId")
    ImageId: String,
    @xmlName("imageLocation")
    @ec2QueryName("imageLocation")
    ImageLocation: String,
    @xmlName("imageOwnerAlias")
    @ec2QueryName("imageOwnerAlias")
    ImageOwnerAlias: String,
    @xmlName("imageOwnerId")
    @ec2QueryName("imageOwnerId")
    ImageOwnerId: String,
    @xmlName("imageState")
    @ec2QueryName("imageState")
    ImageState: String,
    @xmlName("imageType")
    @ec2QueryName("imageType")
    ImageType: String,
    @xmlName("isPublic")
    @ec2QueryName("isPublic")
    IsPublic: Boolean,
    @xmlName("kernelId")
    @ec2QueryName("kernelId")
    KernelId: String,
    @xmlName("launchTime")
    @ec2QueryName("launchTime")
    LaunchTime: Timestamp,
    @xmlName("name")
    @ec2QueryName("name")
    Name: String,
    @xmlName("niftyContactUrl")
    @ec2QueryName("niftyContactUrl")
    NiftyContactUrl: String,
    @xmlName("niftyDistributionIds")
    @ec2QueryName("niftyDistributionIds")
    NiftyDistributionIds: ListOfNiftyDistributionIds,
    @xmlName("niftyImageSize")
    @ec2QueryName("niftyImageSize")
    NiftyImageSize: Integer,
    @xmlName("niftyIsAllowedDistribution")
    @ec2QueryName("niftyIsAllowedDistribution")
    NiftyIsAllowedDistribution: Boolean,
    @xmlName("placement")
    @ec2QueryName("placement")
    Placement: PlacementOfDescribeImages,
    @xmlName("platform")
    @ec2QueryName("platform")
    Platform: String,
    @xmlName("productCodes")
    @ec2QueryName("productCodes")
    ProductCodes: ListOfProductCodes,
    @xmlName("ramdiskId")
    @ec2QueryName("ramdiskId")
    RamdiskId: String,
    @xmlName("redistributable")
    @ec2QueryName("redistributable")
    Redistributable: Boolean,
    @xmlName("rootDeviceName")
    @ec2QueryName("rootDeviceName")
    RootDeviceName: String,
    @xmlName("rootDeviceType")
    @ec2QueryName("rootDeviceType")
    RootDeviceType: String,
    @xmlName("stateReason")
    @ec2QueryName("stateReason")
    StateReason: StateReason,
}

structure PlacementOfDescribeImages {
    @xmlName("availabilityZone")
    @ec2QueryName("availabilityZone")
    AvailabilityZone: String,
    @xmlName("regionName")
    @ec2QueryName("regionName")
    RegionName: String,
}

list ListOfBlockDeviceMappingOfDescribeImages {
    @xmlName("item")
    member: BlockDeviceMappingOfDescribeImages,
}

structure BlockDeviceMappingOfDescribeImages {
    @xmlName("deviceName")
    @ec2QueryName("deviceName")
    DeviceName: String,
    @xmlName("ebs")
    @ec2QueryName("ebs")
    Ebs: EbsOfDescribeImages,
}

structure EbsOfDescribeImages {
    @xmlName("deleteOnTermination")
    @ec2QueryName("deleteOnTermination")
    DeleteOnTermination: Boolean,
    @xmlName("diskType")
    @ec2QueryName("diskType")
    DiskType: String,
    @xmlName("snapshotId")
    @ec2QueryName("snapshotId")
    SnapshotId: String,
    @xmlName("volumeSize")
    @ec2QueryName("volumeSize")
    VolumeSize: Integer,
}

list ListOfNiftyDistributionIds {
    @xmlName("item")
    member: NiftyDistributionIds,
}

structure NiftyDistributionIds {
    @xmlName("distributionId")
    @ec2QueryName("distributionId")
    DistributionId: String,
}

structure RequestPlacementOfCreateImage {
    @xmlName("AvailabilityZone")
    @ec2QueryName("AvailabilityZone")
    AvailabilityZone: String,
    @xmlName("RegionName")
    @ec2QueryName("RegionName")
    RegionName: String,
}

structure CreateImageRequest {
    @xmlName("Description")
    @ec2QueryName("Description")
    Description: String,
    @required
    @xmlName("InstanceId")
    @ec2QueryName("InstanceId")
    InstanceId: String,
    @xmlName("LeftInstance")
    @ec2QueryName("LeftInstance")
    LeftInstance: Boolean,
    @required
    @xmlName("Name")
    @ec2QueryName("Name")
    Name: String,
    @xmlName("NoReboot")
    @ec2QueryName("NoReboot")
    NoReboot: Boolean,
    @xmlName("Placement")
    @ec2QueryName("Placement")
    Placement: RequestPlacementOfCreateImage,
}

structure CreateImageResult {
    @xmlName("imageId")
    @ec2QueryName("imageId")
    ImageId: String,
    @xmlName("imageState")
    @ec2QueryName("imageState")
    ImageState: String,
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
}

structure DeleteImageRequest {
    @required
    @xmlName("ImageId")
    @ec2QueryName("ImageId")
    ImageId: String,
}

structure DeleteImageResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
}

@enum([
  {
      name: "DESCRIPTION",
      value: "description",
  },
  {
      name: "IMAGE_NAME",
      value: "imageName",
  },
  {
      name: "NIFTY_CONTACT_URL",
      value: "niftyContactUrl",
  },
  {
      name: "DETAIL_DESCRIPTION",
      value: "detailDescription",
  },
])
string AttributeOfModifyImageAttributeRequest

structure RequestAdd {
    @xmlName("Group")
    @ec2QueryName("Group")
    Group: String,
    @xmlName("UserId")
    @ec2QueryName("UserId")
    UserId: String,
}

list ListOfRequestAdd {
    member: RequestAdd,
}

structure RequestLaunchPermission {
    @xmlName("Add")
    @ec2QueryName("Add")
    ListOfRequestAdd: ListOfRequestAdd,
    @xmlName("Remove")
    @ec2QueryName("Remove")
    ListOfRequestRemove: ListOfRequestRemove,
}

structure RequestRemove {
    @xmlName("Group")
    @ec2QueryName("Group")
    Group: String,
    @xmlName("UserId")
    @ec2QueryName("UserId")
    UserId: String,
}

list ListOfRequestRemove {
    member: RequestRemove,
}

list ListOfRequestProductCode {
    member: String,
}

structure ModifyImageAttributeRequest {
    @xmlName("Attribute")
    @ec2QueryName("Attribute")
    Attribute: AttributeOfModifyImageAttributeRequest,
    @required
    @xmlName("ImageId")
    @ec2QueryName("ImageId")
    ImageId: String,
    @xmlName("LaunchPermission")
    @ec2QueryName("LaunchPermission")
    LaunchPermission: RequestLaunchPermission,
    @xmlName("ProductCode")
    @ec2QueryName("ProductCode")
    ProductCode: ListOfRequestProductCode,
    @xmlName("Value")
    @ec2QueryName("Value")
    Value: String,
}

structure ModifyImageAttributeResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("return")
    @ec2QueryName("return")
    Return: Boolean,
}

list ListOfRequestDistributionId {
    member: String,
}

structure NiftyAssociateImageRequest {
    @xmlName("DistributionId")
    @ec2QueryName("DistributionId")
    DistributionId: ListOfRequestDistributionId,
    @required
    @xmlName("ImageId")
    @ec2QueryName("ImageId")
    ImageId: String,
    @required
    @xmlName("IsPublic")
    @ec2QueryName("IsPublic")
    IsPublic: Boolean,
    @xmlName("IsRedistribute")
    @ec2QueryName("IsRedistribute")
    IsRedistribute: Boolean,
}

structure NiftyAssociateImageResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("return")
    @ec2QueryName("return")
    Return: Boolean,
}

structure AttachIsoImageRequest {
    @required
    @xmlName("InstanceUniqueId")
    @ec2QueryName("InstanceUniqueId")
    InstanceUniqueId: String,
    @required
    @xmlName("IsoImageId")
    @ec2QueryName("IsoImageId")
    IsoImageId: String,
}

structure AttachIsoImageResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("return")
    @ec2QueryName("return")
    Return: Boolean,
}

structure DeleteIsoImageRequest {
    @required
    @xmlName("IsoImageId")
    @ec2QueryName("IsoImageId")
    IsoImageId: String,
}

structure DeleteIsoImageResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("return")
    @ec2QueryName("return")
    Return: Boolean,
}

@enum([
  {
      name: "ISO_IMAGE_ID",
      value: "iso-image-id",
  },
  {
      name: "ISO_IMAGE_NAME",
      value: "iso-image-name",
  },
  {
      name: "AVAILABILITY_ZONE",
      value: "availability-zone",
  },
  {
      name: "DESCRIPTION",
      value: "description",
  },
])
string NameOfFilterForDescribeIsoImages

structure RequestFilter {
    @xmlName("Value")
    @ec2QueryName("Value")
    ListOfRequestValue: ListOfRequestValue,
    @xmlName("Name")
    @ec2QueryName("Name")
    Name: NameOfFilterForDescribeIsoImages,
}

list ListOfRequestFilter {
    member: RequestFilter,
}

list ListOfRequestValue {
    member: String,
}

structure DescribeIsoImagesRequest {
    @xmlName("Filter")
    @ec2QueryName("Filter")
    Filter: ListOfRequestFilter,
    @xmlName("IsoImageId")
    @ec2QueryName("IsoImageId")
    IsoImageId: String,
}

structure DescribeIsoImagesResult {
    @xmlName("isoImagesSet")
    @ec2QueryName("isoImagesSet")
    IsoImagesSet: ListOfIsoImagesSet,
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
}

list ListOfIsoImagesSet {
    @xmlName("item")
    member: IsoImagesSet,
}

structure IsoImagesSet {
    @xmlName("availabilityZone")
    @ec2QueryName("availabilityZone")
    AvailabilityZone: String,
    @xmlName("createdTime")
    @ec2QueryName("createdTime")
    CreatedTime: String,
    @xmlName("description")
    @ec2QueryName("description")
    Description: String,
    @xmlName("expiredTime")
    @ec2QueryName("expiredTime")
    ExpiredTime: String,
    @xmlName("instancesSet")
    @ec2QueryName("instancesSet")
    InstancesSet: ListOfInstancesSetOfDescribeIsoImages,
    @xmlName("isoImageId")
    @ec2QueryName("isoImageId")
    IsoImageId: String,
    @xmlName("isoImageName")
    @ec2QueryName("isoImageName")
    IsoImageName: String,
    @xmlName("isoImageSize")
    @ec2QueryName("isoImageSize")
    IsoImageSize: String,
    @xmlName("status")
    @ec2QueryName("status")
    Status: String,
}

list ListOfInstancesSetOfDescribeIsoImages {
    @xmlName("item")
    member: InstancesSetOfDescribeIsoImages,
}

structure InstancesSetOfDescribeIsoImages {
    @xmlName("instanceId")
    @ec2QueryName("instanceId")
    InstanceId: String,
    @xmlName("instanceUniqueId")
    @ec2QueryName("instanceUniqueId")
    InstanceUniqueId: String,
}

structure DetachIsoImageRequest {
    @required
    @xmlName("InstanceUniqueId")
    @ec2QueryName("InstanceUniqueId")
    InstanceUniqueId: String,
    @required
    @xmlName("IsoImageId")
    @ec2QueryName("IsoImageId")
    IsoImageId: String,
}

structure DetachIsoImageResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("return")
    @ec2QueryName("return")
    Return: Boolean,
}

structure UploadIsoImageRequest {
    @xmlName("AvailabilityZone")
    @ec2QueryName("AvailabilityZone")
    AvailabilityZone: String,
    @xmlName("Description")
    @ec2QueryName("Description")
    Description: String,
    @xmlName("IsoImageName")
    @ec2QueryName("IsoImageName")
    IsoImageName: String,
    @required
    @xmlName("IsoUrl")
    @ec2QueryName("IsoUrl")
    IsoUrl: String,
}

structure UploadIsoImageResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("return")
    @ec2QueryName("return")
    Return: Boolean,
}

structure RequestHealthCheck {
    @xmlName("HealthyThreshold")
    @ec2QueryName("HealthyThreshold")
    HealthyThreshold: Integer,
    @required
    @xmlName("Interval")
    @ec2QueryName("Interval")
    Interval: Integer,
    @required
    @xmlName("Target")
    @ec2QueryName("Target")
    Target: String,
    @xmlName("Timeout")
    @ec2QueryName("Timeout")
    Timeout: Integer,
    @required
    @xmlName("UnhealthyThreshold")
    @ec2QueryName("UnhealthyThreshold")
    UnhealthyThreshold: Integer,
}

structure ConfigureHealthCheckRequest {
    @required
    @xmlName("HealthCheck")
    @ec2QueryName("HealthCheck")
    HealthCheck: RequestHealthCheck,
    @required
    @xmlName("InstancePort")
    @ec2QueryName("InstancePort")
    InstancePort: Integer,
    @required
    @xmlName("LoadBalancerName")
    @ec2QueryName("LoadBalancerName")
    LoadBalancerName: String,
    @required
    @xmlName("LoadBalancerPort")
    @ec2QueryName("LoadBalancerPort")
    LoadBalancerPort: Integer,
}

structure ConfigureHealthCheckResultWrapper {
    @xmlName("ConfigureHealthCheckResult")
    @ec2QueryName("ConfigureHealthCheckResult")
    ConfigureHealthCheckResult: ConfigureHealthCheckResult,
    @xmlName("ResponseMetadata")
    @ec2QueryName("ResponseMetadata")
    ResponseMetadata: ResponseMetadata,
}

structure ConfigureHealthCheckResult {
    @xmlName("HealthCheck")
    @ec2QueryName("HealthCheck")
    HealthCheck: HealthCheck,
}

structure HealthCheck {
    @xmlName("HealthyThreshold")
    @ec2QueryName("HealthyThreshold")
    HealthyThreshold: Integer,
    @xmlName("Interval")
    @ec2QueryName("Interval")
    Interval: Integer,
    @xmlName("Target")
    @ec2QueryName("Target")
    Target: String,
    @xmlName("UnhealthyThreshold")
    @ec2QueryName("UnhealthyThreshold")
    UnhealthyThreshold: Integer,
}

structure ResponseMetadata {
    @xmlName("RequestId")
    @ec2QueryName("RequestId")
    RequestId: String,
}

@enum([
  {
      name: "HTTP",
      value: "HTTP",
  },
  {
      name: "HTTPS",
      value: "HTTPS",
  },
  {
      name: "FTP",
      value: "FTP",
  },
])
string ProtocolOfListenersForCreateLoadBalancer

structure RequestListeners {
    @xmlName("BalancingType")
    @ec2QueryName("BalancingType")
    BalancingType: Integer,
    @xmlName("InstancePort")
    @ec2QueryName("InstancePort")
    InstancePort: Integer,
    @xmlName("LoadBalancerPort")
    @ec2QueryName("LoadBalancerPort")
    LoadBalancerPort: Integer,
    @xmlName("Protocol")
    @ec2QueryName("Protocol")
    Protocol: ProtocolOfListenersForCreateLoadBalancer,
}

structure ListOfRequestListeners {
    @xmlName("member")
    @ec2QueryName("member")
    Member: ListOfRequestListenersMember,
}

structure ListOfRequestAvailabilityZones {
    @xmlName("member")
    @ec2QueryName("member")
    Member: ListOfRequestAvailabilityZonesMember,
}

@enum([
  {
      name: "IPV4",
      value: "v4",
  },
  {
      name: "IPV6",
      value: "v6",
  },
])
string IpVersionOfCreateLoadBalancerRequest

@enum([
  {
      name: "MONTHLY",
      value: "1",
  },
  {
      name: "HOURLY",
      value: "2",
  },
])
string AccountingTypeOfCreateLoadBalancerRequest

@enum([
  {
      name: "STANDARD",
      value: "standard",
  },
  {
      name: "ATS",
      value: "ats",
  },
])
string PolicyTypeOfCreateLoadBalancerRequest

structure CreateLoadBalancerRequest {
    @xmlName("AccountingType")
    @ec2QueryName("AccountingType")
    AccountingType: AccountingTypeOfCreateLoadBalancerRequest,
    @xmlName("AvailabilityZones")
    @ec2QueryName("AvailabilityZones")
    AvailabilityZones: ListOfRequestAvailabilityZones,
    @xmlName("IpVersion")
    @ec2QueryName("IpVersion")
    IpVersion: IpVersionOfCreateLoadBalancerRequest,
    @xmlName("Listeners")
    @ec2QueryName("Listeners")
    Listeners: ListOfRequestListeners,
    @required
    @xmlName("LoadBalancerName")
    @ec2QueryName("LoadBalancerName")
    LoadBalancerName: String,
    @xmlName("NetworkVolume")
    @ec2QueryName("NetworkVolume")
    NetworkVolume: Integer,
    @xmlName("PolicyType")
    @ec2QueryName("PolicyType")
    PolicyType: PolicyTypeOfCreateLoadBalancerRequest,
}

structure CreateLoadBalancerResultWrapper {
    @xmlName("CreateLoadBalancerResult")
    @ec2QueryName("CreateLoadBalancerResult")
    CreateLoadBalancerResult: CreateLoadBalancerResult,
    @xmlName("ResponseMetadata")
    @ec2QueryName("ResponseMetadata")
    ResponseMetadata: ResponseMetadata,
}

structure CreateLoadBalancerResult {
    @xmlName("DNSName")
    @ec2QueryName("DNSName")
    DNSName: String,
}

structure DeleteLoadBalancerRequest {
    @required
    @xmlName("InstancePort")
    @ec2QueryName("InstancePort")
    InstancePort: Integer,
    @required
    @xmlName("LoadBalancerName")
    @ec2QueryName("LoadBalancerName")
    LoadBalancerName: String,
    @required
    @xmlName("LoadBalancerPort")
    @ec2QueryName("LoadBalancerPort")
    LoadBalancerPort: Integer,
}

structure DeleteLoadBalancerResultWrapper {
    @xmlName("DeleteLoadBalancerResult")
    @ec2QueryName("DeleteLoadBalancerResult")
    DeleteLoadBalancerResult: String,
    @xmlName("ResponseMetadata")
    @ec2QueryName("ResponseMetadata")
    ResponseMetadata: ResponseMetadata,
}

structure RequestInstances {
    @required
    @xmlName("InstanceId")
    @ec2QueryName("InstanceId")
    InstanceId: String,
}

structure ListOfRequestInstances {
    @xmlName("member")
    @ec2QueryName("member")
    Member: ListOfRequestInstancesMember,
}

structure DeregisterInstancesFromLoadBalancerRequest {
    @required
    @xmlName("InstancePort")
    @ec2QueryName("InstancePort")
    InstancePort: Integer,
    @required
    @xmlName("Instances")
    @ec2QueryName("Instances")
    Instances: ListOfRequestInstances,
    @required
    @xmlName("LoadBalancerName")
    @ec2QueryName("LoadBalancerName")
    LoadBalancerName: String,
    @required
    @xmlName("LoadBalancerPort")
    @ec2QueryName("LoadBalancerPort")
    LoadBalancerPort: Integer,
}

structure DeregisterInstancesFromLoadBalancerResultWrapper {
    @xmlName("DeregisterInstancesFromLoadBalancerResult")
    @ec2QueryName("DeregisterInstancesFromLoadBalancerResult")
    DeregisterInstancesFromLoadBalancerResult: DeregisterInstancesFromLoadBalancerResult,
    @xmlName("ResponseMetadata")
    @ec2QueryName("ResponseMetadata")
    ResponseMetadata: ResponseMetadata,
}

structure DeregisterInstancesFromLoadBalancerResult {
    @xmlName("Instances")
    @ec2QueryName("Instances")
    Instances: ListOfInstances,
}

list ListOfInstances {
    @xmlName("member")
    member: Instances,
}

structure Instances {
    @xmlName("InstanceId")
    @ec2QueryName("InstanceId")
    InstanceId: String,
    @xmlName("InstanceUniqueId")
    @ec2QueryName("InstanceUniqueId")
    InstanceUniqueId: String,
}

structure RequestInstancesOfDescribeInstanceHealth {
    @xmlName("InstanceId")
    @ec2QueryName("InstanceId")
    InstanceId: String,
}

structure ListOfRequestInstancesOfDescribeInstanceHealth {
    @xmlName("member")
    @ec2QueryName("member")
    Member: ListOfRequestInstancesOfDescribeInstanceHealthMember,
}

structure DescribeInstanceHealthRequest {
    @required
    @xmlName("InstancePort")
    @ec2QueryName("InstancePort")
    InstancePort: Integer,
    @xmlName("Instances")
    @ec2QueryName("Instances")
    Instances: ListOfRequestInstancesOfDescribeInstanceHealth,
    @required
    @xmlName("LoadBalancerName")
    @ec2QueryName("LoadBalancerName")
    LoadBalancerName: String,
    @required
    @xmlName("LoadBalancerPort")
    @ec2QueryName("LoadBalancerPort")
    LoadBalancerPort: Integer,
}

structure DescribeInstanceHealthResultWrapper {
    @xmlName("DescribeInstanceHealthResult")
    @ec2QueryName("DescribeInstanceHealthResult")
    DescribeInstanceHealthResult: DescribeInstanceHealthResult,
    @xmlName("ResponseMetadata")
    @ec2QueryName("ResponseMetadata")
    ResponseMetadata: ResponseMetadata,
}

structure DescribeInstanceHealthResult {
    @xmlName("InstanceStates")
    @ec2QueryName("InstanceStates")
    InstanceStates: ListOfInstanceStates,
}

list ListOfInstanceStates {
    @xmlName("member")
    member: InstanceStates,
}

structure InstanceStates {
    @xmlName("Description")
    @ec2QueryName("Description")
    Description: String,
    @xmlName("InstanceId")
    @ec2QueryName("InstanceId")
    InstanceId: String,
    @xmlName("InstanceUniqueId")
    @ec2QueryName("InstanceUniqueId")
    InstanceUniqueId: String,
    @xmlName("ReasonCode")
    @ec2QueryName("ReasonCode")
    ReasonCode: String,
    @xmlName("State")
    @ec2QueryName("State")
    State: String,
}

structure RequestLoadBalancerNames {
    @xmlName("InstancePort")
    @ec2QueryName("InstancePort")
    InstancePort: Integer,
    @xmlName("LoadBalancerName")
    @ec2QueryName("LoadBalancerName")
    LoadBalancerName: String,
    @xmlName("LoadBalancerPort")
    @ec2QueryName("LoadBalancerPort")
    LoadBalancerPort: Integer,
}

structure ListOfRequestLoadBalancerNames {
    @xmlName("member")
    @ec2QueryName("member")
    Member: ListOfRequestLoadBalancerNamesMember,
}

@enum([
  {
      name: "SELF",
      value: "self",
  },
  {
      name: "OTHER",
      value: "other",
  },
  {
      name: "ALL",
      value: "all",
  },
])
string OwnerOfDescribeLoadBalancersRequest

structure DescribeLoadBalancersRequest {
    @xmlName("LoadBalancerNames")
    @ec2QueryName("LoadBalancerNames")
    LoadBalancerNames: ListOfRequestLoadBalancerNames,
    @xmlName("Owner")
    @ec2QueryName("Owner")
    Owner: OwnerOfDescribeLoadBalancersRequest,
}

structure DescribeLoadBalancersResultWrapper {
    @xmlName("DescribeLoadBalancersResult")
    @ec2QueryName("DescribeLoadBalancersResult")
    DescribeLoadBalancersResult: DescribeLoadBalancersResult,
    @xmlName("ResponseMetadata")
    @ec2QueryName("ResponseMetadata")
    ResponseMetadata: ResponseMetadata,
}

structure DescribeLoadBalancersResult {
    @xmlName("LoadBalancerDescriptions")
    @ec2QueryName("LoadBalancerDescriptions")
    LoadBalancerDescriptions: ListOfLoadBalancerDescriptions,
}

list ListOfLoadBalancerDescriptions {
    @xmlName("member")
    member: LoadBalancerDescriptions,
}

structure LoadBalancerDescriptions {
    @xmlName("AccountingType")
    @ec2QueryName("AccountingType")
    AccountingType: String,
    @xmlName("AvailabilityZones")
    @ec2QueryName("AvailabilityZones")
    AvailabilityZones: ListOfAvailabilityZones,
    @xmlName("CreatedTime")
    @ec2QueryName("CreatedTime")
    CreatedTime: Timestamp,
    @xmlName("Description")
    @ec2QueryName("Description")
    Description: String,
    @xmlName("DNSName")
    @ec2QueryName("DNSName")
    DNSName: String,
    @xmlName("Filter")
    @ec2QueryName("Filter")
    Filter: Filter,
    @xmlName("HealthCheck")
    @ec2QueryName("HealthCheck")
    HealthCheck: HealthCheckOfDescribeLoadBalancers,
    @xmlName("Instances")
    @ec2QueryName("Instances")
    Instances: ListOfInstances,
    @xmlName("ListenerDescriptions")
    @ec2QueryName("ListenerDescriptions")
    ListenerDescriptions: ListOfListenerDescriptions,
    @xmlName("LoadBalancerName")
    @ec2QueryName("LoadBalancerName")
    LoadBalancerName: String,
    @xmlName("NetworkVolume")
    @ec2QueryName("NetworkVolume")
    NetworkVolume: Integer,
    @xmlName("NextMonthAccountingType")
    @ec2QueryName("NextMonthAccountingType")
    NextMonthAccountingType: String,
    @xmlName("Option")
    @ec2QueryName("Option")
    Option: Option,
    @xmlName("Policies")
    @ec2QueryName("Policies")
    Policies: Policies,
    @xmlName("PolicyType")
    @ec2QueryName("PolicyType")
    PolicyType: String,
}

list ListOfListenerDescriptions {
    @xmlName("member")
    member: ListenerDescriptions,
}

structure ListenerDescriptions {
    @xmlName("Listener")
    @ec2QueryName("Listener")
    Listener: Listener,
}

structure Listener {
    @xmlName("BalancingType")
    @ec2QueryName("BalancingType")
    BalancingType: Integer,
    @xmlName("InstancePort")
    @ec2QueryName("InstancePort")
    InstancePort: Integer,
    @xmlName("LoadBalancerPort")
    @ec2QueryName("LoadBalancerPort")
    LoadBalancerPort: Integer,
    @xmlName("Protocol")
    @ec2QueryName("Protocol")
    Protocol: String,
    @xmlName("SSLCertificateId")
    @ec2QueryName("SSLCertificateId")
    SSLCertificateId: String,
    @xmlName("SSLPolicy")
    @ec2QueryName("SSLPolicy")
    SSLPolicy: SSLPolicy,
}

structure SSLPolicy {
    @xmlName("SSLPolicyId")
    @ec2QueryName("SSLPolicyId")
    SSLPolicyId: String,
    @xmlName("SSLPolicyName")
    @ec2QueryName("SSLPolicyName")
    SSLPolicyName: String,
}

structure Policies {
    @xmlName("AppCookieStickinessPolicies")
    @ec2QueryName("AppCookieStickinessPolicies")
    AppCookieStickinessPolicies: ListOfAppCookieStickinessPolicies,
    @xmlName("LBCookieStickinessPolicies")
    @ec2QueryName("LBCookieStickinessPolicies")
    LBCookieStickinessPolicies: ListOfLBCookieStickinessPolicies,
}

list ListOfAppCookieStickinessPolicies {
    @xmlName("member")
    member: AppCookieStickinessPolicies,
}

structure AppCookieStickinessPolicies {
    @xmlName("CookieName")
    @ec2QueryName("CookieName")
    CookieName: String,
    @xmlName("PolicyName")
    @ec2QueryName("PolicyName")
    PolicyName: String,
}

list ListOfLBCookieStickinessPolicies {
    @xmlName("member")
    member: LBCookieStickinessPolicies,
}

structure LBCookieStickinessPolicies {
    @xmlName("CookieExpirationPeriod")
    @ec2QueryName("CookieExpirationPeriod")
    CookieExpirationPeriod: String,
    @xmlName("PolicyName")
    @ec2QueryName("PolicyName")
    PolicyName: String,
}

list ListOfAvailabilityZones {
    @xmlName("member")
    member: String,
}

structure HealthCheckOfDescribeLoadBalancers {
    @xmlName("HealthyThreshold")
    @ec2QueryName("HealthyThreshold")
    HealthyThreshold: Integer,
    @xmlName("InstanceStates")
    @ec2QueryName("InstanceStates")
    InstanceStates: ListOfInstanceStates,
    @xmlName("Interval")
    @ec2QueryName("Interval")
    Interval: Integer,
    @xmlName("Target")
    @ec2QueryName("Target")
    Target: String,
    @xmlName("Timeout")
    @ec2QueryName("Timeout")
    Timeout: Integer,
    @xmlName("UnhealthyThreshold")
    @ec2QueryName("UnhealthyThreshold")
    UnhealthyThreshold: Integer,
}

structure Filter {
    @xmlName("FilterType")
    @ec2QueryName("FilterType")
    FilterType: String,
    @xmlName("IPAddresses")
    @ec2QueryName("IPAddresses")
    IPAddresses: ListOfIPAddresses,
}

list ListOfIPAddresses {
    @xmlName("member")
    member: IPAddresses,
}

structure IPAddresses {
    @xmlName("IPAddress")
    @ec2QueryName("IPAddress")
    IPAddress: String,
}

structure Option {
    @xmlName("SessionStickinessPolicy")
    @ec2QueryName("SessionStickinessPolicy")
    SessionStickinessPolicy: SessionStickinessPolicy,
    @xmlName("SorryPage")
    @ec2QueryName("SorryPage")
    SorryPage: SorryPage,
}

structure SessionStickinessPolicy {
    @xmlName("Enabled")
    @ec2QueryName("Enabled")
    Enabled: Boolean,
    @xmlName("ExpirationPeriod")
    @ec2QueryName("ExpirationPeriod")
    ExpirationPeriod: Integer,
}

structure SorryPage {
    @xmlName("Enabled")
    @ec2QueryName("Enabled")
    Enabled: Boolean,
    @xmlName("StatusCode")
    @ec2QueryName("StatusCode")
    StatusCode: Integer,
}

structure RegisterInstancesWithLoadBalancerRequest {
    @required
    @xmlName("InstancePort")
    @ec2QueryName("InstancePort")
    InstancePort: Integer,
    @required
    @xmlName("Instances")
    @ec2QueryName("Instances")
    Instances: ListOfRequestInstances,
    @required
    @xmlName("LoadBalancerName")
    @ec2QueryName("LoadBalancerName")
    LoadBalancerName: String,
    @required
    @xmlName("LoadBalancerPort")
    @ec2QueryName("LoadBalancerPort")
    LoadBalancerPort: Integer,
}

structure RegisterInstancesWithLoadBalancerResultWrapper {
    @xmlName("RegisterInstancesWithLoadBalancerResult")
    @ec2QueryName("RegisterInstancesWithLoadBalancerResult")
    RegisterInstancesWithLoadBalancerResult: RegisterInstancesWithLoadBalancerResult,
    @xmlName("ResponseMetadata")
    @ec2QueryName("ResponseMetadata")
    ResponseMetadata: ResponseMetadata,
}

structure RegisterInstancesWithLoadBalancerResult {
    @xmlName("Instances")
    @ec2QueryName("Instances")
    Instances: ListOfInstances,
}

@enum([
  {
      name: "HTTP",
      value: "HTTP",
  },
  {
      name: "HTTPS",
      value: "HTTPS",
  },
  {
      name: "FTP",
      value: "FTP",
  },
])
string ProtocolOfListenersForRegisterPortWithLoadBalancer

structure RequestListenersOfRegisterPortWithLoadBalancer {
    @xmlName("BalancingType")
    @ec2QueryName("BalancingType")
    BalancingType: Integer,
    @xmlName("InstancePort")
    @ec2QueryName("InstancePort")
    InstancePort: Integer,
    @xmlName("LoadBalancerPort")
    @ec2QueryName("LoadBalancerPort")
    LoadBalancerPort: Integer,
    @xmlName("Protocol")
    @ec2QueryName("Protocol")
    Protocol: ProtocolOfListenersForRegisterPortWithLoadBalancer,
}

structure ListOfRequestListenersOfRegisterPortWithLoadBalancer {
    @xmlName("member")
    @ec2QueryName("member")
    Member: ListOfRequestListenersOfRegisterPortWithLoadBalancerMember,
}

structure RegisterPortWithLoadBalancerRequest {
    @xmlName("Listeners")
    @ec2QueryName("Listeners")
    Listeners: ListOfRequestListenersOfRegisterPortWithLoadBalancer,
    @required
    @xmlName("LoadBalancerName")
    @ec2QueryName("LoadBalancerName")
    LoadBalancerName: String,
}

structure RegisterPortWithLoadBalancerResultWrapper {
    @xmlName("RegisterPortWithLoadBalancerResult")
    @ec2QueryName("RegisterPortWithLoadBalancerResult")
    RegisterPortWithLoadBalancerResult: RegisterPortWithLoadBalancerResult,
    @xmlName("ResponseMetadata")
    @ec2QueryName("ResponseMetadata")
    ResponseMetadata: ResponseMetadata,
}

structure RegisterPortWithLoadBalancerResult {
    @xmlName("Listeners")
    @ec2QueryName("Listeners")
    Listeners: ListOfListeners,
}

list ListOfListeners {
    @xmlName("member")
    member: Listeners,
}

structure Listeners {
    @xmlName("BalancingType")
    @ec2QueryName("BalancingType")
    BalancingType: Integer,
    @xmlName("InstancePort")
    @ec2QueryName("InstancePort")
    InstancePort: Integer,
    @xmlName("LoadBalancerPort")
    @ec2QueryName("LoadBalancerPort")
    LoadBalancerPort: Integer,
    @xmlName("Protocol")
    @ec2QueryName("Protocol")
    Protocol: String,
}

structure RequestIPAddresses {
    @xmlName("AddOnFilter")
    @ec2QueryName("AddOnFilter")
    AddOnFilter: Boolean,
    @xmlName("IPAddress")
    @ec2QueryName("IPAddress")
    IPAddress: String,
}

structure ListOfRequestIPAddresses {
    @xmlName("member")
    @ec2QueryName("member")
    Member: ListOfRequestIPAddressesMember,
}

@enum([
  {
      name: "ALLOW",
      value: "1",
  },
  {
      name: "DENY",
      value: "2",
  },
])
string FilterTypeOfSetFilterForLoadBalancerRequest

structure SetFilterForLoadBalancerRequest {
    @xmlName("FilterType")
    @ec2QueryName("FilterType")
    FilterType: FilterTypeOfSetFilterForLoadBalancerRequest,
    @required
    @xmlName("InstancePort")
    @ec2QueryName("InstancePort")
    InstancePort: Integer,
    @xmlName("IPAddresses")
    @ec2QueryName("IPAddresses")
    IPAddresses: ListOfRequestIPAddresses,
    @required
    @xmlName("LoadBalancerName")
    @ec2QueryName("LoadBalancerName")
    LoadBalancerName: String,
    @required
    @xmlName("LoadBalancerPort")
    @ec2QueryName("LoadBalancerPort")
    LoadBalancerPort: Integer,
}

structure SetFilterForLoadBalancerResultWrapper {
    @xmlName("ResponseMetadata")
    @ec2QueryName("ResponseMetadata")
    ResponseMetadata: ResponseMetadata,
    @xmlName("SetFilterForLoadBalancerResult")
    @ec2QueryName("SetFilterForLoadBalancerResult")
    SetFilterForLoadBalancerResult: SetFilterForLoadBalancerResult,
}

structure SetFilterForLoadBalancerResult {
    @xmlName("Filter")
    @ec2QueryName("Filter")
    Filter: Filter,
}

structure RequestListenerUpdate {
    @xmlName("InstancePort")
    @ec2QueryName("InstancePort")
    InstancePort: Integer,
    @xmlName("LoadBalancerPort")
    @ec2QueryName("LoadBalancerPort")
    LoadBalancerPort: Integer,
    @xmlName("Listener")
    @ec2QueryName("Listener")
    RequestListener: RequestListener,
}

@enum([
  {
      name: "HTTP",
      value: "HTTP",
  },
  {
      name: "HTTPS",
      value: "HTTPS",
  },
  {
      name: "FTP",
      value: "FTP",
  },
  {
      name: "CUSTOM",
      value: "custom",
  },
])
string ProtocolOfListenerUpdateForUpdateLoadBalancer

structure RequestListener {
    @xmlName("BalancingType")
    @ec2QueryName("BalancingType")
    BalancingType: Integer,
    @xmlName("InstancePort")
    @ec2QueryName("InstancePort")
    InstancePort: Integer,
    @xmlName("LoadBalancerPort")
    @ec2QueryName("LoadBalancerPort")
    LoadBalancerPort: Integer,
    @xmlName("Protocol")
    @ec2QueryName("Protocol")
    Protocol: ProtocolOfListenerUpdateForUpdateLoadBalancer,
}

structure UpdateLoadBalancerRequest {
    @xmlName("AccountingTypeUpdate")
    @ec2QueryName("AccountingTypeUpdate")
    AccountingTypeUpdate: Integer,
    @xmlName("ListenerUpdate")
    @ec2QueryName("ListenerUpdate")
    ListenerUpdate: RequestListenerUpdate,
    @required
    @xmlName("LoadBalancerName")
    @ec2QueryName("LoadBalancerName")
    LoadBalancerName: String,
    @xmlName("LoadBalancerNameUpdate")
    @ec2QueryName("LoadBalancerNameUpdate")
    LoadBalancerNameUpdate: String,
    @xmlName("NetworkVolumeUpdate")
    @ec2QueryName("NetworkVolumeUpdate")
    NetworkVolumeUpdate: Integer,
}

structure UpdateLoadBalancerResult {
    @xmlName("ResponseMetadata")
    @ec2QueryName("ResponseMetadata")
    ResponseMetadata: ResponseMetadata,
}

structure RequestSessionStickinessPolicyUpdate {
    @xmlName("Enable")
    @ec2QueryName("Enable")
    Enable: Boolean,
    @xmlName("ExpirationPeriod")
    @ec2QueryName("ExpirationPeriod")
    ExpirationPeriod: Integer,
}

structure RequestSorryPageUpdate {
    @xmlName("Enable")
    @ec2QueryName("Enable")
    Enable: Boolean,
    @xmlName("StatusCode")
    @ec2QueryName("StatusCode")
    StatusCode: Integer,
}

structure UpdateLoadBalancerOptionRequest {
    @required
    @xmlName("InstancePort")
    @ec2QueryName("InstancePort")
    InstancePort: Integer,
    @required
    @xmlName("LoadBalancerName")
    @ec2QueryName("LoadBalancerName")
    LoadBalancerName: String,
    @required
    @xmlName("LoadBalancerPort")
    @ec2QueryName("LoadBalancerPort")
    LoadBalancerPort: Integer,
    @xmlName("SessionStickinessPolicyUpdate")
    @ec2QueryName("SessionStickinessPolicyUpdate")
    SessionStickinessPolicyUpdate: RequestSessionStickinessPolicyUpdate,
    @xmlName("SorryPageUpdate")
    @ec2QueryName("SorryPageUpdate")
    SorryPageUpdate: RequestSorryPageUpdate,
}

structure UpdateLoadBalancerOptionResult {
    @xmlName("ResponseMetadata")
    @ec2QueryName("ResponseMetadata")
    ResponseMetadata: ResponseMetadata,
}

structure SetLoadBalancerListenerSSLCertificateRequest {
    @required
    @xmlName("InstancePort")
    @ec2QueryName("InstancePort")
    InstancePort: Integer,
    @required
    @xmlName("LoadBalancerName")
    @ec2QueryName("LoadBalancerName")
    LoadBalancerName: String,
    @required
    @xmlName("LoadBalancerPort")
    @ec2QueryName("LoadBalancerPort")
    LoadBalancerPort: Integer,
    @required
    @xmlName("SSLCertificateId")
    @ec2QueryName("SSLCertificateId")
    SSLCertificateId: String,
}

structure SetLoadBalancerListenerSSLCertificateResultWrapper {
    @xmlName("ResponseMetadata")
    @ec2QueryName("ResponseMetadata")
    ResponseMetadata: ResponseMetadata,
    @xmlName("SetLoadBalancerListenerSSLCertificateResult")
    @ec2QueryName("SetLoadBalancerListenerSSLCertificateResult")
    SetLoadBalancerListenerSSLCertificateResult: String,
}

structure UnsetLoadBalancerListenerSSLCertificateRequest {
    @required
    @xmlName("InstancePort")
    @ec2QueryName("InstancePort")
    InstancePort: Integer,
    @required
    @xmlName("LoadBalancerName")
    @ec2QueryName("LoadBalancerName")
    LoadBalancerName: String,
    @required
    @xmlName("LoadBalancerPort")
    @ec2QueryName("LoadBalancerPort")
    LoadBalancerPort: Integer,
}

structure UnsetLoadBalancerListenerSSLCertificateResultWrapper {
    @xmlName("ResponseMetadata")
    @ec2QueryName("ResponseMetadata")
    ResponseMetadata: ResponseMetadata,
    @xmlName("UnsetLoadBalancerListenerSSLCertificateResult")
    @ec2QueryName("UnsetLoadBalancerListenerSSLCertificateResult")
    UnsetLoadBalancerListenerSSLCertificateResult: String,
}

structure ClearLoadBalancerSessionRequest {
    @required
    @xmlName("InstancePort")
    @ec2QueryName("InstancePort")
    InstancePort: Integer,
    @required
    @xmlName("LoadBalancerName")
    @ec2QueryName("LoadBalancerName")
    LoadBalancerName: String,
    @required
    @xmlName("LoadBalancerPort")
    @ec2QueryName("LoadBalancerPort")
    LoadBalancerPort: Integer,
}

structure ClearLoadBalancerSessionResultWrapper {
    @xmlName("ClearLoadBalancerSessionResult")
    @ec2QueryName("ClearLoadBalancerSessionResult")
    ClearLoadBalancerSessionResult: String,
    @xmlName("ResponseMetadata")
    @ec2QueryName("ResponseMetadata")
    ResponseMetadata: ResponseMetadata,
}

structure NiftySetLoadBalancerSSLPoliciesOfListenerRequest {
    @required
    @xmlName("InstancePort")
    @ec2QueryName("InstancePort")
    InstancePort: Integer,
    @required
    @xmlName("LoadBalancerName")
    @ec2QueryName("LoadBalancerName")
    LoadBalancerName: String,
    @required
    @xmlName("LoadBalancerPort")
    @ec2QueryName("LoadBalancerPort")
    LoadBalancerPort: Integer,
    @xmlName("SSLPolicyId")
    @ec2QueryName("SSLPolicyId")
    SSLPolicyId: String,
    @xmlName("SSLPolicyName")
    @ec2QueryName("SSLPolicyName")
    SSLPolicyName: String,
}

structure NiftySetLoadBalancerSSLPoliciesOfListenerResult {
    @xmlName("ResponseMetadata")
    @ec2QueryName("ResponseMetadata")
    ResponseMetadata: ResponseMetadata,
}

structure NiftyUnsetLoadBalancerSSLPoliciesOfListenerRequest {
    @required
    @xmlName("InstancePort")
    @ec2QueryName("InstancePort")
    InstancePort: Integer,
    @required
    @xmlName("LoadBalancerName")
    @ec2QueryName("LoadBalancerName")
    LoadBalancerName: String,
    @required
    @xmlName("LoadBalancerPort")
    @ec2QueryName("LoadBalancerPort")
    LoadBalancerPort: Integer,
}

structure NiftyUnsetLoadBalancerSSLPoliciesOfListenerResult {
    @xmlName("ResponseMetadata")
    @ec2QueryName("ResponseMetadata")
    ResponseMetadata: ResponseMetadata,
}

structure NiftyDescribeLoadBalancerSSLPoliciesRequest {
    @required
    @xmlName("LoadBalancerName")
    @ec2QueryName("LoadBalancerName")
    LoadBalancerName: String,
}

structure NiftyDescribeLoadBalancerSSLPoliciesResultWrapper {
    @xmlName("NiftyDescribeLoadBalancerSSLPoliciesResult")
    @ec2QueryName("NiftyDescribeLoadBalancerSSLPoliciesResult")
    NiftyDescribeLoadBalancerSSLPoliciesResult: NiftyDescribeLoadBalancerSSLPoliciesResult,
    @xmlName("ResponseMetadata")
    @ec2QueryName("ResponseMetadata")
    ResponseMetadata: ResponseMetadata,
}

structure NiftyDescribeLoadBalancerSSLPoliciesResult {
    @xmlName("LoadBalancerName")
    @ec2QueryName("LoadBalancerName")
    LoadBalancerName: String,
    @xmlName("SSLPoliciesDescriptions")
    @ec2QueryName("SSLPoliciesDescriptions")
    SSLPoliciesDescriptions: ListOfSSLPoliciesDescriptions,
}

list ListOfSSLPoliciesDescriptions {
    @xmlName("member")
    member: SSLPoliciesDescriptions,
}

structure SSLPoliciesDescriptions {
    @xmlName("SSLPolicyId")
    @ec2QueryName("SSLPolicyId")
    SSLPolicyId: Integer,
    @xmlName("SSLPolicyName")
    @ec2QueryName("SSLPolicyName")
    SSLPolicyName: String,
    @xmlName("SSLPolicySet")
    @ec2QueryName("SSLPolicySet")
    SSLPolicySet: ListOfSSLPolicySet,
}

list ListOfSSLPolicySet {
    @xmlName("member")
    member: SSLPolicySet,
}

structure SSLPolicySet {
    @xmlName("Cipher")
    @ec2QueryName("Cipher")
    Cipher: String,
}

@enum([
  {
      name: "TCP",
      value: "TCP",
  },
  {
      name: "UDP",
      value: "UDP",
  },
  {
      name: "HTTP",
      value: "HTTP",
  },
  {
      name: "HTTPS",
      value: "HTTPS",
  },
])
string ProtocolOfNiftyConfigureElasticLoadBalancerHealthCheckRequest

structure RequestHealthCheckOfNiftyConfigureElasticLoadBalancerHealthCheck {
    @required
    @xmlName("Interval")
    @ec2QueryName("Interval")
    Interval: Integer,
    @xmlName("Expectation")
    @ec2QueryName("Expectation")
    ListOfRequestExpectation: ListOfRequestExpectation,
    @xmlName("Path")
    @ec2QueryName("Path")
    Path: String,
    @required
    @xmlName("Target")
    @ec2QueryName("Target")
    Target: String,
    @required
    @xmlName("UnhealthyThreshold")
    @ec2QueryName("UnhealthyThreshold")
    UnhealthyThreshold: Integer,
}

structure RequestExpectation {
    @xmlName("HttpCode")
    @ec2QueryName("HttpCode")
    HttpCode: Integer,
}

structure ListOfRequestExpectation {
    @xmlName("member")
    @ec2QueryName("member")
    Member: ListOfRequestExpectationMember,
}

structure NiftyConfigureElasticLoadBalancerHealthCheckRequest {
    @xmlName("ElasticLoadBalancerId")
    @ec2QueryName("ElasticLoadBalancerId")
    ElasticLoadBalancerId: String,
    @xmlName("ElasticLoadBalancerName")
    @ec2QueryName("ElasticLoadBalancerName")
    ElasticLoadBalancerName: String,
    @required
    @xmlName("ElasticLoadBalancerPort")
    @ec2QueryName("ElasticLoadBalancerPort")
    ElasticLoadBalancerPort: Integer,
    @required
    @xmlName("HealthCheck")
    @ec2QueryName("HealthCheck")
    HealthCheck: RequestHealthCheckOfNiftyConfigureElasticLoadBalancerHealthCheck,
    @required
    @xmlName("InstancePort")
    @ec2QueryName("InstancePort")
    InstancePort: Integer,
    @required
    @xmlName("Protocol")
    @ec2QueryName("Protocol")
    Protocol: ProtocolOfNiftyConfigureElasticLoadBalancerHealthCheckRequest,
}

structure NiftyConfigureElasticLoadBalancerHealthCheckResultWrapper {
    @xmlName("NiftyConfigureElasticLoadBalancerHealthCheckResult")
    @ec2QueryName("NiftyConfigureElasticLoadBalancerHealthCheckResult")
    NiftyConfigureElasticLoadBalancerHealthCheckResult: NiftyConfigureElasticLoadBalancerHealthCheckResult,
    @xmlName("ResponseMetadata")
    @ec2QueryName("ResponseMetadata")
    ResponseMetadata: ResponseMetadata,
}

structure NiftyConfigureElasticLoadBalancerHealthCheckResult {
    @xmlName("HealthCheck")
    @ec2QueryName("HealthCheck")
    HealthCheck: HealthCheckOfNiftyConfigureElasticLoadBalancerHealthCheck,
}

structure HealthCheckOfNiftyConfigureElasticLoadBalancerHealthCheck {
    @xmlName("Expectation")
    @ec2QueryName("Expectation")
    Expectation: ListOfExpectation,
    @xmlName("Interval")
    @ec2QueryName("Interval")
    Interval: Integer,
    @xmlName("Path")
    @ec2QueryName("Path")
    Path: String,
    @xmlName("Target")
    @ec2QueryName("Target")
    Target: String,
    @xmlName("UnhealthyThreshold")
    @ec2QueryName("UnhealthyThreshold")
    UnhealthyThreshold: Integer,
}

list ListOfExpectation {
    @xmlName("member")
    member: Expectation,
}

structure Expectation {
    @xmlName("HttpCode")
    @ec2QueryName("HttpCode")
    HttpCode: Integer,
}

@enum([
  {
      name: "TCP",
      value: "TCP",
  },
  {
      name: "UDP",
      value: "UDP",
  },
  {
      name: "HTTP",
      value: "HTTP",
  },
  {
      name: "HTTPS",
      value: "HTTPS",
  },
])
string ProtocolOfListenersForNiftyCreateElasticLoadBalancer

structure RequestListenersOfNiftyCreateElasticLoadBalancer {
    @xmlName("BalancingType")
    @ec2QueryName("BalancingType")
    BalancingType: Integer,
    @xmlName("Description")
    @ec2QueryName("Description")
    Description: String,
    @required
    @xmlName("ElasticLoadBalancerPort")
    @ec2QueryName("ElasticLoadBalancerPort")
    ElasticLoadBalancerPort: Integer,
    @xmlName("InstancePort")
    @ec2QueryName("InstancePort")
    InstancePort: Integer,
    @xmlName("Instances")
    @ec2QueryName("Instances")
    ListOfRequestInstances: ListOfRequestInstancesOfNiftyCreateElasticLoadBalancer,
    @required
    @xmlName("Protocol")
    @ec2QueryName("Protocol")
    Protocol: ProtocolOfListenersForNiftyCreateElasticLoadBalancer,
    @xmlName("HealthCheck")
    @ec2QueryName("HealthCheck")
    RequestHealthCheck: RequestHealthCheckOfNiftyCreateElasticLoadBalancer,
    @xmlName("Session")
    @ec2QueryName("Session")
    RequestSession: RequestSession,
    @xmlName("SorryPage")
    @ec2QueryName("SorryPage")
    RequestSorryPage: RequestSorryPage,
    @xmlName("SSLCertificateId")
    @ec2QueryName("SSLCertificateId")
    SSLCertificateId: String,
}

structure ListOfRequestListenersOfNiftyCreateElasticLoadBalancer {
    @xmlName("member")
    @ec2QueryName("member")
    Member: ListOfRequestListenersOfNiftyCreateElasticLoadBalancerMember,
}

structure RequestInstancesOfNiftyCreateElasticLoadBalancer {
    @xmlName("InstanceId")
    @ec2QueryName("InstanceId")
    InstanceId: String,
    @xmlName("InstanceUniqueId")
    @ec2QueryName("InstanceUniqueId")
    InstanceUniqueId: String,
}

structure ListOfRequestInstancesOfNiftyCreateElasticLoadBalancer {
    @xmlName("member")
    @ec2QueryName("member")
    Member: ListOfRequestInstancesOfNiftyCreateElasticLoadBalancerMember,
}

structure RequestHealthCheckOfNiftyCreateElasticLoadBalancer {
    @xmlName("Interval")
    @ec2QueryName("Interval")
    Interval: Integer,
    @xmlName("Expectation")
    @ec2QueryName("Expectation")
    ListOfRequestExpectation: ListOfRequestExpectation,
    @xmlName("Path")
    @ec2QueryName("Path")
    Path: String,
    @xmlName("Target")
    @ec2QueryName("Target")
    Target: String,
    @xmlName("UnhealthyThreshold")
    @ec2QueryName("UnhealthyThreshold")
    UnhealthyThreshold: Integer,
}

structure RequestStickinessPolicy {
    @xmlName("Enable")
    @ec2QueryName("Enable")
    Enable: Boolean,
    @xmlName("ExpirationPeriod")
    @ec2QueryName("ExpirationPeriod")
    ExpirationPeriod: Integer,
    @xmlName("Method")
    @ec2QueryName("Method")
    Method: MethodOfListenersForNiftyCreateElasticLoadBalancer,
}

structure RequestSession {
    @xmlName("StickinessPolicy")
    @ec2QueryName("StickinessPolicy")
    RequestStickinessPolicy: RequestStickinessPolicy,
}

@enum([
  {
      name: "IPADDRESS",
      value: "1",
  },
  {
      name: "COOKIE",
      value: "2",
  },
])
string MethodOfListenersForNiftyCreateElasticLoadBalancer

structure RequestSorryPage {
    @xmlName("Enable")
    @ec2QueryName("Enable")
    Enable: Boolean,
    @xmlName("RedirectUrl")
    @ec2QueryName("RedirectUrl")
    RedirectUrl: String,
}

@enum([
  {
      name: "MONTHLY",
      value: "1",
  },
  {
      name: "HOURLY",
      value: "2",
  },
])
string AccountingTypeOfNiftyCreateElasticLoadBalancerRequest

structure RequestNetworkInterfaceOfNiftyCreateElasticLoadBalancer {
    @xmlName("IpAddress")
    @ec2QueryName("IpAddress")
    IpAddress: String,
    @xmlName("IsVipNetwork")
    @ec2QueryName("IsVipNetwork")
    IsVipNetwork: Boolean,
    @xmlName("NetworkId")
    @ec2QueryName("NetworkId")
    NetworkId: String,
    @xmlName("NetworkName")
    @ec2QueryName("NetworkName")
    NetworkName: String,
}

list ListOfRequestNetworkInterfaceOfNiftyCreateElasticLoadBalancer {
    member: RequestNetworkInterfaceOfNiftyCreateElasticLoadBalancer,
}

structure NiftyCreateElasticLoadBalancerRequest {
    @xmlName("AccountingType")
    @ec2QueryName("AccountingType")
    AccountingType: AccountingTypeOfNiftyCreateElasticLoadBalancerRequest,
    @required
    @xmlName("AvailabilityZones")
    @ec2QueryName("AvailabilityZones")
    AvailabilityZones: ListOfRequestAvailabilityZones,
    @xmlName("ElasticLoadBalancerName")
    @ec2QueryName("ElasticLoadBalancerName")
    ElasticLoadBalancerName: String,
    @required
    @xmlName("Listeners")
    @ec2QueryName("Listeners")
    Listeners: ListOfRequestListenersOfNiftyCreateElasticLoadBalancer,
    @xmlName("NetworkInterface")
    @ec2QueryName("NetworkInterface")
    NetworkInterface: ListOfRequestNetworkInterfaceOfNiftyCreateElasticLoadBalancer,
    @xmlName("NetworkVolume")
    @ec2QueryName("NetworkVolume")
    NetworkVolume: Integer,
}

structure NiftyCreateElasticLoadBalancerResultWrapper {
    @xmlName("NiftyCreateElasticLoadBalancerResult")
    @ec2QueryName("NiftyCreateElasticLoadBalancerResult")
    NiftyCreateElasticLoadBalancerResult: NiftyCreateElasticLoadBalancerResult,
    @xmlName("ResponseMetadata")
    @ec2QueryName("ResponseMetadata")
    ResponseMetadata: ResponseMetadata,
}

structure NiftyCreateElasticLoadBalancerResult {
    @xmlName("DNSName")
    @ec2QueryName("DNSName")
    DNSName: String,
}

@enum([
  {
      name: "TCP",
      value: "TCP",
  },
  {
      name: "UDP",
      value: "UDP",
  },
  {
      name: "HTTP",
      value: "HTTP",
  },
  {
      name: "HTTPS",
      value: "HTTPS",
  },
])
string ProtocolOfNiftyDeleteElasticLoadBalancerRequest

structure NiftyDeleteElasticLoadBalancerRequest {
    @xmlName("ElasticLoadBalancerId")
    @ec2QueryName("ElasticLoadBalancerId")
    ElasticLoadBalancerId: String,
    @xmlName("ElasticLoadBalancerName")
    @ec2QueryName("ElasticLoadBalancerName")
    ElasticLoadBalancerName: String,
    @required
    @xmlName("ElasticLoadBalancerPort")
    @ec2QueryName("ElasticLoadBalancerPort")
    ElasticLoadBalancerPort: Integer,
    @required
    @xmlName("InstancePort")
    @ec2QueryName("InstancePort")
    InstancePort: Integer,
    @required
    @xmlName("Protocol")
    @ec2QueryName("Protocol")
    Protocol: ProtocolOfNiftyDeleteElasticLoadBalancerRequest,
}

structure NiftyDeleteElasticLoadBalancerResultWrapper {
    @xmlName("NiftyDeleteElasticLoadBalancerResult")
    @ec2QueryName("NiftyDeleteElasticLoadBalancerResult")
    NiftyDeleteElasticLoadBalancerResult: String,
    @xmlName("ResponseMetadata")
    @ec2QueryName("ResponseMetadata")
    ResponseMetadata: ResponseMetadata,
}

@enum([
  {
      name: "TCP",
      value: "TCP",
  },
  {
      name: "UDP",
      value: "UDP",
  },
  {
      name: "HTTP",
      value: "HTTP",
  },
  {
      name: "HTTPS",
      value: "HTTPS",
  },
])
string ProtocolOfNiftyDeregisterInstancesFromElasticLoadBalancerRequest

structure RequestInstancesOfNiftyDeregisterInstancesFromElasticLoadBalancer {
    @xmlName("InstanceId")
    @ec2QueryName("InstanceId")
    InstanceId: String,
    @xmlName("InstanceUniqueId")
    @ec2QueryName("InstanceUniqueId")
    InstanceUniqueId: String,
}

structure ListOfRequestInstancesOfNiftyDeregisterInstancesFromElasticLoadBalancer {
    @xmlName("member")
    @ec2QueryName("member")
    Member: ListOfRequestInstancesOfNiftyDeregisterInstancesFromElasticLoadBalancerMember,
}

structure NiftyDeregisterInstancesFromElasticLoadBalancerRequest {
    @xmlName("ElasticLoadBalancerId")
    @ec2QueryName("ElasticLoadBalancerId")
    ElasticLoadBalancerId: String,
    @xmlName("ElasticLoadBalancerName")
    @ec2QueryName("ElasticLoadBalancerName")
    ElasticLoadBalancerName: String,
    @required
    @xmlName("ElasticLoadBalancerPort")
    @ec2QueryName("ElasticLoadBalancerPort")
    ElasticLoadBalancerPort: Integer,
    @required
    @xmlName("InstancePort")
    @ec2QueryName("InstancePort")
    InstancePort: Integer,
    @xmlName("Instances")
    @ec2QueryName("Instances")
    Instances: ListOfRequestInstancesOfNiftyDeregisterInstancesFromElasticLoadBalancer,
    @required
    @xmlName("Protocol")
    @ec2QueryName("Protocol")
    Protocol: ProtocolOfNiftyDeregisterInstancesFromElasticLoadBalancerRequest,
}

structure NiftyDeregisterInstancesFromElasticLoadBalancerResultWrapper {
    @xmlName("NiftyDeregisterInstancesFromElasticLoadBalancerResult")
    @ec2QueryName("NiftyDeregisterInstancesFromElasticLoadBalancerResult")
    NiftyDeregisterInstancesFromElasticLoadBalancerResult: String,
    @xmlName("ResponseMetadata")
    @ec2QueryName("ResponseMetadata")
    ResponseMetadata: ResponseMetadata,
}

@enum([
  {
      name: "TCP",
      value: "TCP",
  },
  {
      name: "UDP",
      value: "UDP",
  },
  {
      name: "HTTP",
      value: "HTTP",
  },
  {
      name: "HTTPS",
      value: "HTTPS",
  },
])
string ProtocolOfNiftyDescribeInstanceElasticLoadBalancerHealthRequest

structure RequestInstancesOfNiftyDescribeInstanceElasticLoadBalancerHealth {
    @xmlName("InstanceId")
    @ec2QueryName("InstanceId")
    InstanceId: String,
    @xmlName("InstanceUniqueId")
    @ec2QueryName("InstanceUniqueId")
    InstanceUniqueId: String,
}

structure ListOfRequestInstancesOfNiftyDescribeInstanceElasticLoadBalancerHealth {
    @xmlName("member")
    @ec2QueryName("member")
    Member: ListOfRequestInstancesOfNiftyDescribeInstanceElasticLoadBalancerHealthMember,
}

structure NiftyDescribeInstanceElasticLoadBalancerHealthRequest {
    @xmlName("ElasticLoadBalancerId")
    @ec2QueryName("ElasticLoadBalancerId")
    ElasticLoadBalancerId: String,
    @xmlName("ElasticLoadBalancerName")
    @ec2QueryName("ElasticLoadBalancerName")
    ElasticLoadBalancerName: String,
    @required
    @xmlName("ElasticLoadBalancerPort")
    @ec2QueryName("ElasticLoadBalancerPort")
    ElasticLoadBalancerPort: Integer,
    @required
    @xmlName("InstancePort")
    @ec2QueryName("InstancePort")
    InstancePort: Integer,
    @xmlName("Instances")
    @ec2QueryName("Instances")
    Instances: ListOfRequestInstancesOfNiftyDescribeInstanceElasticLoadBalancerHealth,
    @required
    @xmlName("Protocol")
    @ec2QueryName("Protocol")
    Protocol: ProtocolOfNiftyDescribeInstanceElasticLoadBalancerHealthRequest,
}

structure NiftyDescribeInstanceElasticLoadBalancerHealthResultWrapper {
    @xmlName("NiftyDescribeInstanceElasticLoadBalancerHealthResult")
    @ec2QueryName("NiftyDescribeInstanceElasticLoadBalancerHealthResult")
    NiftyDescribeInstanceElasticLoadBalancerHealthResult: NiftyDescribeInstanceElasticLoadBalancerHealthResult,
    @xmlName("ResponseMetadata")
    @ec2QueryName("ResponseMetadata")
    ResponseMetadata: ResponseMetadata,
}

structure NiftyDescribeInstanceElasticLoadBalancerHealthResult {
    @xmlName("InstanceStates")
    @ec2QueryName("InstanceStates")
    InstanceStates: ListOfInstanceStates,
}

list ListOfRequestElasticLoadBalancerId {
    member: String,
}

structure RequestElasticLoadBalancers {
    @xmlName("ElasticLoadBalancerId")
    @ec2QueryName("ElasticLoadBalancerId")
    ListOfRequestElasticLoadBalancerId: ListOfRequestElasticLoadBalancerId,
    @xmlName("ElasticLoadBalancerName")
    @ec2QueryName("ElasticLoadBalancerName")
    ListOfRequestElasticLoadBalancerName: ListOfRequestElasticLoadBalancerName,
    @xmlName("ElasticLoadBalancerPort")
    @ec2QueryName("ElasticLoadBalancerPort")
    ListOfRequestElasticLoadBalancerPort: ListOfRequestElasticLoadBalancerPort,
    @xmlName("InstancePort")
    @ec2QueryName("InstancePort")
    ListOfRequestInstancePort: ListOfRequestInstancePort,
    @xmlName("Protocol")
    @ec2QueryName("Protocol")
    ListOfRequestProtocol: ListOfRequestProtocol,
}

list ListOfRequestElasticLoadBalancerName {
    member: String,
}

list ListOfRequestProtocol {
    member: String,
}

list ListOfRequestElasticLoadBalancerPort {
    member: Integer,
}

list ListOfRequestInstancePort {
    member: Integer,
}

@enum([
  {
      name: "AVAILABILITY_ZONE",
      value: "availability-zone",
  },
  {
      name: "STATE",
      value: "state",
  },
  {
      name: "ELASTIC_LOADBALANCER_ID",
      value: "elastic-loadbalancer-id",
  },
  {
      name: "ELASTIC_LOADBALANCER_NAME",
      value: "elastic-loadbalancer-name",
  },
  {
      name: "DESCRIPTION",
      value: "description",
  },
  {
      name: "ACCOUNTING_TYPE",
      value: "accounting-type",
  },
  {
      name: "IP_ADDRESS",
      value: "ip-address",
  },
  {
      name: "VERSION",
      value: "version",
  },
])
string NameOfFilterForNiftyDescribeElasticLoadBalancers

structure RequestFilterOfNiftyDescribeElasticLoadBalancers {
    @xmlName("Value")
    @ec2QueryName("Value")
    ListOfRequestValue: ListOfRequestValue,
    @xmlName("Name")
    @ec2QueryName("Name")
    Name: NameOfFilterForNiftyDescribeElasticLoadBalancers,
}

list ListOfRequestFilterOfNiftyDescribeElasticLoadBalancers {
    member: RequestFilterOfNiftyDescribeElasticLoadBalancers,
}

structure NiftyDescribeElasticLoadBalancersRequest {
    @xmlName("ElasticLoadBalancers")
    @ec2QueryName("ElasticLoadBalancers")
    ElasticLoadBalancers: RequestElasticLoadBalancers,
    @xmlName("Filter")
    @ec2QueryName("Filter")
    Filter: ListOfRequestFilterOfNiftyDescribeElasticLoadBalancers,
}

structure NiftyDescribeElasticLoadBalancersResultWrapper {
    @xmlName("NiftyDescribeElasticLoadBalancersResult")
    @ec2QueryName("NiftyDescribeElasticLoadBalancersResult")
    NiftyDescribeElasticLoadBalancersResult: NiftyDescribeElasticLoadBalancersResult,
    @xmlName("ResponseMetadata")
    @ec2QueryName("ResponseMetadata")
    ResponseMetadata: ResponseMetadata,
}

structure NiftyDescribeElasticLoadBalancersResult {
    @xmlName("ElasticLoadBalancerDescriptions")
    @ec2QueryName("ElasticLoadBalancerDescriptions")
    ElasticLoadBalancerDescriptions: ListOfElasticLoadBalancerDescriptions,
}

list ListOfElasticLoadBalancerDescriptions {
    @xmlName("member")
    member: ElasticLoadBalancerDescriptions,
}

structure ElasticLoadBalancerDescriptions {
    @xmlName("AccountingType")
    @ec2QueryName("AccountingType")
    AccountingType: String,
    @xmlName("AvailabilityZones")
    @ec2QueryName("AvailabilityZones")
    AvailabilityZones: ListOfAvailabilityZones,
    @xmlName("CreatedTime")
    @ec2QueryName("CreatedTime")
    CreatedTime: Timestamp,
    @xmlName("DNSName")
    @ec2QueryName("DNSName")
    DNSName: String,
    @xmlName("ElasticLoadBalancerId")
    @ec2QueryName("ElasticLoadBalancerId")
    ElasticLoadBalancerId: String,
    @xmlName("ElasticLoadBalancerListenerDescriptions")
    @ec2QueryName("ElasticLoadBalancerListenerDescriptions")
    ElasticLoadBalancerListenerDescriptions: ListOfElasticLoadBalancerListenerDescriptions,
    @xmlName("ElasticLoadBalancerName")
    @ec2QueryName("ElasticLoadBalancerName")
    ElasticLoadBalancerName: String,
    @xmlName("NetworkInterfaces")
    @ec2QueryName("NetworkInterfaces")
    NetworkInterfaces: ListOfNetworkInterfaces,
    @xmlName("NetworkVolume")
    @ec2QueryName("NetworkVolume")
    NetworkVolume: String,
    @xmlName("NextMonthAccountingType")
    @ec2QueryName("NextMonthAccountingType")
    NextMonthAccountingType: String,
    @xmlName("RouteTableAssociationId")
    @ec2QueryName("RouteTableAssociationId")
    RouteTableAssociationId: String,
    @xmlName("RouteTableId")
    @ec2QueryName("RouteTableId")
    RouteTableId: String,
    @xmlName("State")
    @ec2QueryName("State")
    State: String,
    @xmlName("VersionInformation")
    @ec2QueryName("VersionInformation")
    VersionInformation: VersionInformation,
}

list ListOfElasticLoadBalancerListenerDescriptions {
    @xmlName("member")
    member: ElasticLoadBalancerListenerDescriptions,
}

structure ElasticLoadBalancerListenerDescriptions {
    @xmlName("Listener")
    @ec2QueryName("Listener")
    Listener: ListenerOfNiftyDescribeElasticLoadBalancers,
}

structure ListenerOfNiftyDescribeElasticLoadBalancers {
    @xmlName("BalancingType")
    @ec2QueryName("BalancingType")
    BalancingType: Integer,
    @xmlName("Description")
    @ec2QueryName("Description")
    Description: String,
    @xmlName("ElasticLoadBalancerPort")
    @ec2QueryName("ElasticLoadBalancerPort")
    ElasticLoadBalancerPort: Integer,
    @xmlName("HealthCheck")
    @ec2QueryName("HealthCheck")
    HealthCheck: HealthCheckOfNiftyDescribeElasticLoadBalancers,
    @xmlName("InstancePort")
    @ec2QueryName("InstancePort")
    InstancePort: Integer,
    @xmlName("Instances")
    @ec2QueryName("Instances")
    Instances: ListOfInstances,
    @xmlName("Protocol")
    @ec2QueryName("Protocol")
    Protocol: String,
    @xmlName("SessionStickinessPolicy")
    @ec2QueryName("SessionStickinessPolicy")
    SessionStickinessPolicy: SessionStickinessPolicyOfNiftyDescribeElasticLoadBalancers,
    @xmlName("SorryPage")
    @ec2QueryName("SorryPage")
    SorryPage: SorryPageOfNiftyDescribeElasticLoadBalancers,
    @xmlName("SSLCertificateId")
    @ec2QueryName("SSLCertificateId")
    SSLCertificateId: String,
}

structure SessionStickinessPolicyOfNiftyDescribeElasticLoadBalancers {
    @xmlName("Enabled")
    @ec2QueryName("Enabled")
    Enabled: Boolean,
    @xmlName("ExpirationPeriod")
    @ec2QueryName("ExpirationPeriod")
    ExpirationPeriod: Integer,
    @xmlName("Method")
    @ec2QueryName("Method")
    Method: Integer,
}

structure SorryPageOfNiftyDescribeElasticLoadBalancers {
    @xmlName("Enabled")
    @ec2QueryName("Enabled")
    Enabled: Boolean,
    @xmlName("RedirectUrl")
    @ec2QueryName("RedirectUrl")
    RedirectUrl: String,
}

structure HealthCheckOfNiftyDescribeElasticLoadBalancers {
    @xmlName("Expectation")
    @ec2QueryName("Expectation")
    Expectation: ListOfExpectation,
    @xmlName("InstanceStates")
    @ec2QueryName("InstanceStates")
    InstanceStates: ListOfInstanceStates,
    @xmlName("Interval")
    @ec2QueryName("Interval")
    Interval: Integer,
    @xmlName("Path")
    @ec2QueryName("Path")
    Path: String,
    @xmlName("Target")
    @ec2QueryName("Target")
    Target: String,
    @xmlName("UnhealthyThreshold")
    @ec2QueryName("UnhealthyThreshold")
    UnhealthyThreshold: Integer,
}

list ListOfNetworkInterfaces {
    @xmlName("member")
    member: NetworkInterfaces,
}

structure NetworkInterfaces {
    @xmlName("Description")
    @ec2QueryName("Description")
    Description: String,
    @xmlName("DeviceIndex")
    @ec2QueryName("DeviceIndex")
    DeviceIndex: Integer,
    @xmlName("IpAddress")
    @ec2QueryName("IpAddress")
    IpAddress: String,
    @xmlName("IsVipNetwork")
    @ec2QueryName("IsVipNetwork")
    IsVipNetwork: Boolean,
    @xmlName("NetworkId")
    @ec2QueryName("NetworkId")
    NetworkId: String,
    @xmlName("NetworkName")
    @ec2QueryName("NetworkName")
    NetworkName: String,
}

structure VersionInformation {
    @xmlName("IsLatest")
    @ec2QueryName("IsLatest")
    IsLatest: Boolean,
    @xmlName("Version")
    @ec2QueryName("Version")
    Version: String,
}

@enum([
  {
      name: "TCP",
      value: "TCP",
  },
  {
      name: "UDP",
      value: "UDP",
  },
  {
      name: "HTTP",
      value: "HTTP",
  },
  {
      name: "HTTPS",
      value: "HTTPS",
  },
])
string ProtocolOfNiftyModifyElasticLoadBalancerAttributesRequest

structure RequestStickinessPolicyOfNiftyModifyElasticLoadBalancerAttributes {
    @xmlName("Enable")
    @ec2QueryName("Enable")
    Enable: Boolean,
    @xmlName("ExpirationPeriod")
    @ec2QueryName("ExpirationPeriod")
    ExpirationPeriod: Integer,
    @xmlName("Method")
    @ec2QueryName("Method")
    Method: MethodOfLoadBalancerAttributesForNiftyModifyElasticLoadBalancerAttributes,
}

structure RequestSessionOfNiftyModifyElasticLoadBalancerAttributes {
    @xmlName("StickinessPolicy")
    @ec2QueryName("StickinessPolicy")
    RequestStickinessPolicy: RequestStickinessPolicyOfNiftyModifyElasticLoadBalancerAttributes,
}

structure RequestLoadBalancerAttributes {
    @xmlName("AdditionalAttributes")
    @ec2QueryName("AdditionalAttributes")
    ListOfRequestAdditionalAttributes: ListOfRequestAdditionalAttributes,
    @xmlName("Session")
    @ec2QueryName("Session")
    RequestSession: RequestSessionOfNiftyModifyElasticLoadBalancerAttributes,
    @xmlName("SorryPage")
    @ec2QueryName("SorryPage")
    RequestSorryPage: RequestSorryPage,
}

@enum([
  {
      name: "IPADDRESS",
      value: "1",
  },
  {
      name: "COOKIE",
      value: "2",
  },
])
string MethodOfLoadBalancerAttributesForNiftyModifyElasticLoadBalancerAttributes

@enum([
  {
      name: "PROTOCOL",
      value: "protocol",
  },
  {
      name: "ELASTIC_LOAD_BALANCER_PORT",
      value: "elasticLoadBalancerPort",
  },
  {
      name: "INSTANCE_PORT",
      value: "instancePort",
  },
  {
      name: "DESCRIPTION",
      value: "description",
  },
  {
      name: "BALANCING_TYPE",
      value: "balancingType",
  },
  {
      name: "SSL_CERTIFICATE_ID",
      value: "sslCertificateId",
  },
])
string KeyOfLoadBalancerAttributesForNiftyModifyElasticLoadBalancerAttributes

structure RequestAdditionalAttributes {
    @xmlName("Key")
    @ec2QueryName("Key")
    Key: KeyOfLoadBalancerAttributesForNiftyModifyElasticLoadBalancerAttributes,
    @xmlName("Value")
    @ec2QueryName("Value")
    Value: String,
}

structure ListOfRequestAdditionalAttributes {
    @xmlName("member")
    @ec2QueryName("member")
    Member: ListOfRequestAdditionalAttributesMember,
}

structure NiftyModifyElasticLoadBalancerAttributesRequest {
    @xmlName("ElasticLoadBalancerId")
    @ec2QueryName("ElasticLoadBalancerId")
    ElasticLoadBalancerId: String,
    @xmlName("ElasticLoadBalancerName")
    @ec2QueryName("ElasticLoadBalancerName")
    ElasticLoadBalancerName: String,
    @required
    @xmlName("ElasticLoadBalancerPort")
    @ec2QueryName("ElasticLoadBalancerPort")
    ElasticLoadBalancerPort: Integer,
    @required
    @xmlName("InstancePort")
    @ec2QueryName("InstancePort")
    InstancePort: Integer,
    @xmlName("LoadBalancerAttributes")
    @ec2QueryName("LoadBalancerAttributes")
    LoadBalancerAttributes: RequestLoadBalancerAttributes,
    @required
    @xmlName("Protocol")
    @ec2QueryName("Protocol")
    Protocol: ProtocolOfNiftyModifyElasticLoadBalancerAttributesRequest,
}

structure NiftyModifyElasticLoadBalancerAttributesResult {
    @xmlName("ResponseMetadata")
    @ec2QueryName("ResponseMetadata")
    ResponseMetadata: ResponseMetadata,
}

@enum([
  {
      name: "TCP",
      value: "TCP",
  },
  {
      name: "UDP",
      value: "UDP",
  },
  {
      name: "HTTP",
      value: "HTTP",
  },
  {
      name: "HTTPS",
      value: "HTTPS",
  },
])
string ProtocolOfNiftyRegisterInstancesWithElasticLoadBalancerRequest

structure RequestInstancesOfNiftyRegisterInstancesWithElasticLoadBalancer {
    @xmlName("InstanceId")
    @ec2QueryName("InstanceId")
    InstanceId: String,
    @xmlName("InstanceUniqueId")
    @ec2QueryName("InstanceUniqueId")
    InstanceUniqueId: String,
}

structure ListOfRequestInstancesOfNiftyRegisterInstancesWithElasticLoadBalancer {
    @xmlName("member")
    @ec2QueryName("member")
    Member: ListOfRequestInstancesOfNiftyRegisterInstancesWithElasticLoadBalancerMember,
}

structure NiftyRegisterInstancesWithElasticLoadBalancerRequest {
    @xmlName("ElasticLoadBalancerId")
    @ec2QueryName("ElasticLoadBalancerId")
    ElasticLoadBalancerId: String,
    @xmlName("ElasticLoadBalancerName")
    @ec2QueryName("ElasticLoadBalancerName")
    ElasticLoadBalancerName: String,
    @required
    @xmlName("ElasticLoadBalancerPort")
    @ec2QueryName("ElasticLoadBalancerPort")
    ElasticLoadBalancerPort: Integer,
    @required
    @xmlName("InstancePort")
    @ec2QueryName("InstancePort")
    InstancePort: Integer,
    @xmlName("Instances")
    @ec2QueryName("Instances")
    Instances: ListOfRequestInstancesOfNiftyRegisterInstancesWithElasticLoadBalancer,
    @required
    @xmlName("Protocol")
    @ec2QueryName("Protocol")
    Protocol: ProtocolOfNiftyRegisterInstancesWithElasticLoadBalancerRequest,
}

structure NiftyRegisterInstancesWithElasticLoadBalancerResultWrapper {
    @xmlName("NiftyRegisterInstancesWithElasticLoadBalancerResult")
    @ec2QueryName("NiftyRegisterInstancesWithElasticLoadBalancerResult")
    NiftyRegisterInstancesWithElasticLoadBalancerResult: String,
    @xmlName("ResponseMetadata")
    @ec2QueryName("ResponseMetadata")
    ResponseMetadata: ResponseMetadata,
}

@enum([
  {
      name: "TCP",
      value: "TCP",
  },
  {
      name: "UDP",
      value: "UDP",
  },
  {
      name: "HTTP",
      value: "HTTP",
  },
  {
      name: "HTTPS",
      value: "HTTPS",
  },
])
string ProtocolOfListenersForNiftyRegisterPortWithElasticLoadBalancer

structure RequestListenersOfNiftyRegisterPortWithElasticLoadBalancer {
    @xmlName("BalancingType")
    @ec2QueryName("BalancingType")
    BalancingType: Integer,
    @xmlName("Description")
    @ec2QueryName("Description")
    Description: String,
    @required
    @xmlName("ElasticLoadBalancerPort")
    @ec2QueryName("ElasticLoadBalancerPort")
    ElasticLoadBalancerPort: Integer,
    @required
    @xmlName("InstancePort")
    @ec2QueryName("InstancePort")
    InstancePort: Integer,
    @required
    @xmlName("Protocol")
    @ec2QueryName("Protocol")
    Protocol: ProtocolOfListenersForNiftyRegisterPortWithElasticLoadBalancer,
    @xmlName("SSLCertificateId")
    @ec2QueryName("SSLCertificateId")
    SSLCertificateId: String,
}

structure ListOfRequestListenersOfNiftyRegisterPortWithElasticLoadBalancer {
    @xmlName("member")
    @ec2QueryName("member")
    Member: ListOfRequestListenersOfNiftyRegisterPortWithElasticLoadBalancerMember,
}

structure NiftyRegisterPortWithElasticLoadBalancerRequest {
    @xmlName("ElasticLoadBalancerId")
    @ec2QueryName("ElasticLoadBalancerId")
    ElasticLoadBalancerId: String,
    @xmlName("ElasticLoadBalancerName")
    @ec2QueryName("ElasticLoadBalancerName")
    ElasticLoadBalancerName: String,
    @required
    @xmlName("Listeners")
    @ec2QueryName("Listeners")
    Listeners: ListOfRequestListenersOfNiftyRegisterPortWithElasticLoadBalancer,
}

structure NiftyRegisterPortWithElasticLoadBalancerResultWrapper {
    @xmlName("NiftyRegisterPortWithElasticLoadBalancerResult")
    @ec2QueryName("NiftyRegisterPortWithElasticLoadBalancerResult")
    NiftyRegisterPortWithElasticLoadBalancerResult: NiftyRegisterPortWithElasticLoadBalancerResult,
    @xmlName("ResponseMetadata")
    @ec2QueryName("ResponseMetadata")
    ResponseMetadata: ResponseMetadata,
}

structure NiftyRegisterPortWithElasticLoadBalancerResult {
    @xmlName("Listeners")
    @ec2QueryName("Listeners")
    Listeners: ListOfListenersOfNiftyRegisterPortWithElasticLoadBalancer,
}

list ListOfListenersOfNiftyRegisterPortWithElasticLoadBalancer {
    @xmlName("member")
    member: ListenersOfNiftyRegisterPortWithElasticLoadBalancer,
}

structure ListenersOfNiftyRegisterPortWithElasticLoadBalancer {
    @xmlName("BalancingType")
    @ec2QueryName("BalancingType")
    BalancingType: Integer,
    @xmlName("Description")
    @ec2QueryName("Description")
    Description: String,
    @xmlName("ElasticLoadBalancerPort")
    @ec2QueryName("ElasticLoadBalancerPort")
    ElasticLoadBalancerPort: Integer,
    @xmlName("InstancePort")
    @ec2QueryName("InstancePort")
    InstancePort: Integer,
    @xmlName("Protocol")
    @ec2QueryName("Protocol")
    Protocol: String,
    @xmlName("SSLCertificateId")
    @ec2QueryName("SSLCertificateId")
    SSLCertificateId: String,
}

structure NiftyUpdateElasticLoadBalancerRequest {
    @xmlName("AccountingTypeUpdate")
    @ec2QueryName("AccountingTypeUpdate")
    AccountingTypeUpdate: Integer,
    @xmlName("ElasticLoadBalancerId")
    @ec2QueryName("ElasticLoadBalancerId")
    ElasticLoadBalancerId: String,
    @xmlName("ElasticLoadBalancerName")
    @ec2QueryName("ElasticLoadBalancerName")
    ElasticLoadBalancerName: String,
    @xmlName("ElasticLoadBalancerNameUpdate")
    @ec2QueryName("ElasticLoadBalancerNameUpdate")
    ElasticLoadBalancerNameUpdate: String,
    @xmlName("NetworkVolumeUpdate")
    @ec2QueryName("NetworkVolumeUpdate")
    NetworkVolumeUpdate: Integer,
}

structure NiftyUpdateElasticLoadBalancerResult {
    @xmlName("ResponseMetadata")
    @ec2QueryName("ResponseMetadata")
    ResponseMetadata: ResponseMetadata,
}

structure NiftyReplaceElasticLoadBalancerLatestVersionRequest {
    @xmlName("ElasticLoadBalancerId")
    @ec2QueryName("ElasticLoadBalancerId")
    ElasticLoadBalancerId: String,
    @xmlName("ElasticLoadBalancerName")
    @ec2QueryName("ElasticLoadBalancerName")
    ElasticLoadBalancerName: String,
}

structure NiftyReplaceElasticLoadBalancerLatestVersionResultWrapper {
    @xmlName("NiftyReplaceElasticLoadBalancerLatestVersionResult")
    @ec2QueryName("NiftyReplaceElasticLoadBalancerLatestVersionResult")
    NiftyReplaceElasticLoadBalancerLatestVersionResult: String,
    @xmlName("ResponseMetadata")
    @ec2QueryName("ResponseMetadata")
    ResponseMetadata: ResponseMetadata,
}

@enum([
  {
      name: "HTTPS",
      value: "HTTPS",
  },
])
string ProtocolOfNiftyReplaceElasticLoadBalancerListenerSSLCertificateRequest

structure NiftyReplaceElasticLoadBalancerListenerSSLCertificateRequest {
    @xmlName("ElasticLoadBalancerId")
    @ec2QueryName("ElasticLoadBalancerId")
    ElasticLoadBalancerId: String,
    @xmlName("ElasticLoadBalancerName")
    @ec2QueryName("ElasticLoadBalancerName")
    ElasticLoadBalancerName: String,
    @required
    @xmlName("ElasticLoadBalancerPort")
    @ec2QueryName("ElasticLoadBalancerPort")
    ElasticLoadBalancerPort: Integer,
    @required
    @xmlName("InstancePort")
    @ec2QueryName("InstancePort")
    InstancePort: Integer,
    @required
    @xmlName("Protocol")
    @ec2QueryName("Protocol")
    Protocol: ProtocolOfNiftyReplaceElasticLoadBalancerListenerSSLCertificateRequest,
    @required
    @xmlName("SSLCertificateId")
    @ec2QueryName("SSLCertificateId")
    SSLCertificateId: String,
}

structure NiftyReplaceElasticLoadBalancerListenerSSLCertificateResultWrapper {
    @xmlName("NiftyReplaceElasticLoadBalancerListenerSSLCertificateResult")
    @ec2QueryName("NiftyReplaceElasticLoadBalancerListenerSSLCertificateResult")
    NiftyReplaceElasticLoadBalancerListenerSSLCertificateResult: String,
    @xmlName("ResponseMetadata")
    @ec2QueryName("ResponseMetadata")
    ResponseMetadata: ResponseMetadata,
}

structure NiftyAssociateRouteTableWithElasticLoadBalancerRequest {
    @required
    @xmlName("ElasticLoadBalancerId")
    @ec2QueryName("ElasticLoadBalancerId")
    ElasticLoadBalancerId: String,
    @required
    @xmlName("RouteTableId")
    @ec2QueryName("RouteTableId")
    RouteTableId: String,
}

structure NiftyAssociateRouteTableWithElasticLoadBalancerResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("return")
    @ec2QueryName("return")
    Return: Boolean,
}

structure NiftyReplaceRouteTableAssociationWithElasticLoadBalancerRequest {
    @required
    @xmlName("AssociationId")
    @ec2QueryName("AssociationId")
    AssociationId: String,
    @required
    @xmlName("RouteTableId")
    @ec2QueryName("RouteTableId")
    RouteTableId: String,
}

structure NiftyReplaceRouteTableAssociationWithElasticLoadBalancerResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("return")
    @ec2QueryName("return")
    Return: Boolean,
}

structure NiftyDisassociateRouteTableFromElasticLoadBalancerRequest {
    @required
    @xmlName("AssociationId")
    @ec2QueryName("AssociationId")
    AssociationId: String,
}

structure NiftyDisassociateRouteTableFromElasticLoadBalancerResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("return")
    @ec2QueryName("return")
    Return: Boolean,
}

@enum([
  {
      name: "ANY",
      value: "ANY",
  },
  {
      name: "TCP",
      value: "TCP",
  },
  {
      name: "UDP",
      value: "UDP",
  },
  {
      name: "ICMP",
      value: "ICMP",
  },
  {
      name: "SSH",
      value: "SSH",
  },
  {
      name: "HTTP",
      value: "HTTP",
  },
  {
      name: "HTTPS",
      value: "HTTPS",
  },
  {
      name: "RDP",
      value: "RDP",
  },
  {
      name: "GRE",
      value: "GRE",
  },
  {
      name: "ESP",
      value: "ESP",
  },
  {
      name: "AH",
      value: "AH",
  },
  {
      name: "VRRP",
      value: "VRRP",
  },
  {
      name: "L2TP",
      value: "L2TP",
  },
  {
      name: "ICMPV6_ALL",
      value: "ICMPv6-all",
  },
])
string IpProtocolOfIpPermissionsForAuthorizeSecurityGroupIngress

structure RequestIpPermissions {
    @xmlName("Description")
    @ec2QueryName("Description")
    Description: String,
    @xmlName("FromPort")
    @ec2QueryName("FromPort")
    FromPort: Integer,
    @xmlName("InOut")
    @ec2QueryName("InOut")
    InOut: InOutOfIpPermissionsForAuthorizeSecurityGroupIngress,
    @xmlName("IpProtocol")
    @ec2QueryName("IpProtocol")
    IpProtocol: IpProtocolOfIpPermissionsForAuthorizeSecurityGroupIngress,
    @xmlName("Groups")
    @ec2QueryName("Groups")
    ListOfRequestGroups: ListOfRequestGroups,
    @xmlName("IpRanges")
    @ec2QueryName("IpRanges")
    ListOfRequestIpRanges: ListOfRequestIpRanges,
    @xmlName("ToPort")
    @ec2QueryName("ToPort")
    ToPort: Integer,
}

list ListOfRequestIpPermissions {
    member: RequestIpPermissions,
}

@enum([
  {
      name: "INCOMING",
      value: "IN",
  },
  {
      name: "OUTGOING",
      value: "OUT",
  },
])
string InOutOfIpPermissionsForAuthorizeSecurityGroupIngress

structure RequestGroups {
    @xmlName("GroupName")
    @ec2QueryName("GroupName")
    GroupName: String,
    @xmlName("UserId")
    @ec2QueryName("UserId")
    UserId: String,
}

list ListOfRequestGroups {
    member: RequestGroups,
}

structure RequestIpRanges {
    @xmlName("CidrIp")
    @ec2QueryName("CidrIp")
    CidrIp: String,
}

list ListOfRequestIpRanges {
    member: RequestIpRanges,
}

structure AuthorizeSecurityGroupIngressRequest {
    @required
    @xmlName("GroupName")
    @ec2QueryName("GroupName")
    GroupName: String,
    @xmlName("IpPermissions")
    @ec2QueryName("IpPermissions")
    IpPermissions: ListOfRequestIpPermissions,
    @xmlName("UserId")
    @ec2QueryName("UserId")
    UserId: String,
}

structure AuthorizeSecurityGroupIngressResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("return")
    @ec2QueryName("return")
    Return: Boolean,
}

structure RequestPlacementOfCreateSecurityGroup {
    @xmlName("AvailabilityZone")
    @ec2QueryName("AvailabilityZone")
    AvailabilityZone: String,
}

structure CreateSecurityGroupRequest {
    @xmlName("GroupDescription")
    @ec2QueryName("GroupDescription")
    GroupDescription: String,
    @required
    @xmlName("GroupName")
    @ec2QueryName("GroupName")
    GroupName: String,
    @xmlName("Placement")
    @ec2QueryName("Placement")
    Placement: RequestPlacementOfCreateSecurityGroup,
}

structure CreateSecurityGroupResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("return")
    @ec2QueryName("return")
    Return: Boolean,
}

structure DeleteSecurityGroupRequest {
    @required
    @xmlName("GroupName")
    @ec2QueryName("GroupName")
    GroupName: String,
}

structure DeleteSecurityGroupResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("return")
    @ec2QueryName("return")
    Return: Boolean,
}

structure DeregisterInstancesFromSecurityGroupRequest {
    @required
    @xmlName("GroupName")
    @ec2QueryName("GroupName")
    GroupName: String,
    @required
    @xmlName("InstanceId")
    @ec2QueryName("InstanceId")
    InstanceId: ListOfRequestInstanceId,
}

structure DeregisterInstancesFromSecurityGroupResult {
    @xmlName("instancesSet")
    @ec2QueryName("instancesSet")
    InstancesSet: ListOfInstancesSetOfDeregisterInstancesFromSecurityGroup,
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
}

list ListOfInstancesSetOfDeregisterInstancesFromSecurityGroup {
    @xmlName("item")
    member: InstancesSetOfDeregisterInstancesFromSecurityGroup,
}

structure InstancesSetOfDeregisterInstancesFromSecurityGroup {
    @xmlName("instanceId")
    @ec2QueryName("instanceId")
    InstanceId: String,
}

structure RequestRange {
    @xmlName("All")
    @ec2QueryName("All")
    All: Boolean,
    @xmlName("EndNumber")
    @ec2QueryName("EndNumber")
    EndNumber: Integer,
    @xmlName("StartNumber")
    @ec2QueryName("StartNumber")
    StartNumber: Integer,
}

structure DescribeSecurityActivitiesRequest {
    @xmlName("ActivityDate")
    @ec2QueryName("ActivityDate")
    ActivityDate: String,
    @required
    @xmlName("GroupName")
    @ec2QueryName("GroupName")
    GroupName: String,
    @xmlName("Range")
    @ec2QueryName("Range")
    Range: RequestRange,
}

structure DescribeSecurityActivitiesResult {
    @xmlName("groupName")
    @ec2QueryName("groupName")
    GroupName: String,
    @xmlName("log")
    @ec2QueryName("log")
    Log: String,
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
}

list ListOfRequestGroupName {
    member: String,
}

@enum([
  {
      name: "DESCRIPTION",
      value: "description",
  },
  {
      name: "GROUP_NAME",
      value: "group-name",
  },
])
string NameOfFilterForDescribeSecurityGroups

structure RequestFilterOfDescribeSecurityGroups {
    @xmlName("Value")
    @ec2QueryName("Value")
    ListOfRequestValue: ListOfRequestValue,
    @xmlName("Name")
    @ec2QueryName("Name")
    Name: NameOfFilterForDescribeSecurityGroups,
}

list ListOfRequestFilterOfDescribeSecurityGroups {
    member: RequestFilterOfDescribeSecurityGroups,
}

structure DescribeSecurityGroupsRequest {
    @xmlName("Filter")
    @ec2QueryName("Filter")
    Filter: ListOfRequestFilterOfDescribeSecurityGroups,
    @xmlName("GroupName")
    @ec2QueryName("GroupName")
    GroupName: ListOfRequestGroupName,
}

structure DescribeSecurityGroupsResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("securityGroupInfo")
    @ec2QueryName("securityGroupInfo")
    SecurityGroupInfo: ListOfSecurityGroupInfo,
}

list ListOfSecurityGroupInfo {
    @xmlName("item")
    member: SecurityGroupInfo,
}

structure SecurityGroupInfo {
    @xmlName("availabilityZone")
    @ec2QueryName("availabilityZone")
    AvailabilityZone: String,
    @xmlName("groupDescription")
    @ec2QueryName("groupDescription")
    GroupDescription: String,
    @xmlName("groupLogFilterBroadcast")
    @ec2QueryName("groupLogFilterBroadcast")
    GroupLogFilterBroadcast: Boolean,
    @xmlName("groupLogFilterNetBios")
    @ec2QueryName("groupLogFilterNetBios")
    GroupLogFilterNetBios: Boolean,
    @xmlName("groupLogLimit")
    @ec2QueryName("groupLogLimit")
    GroupLogLimit: Integer,
    @xmlName("groupName")
    @ec2QueryName("groupName")
    GroupName: String,
    @xmlName("groupRuleLimit")
    @ec2QueryName("groupRuleLimit")
    GroupRuleLimit: Integer,
    @xmlName("groupStatus")
    @ec2QueryName("groupStatus")
    GroupStatus: String,
    @xmlName("instancesSet")
    @ec2QueryName("instancesSet")
    InstancesSet: ListOfInstancesSetOfDescribeSecurityGroups,
    @xmlName("instanceUniqueIdsSet")
    @ec2QueryName("instanceUniqueIdsSet")
    InstanceUniqueIdsSet: ListOfInstanceUniqueIdsSet,
    @xmlName("ipPermissions")
    @ec2QueryName("ipPermissions")
    IpPermissions: ListOfIpPermissions,
    @xmlName("ownerId")
    @ec2QueryName("ownerId")
    OwnerId: String,
    @xmlName("routerSet")
    @ec2QueryName("routerSet")
    RouterSet: ListOfRouterSet,
    @xmlName("vpnGatewaySet")
    @ec2QueryName("vpnGatewaySet")
    VpnGatewaySet: ListOfVpnGatewaySet,
}

list ListOfIpPermissions {
    @xmlName("item")
    member: IpPermissions,
}

structure IpPermissions {
    @xmlName("addDatetime")
    @ec2QueryName("addDatetime")
    AddDatetime: Timestamp,
    @xmlName("description")
    @ec2QueryName("description")
    Description: String,
    @xmlName("fromPort")
    @ec2QueryName("fromPort")
    FromPort: Integer,
    @xmlName("groups")
    @ec2QueryName("groups")
    Groups: ListOfGroups,
    @xmlName("inOut")
    @ec2QueryName("inOut")
    InOut: String,
    @xmlName("ipProtocol")
    @ec2QueryName("ipProtocol")
    IpProtocol: String,
    @xmlName("ipRanges")
    @ec2QueryName("ipRanges")
    IpRanges: ListOfIpRanges,
    @xmlName("toPort")
    @ec2QueryName("toPort")
    ToPort: Integer,
}

list ListOfGroups {
    @xmlName("item")
    member: Groups,
}

structure Groups {
    @xmlName("groupName")
    @ec2QueryName("groupName")
    GroupName: String,
    @xmlName("userId")
    @ec2QueryName("userId")
    UserId: String,
}

list ListOfIpRanges {
    @xmlName("item")
    member: IpRanges,
}

structure IpRanges {
    @xmlName("cidrIp")
    @ec2QueryName("cidrIp")
    CidrIp: String,
}

list ListOfInstancesSetOfDescribeSecurityGroups {
    @xmlName("item")
    member: InstancesSetOfDescribeSecurityGroups,
}

structure InstancesSetOfDescribeSecurityGroups {
    @xmlName("instanceId")
    @ec2QueryName("instanceId")
    InstanceId: String,
}

list ListOfInstanceUniqueIdsSet {
    @xmlName("item")
    member: InstanceUniqueIdsSet,
}

structure InstanceUniqueIdsSet {
    @xmlName("instanceUniqueId")
    @ec2QueryName("instanceUniqueId")
    InstanceUniqueId: String,
}

list ListOfRouterSet {
    @xmlName("item")
    member: RouterSet,
}

structure RouterSet {
    @xmlName("routerId")
    @ec2QueryName("routerId")
    RouterId: String,
    @xmlName("routerName")
    @ec2QueryName("routerName")
    RouterName: String,
}

list ListOfVpnGatewaySet {
    @xmlName("item")
    member: VpnGatewaySet,
}

structure VpnGatewaySet {
    @xmlName("niftyVpnGatewayName")
    @ec2QueryName("niftyVpnGatewayName")
    NiftyVpnGatewayName: String,
    @xmlName("vpnGatewayId")
    @ec2QueryName("vpnGatewayId")
    VpnGatewayId: String,
}

structure RegisterInstancesWithSecurityGroupRequest {
    @required
    @xmlName("GroupName")
    @ec2QueryName("GroupName")
    GroupName: String,
    @required
    @xmlName("InstanceId")
    @ec2QueryName("InstanceId")
    InstanceId: ListOfRequestInstanceId,
}

structure RegisterInstancesWithSecurityGroupResult {
    @xmlName("instancesSet")
    @ec2QueryName("instancesSet")
    InstancesSet: ListOfInstancesSetOfRegisterInstancesWithSecurityGroup,
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
}

list ListOfInstancesSetOfRegisterInstancesWithSecurityGroup {
    @xmlName("item")
    member: InstancesSetOfRegisterInstancesWithSecurityGroup,
}

structure InstancesSetOfRegisterInstancesWithSecurityGroup {
    @xmlName("instanceId")
    @ec2QueryName("instanceId")
    InstanceId: String,
}

@enum([
  {
      name: "ANY",
      value: "ANY",
  },
  {
      name: "TCP",
      value: "TCP",
  },
  {
      name: "UDP",
      value: "UDP",
  },
  {
      name: "ICMP",
      value: "ICMP",
  },
  {
      name: "SSH",
      value: "SSH",
  },
  {
      name: "HTTP",
      value: "HTTP",
  },
  {
      name: "HTTPS",
      value: "HTTPS",
  },
  {
      name: "RDP",
      value: "RDP",
  },
  {
      name: "GRE",
      value: "GRE",
  },
  {
      name: "ESP",
      value: "ESP",
  },
  {
      name: "AH",
      value: "AH",
  },
  {
      name: "VRRP",
      value: "VRRP",
  },
  {
      name: "L2TP",
      value: "L2TP",
  },
  {
      name: "ICMPV6_ALL",
      value: "ICMPv6-all",
  },
])
string IpProtocolOfIpPermissionsForRevokeSecurityGroupIngress

structure RequestIpPermissionsOfRevokeSecurityGroupIngress {
    @xmlName("FromPort")
    @ec2QueryName("FromPort")
    FromPort: Integer,
    @xmlName("InOut")
    @ec2QueryName("InOut")
    InOut: InOutOfIpPermissionsForRevokeSecurityGroupIngress,
    @xmlName("IpProtocol")
    @ec2QueryName("IpProtocol")
    IpProtocol: IpProtocolOfIpPermissionsForRevokeSecurityGroupIngress,
    @xmlName("Groups")
    @ec2QueryName("Groups")
    ListOfRequestGroups: ListOfRequestGroups,
    @xmlName("IpRanges")
    @ec2QueryName("IpRanges")
    ListOfRequestIpRanges: ListOfRequestIpRanges,
    @xmlName("ToPort")
    @ec2QueryName("ToPort")
    ToPort: Integer,
}

list ListOfRequestIpPermissionsOfRevokeSecurityGroupIngress {
    member: RequestIpPermissionsOfRevokeSecurityGroupIngress,
}

@enum([
  {
      name: "INCOMING",
      value: "IN",
  },
  {
      name: "OUTGOING",
      value: "OUT",
  },
])
string InOutOfIpPermissionsForRevokeSecurityGroupIngress

structure RevokeSecurityGroupIngressRequest {
    @required
    @xmlName("GroupName")
    @ec2QueryName("GroupName")
    GroupName: String,
    @xmlName("IpPermissions")
    @ec2QueryName("IpPermissions")
    IpPermissions: ListOfRequestIpPermissionsOfRevokeSecurityGroupIngress,
    @xmlName("UserId")
    @ec2QueryName("UserId")
    UserId: String,
}

structure RevokeSecurityGroupIngressResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("return")
    @ec2QueryName("return")
    Return: Boolean,
}

structure UpdateSecurityGroupRequest {
    @xmlName("GroupDescriptionUpdate")
    @ec2QueryName("GroupDescriptionUpdate")
    GroupDescriptionUpdate: String,
    @xmlName("GroupLogFilterBroadcast")
    @ec2QueryName("GroupLogFilterBroadcast")
    GroupLogFilterBroadcast: Boolean,
    @xmlName("GroupLogFilterNetBios")
    @ec2QueryName("GroupLogFilterNetBios")
    GroupLogFilterNetBios: Boolean,
    @xmlName("GroupLogLimitUpdate")
    @ec2QueryName("GroupLogLimitUpdate")
    GroupLogLimitUpdate: Integer,
    @required
    @xmlName("GroupName")
    @ec2QueryName("GroupName")
    GroupName: String,
    @xmlName("GroupNameUpdate")
    @ec2QueryName("GroupNameUpdate")
    GroupNameUpdate: String,
    @xmlName("GroupRuleLimitUpdate")
    @ec2QueryName("GroupRuleLimitUpdate")
    GroupRuleLimitUpdate: Integer,
}

structure UpdateSecurityGroupResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("return")
    @ec2QueryName("return")
    Return: Boolean,
}

structure RequestRouterSet {
    @xmlName("RouterId")
    @ec2QueryName("RouterId")
    RouterId: String,
    @xmlName("RouterName")
    @ec2QueryName("RouterName")
    RouterName: String,
}

list ListOfRequestRouterSet {
    member: RequestRouterSet,
}

structure NiftyRegisterRoutersWithSecurityGroupRequest {
    @required
    @xmlName("GroupName")
    @ec2QueryName("GroupName")
    GroupName: String,
    @xmlName("RouterSet")
    @ec2QueryName("RouterSet")
    RouterSet: ListOfRequestRouterSet,
}

structure NiftyRegisterRoutersWithSecurityGroupResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("routerSet")
    @ec2QueryName("routerSet")
    RouterSet: ListOfRouterSet,
}

structure NiftyDeregisterRoutersFromSecurityGroupRequest {
    @required
    @xmlName("GroupName")
    @ec2QueryName("GroupName")
    GroupName: String,
    @xmlName("RouterSet")
    @ec2QueryName("RouterSet")
    RouterSet: ListOfRequestRouterSet,
}

structure NiftyDeregisterRoutersFromSecurityGroupResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("routerSet")
    @ec2QueryName("routerSet")
    RouterSet: ListOfRouterSet,
}

structure RequestVpnGatewaySet {
    @xmlName("NiftyVpnGatewayName")
    @ec2QueryName("NiftyVpnGatewayName")
    NiftyVpnGatewayName: String,
    @xmlName("VpnGatewayId")
    @ec2QueryName("VpnGatewayId")
    VpnGatewayId: String,
}

list ListOfRequestVpnGatewaySet {
    member: RequestVpnGatewaySet,
}

structure NiftyRegisterVpnGatewaysWithSecurityGroupRequest {
    @required
    @xmlName("GroupName")
    @ec2QueryName("GroupName")
    GroupName: String,
    @xmlName("VpnGatewaySet")
    @ec2QueryName("VpnGatewaySet")
    VpnGatewaySet: ListOfRequestVpnGatewaySet,
}

structure NiftyRegisterVpnGatewaysWithSecurityGroupResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("vpnGatewaySet")
    @ec2QueryName("vpnGatewaySet")
    VpnGatewaySet: ListOfVpnGatewaySet,
}

structure NiftyDeregisterVpnGatewaysFromSecurityGroupRequest {
    @required
    @xmlName("GroupName")
    @ec2QueryName("GroupName")
    GroupName: String,
    @xmlName("VpnGatewaySet")
    @ec2QueryName("VpnGatewaySet")
    VpnGatewaySet: ListOfRequestVpnGatewaySet,
}

structure NiftyDeregisterVpnGatewaysFromSecurityGroupResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("vpnGatewaySet")
    @ec2QueryName("vpnGatewaySet")
    VpnGatewaySet: ListOfVpnGatewaySet,
}

structure RequestCertInfo {
    @xmlName("CountryName")
    @ec2QueryName("CountryName")
    CountryName: String,
    @xmlName("EmailAddress")
    @ec2QueryName("EmailAddress")
    EmailAddress: String,
    @xmlName("LocationName")
    @ec2QueryName("LocationName")
    LocationName: String,
    @xmlName("OrganizationName")
    @ec2QueryName("OrganizationName")
    OrganizationName: String,
    @xmlName("OrganizationUnitName")
    @ec2QueryName("OrganizationUnitName")
    OrganizationUnitName: String,
    @xmlName("StateName")
    @ec2QueryName("StateName")
    StateName: String,
}

structure CreateSslCertificateRequest {
    @xmlName("ApproverEmailAddress")
    @ec2QueryName("ApproverEmailAddress")
    ApproverEmailAddress: String,
    @xmlName("CertAuthority")
    @ec2QueryName("CertAuthority")
    CertAuthority: Integer,
    @xmlName("CertInfo")
    @ec2QueryName("CertInfo")
    CertInfo: RequestCertInfo,
    @xmlName("Count")
    @ec2QueryName("Count")
    Count: Integer,
    @xmlName("Fqdn")
    @ec2QueryName("Fqdn")
    Fqdn: String,
    @xmlName("FqdnId")
    @ec2QueryName("FqdnId")
    FqdnId: String,
    @xmlName("KeyLength")
    @ec2QueryName("KeyLength")
    KeyLength: Integer,
    @xmlName("ValidityTerm")
    @ec2QueryName("ValidityTerm")
    ValidityTerm: Integer,
}

structure CreateSslCertificateResult {
    @xmlName("approverEmailAddress")
    @ec2QueryName("approverEmailAddress")
    ApproverEmailAddress: String,
    @xmlName("certAuthority")
    @ec2QueryName("certAuthority")
    CertAuthority: String,
    @xmlName("certState")
    @ec2QueryName("certState")
    CertState: String,
    @xmlName("fqdn")
    @ec2QueryName("fqdn")
    Fqdn: String,
    @xmlName("fqdnId")
    @ec2QueryName("fqdnId")
    FqdnId: String,
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("validityTerm")
    @ec2QueryName("validityTerm")
    ValidityTerm: Integer,
}

structure DeleteSslCertificateRequest {
    @required
    @xmlName("FqdnId")
    @ec2QueryName("FqdnId")
    FqdnId: String,
}

structure DeleteSslCertificateResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("return")
    @ec2QueryName("return")
    Return: Boolean,
}

list ListOfRequestFqdnId {
    member: String,
}

list ListOfRequestFqdn {
    member: String,
}

structure DescribeSslCertificatesRequest {
    @xmlName("Fqdn")
    @ec2QueryName("Fqdn")
    Fqdn: ListOfRequestFqdn,
    @xmlName("FqdnId")
    @ec2QueryName("FqdnId")
    FqdnId: ListOfRequestFqdnId,
}

structure DescribeSslCertificatesResult {
    @xmlName("certsSet")
    @ec2QueryName("certsSet")
    CertsSet: ListOfCertsSet,
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
}

list ListOfCertsSet {
    @xmlName("item")
    member: CertsSet,
}

structure CertsSet {
    @xmlName("caState")
    @ec2QueryName("caState")
    CaState: Boolean,
    @xmlName("certAuthority")
    @ec2QueryName("certAuthority")
    CertAuthority: String,
    @xmlName("certInfo")
    @ec2QueryName("certInfo")
    CertInfo: CertInfo,
    @xmlName("certState")
    @ec2QueryName("certState")
    CertState: String,
    @xmlName("count")
    @ec2QueryName("count")
    Count: Integer,
    @xmlName("description")
    @ec2QueryName("description")
    Description: String,
    @xmlName("fqdn")
    @ec2QueryName("fqdn")
    Fqdn: String,
    @xmlName("fqdnId")
    @ec2QueryName("fqdnId")
    FqdnId: String,
    @xmlName("keyLength")
    @ec2QueryName("keyLength")
    KeyLength: Integer,
    @xmlName("period")
    @ec2QueryName("period")
    Period: Period,
    @xmlName("uploadState")
    @ec2QueryName("uploadState")
    UploadState: Boolean,
}

structure Period {
    @xmlName("endDate")
    @ec2QueryName("endDate")
    EndDate: Timestamp,
    @xmlName("startDate")
    @ec2QueryName("startDate")
    StartDate: Timestamp,
    @xmlName("validityTerm")
    @ec2QueryName("validityTerm")
    ValidityTerm: Integer,
}

structure CertInfo {
    @xmlName("countryName")
    @ec2QueryName("countryName")
    CountryName: String,
    @xmlName("emailAddress")
    @ec2QueryName("emailAddress")
    EmailAddress: String,
    @xmlName("locationName")
    @ec2QueryName("locationName")
    LocationName: String,
    @xmlName("organizationName")
    @ec2QueryName("organizationName")
    OrganizationName: String,
    @xmlName("organizationUnitName")
    @ec2QueryName("organizationUnitName")
    OrganizationUnitName: String,
    @xmlName("stateName")
    @ec2QueryName("stateName")
    StateName: String,
}

@enum([
  {
      name: "CERT_AUTHORITY",
      value: "certAuthority",
  },
  {
      name: "COUNT",
      value: "count",
  },
  {
      name: "CERT_STATE",
      value: "certState",
  },
  {
      name: "PERIOD",
      value: "period",
  },
  {
      name: "VALIDITY_TERM",
      value: "validityTerm",
  },
  {
      name: "KEY_LENGTH",
      value: "keyLength",
  },
  {
      name: "UPLOAD_STATE",
      value: "uploadState",
  },
  {
      name: "DESCRIPTION",
      value: "description",
  },
  {
      name: "CERT_INFO",
      value: "certInfo",
  },
  {
      name: "CA_STATE",
      value: "caState",
  },
])
string AttributeOfDescribeSslCertificateAttributeRequest

structure DescribeSslCertificateAttributeRequest {
    @xmlName("Attribute")
    @ec2QueryName("Attribute")
    Attribute: AttributeOfDescribeSslCertificateAttributeRequest,
    @required
    @xmlName("FqdnId")
    @ec2QueryName("FqdnId")
    FqdnId: String,
}

structure DescribeSslCertificateAttributeResult {
    @xmlName("caState")
    @ec2QueryName("caState")
    CaState: CaState,
    @xmlName("certAuthority")
    @ec2QueryName("certAuthority")
    CertAuthority: CertAuthority,
    @xmlName("certInfo")
    @ec2QueryName("certInfo")
    CertInfo: CertInfo,
    @xmlName("certState")
    @ec2QueryName("certState")
    CertState: CertState,
    @xmlName("count")
    @ec2QueryName("count")
    Count: Count,
    @xmlName("description")
    @ec2QueryName("description")
    Description: Description,
    @xmlName("fqdn")
    @ec2QueryName("fqdn")
    Fqdn: String,
    @xmlName("fqdnId")
    @ec2QueryName("fqdnId")
    FqdnId: String,
    @xmlName("keyLength")
    @ec2QueryName("keyLength")
    KeyLength: KeyLength,
    @xmlName("period")
    @ec2QueryName("period")
    Period: Period,
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("uploadState")
    @ec2QueryName("uploadState")
    UploadState: UploadState,
}

structure CertAuthority {
    @xmlName("value")
    @ec2QueryName("value")
    Value: String,
}

structure Count {
    @xmlName("value")
    @ec2QueryName("value")
    Value: Integer,
}

structure CertState {
    @xmlName("value")
    @ec2QueryName("value")
    Value: String,
}

structure KeyLength {
    @xmlName("value")
    @ec2QueryName("value")
    Value: Integer,
}

structure UploadState {
    @xmlName("value")
    @ec2QueryName("value")
    Value: Boolean,
}

structure CaState {
    @xmlName("value")
    @ec2QueryName("value")
    Value: Boolean,
}

@enum([
  {
      name: "PRIVATE_KEY",
      value: "1",
  },
  {
      name: "CA",
      value: "2",
  },
  {
      name: "CERTIFICATE",
      value: "3",
  },
])
string FileTypeOfDownloadSslCertificateRequest

structure DownloadSslCertificateRequest {
    @required
    @xmlName("FileType")
    @ec2QueryName("FileType")
    FileType: FileTypeOfDownloadSslCertificateRequest,
    @required
    @xmlName("FqdnId")
    @ec2QueryName("FqdnId")
    FqdnId: String,
}

structure DownloadSslCertificateResult {
    @xmlName("fileData")
    @ec2QueryName("fileData")
    FileData: String,
    @xmlName("fqdn")
    @ec2QueryName("fqdn")
    Fqdn: String,
    @xmlName("fqdnId")
    @ec2QueryName("fqdnId")
    FqdnId: String,
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
}

structure RequestDescription {
    @xmlName("Value")
    @ec2QueryName("Value")
    Value: String,
}

structure ModifySslCertificateAttributeRequest {
    @xmlName("Description")
    @ec2QueryName("Description")
    Description: RequestDescription,
    @required
    @xmlName("FqdnId")
    @ec2QueryName("FqdnId")
    FqdnId: String,
}

structure ModifySslCertificateAttributeResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("return")
    @ec2QueryName("return")
    Return: Boolean,
}

structure RegisterCorporateInfoForCertificateRequest {
    @required
    @xmlName("Agreement")
    @ec2QueryName("Agreement")
    Agreement: Boolean,
    @required
    @xmlName("AlphabetName1")
    @ec2QueryName("AlphabetName1")
    AlphabetName1: String,
    @required
    @xmlName("AlphabetName2")
    @ec2QueryName("AlphabetName2")
    AlphabetName2: String,
    @required
    @xmlName("City")
    @ec2QueryName("City")
    City: String,
    @required
    @xmlName("CorpGrade")
    @ec2QueryName("CorpGrade")
    CorpGrade: String,
    @required
    @xmlName("CorpName")
    @ec2QueryName("CorpName")
    CorpName: String,
    @required
    @xmlName("DivisionName")
    @ec2QueryName("DivisionName")
    DivisionName: String,
    @required
    @xmlName("EmailAddress")
    @ec2QueryName("EmailAddress")
    EmailAddress: String,
    @required
    @xmlName("KanaName1")
    @ec2QueryName("KanaName1")
    KanaName1: String,
    @required
    @xmlName("KanaName2")
    @ec2QueryName("KanaName2")
    KanaName2: String,
    @required
    @xmlName("Name1")
    @ec2QueryName("Name1")
    Name1: String,
    @required
    @xmlName("Name2")
    @ec2QueryName("Name2")
    Name2: String,
    @required
    @xmlName("PhoneNumber")
    @ec2QueryName("PhoneNumber")
    PhoneNumber: String,
    @required
    @xmlName("PostName")
    @ec2QueryName("PostName")
    PostName: String,
    @required
    @xmlName("Pref")
    @ec2QueryName("Pref")
    Pref: String,
    @required
    @xmlName("PresidentName1")
    @ec2QueryName("PresidentName1")
    PresidentName1: String,
    @required
    @xmlName("PresidentName2")
    @ec2QueryName("PresidentName2")
    PresidentName2: String,
    @xmlName("TdbCode")
    @ec2QueryName("TdbCode")
    TdbCode: String,
    @required
    @xmlName("Zip1")
    @ec2QueryName("Zip1")
    Zip1: String,
    @required
    @xmlName("Zip2")
    @ec2QueryName("Zip2")
    Zip2: String,
}

structure RegisterCorporateInfoForCertificateResult {
    @xmlName("alphabetName1")
    @ec2QueryName("alphabetName1")
    AlphabetName1: String,
    @xmlName("alphabetName2")
    @ec2QueryName("alphabetName2")
    AlphabetName2: String,
    @xmlName("city")
    @ec2QueryName("city")
    City: String,
    @xmlName("corpGrade")
    @ec2QueryName("corpGrade")
    CorpGrade: String,
    @xmlName("corpName")
    @ec2QueryName("corpName")
    CorpName: String,
    @xmlName("divisionName")
    @ec2QueryName("divisionName")
    DivisionName: String,
    @xmlName("emailAddress")
    @ec2QueryName("emailAddress")
    EmailAddress: String,
    @xmlName("kanaName1")
    @ec2QueryName("kanaName1")
    KanaName1: String,
    @xmlName("kanaName2")
    @ec2QueryName("kanaName2")
    KanaName2: String,
    @xmlName("name1")
    @ec2QueryName("name1")
    Name1: String,
    @xmlName("name2")
    @ec2QueryName("name2")
    Name2: String,
    @xmlName("phoneNumber")
    @ec2QueryName("phoneNumber")
    PhoneNumber: String,
    @xmlName("postName")
    @ec2QueryName("postName")
    PostName: String,
    @xmlName("pref")
    @ec2QueryName("pref")
    Pref: String,
    @xmlName("presidentName1")
    @ec2QueryName("presidentName1")
    PresidentName1: String,
    @xmlName("presidentName2")
    @ec2QueryName("presidentName2")
    PresidentName2: String,
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("tdbCode")
    @ec2QueryName("tdbCode")
    TdbCode: String,
    @xmlName("zip1")
    @ec2QueryName("zip1")
    Zip1: String,
    @xmlName("zip2")
    @ec2QueryName("zip2")
    Zip2: String,
}

structure UploadSslCertificateRequest {
    @required
    @xmlName("Certificate")
    @ec2QueryName("Certificate")
    Certificate: String,
    @xmlName("Ca")
    @ec2QueryName("Ca")
    CertificateAuthority: String,
    @required
    @xmlName("Key")
    @ec2QueryName("Key")
    Key: String,
}

structure UploadSslCertificateResult {
    @xmlName("fqdn")
    @ec2QueryName("fqdn")
    Fqdn: String,
    @xmlName("fqdnId")
    @ec2QueryName("fqdnId")
    FqdnId: String,
    @xmlName("keyFingerprint")
    @ec2QueryName("keyFingerprint")
    KeyFingerprint: String,
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
}

structure NiftyDescribeCorporateInfoForCertificateRequest {}

structure NiftyDescribeCorporateInfoForCertificateResult {
    @xmlName("alphabetName1")
    @ec2QueryName("alphabetName1")
    AlphabetName1: String,
    @xmlName("alphabetName2")
    @ec2QueryName("alphabetName2")
    AlphabetName2: String,
    @xmlName("city")
    @ec2QueryName("city")
    City: String,
    @xmlName("corpGrade")
    @ec2QueryName("corpGrade")
    CorpGrade: String,
    @xmlName("corpName")
    @ec2QueryName("corpName")
    CorpName: String,
    @xmlName("divisionName")
    @ec2QueryName("divisionName")
    DivisionName: String,
    @xmlName("emailAddress")
    @ec2QueryName("emailAddress")
    EmailAddress: String,
    @xmlName("kanaName1")
    @ec2QueryName("kanaName1")
    KanaName1: String,
    @xmlName("kanaName2")
    @ec2QueryName("kanaName2")
    KanaName2: String,
    @xmlName("name1")
    @ec2QueryName("name1")
    Name1: String,
    @xmlName("name2")
    @ec2QueryName("name2")
    Name2: String,
    @xmlName("phoneNumber")
    @ec2QueryName("phoneNumber")
    PhoneNumber: String,
    @xmlName("postName")
    @ec2QueryName("postName")
    PostName: String,
    @xmlName("pref")
    @ec2QueryName("pref")
    Pref: String,
    @xmlName("presidentName1")
    @ec2QueryName("presidentName1")
    PresidentName1: String,
    @xmlName("presidentName2")
    @ec2QueryName("presidentName2")
    PresidentName2: String,
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("tdbCode")
    @ec2QueryName("tdbCode")
    TdbCode: String,
    @xmlName("zip1")
    @ec2QueryName("zip1")
    Zip1: String,
    @xmlName("zip2")
    @ec2QueryName("zip2")
    Zip2: String,
}

structure DescribeResourcesRequest {}

structure DescribeResourcesResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("resourceInfo")
    @ec2QueryName("resourceInfo")
    ResourceInfo: ResourceInfo,
}

structure ResourceInfo {
    @xmlName("addDiskCount")
    @ec2QueryName("addDiskCount")
    AddDiskCount: Integer,
    @xmlName("addDiskTotalSize")
    @ec2QueryName("addDiskTotalSize")
    AddDiskTotalSize: Integer,
    @xmlName("autoScaleCount")
    @ec2QueryName("autoScaleCount")
    AutoScaleCount: Integer,
    @xmlName("customizeImageCount")
    @ec2QueryName("customizeImageCount")
    CustomizeImageCount: Integer,
    @xmlName("dynamicIpCount")
    @ec2QueryName("dynamicIpCount")
    DynamicIpCount: Integer,
    @xmlName("elasticIpItemSet")
    @ec2QueryName("elasticIpItemSet")
    ElasticIpItemSet: ListOfElasticIpItemSet,
    @xmlName("elasticLoadBalancerCount")
    @ec2QueryName("elasticLoadBalancerCount")
    ElasticLoadBalancerCount: Integer,
    @xmlName("instanceBackupRuleCount")
    @ec2QueryName("instanceBackupRuleCount")
    InstanceBackupRuleCount: Integer,
    @xmlName("instanceItemSet")
    @ec2QueryName("instanceItemSet")
    InstanceItemSet: ListOfInstanceItemSet,
    @xmlName("loadBalancerCount")
    @ec2QueryName("loadBalancerCount")
    LoadBalancerCount: Integer,
    @xmlName("migrationHubItemSet")
    @ec2QueryName("migrationHubItemSet")
    MigrationHubItemSet: ListOfMigrationHubItemSet,
    @xmlName("monitoringRuleCount")
    @ec2QueryName("monitoringRuleCount")
    MonitoringRuleCount: Integer,
    @xmlName("multiIpAddressItemSet")
    @ec2QueryName("multiIpAddressItemSet")
    MultiIpAddressItemSet: ListOfMultiIpAddressItemSet,
    @xmlName("networkFlowAmount")
    @ec2QueryName("networkFlowAmount")
    NetworkFlowAmount: Integer,
    @xmlName("networkInterfaceItemSet")
    @ec2QueryName("networkInterfaceItemSet")
    NetworkInterfaceItemSet: ListOfNetworkInterfaceItemSet,
    @xmlName("niftyMultiAccountCount")
    @ec2QueryName("niftyMultiAccountCount")
    NiftyMultiAccountCount: Integer,
    @xmlName("premiumSupportSet")
    @ec2QueryName("premiumSupportSet")
    PremiumSupportSet: ListOfPremiumSupportSet,
    @xmlName("privateLanClassicCount")
    @ec2QueryName("privateLanClassicCount")
    PrivateLanClassicCount: Integer,
    @xmlName("privateLanCount")
    @ec2QueryName("privateLanCount")
    PrivateLanCount: Integer,
    @xmlName("remoteAccessVpnGatewaySet")
    @ec2QueryName("remoteAccessVpnGatewaySet")
    RemoteAccessVpnGatewaySet: ListOfRemoteAccessVpnGatewaySet,
    @xmlName("routerItemSet")
    @ec2QueryName("routerItemSet")
    RouterItemSet: ListOfRouterItemSet,
    @xmlName("securityGroupCount")
    @ec2QueryName("securityGroupCount")
    SecurityGroupCount: Integer,
    @xmlName("sslCertCount")
    @ec2QueryName("sslCertCount")
    SslCertCount: Integer,
    @xmlName("vpnGatewayItemSet")
    @ec2QueryName("vpnGatewayItemSet")
    VpnGatewayItemSet: ListOfVpnGatewayItemSet,
}

list ListOfInstanceItemSet {
    @xmlName("item")
    member: InstanceItemSet,
}

structure InstanceItemSet {
    @xmlName("count")
    @ec2QueryName("count")
    Count: Integer,
    @xmlName("type")
    @ec2QueryName("type")
    Type: String,
}

list ListOfRouterItemSet {
    @xmlName("item")
    member: RouterItemSet,
}

structure RouterItemSet {
    @xmlName("count")
    @ec2QueryName("count")
    Count: Integer,
    @xmlName("type")
    @ec2QueryName("type")
    Type: String,
}

list ListOfVpnGatewayItemSet {
    @xmlName("item")
    member: VpnGatewayItemSet,
}

structure VpnGatewayItemSet {
    @xmlName("count")
    @ec2QueryName("count")
    Count: Integer,
    @xmlName("type")
    @ec2QueryName("type")
    Type: String,
}

list ListOfElasticIpItemSet {
    @xmlName("item")
    member: ElasticIpItemSet,
}

structure ElasticIpItemSet {
    @xmlName("count")
    @ec2QueryName("count")
    Count: Integer,
    @xmlName("type")
    @ec2QueryName("type")
    Type: String,
}

list ListOfPremiumSupportSet {
    @xmlName("item")
    member: PremiumSupportSet,
}

structure PremiumSupportSet {
    @xmlName("supportName")
    @ec2QueryName("supportName")
    SupportName: String,
}

list ListOfNetworkInterfaceItemSet {
    @xmlName("item")
    member: NetworkInterfaceItemSet,
}

structure NetworkInterfaceItemSet {
    @xmlName("count")
    @ec2QueryName("count")
    Count: Integer,
    @xmlName("type")
    @ec2QueryName("type")
    Type: String,
}

list ListOfRemoteAccessVpnGatewaySet {
    @xmlName("item")
    member: RemoteAccessVpnGatewaySet,
}

structure RemoteAccessVpnGatewaySet {
    @xmlName("count")
    @ec2QueryName("count")
    Count: Integer,
    @xmlName("type")
    @ec2QueryName("type")
    Type: String,
}

list ListOfMultiIpAddressItemSet {
    @xmlName("item")
    member: MultiIpAddressItemSet,
}

structure MultiIpAddressItemSet {
    @xmlName("count")
    @ec2QueryName("count")
    Count: Integer,
    @xmlName("type")
    @ec2QueryName("type")
    Type: String,
}

list ListOfMigrationHubItemSet {
    @xmlName("item")
    member: MigrationHubItemSet,
}

structure MigrationHubItemSet {
    @xmlName("count")
    @ec2QueryName("count")
    Count: Integer,
    @xmlName("type")
    @ec2QueryName("type")
    Type: String,
}

structure DescribeServiceStatusRequest {
    @xmlName("FromDate")
    @ec2QueryName("FromDate")
    FromDate: String,
    @xmlName("ToDate")
    @ec2QueryName("ToDate")
    ToDate: String,
}

structure DescribeServiceStatusResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("serviceStatusSet")
    @ec2QueryName("serviceStatusSet")
    ServiceStatusSet: ListOfServiceStatusSet,
}

list ListOfServiceStatusSet {
    @xmlName("item")
    member: ServiceStatusSet,
}

structure ServiceStatusSet {
    @xmlName("controlPanelStatus")
    @ec2QueryName("controlPanelStatus")
    ControlPanelStatus: String,
    @xmlName("date")
    @ec2QueryName("date")
    Date: String,
    @xmlName("diskStatus")
    @ec2QueryName("diskStatus")
    DiskStatus: String,
    @xmlName("instanceStatus")
    @ec2QueryName("instanceStatus")
    InstanceStatus: String,
    @xmlName("networkStatus")
    @ec2QueryName("networkStatus")
    NetworkStatus: String,
    @xmlName("storageStatus")
    @ec2QueryName("storageStatus")
    StorageStatus: String,
}

structure DescribeUsageRequest {
    @xmlName("IsCharge")
    @ec2QueryName("IsCharge")
    IsCharge: Boolean,
    @xmlName("Region")
    @ec2QueryName("Region")
    Region: String,
    @xmlName("YearMonth")
    @ec2QueryName("YearMonth")
    YearMonth: String,
}

structure DescribeUsageResult {
    @xmlName("autoScaleInfo")
    @ec2QueryName("autoScaleInfo")
    AutoScaleInfo: AutoScaleInfo,
    @xmlName("chargeDetailInfo")
    @ec2QueryName("chargeDetailInfo")
    ChargeDetailInfo: ChargeDetailInfo,
    @xmlName("copyInfo")
    @ec2QueryName("copyInfo")
    CopyInfo: CopyInfoOfDescribeUsage,
    @xmlName("elasticIpInfo")
    @ec2QueryName("elasticIpInfo")
    ElasticIpInfo: ElasticIpInfo,
    @xmlName("elasticLoadBalancerInfo")
    @ec2QueryName("elasticLoadBalancerInfo")
    ElasticLoadBalancerInfo: ElasticLoadBalancerInfo,
    @xmlName("extraChargeInfo")
    @ec2QueryName("extraChargeInfo")
    ExtraChargeInfo: ExtraChargeInfo,
    @xmlName("imageInfo")
    @ec2QueryName("imageInfo")
    ImageInfo: ImageInfo,
    @xmlName("instanceBackupInfo")
    @ec2QueryName("instanceBackupInfo")
    InstanceBackupInfo: InstanceBackupInfo,
    @xmlName("instanceInfo")
    @ec2QueryName("instanceInfo")
    InstanceInfo: InstanceInfo,
    @xmlName("internetVpnInfo")
    @ec2QueryName("internetVpnInfo")
    InternetVpnInfo: InternetVpnInfo,
    @xmlName("licenseInfo")
    @ec2QueryName("licenseInfo")
    LicenseInfo: LicenseInfo,
    @xmlName("liveMigrationInfo")
    @ec2QueryName("liveMigrationInfo")
    LiveMigrationInfo: LiveMigrationInfo,
    @xmlName("loadBalancerInfo")
    @ec2QueryName("loadBalancerInfo")
    LoadBalancerInfo: LoadBalancerInfo,
    @xmlName("multiAccountInfo")
    @ec2QueryName("multiAccountInfo")
    MultiAccountInfo: MultiAccountInfo,
    @xmlName("multiIpAddressInfo")
    @ec2QueryName("multiIpAddressInfo")
    MultiIpAddressInfo: MultiIpAddressInfo,
    @xmlName("networkInfo")
    @ec2QueryName("networkInfo")
    NetworkInfo: NetworkInfo,
    @xmlName("networkInterfaceInfo")
    @ec2QueryName("networkInterfaceInfo")
    NetworkInterfaceInfo: NetworkInterfaceInfo,
    @xmlName("optionCommonInfo")
    @ec2QueryName("optionCommonInfo")
    OptionCommonInfo: ListOfOptionCommonInfo,
    @xmlName("optionInfo")
    @ec2QueryName("optionInfo")
    OptionInfo: ListOfOptionInfo,
    @xmlName("osOptionChargeInfo")
    @ec2QueryName("osOptionChargeInfo")
    OsOptionChargeInfo: OsOptionChargeInfo,
    @xmlName("patternAuthInfo")
    @ec2QueryName("patternAuthInfo")
    PatternAuthInfo: PatternAuthInfo,
    @xmlName("premiumSupportInfo")
    @ec2QueryName("premiumSupportInfo")
    PremiumSupportInfo: PremiumSupportInfo,
    @xmlName("privateLanInfo")
    @ec2QueryName("privateLanInfo")
    PrivateLanInfo: PrivateLanInfo,
    @xmlName("privateNetworkInfo")
    @ec2QueryName("privateNetworkInfo")
    PrivateNetworkInfo: PrivateNetworkInfo,
    @xmlName("remoteAccessVpnGatewayInfo")
    @ec2QueryName("remoteAccessVpnGatewayInfo")
    RemoteAccessVpnGatewayInfo: RemoteAccessVpnGatewayInfo,
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("routerInfo")
    @ec2QueryName("routerInfo")
    RouterInfo: RouterInfo,
    @xmlName("securityGroupInfo")
    @ec2QueryName("securityGroupInfo")
    SecurityGroupInfo: SecurityGroupInfoOfDescribeUsage,
    @xmlName("snapshotInfo")
    @ec2QueryName("snapshotInfo")
    SnapshotInfo: SnapshotInfo,
    @xmlName("sslCertInfo")
    @ec2QueryName("sslCertInfo")
    SslCertInfo: SslCertInfo,
    @xmlName("volumeInfo")
    @ec2QueryName("volumeInfo")
    VolumeInfo: VolumeInfo,
    @xmlName("vpnGatewayInfo")
    @ec2QueryName("vpnGatewayInfo")
    VpnGatewayInfo: VpnGatewayInfo,
    @xmlName("yearMonth")
    @ec2QueryName("yearMonth")
    YearMonth: String,
}

structure InstanceInfo {
    @xmlName("dynamicIpMeasuredRate")
    @ec2QueryName("dynamicIpMeasuredRate")
    DynamicIpMeasuredRate: DynamicIpMeasuredRate,
    @xmlName("dynamicIpMonthlyRate")
    @ec2QueryName("dynamicIpMonthlyRate")
    DynamicIpMonthlyRate: DynamicIpMonthlyRate,
    @xmlName("instanceMonthlyRateSet")
    @ec2QueryName("instanceMonthlyRateSet")
    InstanceMonthlyRateSet: ListOfInstanceMonthlyRateSet,
    @xmlName("multiIpMonthlyRate")
    @ec2QueryName("multiIpMonthlyRate")
    MultiIpMonthlyRate: MultiIpMonthlyRate,
    @xmlName("osMeasuredRate")
    @ec2QueryName("osMeasuredRate")
    OsMeasuredRate: ListOfOsMeasuredRate,
    @xmlName("osMonthlyRate")
    @ec2QueryName("osMonthlyRate")
    OsMonthlyRate: ListOfOsMonthlyRate,
    @xmlName("runningInstanceMeasuredRateSet")
    @ec2QueryName("runningInstanceMeasuredRateSet")
    RunningInstanceMeasuredRateSet: ListOfRunningInstanceMeasuredRateSet,
    @xmlName("stoppedInstanceMeasuredRateSet")
    @ec2QueryName("stoppedInstanceMeasuredRateSet")
    StoppedInstanceMeasuredRateSet: ListOfStoppedInstanceMeasuredRateSet,
}

list ListOfInstanceMonthlyRateSet {
    @xmlName("item")
    member: InstanceMonthlyRateSet,
}

structure InstanceMonthlyRateSet {
    @xmlName("charge")
    @ec2QueryName("charge")
    Charge: Integer,
    @xmlName("type")
    @ec2QueryName("type")
    Type: String,
    @xmlName("unit")
    @ec2QueryName("unit")
    Unit: String,
    @xmlName("value")
    @ec2QueryName("value")
    Value: Integer,
}

list ListOfRunningInstanceMeasuredRateSet {
    @xmlName("item")
    member: RunningInstanceMeasuredRateSet,
}

structure RunningInstanceMeasuredRateSet {
    @xmlName("charge")
    @ec2QueryName("charge")
    Charge: Integer,
    @xmlName("type")
    @ec2QueryName("type")
    Type: String,
    @xmlName("unit")
    @ec2QueryName("unit")
    Unit: String,
    @xmlName("value")
    @ec2QueryName("value")
    Value: Integer,
}

list ListOfStoppedInstanceMeasuredRateSet {
    @xmlName("item")
    member: StoppedInstanceMeasuredRateSet,
}

structure StoppedInstanceMeasuredRateSet {
    @xmlName("charge")
    @ec2QueryName("charge")
    Charge: Integer,
    @xmlName("type")
    @ec2QueryName("type")
    Type: String,
    @xmlName("unit")
    @ec2QueryName("unit")
    Unit: String,
    @xmlName("value")
    @ec2QueryName("value")
    Value: Integer,
}

structure DynamicIpMonthlyRate {
    @xmlName("charge")
    @ec2QueryName("charge")
    Charge: Integer,
    @xmlName("type")
    @ec2QueryName("type")
    Type: String,
    @xmlName("unit")
    @ec2QueryName("unit")
    Unit: String,
    @xmlName("value")
    @ec2QueryName("value")
    Value: Integer,
}

structure DynamicIpMeasuredRate {
    @xmlName("charge")
    @ec2QueryName("charge")
    Charge: Integer,
    @xmlName("type")
    @ec2QueryName("type")
    Type: String,
    @xmlName("unit")
    @ec2QueryName("unit")
    Unit: String,
    @xmlName("value")
    @ec2QueryName("value")
    Value: Integer,
}

list ListOfOsMonthlyRate {
    @xmlName("item")
    member: OsMonthlyRate,
}

structure OsMonthlyRate {
    @xmlName("charge")
    @ec2QueryName("charge")
    Charge: Integer,
    @xmlName("type")
    @ec2QueryName("type")
    Type: String,
    @xmlName("unit")
    @ec2QueryName("unit")
    Unit: String,
    @xmlName("value")
    @ec2QueryName("value")
    Value: Integer,
}

list ListOfOsMeasuredRate {
    @xmlName("item")
    member: OsMeasuredRate,
}

structure OsMeasuredRate {
    @xmlName("charge")
    @ec2QueryName("charge")
    Charge: Integer,
    @xmlName("type")
    @ec2QueryName("type")
    Type: String,
    @xmlName("unit")
    @ec2QueryName("unit")
    Unit: String,
    @xmlName("value")
    @ec2QueryName("value")
    Value: Integer,
}

structure MultiIpMonthlyRate {
    @xmlName("charge")
    @ec2QueryName("charge")
    Charge: Integer,
    @xmlName("type")
    @ec2QueryName("type")
    Type: String,
    @xmlName("unit")
    @ec2QueryName("unit")
    Unit: String,
    @xmlName("value")
    @ec2QueryName("value")
    Value: Integer,
}

structure CopyInfoOfDescribeUsage {
    @xmlName("instanceCopy")
    @ec2QueryName("instanceCopy")
    InstanceCopy: InstanceCopy,
}

structure InstanceCopy {
    @xmlName("charge")
    @ec2QueryName("charge")
    Charge: Integer,
    @xmlName("type")
    @ec2QueryName("type")
    Type: String,
    @xmlName("unit")
    @ec2QueryName("unit")
    Unit: String,
    @xmlName("value")
    @ec2QueryName("value")
    Value: Integer,
}

structure ImageInfo {
    @xmlName("createImage")
    @ec2QueryName("createImage")
    CreateImage: CreateImage,
    @xmlName("keepImageSet")
    @ec2QueryName("keepImageSet")
    KeepImageSet: ListOfKeepImageSet,
}

structure CreateImage {
    @xmlName("charge")
    @ec2QueryName("charge")
    Charge: Integer,
    @xmlName("type")
    @ec2QueryName("type")
    Type: String,
    @xmlName("unit")
    @ec2QueryName("unit")
    Unit: String,
    @xmlName("value")
    @ec2QueryName("value")
    Value: Integer,
}

list ListOfKeepImageSet {
    @xmlName("item")
    member: KeepImageSet,
}

structure KeepImageSet {
    @xmlName("charge")
    @ec2QueryName("charge")
    Charge: Integer,
    @xmlName("type")
    @ec2QueryName("type")
    Type: String,
    @xmlName("unit")
    @ec2QueryName("unit")
    Unit: String,
    @xmlName("value")
    @ec2QueryName("value")
    Value: Integer,
}

structure VolumeInfo {
    @xmlName("importInstanceDiskMeasuredRate")
    @ec2QueryName("importInstanceDiskMeasuredRate")
    ImportInstanceDiskMeasuredRate: ImportInstanceDiskMeasuredRate,
    @xmlName("importInstanceDiskMonthlyRate")
    @ec2QueryName("importInstanceDiskMonthlyRate")
    ImportInstanceDiskMonthlyRate: ImportInstanceDiskMonthlyRate,
    @xmlName("volumeMeasuredRateSet")
    @ec2QueryName("volumeMeasuredRateSet")
    VolumeMeasuredRateSet: ListOfVolumeMeasuredRateSet,
    @xmlName("volumeSet")
    @ec2QueryName("volumeSet")
    VolumeSet: ListOfVolumeSetOfDescribeUsage,
}

list ListOfVolumeSetOfDescribeUsage {
    @xmlName("item")
    member: VolumeSetOfDescribeUsage,
}

structure VolumeSetOfDescribeUsage {
    @xmlName("charge")
    @ec2QueryName("charge")
    Charge: Integer,
    @xmlName("type")
    @ec2QueryName("type")
    Type: String,
    @xmlName("unit")
    @ec2QueryName("unit")
    Unit: String,
    @xmlName("value")
    @ec2QueryName("value")
    Value: Integer,
}

list ListOfVolumeMeasuredRateSet {
    @xmlName("item")
    member: VolumeMeasuredRateSet,
}

structure VolumeMeasuredRateSet {
    @xmlName("charge")
    @ec2QueryName("charge")
    Charge: Integer,
    @xmlName("type")
    @ec2QueryName("type")
    Type: String,
    @xmlName("unit")
    @ec2QueryName("unit")
    Unit: String,
    @xmlName("value")
    @ec2QueryName("value")
    Value: Integer,
}

structure ImportInstanceDiskMonthlyRate {
    @xmlName("charge")
    @ec2QueryName("charge")
    Charge: Integer,
    @xmlName("type")
    @ec2QueryName("type")
    Type: String,
    @xmlName("unit")
    @ec2QueryName("unit")
    Unit: String,
    @xmlName("value")
    @ec2QueryName("value")
    Value: Integer,
}

structure ImportInstanceDiskMeasuredRate {
    @xmlName("charge")
    @ec2QueryName("charge")
    Charge: Integer,
    @xmlName("type")
    @ec2QueryName("type")
    Type: String,
    @xmlName("unit")
    @ec2QueryName("unit")
    Unit: String,
    @xmlName("value")
    @ec2QueryName("value")
    Value: Integer,
}

structure NetworkInfo {
    @xmlName("networkFlowSet")
    @ec2QueryName("networkFlowSet")
    NetworkFlowSet: ListOfNetworkFlowSet,
}

list ListOfNetworkFlowSet {
    @xmlName("item")
    member: NetworkFlowSet,
}

structure NetworkFlowSet {
    @xmlName("charge")
    @ec2QueryName("charge")
    Charge: Integer,
    @xmlName("type")
    @ec2QueryName("type")
    Type: String,
    @xmlName("unit")
    @ec2QueryName("unit")
    Unit: String,
    @xmlName("value")
    @ec2QueryName("value")
    Value: Integer,
}

structure SecurityGroupInfoOfDescribeUsage {
    @xmlName("optionSet")
    @ec2QueryName("optionSet")
    OptionSet: ListOfOptionSet,
    @xmlName("securityGroupApplyTime")
    @ec2QueryName("securityGroupApplyTime")
    SecurityGroupApplyTime: SecurityGroupApplyTime,
}

structure SecurityGroupApplyTime {
    @xmlName("charge")
    @ec2QueryName("charge")
    Charge: Integer,
    @xmlName("type")
    @ec2QueryName("type")
    Type: String,
    @xmlName("unit")
    @ec2QueryName("unit")
    Unit: String,
    @xmlName("value")
    @ec2QueryName("value")
    Value: Integer,
}

list ListOfOptionSet {
    @xmlName("item")
    member: OptionSet,
}

structure OptionSet {
    @xmlName("charge")
    @ec2QueryName("charge")
    Charge: Integer,
    @xmlName("type")
    @ec2QueryName("type")
    Type: String,
    @xmlName("unit")
    @ec2QueryName("unit")
    Unit: String,
    @xmlName("value")
    @ec2QueryName("value")
    Value: Integer,
}

structure LoadBalancerInfo {
    @xmlName("optionSet")
    @ec2QueryName("optionSet")
    OptionSet: ListOfOptionSet,
    @xmlName("vipMeasuredRateSet")
    @ec2QueryName("vipMeasuredRateSet")
    VipMeasuredRateSet: ListOfVipMeasuredRateSet,
    @xmlName("vipSet")
    @ec2QueryName("vipSet")
    VipSet: ListOfVipSet,
}

list ListOfVipSet {
    @xmlName("item")
    member: VipSet,
}

structure VipSet {
    @xmlName("charge")
    @ec2QueryName("charge")
    Charge: Integer,
    @xmlName("type")
    @ec2QueryName("type")
    Type: String,
    @xmlName("unit")
    @ec2QueryName("unit")
    Unit: String,
    @xmlName("value")
    @ec2QueryName("value")
    Value: Integer,
}

list ListOfVipMeasuredRateSet {
    @xmlName("item")
    member: VipMeasuredRateSet,
}

structure VipMeasuredRateSet {
    @xmlName("charge")
    @ec2QueryName("charge")
    Charge: Integer,
    @xmlName("type")
    @ec2QueryName("type")
    Type: String,
    @xmlName("unit")
    @ec2QueryName("unit")
    Unit: String,
    @xmlName("value")
    @ec2QueryName("value")
    Value: Integer,
}

structure ElasticIpInfo {
    @xmlName("elasticIpSet")
    @ec2QueryName("elasticIpSet")
    ElasticIpSet: ListOfElasticIpSet,
}

list ListOfElasticIpSet {
    @xmlName("item")
    member: ElasticIpSet,
}

structure ElasticIpSet {
    @xmlName("charge")
    @ec2QueryName("charge")
    Charge: Integer,
    @xmlName("type")
    @ec2QueryName("type")
    Type: String,
    @xmlName("unit")
    @ec2QueryName("unit")
    Unit: String,
    @xmlName("value")
    @ec2QueryName("value")
    Value: Integer,
}

structure AutoScaleInfo {
    @xmlName("autoScaleCount")
    @ec2QueryName("autoScaleCount")
    AutoScaleCount: AutoScaleCount,
    @xmlName("runningScaleOutInstanceSet")
    @ec2QueryName("runningScaleOutInstanceSet")
    RunningScaleOutInstanceSet: ListOfRunningScaleOutInstanceSet,
    @xmlName("runningScaleOutOsSet")
    @ec2QueryName("runningScaleOutOsSet")
    RunningScaleOutOsSet: ListOfRunningScaleOutOsSet,
    @xmlName("stoppedScaleOutInstanceSet")
    @ec2QueryName("stoppedScaleOutInstanceSet")
    StoppedScaleOutInstanceSet: ListOfStoppedScaleOutInstanceSet,
    @xmlName("stoppedScaleOutOsSet")
    @ec2QueryName("stoppedScaleOutOsSet")
    StoppedScaleOutOsSet: ListOfStoppedScaleOutOsSet,
}

structure AutoScaleCount {
    @xmlName("charge")
    @ec2QueryName("charge")
    Charge: Integer,
    @xmlName("type")
    @ec2QueryName("type")
    Type: String,
    @xmlName("unit")
    @ec2QueryName("unit")
    Unit: String,
    @xmlName("value")
    @ec2QueryName("value")
    Value: Integer,
}

list ListOfRunningScaleOutInstanceSet {
    @xmlName("item")
    member: RunningScaleOutInstanceSet,
}

structure RunningScaleOutInstanceSet {
    @xmlName("charge")
    @ec2QueryName("charge")
    Charge: Integer,
    @xmlName("type")
    @ec2QueryName("type")
    Type: String,
    @xmlName("unit")
    @ec2QueryName("unit")
    Unit: String,
    @xmlName("value")
    @ec2QueryName("value")
    Value: Integer,
}

list ListOfStoppedScaleOutInstanceSet {
    @xmlName("item")
    member: StoppedScaleOutInstanceSet,
}

structure StoppedScaleOutInstanceSet {
    @xmlName("charge")
    @ec2QueryName("charge")
    Charge: Integer,
    @xmlName("type")
    @ec2QueryName("type")
    Type: String,
    @xmlName("unit")
    @ec2QueryName("unit")
    Unit: String,
    @xmlName("value")
    @ec2QueryName("value")
    Value: Integer,
}

list ListOfRunningScaleOutOsSet {
    @xmlName("item")
    member: RunningScaleOutOsSet,
}

structure RunningScaleOutOsSet {
    @xmlName("charge")
    @ec2QueryName("charge")
    Charge: Integer,
    @xmlName("type")
    @ec2QueryName("type")
    Type: String,
    @xmlName("unit")
    @ec2QueryName("unit")
    Unit: String,
    @xmlName("value")
    @ec2QueryName("value")
    Value: Integer,
}

list ListOfStoppedScaleOutOsSet {
    @xmlName("item")
    member: StoppedScaleOutOsSet,
}

structure StoppedScaleOutOsSet {
    @xmlName("charge")
    @ec2QueryName("charge")
    Charge: Integer,
    @xmlName("type")
    @ec2QueryName("type")
    Type: String,
    @xmlName("unit")
    @ec2QueryName("unit")
    Unit: String,
    @xmlName("value")
    @ec2QueryName("value")
    Value: Integer,
}

structure SslCertInfo {
    @xmlName("createSslCertSet")
    @ec2QueryName("createSslCertSet")
    CreateSslCertSet: ListOfCreateSslCertSet,
}

list ListOfCreateSslCertSet {
    @xmlName("item")
    member: CreateSslCertSet,
}

structure CreateSslCertSet {
    @xmlName("charge")
    @ec2QueryName("charge")
    Charge: Integer,
    @xmlName("type")
    @ec2QueryName("type")
    Type: String,
    @xmlName("unit")
    @ec2QueryName("unit")
    Unit: String,
    @xmlName("value")
    @ec2QueryName("value")
    Value: Integer,
}

structure PrivateLanInfo {
    @xmlName("privateLan")
    @ec2QueryName("privateLan")
    PrivateLan: PrivateLan,
}

structure PrivateLan {
    @xmlName("charge")
    @ec2QueryName("charge")
    Charge: Integer,
    @xmlName("type")
    @ec2QueryName("type")
    Type: String,
    @xmlName("unit")
    @ec2QueryName("unit")
    Unit: String,
    @xmlName("value")
    @ec2QueryName("value")
    Value: Integer,
}

structure ChargeDetailInfo {
    @xmlName("chargeDetail")
    @ec2QueryName("chargeDetail")
    ChargeDetail: ChargeDetail,
}

structure ChargeDetail {
    @xmlName("charge")
    @ec2QueryName("charge")
    Charge: Integer,
    @xmlName("value")
    @ec2QueryName("value")
    Value: Integer,
}

structure PremiumSupportInfo {
    @xmlName("premiumSupportSet")
    @ec2QueryName("premiumSupportSet")
    PremiumSupportSet: ListOfPremiumSupportSetOfDescribeUsage,
}

list ListOfPremiumSupportSetOfDescribeUsage {
    @xmlName("item")
    member: PremiumSupportSetOfDescribeUsage,
}

structure PremiumSupportSetOfDescribeUsage {
    @xmlName("charge")
    @ec2QueryName("charge")
    Charge: Integer,
    @xmlName("type")
    @ec2QueryName("type")
    Type: String,
    @xmlName("unit")
    @ec2QueryName("unit")
    Unit: String,
    @xmlName("value")
    @ec2QueryName("value")
    Value: Integer,
}

structure MultiAccountInfo {
    @xmlName("multiAccount")
    @ec2QueryName("multiAccount")
    MultiAccount: MultiAccount,
}

structure MultiAccount {
    @xmlName("charge")
    @ec2QueryName("charge")
    Charge: Integer,
    @xmlName("unit")
    @ec2QueryName("unit")
    Unit: String,
    @xmlName("value")
    @ec2QueryName("value")
    Value: Integer,
}

structure PatternAuthInfo {
    @xmlName("patternAuthSet")
    @ec2QueryName("patternAuthSet")
    PatternAuthSet: ListOfPatternAuthSet,
}

list ListOfPatternAuthSet {
    @xmlName("item")
    member: PatternAuthSet,
}

structure PatternAuthSet {
    @xmlName("charge")
    @ec2QueryName("charge")
    Charge: Integer,
    @xmlName("type")
    @ec2QueryName("type")
    Type: String,
    @xmlName("unit")
    @ec2QueryName("unit")
    Unit: String,
    @xmlName("value")
    @ec2QueryName("value")
    Value: Integer,
}

structure OsOptionChargeInfo {
    @xmlName("osOptionChargeMonthlyRateSet")
    @ec2QueryName("osOptionChargeMonthlyRateSet")
    OsOptionChargeMonthlyRateSet: ListOfOsOptionChargeMonthlyRateSet,
}

list ListOfOsOptionChargeMonthlyRateSet {
    @xmlName("item")
    member: OsOptionChargeMonthlyRateSet,
}

structure OsOptionChargeMonthlyRateSet {
    @xmlName("charge")
    @ec2QueryName("charge")
    Charge: Integer,
    @xmlName("type")
    @ec2QueryName("type")
    Type: String,
    @xmlName("unit")
    @ec2QueryName("unit")
    Unit: String,
    @xmlName("value")
    @ec2QueryName("value")
    Value: Integer,
}

structure ExtraChargeInfo {
    @xmlName("extraChargeMonthlyRateSet")
    @ec2QueryName("extraChargeMonthlyRateSet")
    ExtraChargeMonthlyRateSet: ListOfExtraChargeMonthlyRateSet,
}

list ListOfExtraChargeMonthlyRateSet {
    @xmlName("item")
    member: ExtraChargeMonthlyRateSet,
}

structure ExtraChargeMonthlyRateSet {
    @xmlName("charge")
    @ec2QueryName("charge")
    Charge: Integer,
    @xmlName("type")
    @ec2QueryName("type")
    Type: String,
    @xmlName("unit")
    @ec2QueryName("unit")
    Unit: String,
    @xmlName("value")
    @ec2QueryName("value")
    Value: Integer,
}

structure LicenseInfo {
    @xmlName("licenseMonthlyRateSet")
    @ec2QueryName("licenseMonthlyRateSet")
    LicenseMonthlyRateSet: ListOfLicenseMonthlyRateSet,
}

list ListOfLicenseMonthlyRateSet {
    @xmlName("item")
    member: LicenseMonthlyRateSet,
}

structure LicenseMonthlyRateSet {
    @xmlName("charge")
    @ec2QueryName("charge")
    Charge: Integer,
    @xmlName("type")
    @ec2QueryName("type")
    Type: String,
    @xmlName("unit")
    @ec2QueryName("unit")
    Unit: String,
    @xmlName("value")
    @ec2QueryName("value")
    Value: Integer,
}

list ListOfOptionCommonInfo {
    @xmlName("item")
    member: OptionCommonInfo,
}

structure OptionCommonInfo {
    @xmlName("optionName")
    @ec2QueryName("optionName")
    OptionName: String,
    @xmlName("optionSet")
    @ec2QueryName("optionSet")
    OptionSet: ListOfOptionSet,
}

list ListOfOptionInfo {
    @xmlName("item")
    member: OptionInfo,
}

structure OptionInfo {
    @xmlName("optionName")
    @ec2QueryName("optionName")
    OptionName: String,
    @xmlName("optionSet")
    @ec2QueryName("optionSet")
    OptionSet: ListOfOptionSet,
}

structure InternetVpnInfo {
    @xmlName("internetVpnInitial")
    @ec2QueryName("internetVpnInitial")
    InternetVpnInitial: InternetVpnInitial,
    @xmlName("internetVpnMonthlyRateSet")
    @ec2QueryName("internetVpnMonthlyRateSet")
    InternetVpnMonthlyRateSet: ListOfInternetVpnMonthlyRateSet,
}

structure InternetVpnInitial {
    @xmlName("charge")
    @ec2QueryName("charge")
    Charge: Integer,
    @xmlName("type")
    @ec2QueryName("type")
    Type: String,
    @xmlName("unit")
    @ec2QueryName("unit")
    Unit: String,
    @xmlName("value")
    @ec2QueryName("value")
    Value: Integer,
}

list ListOfInternetVpnMonthlyRateSet {
    @xmlName("item")
    member: InternetVpnMonthlyRateSet,
}

structure InternetVpnMonthlyRateSet {
    @xmlName("charge")
    @ec2QueryName("charge")
    Charge: Integer,
    @xmlName("type")
    @ec2QueryName("type")
    Type: String,
    @xmlName("value")
    @ec2QueryName("value")
    Value: Integer,
}

structure SnapshotInfo {
    @xmlName("snapShot")
    @ec2QueryName("snapShot")
    SnapShot: SnapShot,
}

structure SnapShot {
    @xmlName("charge")
    @ec2QueryName("charge")
    Charge: Integer,
    @xmlName("unit")
    @ec2QueryName("unit")
    Unit: String,
    @xmlName("value")
    @ec2QueryName("value")
    Value: Integer,
}

structure PrivateNetworkInfo {
    @xmlName("privateNetworkMeasuredRate")
    @ec2QueryName("privateNetworkMeasuredRate")
    PrivateNetworkMeasuredRate: PrivateNetworkMeasuredRate,
    @xmlName("privateNetworkMonthlyRate")
    @ec2QueryName("privateNetworkMonthlyRate")
    PrivateNetworkMonthlyRate: PrivateNetworkMonthlyRate,
}

structure PrivateNetworkMonthlyRate {
    @xmlName("charge")
    @ec2QueryName("charge")
    Charge: Integer,
    @xmlName("value")
    @ec2QueryName("value")
    Value: Integer,
}

structure PrivateNetworkMeasuredRate {
    @xmlName("charge")
    @ec2QueryName("charge")
    Charge: Integer,
    @xmlName("unit")
    @ec2QueryName("unit")
    Unit: String,
    @xmlName("value")
    @ec2QueryName("value")
    Value: Integer,
}

structure RouterInfo {
    @xmlName("routerMeasuredRateSet")
    @ec2QueryName("routerMeasuredRateSet")
    RouterMeasuredRateSet: ListOfRouterMeasuredRateSet,
    @xmlName("routerMonthlyRateSet")
    @ec2QueryName("routerMonthlyRateSet")
    RouterMonthlyRateSet: ListOfRouterMonthlyRateSet,
}

list ListOfRouterMonthlyRateSet {
    @xmlName("item")
    member: RouterMonthlyRateSet,
}

structure RouterMonthlyRateSet {
    @xmlName("charge")
    @ec2QueryName("charge")
    Charge: Integer,
    @xmlName("type")
    @ec2QueryName("type")
    Type: String,
    @xmlName("unit")
    @ec2QueryName("unit")
    Unit: String,
    @xmlName("value")
    @ec2QueryName("value")
    Value: Integer,
}

list ListOfRouterMeasuredRateSet {
    @xmlName("item")
    member: RouterMeasuredRateSet,
}

structure RouterMeasuredRateSet {
    @xmlName("charge")
    @ec2QueryName("charge")
    Charge: Integer,
    @xmlName("type")
    @ec2QueryName("type")
    Type: String,
    @xmlName("unit")
    @ec2QueryName("unit")
    Unit: String,
    @xmlName("value")
    @ec2QueryName("value")
    Value: Integer,
}

structure VpnGatewayInfo {
    @xmlName("vpnGatewayMeasuredRateSet")
    @ec2QueryName("vpnGatewayMeasuredRateSet")
    VpnGatewayMeasuredRateSet: ListOfVpnGatewayMeasuredRateSet,
    @xmlName("vpnGatewayMonthlyRateSet")
    @ec2QueryName("vpnGatewayMonthlyRateSet")
    VpnGatewayMonthlyRateSet: ListOfVpnGatewayMonthlyRateSet,
}

list ListOfVpnGatewayMonthlyRateSet {
    @xmlName("item")
    member: VpnGatewayMonthlyRateSet,
}

structure VpnGatewayMonthlyRateSet {
    @xmlName("charge")
    @ec2QueryName("charge")
    Charge: Integer,
    @xmlName("type")
    @ec2QueryName("type")
    Type: String,
    @xmlName("unit")
    @ec2QueryName("unit")
    Unit: String,
    @xmlName("value")
    @ec2QueryName("value")
    Value: Integer,
}

list ListOfVpnGatewayMeasuredRateSet {
    @xmlName("item")
    member: VpnGatewayMeasuredRateSet,
}

structure VpnGatewayMeasuredRateSet {
    @xmlName("charge")
    @ec2QueryName("charge")
    Charge: Integer,
    @xmlName("type")
    @ec2QueryName("type")
    Type: String,
    @xmlName("unit")
    @ec2QueryName("unit")
    Unit: String,
    @xmlName("value")
    @ec2QueryName("value")
    Value: Integer,
}

structure ElasticLoadBalancerInfo {
    @xmlName("vip")
    @ec2QueryName("vip")
    Vip: ListOfVip,
    @xmlName("vipMeasuredRate")
    @ec2QueryName("vipMeasuredRate")
    VipMeasuredRate: ListOfVipMeasuredRate,
}

list ListOfVip {
    @xmlName("item")
    member: Vip,
}

structure Vip {
    @xmlName("charge")
    @ec2QueryName("charge")
    Charge: Integer,
    @xmlName("type")
    @ec2QueryName("type")
    Type: String,
    @xmlName("unit")
    @ec2QueryName("unit")
    Unit: String,
    @xmlName("value")
    @ec2QueryName("value")
    Value: Integer,
}

list ListOfVipMeasuredRate {
    @xmlName("item")
    member: VipMeasuredRate,
}

structure VipMeasuredRate {
    @xmlName("charge")
    @ec2QueryName("charge")
    Charge: Integer,
    @xmlName("type")
    @ec2QueryName("type")
    Type: String,
    @xmlName("unit")
    @ec2QueryName("unit")
    Unit: String,
    @xmlName("value")
    @ec2QueryName("value")
    Value: Integer,
}

structure NetworkInterfaceInfo {
    @xmlName("networkInterfaceMonthlyRateSet")
    @ec2QueryName("networkInterfaceMonthlyRateSet")
    NetworkInterfaceMonthlyRateSet: ListOfNetworkInterfaceMonthlyRateSet,
}

list ListOfNetworkInterfaceMonthlyRateSet {
    @xmlName("item")
    member: NetworkInterfaceMonthlyRateSet,
}

structure NetworkInterfaceMonthlyRateSet {
    @xmlName("charge")
    @ec2QueryName("charge")
    Charge: Integer,
    @xmlName("type")
    @ec2QueryName("type")
    Type: String,
    @xmlName("unit")
    @ec2QueryName("unit")
    Unit: String,
    @xmlName("value")
    @ec2QueryName("value")
    Value: Integer,
}

structure InstanceBackupInfo {
    @xmlName("instanceBackupBaseSet")
    @ec2QueryName("instanceBackupBaseSet")
    InstanceBackupBaseSet: ListOfInstanceBackupBaseSet,
    @xmlName("instanceBackupImportInstanceDiskSet")
    @ec2QueryName("instanceBackupImportInstanceDiskSet")
    InstanceBackupImportInstanceDiskSet: InstanceBackupImportInstanceDiskSet,
    @xmlName("instanceBackupVolumeSet")
    @ec2QueryName("instanceBackupVolumeSet")
    InstanceBackupVolumeSet: InstanceBackupVolumeSet,
}

list ListOfInstanceBackupBaseSet {
    @xmlName("item")
    member: InstanceBackupBaseSet,
}

structure InstanceBackupBaseSet {
    @xmlName("charge")
    @ec2QueryName("charge")
    Charge: Integer,
    @xmlName("type")
    @ec2QueryName("type")
    Type: String,
    @xmlName("unit")
    @ec2QueryName("unit")
    Unit: String,
    @xmlName("value")
    @ec2QueryName("value")
    Value: Integer,
}

structure InstanceBackupVolumeSet {
    @xmlName("charge")
    @ec2QueryName("charge")
    Charge: Integer,
    @xmlName("unit")
    @ec2QueryName("unit")
    Unit: String,
    @xmlName("value")
    @ec2QueryName("value")
    Value: Integer,
}

structure InstanceBackupImportInstanceDiskSet {
    @xmlName("charge")
    @ec2QueryName("charge")
    Charge: Integer,
    @xmlName("unit")
    @ec2QueryName("unit")
    Unit: String,
    @xmlName("value")
    @ec2QueryName("value")
    Value: Integer,
}

structure RemoteAccessVpnGatewayInfo {
    @xmlName("remoteAccessVpnGatewayMeasuredRateSet")
    @ec2QueryName("remoteAccessVpnGatewayMeasuredRateSet")
    RemoteAccessVpnGatewayMeasuredRateSet: ListOfRemoteAccessVpnGatewayMeasuredRateSet,
    @xmlName("remoteAccessVpnGatewayMonthlyRateSet")
    @ec2QueryName("remoteAccessVpnGatewayMonthlyRateSet")
    RemoteAccessVpnGatewayMonthlyRateSet: ListOfRemoteAccessVpnGatewayMonthlyRateSet,
}

list ListOfRemoteAccessVpnGatewayMonthlyRateSet {
    @xmlName("item")
    member: RemoteAccessVpnGatewayMonthlyRateSet,
}

structure RemoteAccessVpnGatewayMonthlyRateSet {
    @xmlName("charge")
    @ec2QueryName("charge")
    Charge: Integer,
    @xmlName("type")
    @ec2QueryName("type")
    Type: String,
    @xmlName("unit")
    @ec2QueryName("unit")
    Unit: String,
    @xmlName("value")
    @ec2QueryName("value")
    Value: Integer,
}

list ListOfRemoteAccessVpnGatewayMeasuredRateSet {
    @xmlName("item")
    member: RemoteAccessVpnGatewayMeasuredRateSet,
}

structure RemoteAccessVpnGatewayMeasuredRateSet {
    @xmlName("charge")
    @ec2QueryName("charge")
    Charge: Integer,
    @xmlName("type")
    @ec2QueryName("type")
    Type: String,
    @xmlName("unit")
    @ec2QueryName("unit")
    Unit: String,
    @xmlName("value")
    @ec2QueryName("value")
    Value: Integer,
}

structure MultiIpAddressInfo {
    @xmlName("multiIpAddressMonthlyRateSet")
    @ec2QueryName("multiIpAddressMonthlyRateSet")
    MultiIpAddressMonthlyRateSet: ListOfMultiIpAddressMonthlyRateSet,
}

list ListOfMultiIpAddressMonthlyRateSet {
    @xmlName("item")
    member: MultiIpAddressMonthlyRateSet,
}

structure MultiIpAddressMonthlyRateSet {
    @xmlName("charge")
    @ec2QueryName("charge")
    Charge: Integer,
    @xmlName("type")
    @ec2QueryName("type")
    Type: String,
    @xmlName("unit")
    @ec2QueryName("unit")
    Unit: String,
    @xmlName("value")
    @ec2QueryName("value")
    Value: Integer,
}

structure LiveMigrationInfo {
    @xmlName("liveMigrationHubMonthlyRateSet")
    @ec2QueryName("liveMigrationHubMonthlyRateSet")
    LiveMigrationHubMonthlyRateSet: ListOfLiveMigrationHubMonthlyRateSet,
    @xmlName("liveMigrationOperationMonthlyRateSet")
    @ec2QueryName("liveMigrationOperationMonthlyRateSet")
    LiveMigrationOperationMonthlyRateSet: ListOfLiveMigrationOperationMonthlyRateSet,
}

list ListOfLiveMigrationOperationMonthlyRateSet {
    @xmlName("item")
    member: LiveMigrationOperationMonthlyRateSet,
}

structure LiveMigrationOperationMonthlyRateSet {
    @xmlName("charge")
    @ec2QueryName("charge")
    Charge: Integer,
    @xmlName("type")
    @ec2QueryName("type")
    Type: String,
    @xmlName("unit")
    @ec2QueryName("unit")
    Unit: String,
    @xmlName("value")
    @ec2QueryName("value")
    Value: Integer,
}

list ListOfLiveMigrationHubMonthlyRateSet {
    @xmlName("item")
    member: LiveMigrationHubMonthlyRateSet,
}

structure LiveMigrationHubMonthlyRateSet {
    @xmlName("charge")
    @ec2QueryName("charge")
    Charge: Integer,
    @xmlName("type")
    @ec2QueryName("type")
    Type: String,
    @xmlName("unit")
    @ec2QueryName("unit")
    Unit: String,
    @xmlName("value")
    @ec2QueryName("value")
    Value: Integer,
}

structure RequestRangeOfDescribeUserActivities {
    @xmlName("EndNumber")
    @ec2QueryName("EndNumber")
    EndNumber: Integer,
    @xmlName("StartNumber")
    @ec2QueryName("StartNumber")
    StartNumber: Integer,
}

structure DescribeUserActivitiesRequest {
    @xmlName("Range")
    @ec2QueryName("Range")
    Range: RequestRangeOfDescribeUserActivities,
    @xmlName("YearMonth")
    @ec2QueryName("YearMonth")
    YearMonth: String,
}

structure DescribeUserActivitiesResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("userActivitiesSet")
    @ec2QueryName("userActivitiesSet")
    UserActivitiesSet: ListOfUserActivitiesSet,
}

list ListOfUserActivitiesSet {
    @xmlName("item")
    member: UserActivitiesSet,
}

structure UserActivitiesSet {
    @xmlName("categoryName")
    @ec2QueryName("categoryName")
    CategoryName: String,
    @xmlName("dateTime")
    @ec2QueryName("dateTime")
    DateTime: Timestamp,
    @xmlName("ipAddress")
    @ec2QueryName("ipAddress")
    IpAddress: String,
    @xmlName("operation")
    @ec2QueryName("operation")
    Operation: String,
    @xmlName("operator")
    @ec2QueryName("operator")
    Operator: String,
    @xmlName("result")
    @ec2QueryName("result")
    Result: Boolean,
    @xmlName("serviceId")
    @ec2QueryName("serviceId")
    ServiceId: String,
    @xmlName("uuid")
    @ec2QueryName("uuid")
    Uuid: String,
}

list ListOfRequestConversionTaskId {
    member: String,
}

structure DescribeUploadsRequest {
    @xmlName("ConversionTaskId")
    @ec2QueryName("ConversionTaskId")
    ConversionTaskId: ListOfRequestConversionTaskId,
}

structure DescribeUploadsResult {
    @xmlName("uploads")
    @ec2QueryName("uploads")
    Uploads: ListOfUploads,
}

list ListOfUploads {
    @xmlName("item")
    member: Uploads,
}

structure Uploads {
    @xmlName("conversionTaskId")
    @ec2QueryName("conversionTaskId")
    ConversionTaskId: Integer,
    @xmlName("expirationTime")
    @ec2QueryName("expirationTime")
    ExpirationTime: String,
    @xmlName("importInstance")
    @ec2QueryName("importInstance")
    ImportInstance: ImportInstanceOfDescribeUploads,
}

structure ImportInstanceOfDescribeUploads {
    @xmlName("availabilityZone")
    @ec2QueryName("availabilityZone")
    AvailabilityZone: String,
    @xmlName("image")
    @ec2QueryName("image")
    Image: Image,
    @xmlName("instanceId")
    @ec2QueryName("instanceId")
    InstanceId: String,
    @xmlName("instanceUniqueId")
    @ec2QueryName("instanceUniqueId")
    InstanceUniqueId: String,
}

structure CancelUploadRequest {
    @required
    @xmlName("ConversionTaskId")
    @ec2QueryName("ConversionTaskId")
    ConversionTaskId: String,
}

structure CancelUploadResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("return")
    @ec2QueryName("return")
    Return: Boolean,
}

structure RequestPlacementOfAllocateAddress {
    @xmlName("AvailabilityZone")
    @ec2QueryName("AvailabilityZone")
    AvailabilityZone: String,
}

structure AllocateAddressRequest {
    @xmlName("Domain")
    @ec2QueryName("Domain")
    Domain: String,
    @xmlName("InstanceId")
    @ec2QueryName("InstanceId")
    InstanceId: String,
    @xmlName("NiftyPrivateIp")
    @ec2QueryName("NiftyPrivateIp")
    NiftyPrivateIp: Boolean,
    @xmlName("Placement")
    @ec2QueryName("Placement")
    Placement: RequestPlacementOfAllocateAddress,
}

structure AllocateAddressResult {
    @xmlName("placement")
    @ec2QueryName("placement")
    Placement: Placement,
    @xmlName("privateIpAddress")
    @ec2QueryName("privateIpAddress")
    PrivateIpAddress: String,
    @xmlName("publicIp")
    @ec2QueryName("publicIp")
    PublicIp: String,
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
}

@enum([
  {
      name: "FORCE",
      value: "force",
  },
  {
      name: "TRUE",
      value: "true",
  },
  {
      name: "FALSE",
      value: "false",
  },
])
string NiftyRebootOfAssociateAddressRequest

structure AssociateAddressRequest {
    @xmlName("AllocationId")
    @ec2QueryName("AllocationId")
    AllocationId: String,
    @xmlName("AllowReassociation")
    @ec2QueryName("AllowReassociation")
    AllowReassociation: Boolean,
    @required
    @xmlName("InstanceId")
    @ec2QueryName("InstanceId")
    InstanceId: String,
    @xmlName("NetworkInterfaceId")
    @ec2QueryName("NetworkInterfaceId")
    NetworkInterfaceId: String,
    @xmlName("NiftyReboot")
    @ec2QueryName("NiftyReboot")
    NiftyReboot: NiftyRebootOfAssociateAddressRequest,
    @xmlName("PrivateIpAddress")
    @ec2QueryName("PrivateIpAddress")
    PrivateIpAddress: String,
    @xmlName("PublicIp")
    @ec2QueryName("PublicIp")
    PublicIp: String,
}

structure AssociateAddressResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("return")
    @ec2QueryName("return")
    Return: Boolean,
}

@enum([
  {
      name: "DESCRIPTION",
      value: "description",
  },
])
string AttributeOfNiftyModifyAddressAttributeRequest

structure NiftyModifyAddressAttributeRequest {
    @required
    @xmlName("Attribute")
    @ec2QueryName("Attribute")
    Attribute: AttributeOfNiftyModifyAddressAttributeRequest,
    @xmlName("PrivateIpAddress")
    @ec2QueryName("PrivateIpAddress")
    PrivateIpAddress: String,
    @xmlName("PublicIp")
    @ec2QueryName("PublicIp")
    PublicIp: String,
    @required
    @xmlName("Value")
    @ec2QueryName("Value")
    Value: String,
}

structure NiftyModifyAddressAttributeResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("return")
    @ec2QueryName("return")
    Return: Boolean,
}

list ListOfRequestPublicIp {
    member: String,
}

list ListOfRequestPrivateIpAddress {
    member: String,
}

list ListOfRequestAllocationId {
    member: String,
}

structure RequestFilterOfDescribeAddresses {
    @xmlName("Value")
    @ec2QueryName("Value")
    ListOfRequestValue: ListOfRequestValue,
    @xmlName("Name")
    @ec2QueryName("Name")
    Name: String,
}

list ListOfRequestFilterOfDescribeAddresses {
    member: RequestFilterOfDescribeAddresses,
}

structure DescribeAddressesRequest {
    @xmlName("AllocationId")
    @ec2QueryName("AllocationId")
    AllocationId: ListOfRequestAllocationId,
    @xmlName("Filter")
    @ec2QueryName("Filter")
    Filter: ListOfRequestFilterOfDescribeAddresses,
    @xmlName("PrivateIpAddress")
    @ec2QueryName("PrivateIpAddress")
    PrivateIpAddress: ListOfRequestPrivateIpAddress,
    @xmlName("PublicIp")
    @ec2QueryName("PublicIp")
    PublicIp: ListOfRequestPublicIp,
}

structure DescribeAddressesResult {
    @xmlName("addressesSet")
    @ec2QueryName("addressesSet")
    AddressesSet: ListOfAddressesSet,
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
}

list ListOfAddressesSet {
    @xmlName("item")
    member: AddressesSet,
}

structure AddressesSet {
    @xmlName("availabilityZone")
    @ec2QueryName("availabilityZone")
    AvailabilityZone: String,
    @xmlName("description")
    @ec2QueryName("description")
    Description: String,
    @xmlName("instanceId")
    @ec2QueryName("instanceId")
    InstanceId: String,
    @xmlName("instanceUniqueId")
    @ec2QueryName("instanceUniqueId")
    InstanceUniqueId: String,
    @xmlName("privateIpAddress")
    @ec2QueryName("privateIpAddress")
    PrivateIpAddress: String,
    @xmlName("publicIp")
    @ec2QueryName("publicIp")
    PublicIp: String,
}

@enum([
  {
      name: "FORCE",
      value: "force",
  },
  {
      name: "TRUE",
      value: "true",
  },
  {
      name: "FALSE",
      value: "false",
  },
])
string NiftyRebootOfDisassociateAddressRequest

structure DisassociateAddressRequest {
    @xmlName("AssociationId")
    @ec2QueryName("AssociationId")
    AssociationId: String,
    @xmlName("NiftyReboot")
    @ec2QueryName("NiftyReboot")
    NiftyReboot: NiftyRebootOfDisassociateAddressRequest,
    @xmlName("PrivateIpAddress")
    @ec2QueryName("PrivateIpAddress")
    PrivateIpAddress: String,
    @xmlName("PublicIp")
    @ec2QueryName("PublicIp")
    PublicIp: String,
}

structure DisassociateAddressResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("return")
    @ec2QueryName("return")
    Return: Boolean,
}

structure ReleaseAddressRequest {
    @xmlName("AllocationId")
    @ec2QueryName("AllocationId")
    AllocationId: String,
    @xmlName("PrivateIpAddress")
    @ec2QueryName("PrivateIpAddress")
    PrivateIpAddress: String,
    @xmlName("PublicIp")
    @ec2QueryName("PublicIp")
    PublicIp: String,
}

structure ReleaseAddressResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("return")
    @ec2QueryName("return")
    Return: Boolean,
}

@enum([
  {
      name: "FORCE",
      value: "force",
  },
  {
      name: "TRUE",
      value: "true",
  },
  {
      name: "FALSE",
      value: "false",
  },
])
string NiftyRebootOfAssociateMultiIpAddressGroupRequest

structure AssociateMultiIpAddressGroupRequest {
    @required
    @xmlName("InstanceUniqueId")
    @ec2QueryName("InstanceUniqueId")
    InstanceUniqueId: String,
    @required
    @xmlName("MultiIpAddressGroupId")
    @ec2QueryName("MultiIpAddressGroupId")
    MultiIpAddressGroupId: String,
    @xmlName("NiftyReboot")
    @ec2QueryName("NiftyReboot")
    NiftyReboot: NiftyRebootOfAssociateMultiIpAddressGroupRequest,
}

structure AssociateMultiIpAddressGroupResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("return")
    @ec2QueryName("return")
    Return: Boolean,
}

structure RequestPlacementOfCreateMultiIpAddressGroup {
    @required
    @xmlName("AvailabilityZone")
    @ec2QueryName("AvailabilityZone")
    AvailabilityZone: String,
}

structure CreateMultiIpAddressGroupRequest {
    @xmlName("Description")
    @ec2QueryName("Description")
    Description: String,
    @required
    @xmlName("IpAddressCount")
    @ec2QueryName("IpAddressCount")
    IpAddressCount: Integer,
    @required
    @xmlName("MultiIpAddressGroupName")
    @ec2QueryName("MultiIpAddressGroupName")
    MultiIpAddressGroupName: String,
    @required
    @xmlName("Placement")
    @ec2QueryName("Placement")
    Placement: RequestPlacementOfCreateMultiIpAddressGroup,
}

structure CreateMultiIpAddressGroupResult {
    @xmlName("multiIpAddressGroup")
    @ec2QueryName("multiIpAddressGroup")
    MultiIpAddressGroup: MultiIpAddressGroupOfCreateMultiIpAddressGroup,
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("return")
    @ec2QueryName("return")
    Return: Boolean,
}

structure MultiIpAddressGroupOfCreateMultiIpAddressGroup {
    @xmlName("availabilityZone")
    @ec2QueryName("availabilityZone")
    AvailabilityZone: String,
    @xmlName("createTime")
    @ec2QueryName("createTime")
    CreateTime: String,
    @xmlName("description")
    @ec2QueryName("description")
    Description: String,
    @xmlName("instancesSet")
    @ec2QueryName("instancesSet")
    InstancesSet: String,
    @xmlName("multiIpAddressGroupId")
    @ec2QueryName("multiIpAddressGroupId")
    MultiIpAddressGroupId: String,
    @xmlName("multiIpAddressGroupName")
    @ec2QueryName("multiIpAddressGroupName")
    MultiIpAddressGroupName: String,
    @xmlName("multiIpAddressNetwork")
    @ec2QueryName("multiIpAddressNetwork")
    MultiIpAddressNetwork: MultiIpAddressNetwork,
    @xmlName("status")
    @ec2QueryName("status")
    Status: String,
}

structure MultiIpAddressNetwork {
    @xmlName("defaultGateway")
    @ec2QueryName("defaultGateway")
    DefaultGateway: String,
    @xmlName("ipAddressesSet")
    @ec2QueryName("ipAddressesSet")
    IpAddressesSet: String,
    @xmlName("subnetMask")
    @ec2QueryName("subnetMask")
    SubnetMask: String,
}

structure DeleteMultiIpAddressGroupRequest {
    @required
    @xmlName("MultiIpAddressGroupId")
    @ec2QueryName("MultiIpAddressGroupId")
    MultiIpAddressGroupId: String,
}

structure DeleteMultiIpAddressGroupResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("return")
    @ec2QueryName("return")
    Return: Boolean,
}

list ListOfRequestMultiIpAddressGroupId {
    member: String,
}

structure DescribeMultiIpAddressGroupsRequest {
    @xmlName("MultiIpAddressGroupId")
    @ec2QueryName("MultiIpAddressGroupId")
    MultiIpAddressGroupId: ListOfRequestMultiIpAddressGroupId,
}

structure DescribeMultiIpAddressGroupsResult {
    @xmlName("multiIpAddressGroupsSet")
    @ec2QueryName("multiIpAddressGroupsSet")
    MultiIpAddressGroupsSet: ListOfMultiIpAddressGroupsSet,
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
}

list ListOfMultiIpAddressGroupsSet {
    @xmlName("item")
    member: MultiIpAddressGroupsSet,
}

structure MultiIpAddressGroupsSet {
    @xmlName("availabilityZone")
    @ec2QueryName("availabilityZone")
    AvailabilityZone: String,
    @xmlName("createTime")
    @ec2QueryName("createTime")
    CreateTime: String,
    @xmlName("description")
    @ec2QueryName("description")
    Description: String,
    @xmlName("instancesSet")
    @ec2QueryName("instancesSet")
    InstancesSet: ListOfInstancesSetOfDescribeMultiIpAddressGroups,
    @xmlName("multiIpAddressGroupId")
    @ec2QueryName("multiIpAddressGroupId")
    MultiIpAddressGroupId: String,
    @xmlName("multiIpAddressGroupName")
    @ec2QueryName("multiIpAddressGroupName")
    MultiIpAddressGroupName: String,
    @xmlName("multiIpAddressNetwork")
    @ec2QueryName("multiIpAddressNetwork")
    MultiIpAddressNetwork: MultiIpAddressNetworkOfDescribeMultiIpAddressGroups,
    @xmlName("status")
    @ec2QueryName("status")
    Status: String,
}

list ListOfInstancesSetOfDescribeMultiIpAddressGroups {
    @xmlName("item")
    member: InstancesSetOfDescribeMultiIpAddressGroups,
}

structure InstancesSetOfDescribeMultiIpAddressGroups {
    @xmlName("instanceId")
    @ec2QueryName("instanceId")
    InstanceId: String,
    @xmlName("instanceUniqueId")
    @ec2QueryName("instanceUniqueId")
    InstanceUniqueId: String,
}

structure MultiIpAddressNetworkOfDescribeMultiIpAddressGroups {
    @xmlName("defaultGateway")
    @ec2QueryName("defaultGateway")
    DefaultGateway: String,
    @xmlName("ipAddressesSet")
    @ec2QueryName("ipAddressesSet")
    IpAddressesSet: ListOfIpAddressesSet,
    @xmlName("subnetMask")
    @ec2QueryName("subnetMask")
    SubnetMask: String,
}

list ListOfIpAddressesSet {
    @xmlName("item")
    member: IpAddressesSet,
}

structure IpAddressesSet {
    @xmlName("ipAddress")
    @ec2QueryName("ipAddress")
    IpAddress: String,
}

@enum([
  {
      name: "FORCE",
      value: "force",
  },
  {
      name: "TRUE",
      value: "true",
  },
  {
      name: "FALSE",
      value: "false",
  },
])
string NiftyRebootOfDisassociateMultiIpAddressGroupRequest

structure DisassociateMultiIpAddressGroupRequest {
    @required
    @xmlName("InstanceUniqueId")
    @ec2QueryName("InstanceUniqueId")
    InstanceUniqueId: String,
    @required
    @xmlName("MultiIpAddressGroupId")
    @ec2QueryName("MultiIpAddressGroupId")
    MultiIpAddressGroupId: String,
    @xmlName("NiftyReboot")
    @ec2QueryName("NiftyReboot")
    NiftyReboot: NiftyRebootOfDisassociateMultiIpAddressGroupRequest,
}

structure DisassociateMultiIpAddressGroupResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("return")
    @ec2QueryName("return")
    Return: Boolean,
}

structure IncreaseMultiIpAddressCountRequest {
    @required
    @xmlName("IpAddressCount")
    @ec2QueryName("IpAddressCount")
    IpAddressCount: Integer,
    @required
    @xmlName("MultiIpAddressGroupId")
    @ec2QueryName("MultiIpAddressGroupId")
    MultiIpAddressGroupId: String,
}

structure IncreaseMultiIpAddressCountResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("return")
    @ec2QueryName("return")
    Return: Boolean,
}

structure ModifyMultiIpAddressGroupAttributeRequest {
    @xmlName("Description")
    @ec2QueryName("Description")
    Description: String,
    @required
    @xmlName("MultiIpAddressGroupId")
    @ec2QueryName("MultiIpAddressGroupId")
    MultiIpAddressGroupId: String,
    @xmlName("MultiIpAddressGroupName")
    @ec2QueryName("MultiIpAddressGroupName")
    MultiIpAddressGroupName: String,
}

structure ModifyMultiIpAddressGroupAttributeResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("return")
    @ec2QueryName("return")
    Return: Boolean,
}

list ListOfRequestIpAddress {
    member: String,
}

structure ReleaseMultiIpAddressesRequest {
    @required
    @xmlName("IpAddress")
    @ec2QueryName("IpAddress")
    IpAddress: ListOfRequestIpAddress,
    @required
    @xmlName("MultiIpAddressGroupId")
    @ec2QueryName("MultiIpAddressGroupId")
    MultiIpAddressGroupId: String,
}

structure ReleaseMultiIpAddressesResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("return")
    @ec2QueryName("return")
    Return: Boolean,
}

structure RequestPlacementOfCreateNetworkInterface {
    @xmlName("AvailabilityZone")
    @ec2QueryName("AvailabilityZone")
    AvailabilityZone: String,
}

structure CreateNetworkInterfaceRequest {
    @xmlName("Description")
    @ec2QueryName("Description")
    Description: String,
    @xmlName("IpAddress")
    @ec2QueryName("IpAddress")
    IpAddress: String,
    @required
    @xmlName("NiftyNetworkId")
    @ec2QueryName("NiftyNetworkId")
    NiftyNetworkId: String,
    @xmlName("Placement")
    @ec2QueryName("Placement")
    Placement: RequestPlacementOfCreateNetworkInterface,
}

structure CreateNetworkInterfaceResult {
    @xmlName("networkInterface")
    @ec2QueryName("networkInterface")
    NetworkInterface: NetworkInterface,
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("return")
    @ec2QueryName("return")
    Return: Boolean,
}

structure NetworkInterface {
    @xmlName("association")
    @ec2QueryName("association")
    Association: AssociationOfCreateNetworkInterface,
    @xmlName("attachment")
    @ec2QueryName("attachment")
    Attachment: AttachmentOfCreateNetworkInterface,
    @xmlName("availabilityZone")
    @ec2QueryName("availabilityZone")
    AvailabilityZone: String,
    @xmlName("description")
    @ec2QueryName("description")
    Description: String,
    @xmlName("groupSet")
    @ec2QueryName("groupSet")
    GroupSet: ListOfGroupSet,
    @xmlName("interfaceType")
    @ec2QueryName("interfaceType")
    InterfaceType: String,
    @xmlName("ipv6AddressesSet")
    @ec2QueryName("ipv6AddressesSet")
    Ipv6AddressesSet: ListOfIpv6AddressesSet,
    @xmlName("macAddress")
    @ec2QueryName("macAddress")
    MacAddress: String,
    @xmlName("networkInterfaceId")
    @ec2QueryName("networkInterfaceId")
    NetworkInterfaceId: String,
    @xmlName("niftyNetworkId")
    @ec2QueryName("niftyNetworkId")
    NiftyNetworkId: String,
    @xmlName("niftyNetworkName")
    @ec2QueryName("niftyNetworkName")
    NiftyNetworkName: String,
    @xmlName("ownerId")
    @ec2QueryName("ownerId")
    OwnerId: String,
    @xmlName("privateDnsName")
    @ec2QueryName("privateDnsName")
    PrivateDnsName: String,
    @xmlName("privateIpAddress")
    @ec2QueryName("privateIpAddress")
    PrivateIpAddress: String,
    @xmlName("privateIpAddressesSet")
    @ec2QueryName("privateIpAddressesSet")
    PrivateIpAddressesSet: ListOfPrivateIpAddressesSetOfCreateNetworkInterface,
    @xmlName("privateIpAddressV6")
    @ec2QueryName("privateIpAddressV6")
    PrivateIpAddressV6: String,
    @xmlName("requesterId")
    @ec2QueryName("requesterId")
    RequesterId: String,
    @xmlName("requesterManaged")
    @ec2QueryName("requesterManaged")
    RequesterManaged: String,
    @xmlName("sourceDestCheck")
    @ec2QueryName("sourceDestCheck")
    SourceDestCheck: String,
    @xmlName("status")
    @ec2QueryName("status")
    Status: String,
    @xmlName("subnetId")
    @ec2QueryName("subnetId")
    SubnetId: String,
    @xmlName("tagSet")
    @ec2QueryName("tagSet")
    TagSet: ListOfTagSet,
    @xmlName("vpcId")
    @ec2QueryName("vpcId")
    VpcId: String,
}

structure AssociationOfCreateNetworkInterface {
    @xmlName("allocationId")
    @ec2QueryName("allocationId")
    AllocationId: String,
    @xmlName("associationId")
    @ec2QueryName("associationId")
    AssociationId: String,
    @xmlName("ipOwnerId")
    @ec2QueryName("ipOwnerId")
    IpOwnerId: String,
    @xmlName("publicDnsName")
    @ec2QueryName("publicDnsName")
    PublicDnsName: String,
    @xmlName("publicIp")
    @ec2QueryName("publicIp")
    PublicIp: String,
    @xmlName("publicIpV6")
    @ec2QueryName("publicIpV6")
    PublicIpV6: String,
}

structure AttachmentOfCreateNetworkInterface {
    @xmlName("attachmentId")
    @ec2QueryName("attachmentId")
    AttachmentId: String,
    @xmlName("attachTime")
    @ec2QueryName("attachTime")
    AttachTime: String,
    @xmlName("deleteOnTermination")
    @ec2QueryName("deleteOnTermination")
    DeleteOnTermination: String,
    @xmlName("deviceIndex")
    @ec2QueryName("deviceIndex")
    DeviceIndex: String,
    @xmlName("instanceId")
    @ec2QueryName("instanceId")
    InstanceId: String,
    @xmlName("instanceOwnerId")
    @ec2QueryName("instanceOwnerId")
    InstanceOwnerId: String,
    @xmlName("status")
    @ec2QueryName("status")
    Status: String,
}

list ListOfIpv6AddressesSet {
    @xmlName("item")
    member: Ipv6AddressesSet,
}

structure Ipv6AddressesSet {
    @xmlName("ipv6Address")
    @ec2QueryName("ipv6Address")
    Ipv6Address: String,
}

list ListOfPrivateIpAddressesSetOfCreateNetworkInterface {
    @xmlName("item")
    member: PrivateIpAddressesSetOfCreateNetworkInterface,
}

structure PrivateIpAddressesSetOfCreateNetworkInterface {
    @xmlName("association")
    @ec2QueryName("association")
    Association: AssociationOfCreateNetworkInterface,
    @xmlName("primary")
    @ec2QueryName("primary")
    Primary: String,
    @xmlName("privateDnsName")
    @ec2QueryName("privateDnsName")
    PrivateDnsName: String,
    @xmlName("privateIpAddress")
    @ec2QueryName("privateIpAddress")
    PrivateIpAddress: String,
}

list ListOfTagSet {
    @xmlName("item")
    member: TagSet,
}

structure TagSet {
    @xmlName("key")
    @ec2QueryName("key")
    Key: String,
    @xmlName("value")
    @ec2QueryName("value")
    Value: String,
}

list ListOfRequestNetworkInterfaceId {
    member: String,
}

@enum([
  {
      name: "ATTACHMENT_INSTANCE_ID",
      value: "attachment.instance-id",
  },
  {
      name: "AVAILABILITY_ZONE",
      value: "availability-zone",
  },
  {
      name: "DESCRIPTION",
      value: "description",
  },
  {
      name: "NETWORK_INTERFACE_ID",
      value: "network-interface-id",
  },
  {
      name: "NIFTY_NETWORK_ID",
      value: "nifty-network-id",
  },
  {
      name: "NIFTY_NETWORK_NAME",
      value: "nifty-network-name",
  },
])
string NameOfFilterForDescribeNetworkInterfaces

structure RequestFilterOfDescribeNetworkInterfaces {
    @xmlName("Value")
    @ec2QueryName("Value")
    ListOfRequestValue: ListOfRequestValue,
    @xmlName("Name")
    @ec2QueryName("Name")
    Name: NameOfFilterForDescribeNetworkInterfaces,
}

list ListOfRequestFilterOfDescribeNetworkInterfaces {
    member: RequestFilterOfDescribeNetworkInterfaces,
}

structure DescribeNetworkInterfacesRequest {
    @xmlName("Filter")
    @ec2QueryName("Filter")
    Filter: ListOfRequestFilterOfDescribeNetworkInterfaces,
    @xmlName("NetworkInterfaceId")
    @ec2QueryName("NetworkInterfaceId")
    NetworkInterfaceId: ListOfRequestNetworkInterfaceId,
}

structure DescribeNetworkInterfacesResult {
    @xmlName("networkInterfaceSet")
    @ec2QueryName("networkInterfaceSet")
    NetworkInterfaceSet: ListOfNetworkInterfaceSetOfDescribeNetworkInterfaces,
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
}

list ListOfNetworkInterfaceSetOfDescribeNetworkInterfaces {
    @xmlName("item")
    member: NetworkInterfaceSetOfDescribeNetworkInterfaces,
}

structure NetworkInterfaceSetOfDescribeNetworkInterfaces {
    @xmlName("association")
    @ec2QueryName("association")
    Association: AssociationOfDescribeNetworkInterfaces,
    @xmlName("attachment")
    @ec2QueryName("attachment")
    Attachment: AttachmentOfDescribeNetworkInterfaces,
    @xmlName("availabilityZone")
    @ec2QueryName("availabilityZone")
    AvailabilityZone: String,
    @xmlName("description")
    @ec2QueryName("description")
    Description: String,
    @xmlName("groupSet")
    @ec2QueryName("groupSet")
    GroupSet: ListOfGroupSet,
    @xmlName("interfaceType")
    @ec2QueryName("interfaceType")
    InterfaceType: String,
    @xmlName("ipv6AddressesSet")
    @ec2QueryName("ipv6AddressesSet")
    Ipv6AddressesSet: ListOfIpv6AddressesSet,
    @xmlName("macAddress")
    @ec2QueryName("macAddress")
    MacAddress: String,
    @xmlName("networkInterfaceId")
    @ec2QueryName("networkInterfaceId")
    NetworkInterfaceId: String,
    @xmlName("niftyNetworkId")
    @ec2QueryName("niftyNetworkId")
    NiftyNetworkId: String,
    @xmlName("niftyNetworkName")
    @ec2QueryName("niftyNetworkName")
    NiftyNetworkName: String,
    @xmlName("ownerId")
    @ec2QueryName("ownerId")
    OwnerId: String,
    @xmlName("privateDnsName")
    @ec2QueryName("privateDnsName")
    PrivateDnsName: String,
    @xmlName("privateIpAddress")
    @ec2QueryName("privateIpAddress")
    PrivateIpAddress: String,
    @xmlName("privateIpAddressesSet")
    @ec2QueryName("privateIpAddressesSet")
    PrivateIpAddressesSet: ListOfPrivateIpAddressesSetOfDescribeNetworkInterfaces,
    @xmlName("privateIpAddressV6")
    @ec2QueryName("privateIpAddressV6")
    PrivateIpAddressV6: String,
    @xmlName("requesterId")
    @ec2QueryName("requesterId")
    RequesterId: String,
    @xmlName("requesterManaged")
    @ec2QueryName("requesterManaged")
    RequesterManaged: String,
    @xmlName("sourceDestCheck")
    @ec2QueryName("sourceDestCheck")
    SourceDestCheck: String,
    @xmlName("status")
    @ec2QueryName("status")
    Status: String,
    @xmlName("subnetId")
    @ec2QueryName("subnetId")
    SubnetId: String,
    @xmlName("tagSet")
    @ec2QueryName("tagSet")
    TagSet: ListOfTagSet,
    @xmlName("vpcId")
    @ec2QueryName("vpcId")
    VpcId: String,
}

structure AssociationOfDescribeNetworkInterfaces {
    @xmlName("allocationId")
    @ec2QueryName("allocationId")
    AllocationId: String,
    @xmlName("associationId")
    @ec2QueryName("associationId")
    AssociationId: String,
    @xmlName("ipOwnerId")
    @ec2QueryName("ipOwnerId")
    IpOwnerId: String,
    @xmlName("publicDnsName")
    @ec2QueryName("publicDnsName")
    PublicDnsName: String,
    @xmlName("publicIp")
    @ec2QueryName("publicIp")
    PublicIp: String,
    @xmlName("publicIpV6")
    @ec2QueryName("publicIpV6")
    PublicIpV6: String,
}

structure AttachmentOfDescribeNetworkInterfaces {
    @xmlName("attachmentId")
    @ec2QueryName("attachmentId")
    AttachmentId: String,
    @xmlName("attachTime")
    @ec2QueryName("attachTime")
    AttachTime: Timestamp,
    @xmlName("deleteOnTermination")
    @ec2QueryName("deleteOnTermination")
    DeleteOnTermination: Boolean,
    @xmlName("deviceIndex")
    @ec2QueryName("deviceIndex")
    DeviceIndex: Integer,
    @xmlName("instanceId")
    @ec2QueryName("instanceId")
    InstanceId: String,
    @xmlName("instanceOwnerId")
    @ec2QueryName("instanceOwnerId")
    InstanceOwnerId: String,
    @xmlName("status")
    @ec2QueryName("status")
    Status: String,
}

list ListOfPrivateIpAddressesSetOfDescribeNetworkInterfaces {
    @xmlName("item")
    member: PrivateIpAddressesSetOfDescribeNetworkInterfaces,
}

structure PrivateIpAddressesSetOfDescribeNetworkInterfaces {
    @xmlName("association")
    @ec2QueryName("association")
    Association: AssociationOfDescribeNetworkInterfaces,
    @xmlName("primary")
    @ec2QueryName("primary")
    Primary: String,
    @xmlName("privateDnsName")
    @ec2QueryName("privateDnsName")
    PrivateDnsName: String,
    @xmlName("privateIpAddress")
    @ec2QueryName("privateIpAddress")
    PrivateIpAddress: String,
}

@enum([
  {
      name: "FORCE",
      value: "force",
  },
  {
      name: "TRUE",
      value: "true",
  },
  {
      name: "FALSE",
      value: "false",
  },
])
string NiftyRebootOfAttachNetworkInterfaceRequest

structure AttachNetworkInterfaceRequest {
    @xmlName("InstanceId")
    @ec2QueryName("InstanceId")
    InstanceId: String,
    @xmlName("InstanceUniqueId")
    @ec2QueryName("InstanceUniqueId")
    InstanceUniqueId: String,
    @required
    @xmlName("NetworkInterfaceId")
    @ec2QueryName("NetworkInterfaceId")
    NetworkInterfaceId: String,
    @xmlName("NiftyReboot")
    @ec2QueryName("NiftyReboot")
    NiftyReboot: NiftyRebootOfAttachNetworkInterfaceRequest,
}

structure AttachNetworkInterfaceResult {
    @xmlName("attachmentId")
    @ec2QueryName("attachmentId")
    AttachmentId: String,
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("return")
    @ec2QueryName("return")
    Return: Boolean,
}

@enum([
  {
      name: "FORCE",
      value: "force",
  },
  {
      name: "TRUE",
      value: "true",
  },
  {
      name: "FALSE",
      value: "false",
  },
])
string NiftyRebootOfDetachNetworkInterfaceRequest

structure DetachNetworkInterfaceRequest {
    @required
    @xmlName("AttachmentId")
    @ec2QueryName("AttachmentId")
    AttachmentId: String,
    @xmlName("NiftyReboot")
    @ec2QueryName("NiftyReboot")
    NiftyReboot: NiftyRebootOfDetachNetworkInterfaceRequest,
}

structure DetachNetworkInterfaceResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("return")
    @ec2QueryName("return")
    Return: Boolean,
}

structure DeleteNetworkInterfaceRequest {
    @required
    @xmlName("NetworkInterfaceId")
    @ec2QueryName("NetworkInterfaceId")
    NetworkInterfaceId: String,
}

structure DeleteNetworkInterfaceResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("return")
    @ec2QueryName("return")
    Return: Boolean,
}

structure ModifyNetworkInterfaceAttributeRequest {
    @xmlName("Description")
    @ec2QueryName("Description")
    Description: String,
    @xmlName("IpAddress")
    @ec2QueryName("IpAddress")
    IpAddress: String,
    @required
    @xmlName("NetworkInterfaceId")
    @ec2QueryName("NetworkInterfaceId")
    NetworkInterfaceId: String,
}

structure ModifyNetworkInterfaceAttributeResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("return")
    @ec2QueryName("return")
    Return: Boolean,
}

@enum([
  {
      name: "E_MINI",
      value: "e-mini",
  },
  {
      name: "H2_MINI",
      value: "h2-mini",
  },
  {
      name: "MINI",
      value: "mini",
  },
  {
      name: "C_SMALL",
      value: "c-small",
  },
  {
      name: "E_SMALL",
      value: "e-small",
  },
  {
      name: "H2_SMALL",
      value: "h2-small",
  },
  {
      name: "SMALL",
      value: "small",
  },
  {
      name: "C_SMALL2",
      value: "c-small2",
  },
  {
      name: "E_SMALL2",
      value: "e-small2",
  },
  {
      name: "H2_SMALL2",
      value: "h2-small2",
  },
  {
      name: "SMALL2",
      value: "small2",
  },
  {
      name: "C_SMALL4",
      value: "c-small4",
  },
  {
      name: "E_SMALL4",
      value: "e-small4",
  },
  {
      name: "H2_SMALL4",
      value: "h2-small4",
  },
  {
      name: "SMALL4",
      value: "small4",
  },
  {
      name: "E_SMALL8",
      value: "e-small8",
  },
  {
      name: "H2_SMALL8",
      value: "h2-small8",
  },
  {
      name: "SMALL8",
      value: "small8",
  },
  {
      name: "E_SMALL16",
      value: "e-small16",
  },
  {
      name: "H2_SMALL16",
      value: "h2-small16",
  },
  {
      name: "SMALL16",
      value: "small16",
  },
  {
      name: "C_MEDIUM",
      value: "c-medium",
  },
  {
      name: "E_MEDIUM",
      value: "e-medium",
  },
  {
      name: "H2_MEDIUM",
      value: "h2-medium",
  },
  {
      name: "MEDIUM",
      value: "medium",
  },
  {
      name: "C_MEDIUM4",
      value: "c-medium4",
  },
  {
      name: "E_MEDIUM4",
      value: "e-medium4",
  },
  {
      name: "H2_MEDIUM4",
      value: "h2-medium4",
  },
  {
      name: "MEDIUM4",
      value: "medium4",
  },
  {
      name: "C_MEDIUM8",
      value: "c-medium8",
  },
  {
      name: "E_MEDIUM8",
      value: "e-medium8",
  },
  {
      name: "H2_MEDIUM8",
      value: "h2-medium8",
  },
  {
      name: "MEDIUM8",
      value: "medium8",
  },
  {
      name: "E_MEDIUM16",
      value: "e-medium16",
  },
  {
      name: "H2_MEDIUM16",
      value: "h2-medium16",
  },
  {
      name: "MEDIUM16",
      value: "medium16",
  },
  {
      name: "E_MEDIUM24",
      value: "e-medium24",
  },
  {
      name: "H2_MEDIUM24",
      value: "h2-medium24",
  },
  {
      name: "MEDIUM24",
      value: "medium24",
  },
  {
      name: "C_LARGE",
      value: "c-large",
  },
  {
      name: "E_LARGE",
      value: "e-large",
  },
  {
      name: "H2_LARGE",
      value: "h2-large",
  },
  {
      name: "LARGE",
      value: "large",
  },
  {
      name: "C_LARGE8",
      value: "c-large8",
  },
  {
      name: "E_LARGE8",
      value: "e-large8",
  },
  {
      name: "H2_LARGE8",
      value: "h2-large8",
  },
  {
      name: "LARGE8",
      value: "large8",
  },
  {
      name: "E_LARGE16",
      value: "e-large16",
  },
  {
      name: "H2_LARGE16",
      value: "h2-large16",
  },
  {
      name: "LARGE16",
      value: "large16",
  },
  {
      name: "E_LARGE24",
      value: "e-large24",
  },
  {
      name: "H2_LARGE24",
      value: "h2-large24",
  },
  {
      name: "LARGE24",
      value: "large24",
  },
  {
      name: "E_LARGE32",
      value: "e-large32",
  },
  {
      name: "H2_LARGE32",
      value: "h2-large32",
  },
  {
      name: "LARGE32",
      value: "large32",
  },
  {
      name: "E_EXTRA_LARGE8",
      value: "e-extra-large8",
  },
  {
      name: "H2_EXTRA_LARGE8",
      value: "h2-extra-large8",
  },
  {
      name: "EXTRA_LARGE8",
      value: "extra-large8",
  },
  {
      name: "E_EXTRA_LARGE16",
      value: "e-extra-large16",
  },
  {
      name: "H2_EXTRA_LARGE16",
      value: "h2-extra-large16",
  },
  {
      name: "EXTRA_LARGE16",
      value: "extra-large16",
  },
  {
      name: "E_EXTRA_LARGE24",
      value: "e-extra-large24",
  },
  {
      name: "H2_EXTRA_LARGE24",
      value: "h2-extra-large24",
  },
  {
      name: "EXTRA_LARGE24",
      value: "extra-large24",
  },
  {
      name: "E_EXTRA_LARGE32",
      value: "e-extra-large32",
  },
  {
      name: "H2_EXTRA_LARGE32",
      value: "h2-extra-large32",
  },
  {
      name: "EXTRA_LARGE32",
      value: "extra-large32",
  },
  {
      name: "E_EXTRA_LARGE48",
      value: "e-extra-large48",
  },
  {
      name: "H2_EXTRA_LARGE48",
      value: "h2-extra-large48",
  },
  {
      name: "EXTRA_LARGE48",
      value: "extra-large48",
  },
  {
      name: "E_DOUBLE_LARGE16",
      value: "e-double-large16",
  },
  {
      name: "H2_DOUBLE_LARGE16",
      value: "h2-double-large16",
  },
  {
      name: "DOUBLE_LARGE16",
      value: "double-large16",
  },
  {
      name: "E_DOUBLE_LARGE24",
      value: "e-double-large24",
  },
  {
      name: "H2_DOUBLE_LARGE24",
      value: "h2-double-large24",
  },
  {
      name: "DOUBLE_LARGE24",
      value: "double-large24",
  },
  {
      name: "E_DOUBLE_LARGE32",
      value: "e-double-large32",
  },
  {
      name: "H2_DOUBLE_LARGE32",
      value: "h2-double-large32",
  },
  {
      name: "DOUBLE_LARGE32",
      value: "double-large32",
  },
  {
      name: "E_DOUBLE_LARGE48",
      value: "e-double-large48",
  },
  {
      name: "H2_DOUBLE_LARGE48",
      value: "h2-double-large48",
  },
  {
      name: "DOUBLE_LARGE48",
      value: "double-large48",
  },
  {
      name: "E_DOUBLE_LARGE64",
      value: "e-double-large64",
  },
  {
      name: "H2_DOUBLE_LARGE64",
      value: "h2-double-large64",
  },
  {
      name: "DOUBLE_LARGE64",
      value: "double-large64",
  },
  {
      name: "E_DOUBLE_LARGE96",
      value: "e-double-large96",
  },
  {
      name: "H2_DOUBLE_LARGE96",
      value: "h2-double-large96",
  },
  {
      name: "DOUBLE_LARGE96",
      value: "double-large96",
  },
  {
      name: "H2_TRIPLE_LARGE32",
      value: "h2-triple-large32",
  },
  {
      name: "TRIPLE_LARGE32",
      value: "triple-large32",
  },
  {
      name: "H2_TRIPLE_LARGE48",
      value: "h2-triple-large48",
  },
  {
      name: "TRIPLE_LARGE48",
      value: "triple-large48",
  },
  {
      name: "H2_TRIPLE_LARGE64",
      value: "h2-triple-large64",
  },
  {
      name: "TRIPLE_LARGE64",
      value: "triple-large64",
  },
  {
      name: "H2_TRIPLE_LARGE96",
      value: "h2-triple-large96",
  },
  {
      name: "TRIPLE_LARGE96",
      value: "triple-large96",
  },
  {
      name: "H2_TRIPLE_LARGE128",
      value: "h2-triple-large128",
  },
  {
      name: "TRIPLE_LARGE128",
      value: "triple-large128",
  },
  {
      name: "H2_QUAD_LARGE64",
      value: "h2-quad-large64",
  },
  {
      name: "QUAD_LARGE64",
      value: "quad-large64",
  },
  {
      name: "H2_QUAD_LARGE96",
      value: "h2-quad-large96",
  },
  {
      name: "QUAD_LARGE96",
      value: "quad-large96",
  },
  {
      name: "H2_QUAD_LARGE128",
      value: "h2-quad-large128",
  },
  {
      name: "QUAD_LARGE128",
      value: "quad-large128",
  },
  {
      name: "H2_SEPTA_LARGE128",
      value: "h2-septa-large128",
  },
  {
      name: "SEPTA_LARGE128",
      value: "septa-large128",
  },
])
string InstanceTypeOfNiftyCreateAutoScalingGroupRequest

@enum([
  {
      name: "SERVER_CPU",
      value: "Server-cpu",
  },
  {
      name: "SERVER_MEMORY",
      value: "Server-memory",
  },
  {
      name: "SERVER_NETWORK",
      value: "Server-network",
  },
  {
      name: "LOADBALANCER_NETWORK",
      value: "LoadBalancer-network",
  },
])
string ResourceOfScalingTriggerForNiftyCreateAutoScalingGroup

structure RequestScalingTrigger {
    @xmlName("BreachDuration")
    @ec2QueryName("BreachDuration")
    BreachDuration: Integer,
    @required
    @xmlName("Resource")
    @ec2QueryName("Resource")
    Resource: ResourceOfScalingTriggerForNiftyCreateAutoScalingGroup,
    @required
    @xmlName("UpperThreshold")
    @ec2QueryName("UpperThreshold")
    UpperThreshold: Double,
}

list ListOfRequestScalingTrigger {
    member: RequestScalingTrigger,
}

@enum([
  {
      name: "OR",
      value: "or",
  },
  {
      name: "AND",
      value: "and",
  },
])
string ScaleoutConditionOfNiftyCreateAutoScalingGroupRequest

structure RequestLoadBalancersOfNiftyCreateAutoScalingGroup {
    @xmlName("InstancePort")
    @ec2QueryName("InstancePort")
    InstancePort: Integer,
    @xmlName("LoadBalancerPort")
    @ec2QueryName("LoadBalancerPort")
    LoadBalancerPort: Integer,
    @xmlName("Name")
    @ec2QueryName("Name")
    Name: String,
}

list ListOfRequestLoadBalancersOfNiftyCreateAutoScalingGroup {
    member: RequestLoadBalancersOfNiftyCreateAutoScalingGroup,
}

structure RequestTimeZone {
    @xmlName("EndingTimeZone")
    @ec2QueryName("EndingTimeZone")
    EndingTimeZone: String,
    @xmlName("StartingTimeZone")
    @ec2QueryName("StartingTimeZone")
    StartingTimeZone: String,
}

structure RequestScalingSchedule {
    @xmlName("Day")
    @ec2QueryName("Day")
    RequestDay: RequestDay,
    @xmlName("DDay")
    @ec2QueryName("DDay")
    RequestDDay: RequestDDay,
    @xmlName("Month")
    @ec2QueryName("Month")
    RequestMonth: RequestMonth,
    @xmlName("TimeZone")
    @ec2QueryName("TimeZone")
    RequestTimeZone: RequestTimeZone,
}

list ListOfRequestScalingSchedule {
    member: RequestScalingSchedule,
}

@enum([
  {
      name: "DISABLED",
      value: "0",
  },
  {
      name: "ENABLED",
      value: "1",
  },
])
string SetSundayOfScalingScheduleForNiftyCreateAutoScalingGroup

structure RequestDay {
    @xmlName("SetFriday")
    @ec2QueryName("SetFriday")
    SetFriday: SetFridayOfScalingScheduleForNiftyCreateAutoScalingGroup,
    @xmlName("SetMonday")
    @ec2QueryName("SetMonday")
    SetMonday: SetMondayOfScalingScheduleForNiftyCreateAutoScalingGroup,
    @xmlName("SetSaturday")
    @ec2QueryName("SetSaturday")
    SetSaturday: SetSaturdayOfScalingScheduleForNiftyCreateAutoScalingGroup,
    @xmlName("SetSunday")
    @ec2QueryName("SetSunday")
    SetSunday: SetSundayOfScalingScheduleForNiftyCreateAutoScalingGroup,
    @xmlName("SetThursday")
    @ec2QueryName("SetThursday")
    SetThursday: SetThursdayOfScalingScheduleForNiftyCreateAutoScalingGroup,
    @xmlName("SetTuesday")
    @ec2QueryName("SetTuesday")
    SetTuesday: SetTuesdayOfScalingScheduleForNiftyCreateAutoScalingGroup,
    @xmlName("SetWednesday")
    @ec2QueryName("SetWednesday")
    SetWednesday: SetWednesdayOfScalingScheduleForNiftyCreateAutoScalingGroup,
}

@enum([
  {
      name: "DISABLED",
      value: "0",
  },
  {
      name: "ENABLED",
      value: "1",
  },
])
string SetMondayOfScalingScheduleForNiftyCreateAutoScalingGroup

@enum([
  {
      name: "DISABLED",
      value: "0",
  },
  {
      name: "ENABLED",
      value: "1",
  },
])
string SetTuesdayOfScalingScheduleForNiftyCreateAutoScalingGroup

@enum([
  {
      name: "DISABLED",
      value: "0",
  },
  {
      name: "ENABLED",
      value: "1",
  },
])
string SetWednesdayOfScalingScheduleForNiftyCreateAutoScalingGroup

@enum([
  {
      name: "DISABLED",
      value: "0",
  },
  {
      name: "ENABLED",
      value: "1",
  },
])
string SetThursdayOfScalingScheduleForNiftyCreateAutoScalingGroup

@enum([
  {
      name: "DISABLED",
      value: "0",
  },
  {
      name: "ENABLED",
      value: "1",
  },
])
string SetFridayOfScalingScheduleForNiftyCreateAutoScalingGroup

@enum([
  {
      name: "DISABLED",
      value: "0",
  },
  {
      name: "ENABLED",
      value: "1",
  },
])
string SetSaturdayOfScalingScheduleForNiftyCreateAutoScalingGroup

structure RequestDDay {
    @xmlName("EndingDDay")
    @ec2QueryName("EndingDDay")
    EndingDDay: String,
    @xmlName("StartingDDay")
    @ec2QueryName("StartingDDay")
    StartingDDay: String,
}

structure RequestMonth {
    @xmlName("EndingMonth")
    @ec2QueryName("EndingMonth")
    EndingMonth: String,
    @xmlName("StartingMonth")
    @ec2QueryName("StartingMonth")
    StartingMonth: String,
}

structure NiftyCreateAutoScalingGroupRequest {
    @required
    @xmlName("AutoScalingGroupName")
    @ec2QueryName("AutoScalingGroupName")
    AutoScalingGroupName: String,
    @required
    @xmlName("ChangeInCapacity")
    @ec2QueryName("ChangeInCapacity")
    ChangeInCapacity: Integer,
    @xmlName("DefaultCooldown")
    @ec2QueryName("DefaultCooldown")
    DefaultCooldown: Integer,
    @xmlName("Description")
    @ec2QueryName("Description")
    Description: String,
    @required
    @xmlName("ImageId")
    @ec2QueryName("ImageId")
    ImageId: String,
    @xmlName("InstanceLifecycleLimit")
    @ec2QueryName("InstanceLifecycleLimit")
    InstanceLifecycleLimit: Integer,
    @xmlName("InstanceType")
    @ec2QueryName("InstanceType")
    InstanceType: InstanceTypeOfNiftyCreateAutoScalingGroupRequest,
    @xmlName("LoadBalancers")
    @ec2QueryName("LoadBalancers")
    LoadBalancers: ListOfRequestLoadBalancersOfNiftyCreateAutoScalingGroup,
    @required
    @xmlName("MaxSize")
    @ec2QueryName("MaxSize")
    MaxSize: Integer,
    @required
    @xmlName("MinSize")
    @ec2QueryName("MinSize")
    MinSize: Integer,
    @xmlName("Scaleout")
    @ec2QueryName("Scaleout")
    Scaleout: Integer,
    @required
    @xmlName("ScaleoutCondition")
    @ec2QueryName("ScaleoutCondition")
    ScaleoutCondition: ScaleoutConditionOfNiftyCreateAutoScalingGroupRequest,
    @xmlName("ScalingSchedule")
    @ec2QueryName("ScalingSchedule")
    ScalingSchedule: ListOfRequestScalingSchedule,
    @required
    @xmlName("ScalingTrigger")
    @ec2QueryName("ScalingTrigger")
    ScalingTrigger: ListOfRequestScalingTrigger,
    @xmlName("SecurityGroup")
    @ec2QueryName("SecurityGroup")
    SecurityGroup: ListOfRequestSecurityGroup,
}

structure NiftyCreateAutoScalingGroupResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("return")
    @ec2QueryName("return")
    Return: Boolean,
}

list ListOfRequestAutoScalingGroupName {
    member: String,
}

structure NiftyDescribeAutoScalingGroupsRequest {
    @xmlName("AutoScalingGroupName")
    @ec2QueryName("AutoScalingGroupName")
    AutoScalingGroupName: ListOfRequestAutoScalingGroupName,
}

structure NiftyDescribeAutoScalingGroupsResult {
    @xmlName("autoScalingReservationSet")
    @ec2QueryName("autoScalingReservationSet")
    AutoScalingReservationSet: ListOfAutoScalingReservationSet,
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
}

list ListOfAutoScalingReservationSet {
    @xmlName("item")
    member: AutoScalingReservationSet,
}

structure AutoScalingReservationSet {
    @xmlName("alarm")
    @ec2QueryName("alarm")
    Alarm: String,
    @xmlName("autoScalingGroupName")
    @ec2QueryName("autoScalingGroupName")
    AutoScalingGroupName: String,
    @xmlName("changeInCapacity")
    @ec2QueryName("changeInCapacity")
    ChangeInCapacity: Integer,
    @xmlName("createdTime")
    @ec2QueryName("createdTime")
    CreatedTime: Timestamp,
    @xmlName("defaultCooldown")
    @ec2QueryName("defaultCooldown")
    DefaultCooldown: Integer,
    @xmlName("description")
    @ec2QueryName("description")
    Description: String,
    @xmlName("groupSet")
    @ec2QueryName("groupSet")
    GroupSet: ListOfGroupSet,
    @xmlName("imageId")
    @ec2QueryName("imageId")
    ImageId: String,
    @xmlName("instanceLifecycleLimit")
    @ec2QueryName("instanceLifecycleLimit")
    InstanceLifecycleLimit: Integer,
    @xmlName("instancesSet")
    @ec2QueryName("instancesSet")
    InstancesSet: ListOfInstancesSetOfNiftyDescribeAutoScalingGroups,
    @xmlName("instanceType")
    @ec2QueryName("instanceType")
    InstanceType: String,
    @xmlName("loadBalancing")
    @ec2QueryName("loadBalancing")
    LoadBalancing: ListOfLoadBalancingOfNiftyDescribeAutoScalingGroups,
    @xmlName("maxSize")
    @ec2QueryName("maxSize")
    MaxSize: Integer,
    @xmlName("minSize")
    @ec2QueryName("minSize")
    MinSize: Integer,
    @xmlName("placement")
    @ec2QueryName("placement")
    Placement: Placement,
    @xmlName("scaleout")
    @ec2QueryName("scaleout")
    Scaleout: Integer,
    @xmlName("scaleoutCondition")
    @ec2QueryName("scaleoutCondition")
    ScaleoutCondition: String,
    @xmlName("scheduleSet")
    @ec2QueryName("scheduleSet")
    ScheduleSet: ListOfScheduleSet,
    @xmlName("triggerSet")
    @ec2QueryName("triggerSet")
    TriggerSet: ListOfTriggerSet,
}

list ListOfTriggerSet {
    @xmlName("item")
    member: TriggerSet,
}

structure TriggerSet {
    @xmlName("breachDuration")
    @ec2QueryName("breachDuration")
    BreachDuration: Integer,
    @xmlName("resource")
    @ec2QueryName("resource")
    Resource: String,
    @xmlName("upperThreshold")
    @ec2QueryName("upperThreshold")
    UpperThreshold: Double,
}

list ListOfLoadBalancingOfNiftyDescribeAutoScalingGroups {
    @xmlName("item")
    member: LoadBalancingOfNiftyDescribeAutoScalingGroups,
}

structure LoadBalancingOfNiftyDescribeAutoScalingGroups {
    @xmlName("instancePort")
    @ec2QueryName("instancePort")
    InstancePort: Integer,
    @xmlName("loadBalancerName")
    @ec2QueryName("loadBalancerName")
    LoadBalancerName: String,
    @xmlName("loadBalancerPort")
    @ec2QueryName("loadBalancerPort")
    LoadBalancerPort: Integer,
}

list ListOfScheduleSet {
    @xmlName("item")
    member: ScheduleSet,
}

structure ScheduleSet {
    @xmlName("day")
    @ec2QueryName("day")
    Day: Day,
    @xmlName("dDay")
    @ec2QueryName("dDay")
    DDay: DDay,
    @xmlName("month")
    @ec2QueryName("month")
    Month: Month,
    @xmlName("timeZone")
    @ec2QueryName("timeZone")
    TimeZone: TimeZone,
}

structure TimeZone {
    @xmlName("endingTimeZone")
    @ec2QueryName("endingTimeZone")
    EndingTimeZone: String,
    @xmlName("startingTimeZone")
    @ec2QueryName("startingTimeZone")
    StartingTimeZone: String,
}

structure Day {
    @xmlName("setFriday")
    @ec2QueryName("setFriday")
    SetFriday: String,
    @xmlName("setMonday")
    @ec2QueryName("setMonday")
    SetMonday: String,
    @xmlName("setSaturday")
    @ec2QueryName("setSaturday")
    SetSaturday: String,
    @xmlName("setSunday")
    @ec2QueryName("setSunday")
    SetSunday: String,
    @xmlName("setThursday")
    @ec2QueryName("setThursday")
    SetThursday: String,
    @xmlName("setTuesday")
    @ec2QueryName("setTuesday")
    SetTuesday: String,
    @xmlName("setWednesday")
    @ec2QueryName("setWednesday")
    SetWednesday: String,
}

structure DDay {
    @xmlName("endingDDay")
    @ec2QueryName("endingDDay")
    EndingDDay: String,
    @xmlName("startingDDay")
    @ec2QueryName("startingDDay")
    StartingDDay: String,
}

structure Month {
    @xmlName("endingMonth")
    @ec2QueryName("endingMonth")
    EndingMonth: String,
    @xmlName("startingMonth")
    @ec2QueryName("startingMonth")
    StartingMonth: String,
}

list ListOfInstancesSetOfNiftyDescribeAutoScalingGroups {
    @xmlName("item")
    member: InstancesSetOfNiftyDescribeAutoScalingGroups,
}

structure InstancesSetOfNiftyDescribeAutoScalingGroups {
    @xmlName("dnsName")
    @ec2QueryName("dnsName")
    DnsName: String,
    @xmlName("expireTime")
    @ec2QueryName("expireTime")
    ExpireTime: Timestamp,
    @xmlName("instanceId")
    @ec2QueryName("instanceId")
    InstanceId: String,
    @xmlName("instanceState")
    @ec2QueryName("instanceState")
    InstanceState: InstanceState,
    @xmlName("instanceType")
    @ec2QueryName("instanceType")
    InstanceType: String,
    @xmlName("instanceUniqueId")
    @ec2QueryName("instanceUniqueId")
    InstanceUniqueId: String,
}

structure NiftyDescribeScalingActivitiesRequest {
    @xmlName("ActivityDateFrom")
    @ec2QueryName("ActivityDateFrom")
    ActivityDateFrom: String,
    @xmlName("ActivityDateTo")
    @ec2QueryName("ActivityDateTo")
    ActivityDateTo: String,
    @required
    @xmlName("AutoScalingGroupName")
    @ec2QueryName("AutoScalingGroupName")
    AutoScalingGroupName: String,
    @xmlName("Range")
    @ec2QueryName("Range")
    Range: RequestRange,
}

structure NiftyDescribeScalingActivitiesResult {
    @xmlName("autoScalingGroupName")
    @ec2QueryName("autoScalingGroupName")
    AutoScalingGroupName: String,
    @xmlName("logSet")
    @ec2QueryName("logSet")
    LogSet: ListOfLogSet,
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
}

list ListOfLogSet {
    @xmlName("item")
    member: LogSet,
}

structure LogSet {
    @xmlName("details")
    @ec2QueryName("details")
    Details: Details,
    @xmlName("process")
    @ec2QueryName("process")
    Process: String,
    @xmlName("time")
    @ec2QueryName("time")
    Time: Timestamp,
}

structure Details {
    @xmlName("changeInCapacity")
    @ec2QueryName("changeInCapacity")
    ChangeInCapacity: Integer,
    @xmlName("currentServersCount")
    @ec2QueryName("currentServersCount")
    CurrentServersCount: Integer,
    @xmlName("resource")
    @ec2QueryName("resource")
    Resource: String,
    @xmlName("resourceValue")
    @ec2QueryName("resourceValue")
    ResourceValue: Double,
    @xmlName("upperThreshold")
    @ec2QueryName("upperThreshold")
    UpperThreshold: Double,
}

@enum([
  {
      name: "E_MINI",
      value: "e-mini",
  },
  {
      name: "H2_MINI",
      value: "h2-mini",
  },
  {
      name: "MINI",
      value: "mini",
  },
  {
      name: "C_SMALL",
      value: "c-small",
  },
  {
      name: "E_SMALL",
      value: "e-small",
  },
  {
      name: "H2_SMALL",
      value: "h2-small",
  },
  {
      name: "SMALL",
      value: "small",
  },
  {
      name: "C_SMALL2",
      value: "c-small2",
  },
  {
      name: "E_SMALL2",
      value: "e-small2",
  },
  {
      name: "H2_SMALL2",
      value: "h2-small2",
  },
  {
      name: "SMALL2",
      value: "small2",
  },
  {
      name: "C_SMALL4",
      value: "c-small4",
  },
  {
      name: "E_SMALL4",
      value: "e-small4",
  },
  {
      name: "H2_SMALL4",
      value: "h2-small4",
  },
  {
      name: "SMALL4",
      value: "small4",
  },
  {
      name: "E_SMALL8",
      value: "e-small8",
  },
  {
      name: "H2_SMALL8",
      value: "h2-small8",
  },
  {
      name: "SMALL8",
      value: "small8",
  },
  {
      name: "E_SMALL16",
      value: "e-small16",
  },
  {
      name: "H2_SMALL16",
      value: "h2-small16",
  },
  {
      name: "SMALL16",
      value: "small16",
  },
  {
      name: "C_MEDIUM",
      value: "c-medium",
  },
  {
      name: "E_MEDIUM",
      value: "e-medium",
  },
  {
      name: "H2_MEDIUM",
      value: "h2-medium",
  },
  {
      name: "MEDIUM",
      value: "medium",
  },
  {
      name: "C_MEDIUM4",
      value: "c-medium4",
  },
  {
      name: "E_MEDIUM4",
      value: "e-medium4",
  },
  {
      name: "H2_MEDIUM4",
      value: "h2-medium4",
  },
  {
      name: "MEDIUM4",
      value: "medium4",
  },
  {
      name: "C_MEDIUM8",
      value: "c-medium8",
  },
  {
      name: "E_MEDIUM8",
      value: "e-medium8",
  },
  {
      name: "H2_MEDIUM8",
      value: "h2-medium8",
  },
  {
      name: "MEDIUM8",
      value: "medium8",
  },
  {
      name: "E_MEDIUM16",
      value: "e-medium16",
  },
  {
      name: "H2_MEDIUM16",
      value: "h2-medium16",
  },
  {
      name: "MEDIUM16",
      value: "medium16",
  },
  {
      name: "E_MEDIUM24",
      value: "e-medium24",
  },
  {
      name: "H2_MEDIUM24",
      value: "h2-medium24",
  },
  {
      name: "MEDIUM24",
      value: "medium24",
  },
  {
      name: "C_LARGE",
      value: "c-large",
  },
  {
      name: "E_LARGE",
      value: "e-large",
  },
  {
      name: "H2_LARGE",
      value: "h2-large",
  },
  {
      name: "LARGE",
      value: "large",
  },
  {
      name: "C_LARGE8",
      value: "c-large8",
  },
  {
      name: "E_LARGE8",
      value: "e-large8",
  },
  {
      name: "H2_LARGE8",
      value: "h2-large8",
  },
  {
      name: "LARGE8",
      value: "large8",
  },
  {
      name: "E_LARGE16",
      value: "e-large16",
  },
  {
      name: "H2_LARGE16",
      value: "h2-large16",
  },
  {
      name: "LARGE16",
      value: "large16",
  },
  {
      name: "E_LARGE24",
      value: "e-large24",
  },
  {
      name: "H2_LARGE24",
      value: "h2-large24",
  },
  {
      name: "LARGE24",
      value: "large24",
  },
  {
      name: "E_LARGE32",
      value: "e-large32",
  },
  {
      name: "H2_LARGE32",
      value: "h2-large32",
  },
  {
      name: "LARGE32",
      value: "large32",
  },
  {
      name: "E_EXTRA_LARGE8",
      value: "e-extra-large8",
  },
  {
      name: "H2_EXTRA_LARGE8",
      value: "h2-extra-large8",
  },
  {
      name: "EXTRA_LARGE8",
      value: "extra-large8",
  },
  {
      name: "E_EXTRA_LARGE16",
      value: "e-extra-large16",
  },
  {
      name: "H2_EXTRA_LARGE16",
      value: "h2-extra-large16",
  },
  {
      name: "EXTRA_LARGE16",
      value: "extra-large16",
  },
  {
      name: "E_EXTRA_LARGE24",
      value: "e-extra-large24",
  },
  {
      name: "H2_EXTRA_LARGE24",
      value: "h2-extra-large24",
  },
  {
      name: "EXTRA_LARGE24",
      value: "extra-large24",
  },
  {
      name: "E_EXTRA_LARGE32",
      value: "e-extra-large32",
  },
  {
      name: "H2_EXTRA_LARGE32",
      value: "h2-extra-large32",
  },
  {
      name: "EXTRA_LARGE32",
      value: "extra-large32",
  },
  {
      name: "E_EXTRA_LARGE48",
      value: "e-extra-large48",
  },
  {
      name: "H2_EXTRA_LARGE48",
      value: "h2-extra-large48",
  },
  {
      name: "EXTRA_LARGE48",
      value: "extra-large48",
  },
  {
      name: "E_DOUBLE_LARGE16",
      value: "e-double-large16",
  },
  {
      name: "H2_DOUBLE_LARGE16",
      value: "h2-double-large16",
  },
  {
      name: "DOUBLE_LARGE16",
      value: "double-large16",
  },
  {
      name: "E_DOUBLE_LARGE24",
      value: "e-double-large24",
  },
  {
      name: "H2_DOUBLE_LARGE24",
      value: "h2-double-large24",
  },
  {
      name: "DOUBLE_LARGE24",
      value: "double-large24",
  },
  {
      name: "E_DOUBLE_LARGE32",
      value: "e-double-large32",
  },
  {
      name: "H2_DOUBLE_LARGE32",
      value: "h2-double-large32",
  },
  {
      name: "DOUBLE_LARGE32",
      value: "double-large32",
  },
  {
      name: "E_DOUBLE_LARGE48",
      value: "e-double-large48",
  },
  {
      name: "H2_DOUBLE_LARGE48",
      value: "h2-double-large48",
  },
  {
      name: "DOUBLE_LARGE48",
      value: "double-large48",
  },
  {
      name: "E_DOUBLE_LARGE64",
      value: "e-double-large64",
  },
  {
      name: "H2_DOUBLE_LARGE64",
      value: "h2-double-large64",
  },
  {
      name: "DOUBLE_LARGE64",
      value: "double-large64",
  },
  {
      name: "E_DOUBLE_LARGE96",
      value: "e-double-large96",
  },
  {
      name: "H2_DOUBLE_LARGE96",
      value: "h2-double-large96",
  },
  {
      name: "DOUBLE_LARGE96",
      value: "double-large96",
  },
  {
      name: "H2_TRIPLE_LARGE32",
      value: "h2-triple-large32",
  },
  {
      name: "TRIPLE_LARGE32",
      value: "triple-large32",
  },
  {
      name: "H2_TRIPLE_LARGE48",
      value: "h2-triple-large48",
  },
  {
      name: "TRIPLE_LARGE48",
      value: "triple-large48",
  },
  {
      name: "H2_TRIPLE_LARGE64",
      value: "h2-triple-large64",
  },
  {
      name: "TRIPLE_LARGE64",
      value: "triple-large64",
  },
  {
      name: "H2_TRIPLE_LARGE96",
      value: "h2-triple-large96",
  },
  {
      name: "TRIPLE_LARGE96",
      value: "triple-large96",
  },
  {
      name: "H2_TRIPLE_LARGE128",
      value: "h2-triple-large128",
  },
  {
      name: "TRIPLE_LARGE128",
      value: "triple-large128",
  },
  {
      name: "H2_QUAD_LARGE64",
      value: "h2-quad-large64",
  },
  {
      name: "QUAD_LARGE64",
      value: "quad-large64",
  },
  {
      name: "H2_QUAD_LARGE96",
      value: "h2-quad-large96",
  },
  {
      name: "QUAD_LARGE96",
      value: "quad-large96",
  },
  {
      name: "H2_QUAD_LARGE128",
      value: "h2-quad-large128",
  },
  {
      name: "QUAD_LARGE128",
      value: "quad-large128",
  },
  {
      name: "H2_SEPTA_LARGE128",
      value: "h2-septa-large128",
  },
  {
      name: "SEPTA_LARGE128",
      value: "septa-large128",
  },
])
string InstanceTypeOfNiftyUpdateAutoScalingGroupRequest

@enum([
  {
      name: "SERVER_CPU",
      value: "Server-cpu",
  },
  {
      name: "SERVER_MEMORY",
      value: "Server-memory",
  },
  {
      name: "SERVER_NETWORK",
      value: "Server-network",
  },
  {
      name: "LOADBALANCER_NETWORK",
      value: "LoadBalancer-network",
  },
])
string ResourceOfScalingTriggerForNiftyUpdateAutoScalingGroup

structure RequestScalingTriggerOfNiftyUpdateAutoScalingGroup {
    @xmlName("BreachDuration")
    @ec2QueryName("BreachDuration")
    BreachDuration: Integer,
    @required
    @xmlName("Resource")
    @ec2QueryName("Resource")
    Resource: ResourceOfScalingTriggerForNiftyUpdateAutoScalingGroup,
    @required
    @xmlName("UpperThreshold")
    @ec2QueryName("UpperThreshold")
    UpperThreshold: Double,
}

list ListOfRequestScalingTriggerOfNiftyUpdateAutoScalingGroup {
    member: RequestScalingTriggerOfNiftyUpdateAutoScalingGroup,
}

@enum([
  {
      name: "OR",
      value: "or",
  },
  {
      name: "AND",
      value: "and",
  },
])
string ScaleoutConditionOfNiftyUpdateAutoScalingGroupRequest

structure RequestLoadBalancersOfNiftyUpdateAutoScalingGroup {
    @xmlName("InstancePort")
    @ec2QueryName("InstancePort")
    InstancePort: Integer,
    @xmlName("LoadBalancerPort")
    @ec2QueryName("LoadBalancerPort")
    LoadBalancerPort: Integer,
    @xmlName("Name")
    @ec2QueryName("Name")
    Name: String,
}

list ListOfRequestLoadBalancersOfNiftyUpdateAutoScalingGroup {
    member: RequestLoadBalancersOfNiftyUpdateAutoScalingGroup,
}

structure RequestScalingScheduleOfNiftyUpdateAutoScalingGroup {
    @xmlName("Day")
    @ec2QueryName("Day")
    RequestDay: RequestDayOfNiftyUpdateAutoScalingGroup,
    @xmlName("DDay")
    @ec2QueryName("DDay")
    RequestDDay: RequestDDay,
    @xmlName("Month")
    @ec2QueryName("Month")
    RequestMonth: RequestMonth,
    @xmlName("TimeZone")
    @ec2QueryName("TimeZone")
    RequestTimeZone: RequestTimeZone,
}

list ListOfRequestScalingScheduleOfNiftyUpdateAutoScalingGroup {
    member: RequestScalingScheduleOfNiftyUpdateAutoScalingGroup,
}

@enum([
  {
      name: "DISABLED",
      value: "0",
  },
  {
      name: "ENABLED",
      value: "1",
  },
])
string SetSundayOfScalingScheduleForNiftyUpdateAutoScalingGroup

structure RequestDayOfNiftyUpdateAutoScalingGroup {
    @xmlName("SetFriday")
    @ec2QueryName("SetFriday")
    SetFriday: SetFridayOfScalingScheduleForNiftyUpdateAutoScalingGroup,
    @xmlName("SetMonday")
    @ec2QueryName("SetMonday")
    SetMonday: SetMondayOfScalingScheduleForNiftyUpdateAutoScalingGroup,
    @xmlName("SetSaturday")
    @ec2QueryName("SetSaturday")
    SetSaturday: SetSaturdayOfScalingScheduleForNiftyUpdateAutoScalingGroup,
    @xmlName("SetSunday")
    @ec2QueryName("SetSunday")
    SetSunday: SetSundayOfScalingScheduleForNiftyUpdateAutoScalingGroup,
    @xmlName("SetThursday")
    @ec2QueryName("SetThursday")
    SetThursday: SetThursdayOfScalingScheduleForNiftyUpdateAutoScalingGroup,
    @xmlName("SetTuesday")
    @ec2QueryName("SetTuesday")
    SetTuesday: SetTuesdayOfScalingScheduleForNiftyUpdateAutoScalingGroup,
    @xmlName("SetWednesday")
    @ec2QueryName("SetWednesday")
    SetWednesday: SetWednesdayOfScalingScheduleForNiftyUpdateAutoScalingGroup,
}

@enum([
  {
      name: "DISABLED",
      value: "0",
  },
  {
      name: "ENABLED",
      value: "1",
  },
])
string SetMondayOfScalingScheduleForNiftyUpdateAutoScalingGroup

@enum([
  {
      name: "DISABLED",
      value: "0",
  },
  {
      name: "ENABLED",
      value: "1",
  },
])
string SetTuesdayOfScalingScheduleForNiftyUpdateAutoScalingGroup

@enum([
  {
      name: "DISABLED",
      value: "0",
  },
  {
      name: "ENABLED",
      value: "1",
  },
])
string SetWednesdayOfScalingScheduleForNiftyUpdateAutoScalingGroup

@enum([
  {
      name: "DISABLED",
      value: "0",
  },
  {
      name: "ENABLED",
      value: "1",
  },
])
string SetThursdayOfScalingScheduleForNiftyUpdateAutoScalingGroup

@enum([
  {
      name: "DISABLED",
      value: "0",
  },
  {
      name: "ENABLED",
      value: "1",
  },
])
string SetFridayOfScalingScheduleForNiftyUpdateAutoScalingGroup

@enum([
  {
      name: "DISABLED",
      value: "0",
  },
  {
      name: "ENABLED",
      value: "1",
  },
])
string SetSaturdayOfScalingScheduleForNiftyUpdateAutoScalingGroup

structure NiftyUpdateAutoScalingGroupRequest {
    @required
    @xmlName("AutoScalingGroupName")
    @ec2QueryName("AutoScalingGroupName")
    AutoScalingGroupName: String,
    @xmlName("AutoScalingGroupNameUpdate")
    @ec2QueryName("AutoScalingGroupNameUpdate")
    AutoScalingGroupNameUpdate: String,
    @required
    @xmlName("ChangeInCapacity")
    @ec2QueryName("ChangeInCapacity")
    ChangeInCapacity: Integer,
    @xmlName("DefaultCooldown")
    @ec2QueryName("DefaultCooldown")
    DefaultCooldown: Integer,
    @xmlName("Description")
    @ec2QueryName("Description")
    Description: String,
    @xmlName("ImageId")
    @ec2QueryName("ImageId")
    ImageId: String,
    @xmlName("InstanceLifecycleLimit")
    @ec2QueryName("InstanceLifecycleLimit")
    InstanceLifecycleLimit: Integer,
    @xmlName("InstanceType")
    @ec2QueryName("InstanceType")
    InstanceType: InstanceTypeOfNiftyUpdateAutoScalingGroupRequest,
    @xmlName("LoadBalancers")
    @ec2QueryName("LoadBalancers")
    LoadBalancers: ListOfRequestLoadBalancersOfNiftyUpdateAutoScalingGroup,
    @required
    @xmlName("MaxSize")
    @ec2QueryName("MaxSize")
    MaxSize: Integer,
    @required
    @xmlName("MinSize")
    @ec2QueryName("MinSize")
    MinSize: Integer,
    @xmlName("Scaleout")
    @ec2QueryName("Scaleout")
    Scaleout: Integer,
    @required
    @xmlName("ScaleoutCondition")
    @ec2QueryName("ScaleoutCondition")
    ScaleoutCondition: ScaleoutConditionOfNiftyUpdateAutoScalingGroupRequest,
    @xmlName("ScalingSchedule")
    @ec2QueryName("ScalingSchedule")
    ScalingSchedule: ListOfRequestScalingScheduleOfNiftyUpdateAutoScalingGroup,
    @required
    @xmlName("ScalingTrigger")
    @ec2QueryName("ScalingTrigger")
    ScalingTrigger: ListOfRequestScalingTriggerOfNiftyUpdateAutoScalingGroup,
    @xmlName("SecurityGroup")
    @ec2QueryName("SecurityGroup")
    SecurityGroup: ListOfRequestSecurityGroup,
}

structure NiftyUpdateAutoScalingGroupResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("return")
    @ec2QueryName("return")
    Return: Boolean,
}

structure NiftyDeleteAutoScalingGroupRequest {
    @required
    @xmlName("AutoScalingGroupName")
    @ec2QueryName("AutoScalingGroupName")
    AutoScalingGroupName: String,
}

structure NiftyDeleteAutoScalingGroupResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("return")
    @ec2QueryName("return")
    Return: Boolean,
}

@enum([
  {
      name: "SERVER",
      value: "Server",
  },
  {
      name: "LOAD_BALANCER",
      value: "LoadBalancer",
  },
  {
      name: "DISK_PARTITION",
      value: "DiskPartition",
  },
  {
      name: "ELASTIC_LOAD_BALANCER",
      value: "ElasticLoadBalancer",
  },
])
string FunctionNameOfNiftyCreateAlarmRequest

list ListOfRequestLoadBalancerName {
    member: String,
}

list ListOfRequestLoadBalancerPort {
    member: Integer,
}

list ListOfRequestPartition {
    member: String,
}

list ListOfRequestElasticLoadBalancerProtocol {
    member: String,
}

structure RequestRule {
    @required
    @xmlName("BreachDuration")
    @ec2QueryName("BreachDuration")
    BreachDuration: Integer,
    @required
    @xmlName("DataType")
    @ec2QueryName("DataType")
    DataType: String,
    @xmlName("Threshold")
    @ec2QueryName("Threshold")
    Threshold: Double,
    @xmlName("UpperLowerCondition")
    @ec2QueryName("UpperLowerCondition")
    UpperLowerCondition: UpperLowerConditionOfRuleForNiftyCreateAlarm,
}

list ListOfRequestRule {
    member: RequestRule,
}

@enum([
  {
      name: "UPPER",
      value: "upper",
  },
  {
      name: "LOWER",
      value: "lower",
  },
])
string UpperLowerConditionOfRuleForNiftyCreateAlarm

@enum([
  {
      name: "AND",
      value: "and",
  },
  {
      name: "OR",
      value: "or",
  },
])
string AlarmConditionOfNiftyCreateAlarmRequest

list ListOfRequestEmailAddress {
    member: String,
}

structure NiftyCreateAlarmRequest {
    @xmlName("AlarmCondition")
    @ec2QueryName("AlarmCondition")
    AlarmCondition: AlarmConditionOfNiftyCreateAlarmRequest,
    @xmlName("Description")
    @ec2QueryName("Description")
    Description: String,
    @xmlName("ElasticLoadBalancerName")
    @ec2QueryName("ElasticLoadBalancerName")
    ElasticLoadBalancerName: ListOfRequestElasticLoadBalancerName,
    @xmlName("ElasticLoadBalancerPort")
    @ec2QueryName("ElasticLoadBalancerPort")
    ElasticLoadBalancerPort: ListOfRequestElasticLoadBalancerPort,
    @xmlName("ElasticLoadBalancerProtocol")
    @ec2QueryName("ElasticLoadBalancerProtocol")
    ElasticLoadBalancerProtocol: ListOfRequestElasticLoadBalancerProtocol,
    @required
    @xmlName("EmailAddress")
    @ec2QueryName("EmailAddress")
    EmailAddress: ListOfRequestEmailAddress,
    @required
    @xmlName("FunctionName")
    @ec2QueryName("FunctionName")
    FunctionName: FunctionNameOfNiftyCreateAlarmRequest,
    @xmlName("InstanceId")
    @ec2QueryName("InstanceId")
    InstanceId: ListOfRequestInstanceId,
    @xmlName("LoadBalancerName")
    @ec2QueryName("LoadBalancerName")
    LoadBalancerName: ListOfRequestLoadBalancerName,
    @xmlName("LoadBalancerPort")
    @ec2QueryName("LoadBalancerPort")
    LoadBalancerPort: ListOfRequestLoadBalancerPort,
    @xmlName("Partition")
    @ec2QueryName("Partition")
    Partition: ListOfRequestPartition,
    @required
    @xmlName("Rule")
    @ec2QueryName("Rule")
    Rule: ListOfRequestRule,
    @xmlName("RuleName")
    @ec2QueryName("RuleName")
    RuleName: String,
    @xmlName("Zone")
    @ec2QueryName("Zone")
    Zone: String,
}

structure NiftyCreateAlarmResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("return")
    @ec2QueryName("return")
    Return: Boolean,
}

structure RequestRuleOfNiftyDescribeAlarms {
    @xmlName("FunctionName")
    @ec2QueryName("FunctionName")
    FunctionName: FunctionNameOfRuleForNiftyDescribeAlarms,
    @xmlName("RuleName")
    @ec2QueryName("RuleName")
    RuleName: String,
}

list ListOfRequestRuleOfNiftyDescribeAlarms {
    member: RequestRuleOfNiftyDescribeAlarms,
}

@enum([
  {
      name: "SERVER",
      value: "Server",
  },
  {
      name: "LOAD_BALANCER",
      value: "LoadBalancer",
  },
  {
      name: "DISK_PARTITION",
      value: "DiskPartition",
  },
  {
      name: "ELASTIC_LOAD_BALANCER",
      value: "ElasticLoadBalancer",
  },
])
string FunctionNameOfRuleForNiftyDescribeAlarms

structure NiftyDescribeAlarmsRequest {
    @xmlName("Rule")
    @ec2QueryName("Rule")
    Rule: ListOfRequestRuleOfNiftyDescribeAlarms,
}

structure NiftyDescribeAlarmsResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("reservationSet")
    @ec2QueryName("reservationSet")
    ReservationSet: ListOfReservationSetOfNiftyDescribeAlarms,
}

list ListOfReservationSetOfNiftyDescribeAlarms {
    @xmlName("item")
    member: ReservationSetOfNiftyDescribeAlarms,
}

structure ReservationSetOfNiftyDescribeAlarms {
    @xmlName("alarmCondition")
    @ec2QueryName("alarmCondition")
    AlarmCondition: String,
    @xmlName("alarmState")
    @ec2QueryName("alarmState")
    AlarmState: String,
    @xmlName("alarmTargetsSet")
    @ec2QueryName("alarmTargetsSet")
    AlarmTargetsSet: ListOfAlarmTargetsSet,
    @xmlName("createdTime")
    @ec2QueryName("createdTime")
    CreatedTime: Timestamp,
    @xmlName("description")
    @ec2QueryName("description")
    Description: String,
    @xmlName("emailAddressSet")
    @ec2QueryName("emailAddressSet")
    EmailAddressSet: ListOfEmailAddressSet,
    @xmlName("functionName")
    @ec2QueryName("functionName")
    FunctionName: String,
    @xmlName("ruleName")
    @ec2QueryName("ruleName")
    RuleName: String,
    @xmlName("ruleSet")
    @ec2QueryName("ruleSet")
    RuleSet: ListOfRuleSet,
    @xmlName("zone")
    @ec2QueryName("zone")
    Zone: String,
}

list ListOfRuleSet {
    @xmlName("item")
    member: RuleSet,
}

structure RuleSet {
    @xmlName("addDatetime")
    @ec2QueryName("addDatetime")
    AddDatetime: Timestamp,
    @xmlName("breachDuration")
    @ec2QueryName("breachDuration")
    BreachDuration: Integer,
    @xmlName("dataType")
    @ec2QueryName("dataType")
    DataType: String,
    @xmlName("threshold")
    @ec2QueryName("threshold")
    Threshold: Double,
    @xmlName("upperLowerCondition")
    @ec2QueryName("upperLowerCondition")
    UpperLowerCondition: String,
}

list ListOfEmailAddressSet {
    @xmlName("item")
    member: EmailAddressSet,
}

structure EmailAddressSet {
    @xmlName("emailAddress")
    @ec2QueryName("emailAddress")
    EmailAddress: String,
}

list ListOfAlarmTargetsSet {
    @xmlName("item")
    member: AlarmTargetsSet,
}

structure AlarmTargetsSet {
    @xmlName("resourceName")
    @ec2QueryName("resourceName")
    ResourceName: String,
}

@enum([
  {
      name: "SERVER",
      value: "Server",
  },
  {
      name: "LOAD_BALANCER",
      value: "LoadBalancer",
  },
  {
      name: "DISK_PARTITION",
      value: "DiskPartition",
  },
  {
      name: "ELASTIC_LOAD_BALANCER",
      value: "ElasticLoadBalancer",
  },
])
string FunctionNameOfNiftyUpdateAlarmRequest

structure RequestRuleOfNiftyUpdateAlarm {
    @required
    @xmlName("BreachDuration")
    @ec2QueryName("BreachDuration")
    BreachDuration: Integer,
    @xmlName("DataType")
    @ec2QueryName("DataType")
    DataType: String,
    @xmlName("Threshold")
    @ec2QueryName("Threshold")
    Threshold: Double,
    @xmlName("UpperLowerCondition")
    @ec2QueryName("UpperLowerCondition")
    UpperLowerCondition: UpperLowerConditionOfRuleForNiftyUpdateAlarm,
}

list ListOfRequestRuleOfNiftyUpdateAlarm {
    member: RequestRuleOfNiftyUpdateAlarm,
}

@enum([
  {
      name: "UPPER",
      value: "upper",
  },
  {
      name: "LOWER",
      value: "lower",
  },
])
string UpperLowerConditionOfRuleForNiftyUpdateAlarm

@enum([
  {
      name: "AND",
      value: "and",
  },
  {
      name: "OR",
      value: "or",
  },
])
string AlarmConditionOfNiftyUpdateAlarmRequest

structure NiftyUpdateAlarmRequest {
    @xmlName("AlarmCondition")
    @ec2QueryName("AlarmCondition")
    AlarmCondition: AlarmConditionOfNiftyUpdateAlarmRequest,
    @xmlName("Description")
    @ec2QueryName("Description")
    Description: String,
    @xmlName("ElasticLoadBalancerName")
    @ec2QueryName("ElasticLoadBalancerName")
    ElasticLoadBalancerName: ListOfRequestElasticLoadBalancerName,
    @xmlName("ElasticLoadBalancerPort")
    @ec2QueryName("ElasticLoadBalancerPort")
    ElasticLoadBalancerPort: ListOfRequestElasticLoadBalancerPort,
    @xmlName("ElasticLoadBalancerProtocol")
    @ec2QueryName("ElasticLoadBalancerProtocol")
    ElasticLoadBalancerProtocol: ListOfRequestElasticLoadBalancerProtocol,
    @xmlName("EmailAddress")
    @ec2QueryName("EmailAddress")
    EmailAddress: ListOfRequestEmailAddress,
    @required
    @xmlName("FunctionName")
    @ec2QueryName("FunctionName")
    FunctionName: FunctionNameOfNiftyUpdateAlarmRequest,
    @xmlName("InstanceId")
    @ec2QueryName("InstanceId")
    InstanceId: ListOfRequestInstanceId,
    @xmlName("LoadBalancerName")
    @ec2QueryName("LoadBalancerName")
    LoadBalancerName: ListOfRequestLoadBalancerName,
    @xmlName("LoadBalancerPort")
    @ec2QueryName("LoadBalancerPort")
    LoadBalancerPort: ListOfRequestLoadBalancerPort,
    @xmlName("Partition")
    @ec2QueryName("Partition")
    Partition: ListOfRequestPartition,
    @required
    @xmlName("Rule")
    @ec2QueryName("Rule")
    Rule: ListOfRequestRuleOfNiftyUpdateAlarm,
    @required
    @xmlName("RuleName")
    @ec2QueryName("RuleName")
    RuleName: String,
    @xmlName("RuleNameUpdate")
    @ec2QueryName("RuleNameUpdate")
    RuleNameUpdate: String,
}

structure NiftyUpdateAlarmResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("return")
    @ec2QueryName("return")
    Return: Boolean,
}

@enum([
  {
      name: "SERVER",
      value: "Server",
  },
  {
      name: "LOAD_BALANCER",
      value: "LoadBalancer",
  },
  {
      name: "DISK_PARTITION",
      value: "DiskPartition",
  },
  {
      name: "ELASTIC_LOAD_BALANCER",
      value: "ElasticLoadBalancer",
  },
])
string FunctionNameOfNiftyDeleteAlarmRequest

structure NiftyDeleteAlarmRequest {
    @required
    @xmlName("FunctionName")
    @ec2QueryName("FunctionName")
    FunctionName: FunctionNameOfNiftyDeleteAlarmRequest,
    @required
    @xmlName("RuleName")
    @ec2QueryName("RuleName")
    RuleName: String,
}

structure NiftyDeleteAlarmResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("return")
    @ec2QueryName("return")
    Return: Boolean,
}

structure NiftyDescribeAlarmsPartitionsRequest {
    @xmlName("InstanceId")
    @ec2QueryName("InstanceId")
    InstanceId: ListOfRequestInstanceId,
}

structure NiftyDescribeAlarmsPartitionsResult {
    @xmlName("alarmTargetSet")
    @ec2QueryName("alarmTargetSet")
    AlarmTargetSet: ListOfAlarmTargetSet,
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
}

list ListOfAlarmTargetSet {
    @xmlName("item")
    member: AlarmTargetSet,
}

structure AlarmTargetSet {
    @xmlName("instanceId")
    @ec2QueryName("instanceId")
    InstanceId: String,
    @xmlName("partitionsSet")
    @ec2QueryName("partitionsSet")
    PartitionsSet: ListOfPartitionsSet,
}

list ListOfPartitionsSet {
    @xmlName("item")
    member: PartitionsSet,
}

structure PartitionsSet {
    @xmlName("partition")
    @ec2QueryName("partition")
    Partition: String,
}

@enum([
  {
      name: "SERVER",
      value: "Server",
  },
  {
      name: "LOAD_BALANCER",
      value: "LoadBalancer",
  },
  {
      name: "LB",
      value: "LB",
  },
  {
      name: "DISK_PARTITION",
      value: "DiskPartition",
  },
  {
      name: "DP",
      value: "DP",
  },
  {
      name: "ELASTIC_LOAD_BALANCER",
      value: "ElasticLoadBalancer",
  },
  {
      name: "ELB",
      value: "ELB",
  },
])
string FunctionNameOfNiftyDescribePerformanceChartRequest

list ListOfRequestResourceName {
    member: String,
}

list ListOfRequestDataType {
    member: String,
}

@enum([
  {
      name: "AVERAGE",
      value: "1",
  },
  {
      name: "MAXIMUM",
      value: "2",
  },
])
string ValueTypeOfNiftyDescribePerformanceChartRequest

structure NiftyDescribePerformanceChartRequest {
    @xmlName("DataType")
    @ec2QueryName("DataType")
    DataType: ListOfRequestDataType,
    @xmlName("FromDate")
    @ec2QueryName("FromDate")
    FromDate: String,
    @required
    @xmlName("FunctionName")
    @ec2QueryName("FunctionName")
    FunctionName: FunctionNameOfNiftyDescribePerformanceChartRequest,
    @required
    @xmlName("ResourceName")
    @ec2QueryName("ResourceName")
    ResourceName: ListOfRequestResourceName,
    @xmlName("ToDate")
    @ec2QueryName("ToDate")
    ToDate: String,
    @xmlName("ValueType")
    @ec2QueryName("ValueType")
    ValueType: ValueTypeOfNiftyDescribePerformanceChartRequest,
}

structure NiftyDescribePerformanceChartResult {
    @xmlName("functionName")
    @ec2QueryName("functionName")
    FunctionName: String,
    @xmlName("performanceChartSet")
    @ec2QueryName("performanceChartSet")
    PerformanceChartSet: ListOfPerformanceChartSet,
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("valueType")
    @ec2QueryName("valueType")
    ValueType: String,
}

list ListOfPerformanceChartSet {
    @xmlName("item")
    member: PerformanceChartSet,
}

structure PerformanceChartSet {
    @xmlName("dataSet")
    @ec2QueryName("dataSet")
    DataSet: ListOfDataSet,
    @xmlName("dataType")
    @ec2QueryName("dataType")
    DataType: String,
    @xmlName("resourceName")
    @ec2QueryName("resourceName")
    ResourceName: String,
}

list ListOfDataSet {
    @xmlName("item")
    member: DataSet,
}

structure DataSet {
    @xmlName("dateTime")
    @ec2QueryName("dateTime")
    DateTime: String,
    @xmlName("value")
    @ec2QueryName("value")
    Value: String,
}

structure RequestRuleOfNiftyDescribeAlarmHistory {
    @xmlName("FromDate")
    @ec2QueryName("FromDate")
    FromDate: String,
    @xmlName("FunctionName")
    @ec2QueryName("FunctionName")
    FunctionName: FunctionNameOfRuleForNiftyDescribeAlarmHistory,
    @xmlName("RuleName")
    @ec2QueryName("RuleName")
    RuleName: String,
    @xmlName("ToDate")
    @ec2QueryName("ToDate")
    ToDate: String,
}

list ListOfRequestRuleOfNiftyDescribeAlarmHistory {
    member: RequestRuleOfNiftyDescribeAlarmHistory,
}

@enum([
  {
      name: "SERVER",
      value: "Server",
  },
  {
      name: "LOAD_BALANCER",
      value: "LoadBalancer",
  },
  {
      name: "DISK_PARTITION",
      value: "DiskPartition",
  },
  {
      name: "ELASTIC_LOAD_BALANCER",
      value: "ElasticLoadBalancer",
  },
])
string FunctionNameOfRuleForNiftyDescribeAlarmHistory

structure NiftyDescribeAlarmHistoryRequest {
    @xmlName("Rule")
    @ec2QueryName("Rule")
    Rule: ListOfRequestRuleOfNiftyDescribeAlarmHistory,
}

structure NiftyDescribeAlarmHistoryResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("reservationSet")
    @ec2QueryName("reservationSet")
    ReservationSet: ListOfReservationSetOfNiftyDescribeAlarmHistory,
}

list ListOfReservationSetOfNiftyDescribeAlarmHistory {
    @xmlName("item")
    member: ReservationSetOfNiftyDescribeAlarmHistory,
}

structure ReservationSetOfNiftyDescribeAlarmHistory {
    @xmlName("alarmDateHistorySet")
    @ec2QueryName("alarmDateHistorySet")
    AlarmDateHistorySet: ListOfAlarmDateHistorySet,
    @xmlName("functionName")
    @ec2QueryName("functionName")
    FunctionName: String,
    @xmlName("ruleName")
    @ec2QueryName("ruleName")
    RuleName: String,
}

list ListOfAlarmDateHistorySet {
    @xmlName("item")
    member: AlarmDateHistorySet,
}

structure AlarmDateHistorySet {
    @xmlName("alarmEventHistorySet")
    @ec2QueryName("alarmEventHistorySet")
    AlarmEventHistorySet: ListOfAlarmEventHistorySet,
    @xmlName("date")
    @ec2QueryName("date")
    Date: String,
}

list ListOfAlarmEventHistorySet {
    @xmlName("item")
    member: AlarmEventHistorySet,
}

structure AlarmEventHistorySet {
    @xmlName("alarmEvent")
    @ec2QueryName("alarmEvent")
    AlarmEvent: String,
    @xmlName("alarmEventDatetime")
    @ec2QueryName("alarmEventDatetime")
    AlarmEventDatetime: Timestamp,
}

structure RequestRuleOfNiftyDescribeAlarmRulesActivities {
    @xmlName("DataType")
    @ec2QueryName("DataType")
    DataType: String,
    @xmlName("FromDate")
    @ec2QueryName("FromDate")
    FromDate: String,
    @xmlName("FunctionName")
    @ec2QueryName("FunctionName")
    FunctionName: FunctionNameOfRuleForNiftyDescribeAlarmRulesActivities,
    @xmlName("RuleName")
    @ec2QueryName("RuleName")
    RuleName: String,
    @xmlName("ToDate")
    @ec2QueryName("ToDate")
    ToDate: String,
}

list ListOfRequestRuleOfNiftyDescribeAlarmRulesActivities {
    member: RequestRuleOfNiftyDescribeAlarmRulesActivities,
}

@enum([
  {
      name: "SERVER",
      value: "Server",
  },
  {
      name: "LOAD_BALANCER",
      value: "LoadBalancer",
  },
  {
      name: "DISK_PARTITION",
      value: "DiskPartition",
  },
])
string FunctionNameOfRuleForNiftyDescribeAlarmRulesActivities

structure NiftyDescribeAlarmRulesActivitiesRequest {
    @xmlName("Rule")
    @ec2QueryName("Rule")
    Rule: ListOfRequestRuleOfNiftyDescribeAlarmRulesActivities,
}

structure NiftyDescribeAlarmRulesActivitiesResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("reservationSet")
    @ec2QueryName("reservationSet")
    ReservationSet: ListOfReservationSetOfNiftyDescribeAlarmRulesActivities,
}

list ListOfReservationSetOfNiftyDescribeAlarmRulesActivities {
    @xmlName("item")
    member: ReservationSetOfNiftyDescribeAlarmRulesActivities,
}

structure ReservationSetOfNiftyDescribeAlarmRulesActivities {
    @xmlName("alarmRulesActivitiesSet")
    @ec2QueryName("alarmRulesActivitiesSet")
    AlarmRulesActivitiesSet: ListOfAlarmRulesActivitiesSet,
    @xmlName("functionName")
    @ec2QueryName("functionName")
    FunctionName: String,
    @xmlName("ruleName")
    @ec2QueryName("ruleName")
    RuleName: String,
}

list ListOfAlarmRulesActivitiesSet {
    @xmlName("item")
    member: AlarmRulesActivitiesSet,
}

structure AlarmRulesActivitiesSet {
    @xmlName("alarmRulesActivitiesDateSet")
    @ec2QueryName("alarmRulesActivitiesDateSet")
    AlarmRulesActivitiesDateSet: ListOfAlarmRulesActivitiesDateSet,
    @xmlName("dataType")
    @ec2QueryName("dataType")
    DataType: String,
}

list ListOfAlarmRulesActivitiesDateSet {
    @xmlName("item")
    member: AlarmRulesActivitiesDateSet,
}

structure AlarmRulesActivitiesDateSet {
    @xmlName("alarmRulesActivitiesEventSet")
    @ec2QueryName("alarmRulesActivitiesEventSet")
    AlarmRulesActivitiesEventSet: ListOfAlarmRulesActivitiesEventSet,
    @xmlName("date")
    @ec2QueryName("date")
    Date: String,
}

list ListOfAlarmRulesActivitiesEventSet {
    @xmlName("item")
    member: AlarmRulesActivitiesEventSet,
}

structure AlarmRulesActivitiesEventSet {
    @xmlName("alarmRulesActivitiesEvent")
    @ec2QueryName("alarmRulesActivitiesEvent")
    AlarmRulesActivitiesEvent: String,
    @xmlName("alarmRulesActivitiesEventDatetime")
    @ec2QueryName("alarmRulesActivitiesEventDatetime")
    AlarmRulesActivitiesEventDatetime: Timestamp,
    @xmlName("resourceName")
    @ec2QueryName("resourceName")
    ResourceName: String,
    @xmlName("value")
    @ec2QueryName("value")
    Value: String,
}

@enum([
  {
      name: "MONTHLY",
      value: "1",
  },
  {
      name: "HOURLY",
      value: "2",
  },
])
string AccountingTypeOfNiftyCreatePrivateLanRequest

structure NiftyCreatePrivateLanRequest {
    @xmlName("AccountingType")
    @ec2QueryName("AccountingType")
    AccountingType: AccountingTypeOfNiftyCreatePrivateLanRequest,
    @xmlName("AvailabilityZone")
    @ec2QueryName("AvailabilityZone")
    AvailabilityZone: String,
    @required
    @xmlName("CidrBlock")
    @ec2QueryName("CidrBlock")
    CidrBlock: String,
    @xmlName("Description")
    @ec2QueryName("Description")
    Description: String,
    @xmlName("PrivateLanName")
    @ec2QueryName("PrivateLanName")
    PrivateLanName: String,
}

structure NiftyCreatePrivateLanResult {
    @xmlName("privateLan")
    @ec2QueryName("privateLan")
    PrivateLan: PrivateLanOfNiftyCreatePrivateLan,
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
}

structure PrivateLanOfNiftyCreatePrivateLan {
    @xmlName("accountingType")
    @ec2QueryName("accountingType")
    AccountingType: String,
    @xmlName("availabilityZone")
    @ec2QueryName("availabilityZone")
    AvailabilityZone: String,
    @xmlName("cidrBlock")
    @ec2QueryName("cidrBlock")
    CidrBlock: String,
    @xmlName("createdTime")
    @ec2QueryName("createdTime")
    CreatedTime: Timestamp,
    @xmlName("description")
    @ec2QueryName("description")
    Description: String,
    @xmlName("elasticLoadBalancingSet")
    @ec2QueryName("elasticLoadBalancingSet")
    ElasticLoadBalancingSet: ListOfElasticLoadBalancingOfNiftyDescribeAutoScalingGroupsSet,
    @xmlName("instancesSet")
    @ec2QueryName("instancesSet")
    InstancesSet: ListOfInstancesSetOfNiftyCreatePrivateLan,
    @xmlName("networkId")
    @ec2QueryName("networkId")
    NetworkId: String,
    @xmlName("networkInterfaceSet")
    @ec2QueryName("networkInterfaceSet")
    NetworkInterfaceSet: ListOfNetworkInterfaceSetOfNiftyCreatePrivateLan,
    @xmlName("nextMonthAccountingType")
    @ec2QueryName("nextMonthAccountingType")
    NextMonthAccountingType: String,
    @xmlName("privateLanName")
    @ec2QueryName("privateLanName")
    PrivateLanName: String,
    @xmlName("remoteAccessVpnGatewaySet")
    @ec2QueryName("remoteAccessVpnGatewaySet")
    RemoteAccessVpnGatewaySet: ListOfRemoteAccessVpnGatewaySetOfNiftyCreatePrivateLan,
    @xmlName("routerSet")
    @ec2QueryName("routerSet")
    RouterSet: ListOfRouterSetOfNiftyCreatePrivateLan,
    @xmlName("sharingStatus")
    @ec2QueryName("sharingStatus")
    SharingStatus: String,
    @xmlName("state")
    @ec2QueryName("state")
    State: String,
    @xmlName("tagSet")
    @ec2QueryName("tagSet")
    TagSet: ListOfTagSet,
    @xmlName("vpnGatewaySet")
    @ec2QueryName("vpnGatewaySet")
    VpnGatewaySet: ListOfVpnGatewaySetOfNiftyCreatePrivateLan,
}

list ListOfInstancesSetOfNiftyCreatePrivateLan {
    @xmlName("item")
    member: InstancesSetOfNiftyCreatePrivateLan,
}

structure InstancesSetOfNiftyCreatePrivateLan {
    @xmlName("deviceIndex")
    @ec2QueryName("deviceIndex")
    DeviceIndex: Integer,
    @xmlName("instanceId")
    @ec2QueryName("instanceId")
    InstanceId: String,
    @xmlName("instanceUniqueId")
    @ec2QueryName("instanceUniqueId")
    InstanceUniqueId: String,
    @xmlName("ipAddress")
    @ec2QueryName("ipAddress")
    IpAddress: String,
}

list ListOfRouterSetOfNiftyCreatePrivateLan {
    @xmlName("item")
    member: RouterSetOfNiftyCreatePrivateLan,
}

structure RouterSetOfNiftyCreatePrivateLan {
    @xmlName("deviceIndex")
    @ec2QueryName("deviceIndex")
    DeviceIndex: Integer,
    @xmlName("ipAddress")
    @ec2QueryName("ipAddress")
    IpAddress: String,
    @xmlName("routerId")
    @ec2QueryName("routerId")
    RouterId: String,
    @xmlName("routerName")
    @ec2QueryName("routerName")
    RouterName: String,
}

list ListOfVpnGatewaySetOfNiftyCreatePrivateLan {
    @xmlName("item")
    member: VpnGatewaySetOfNiftyCreatePrivateLan,
}

structure VpnGatewaySetOfNiftyCreatePrivateLan {
    @xmlName("deviceIndex")
    @ec2QueryName("deviceIndex")
    DeviceIndex: Integer,
    @xmlName("ipAddress")
    @ec2QueryName("ipAddress")
    IpAddress: String,
    @xmlName("niftyVpnGatewayName")
    @ec2QueryName("niftyVpnGatewayName")
    NiftyVpnGatewayName: String,
    @xmlName("vpnGatewayId")
    @ec2QueryName("vpnGatewayId")
    VpnGatewayId: String,
}

list ListOfElasticLoadBalancingOfNiftyDescribeAutoScalingGroupsSet {
    @xmlName("item")
    member: ElasticLoadBalancingOfNiftyDescribeAutoScalingGroupsSet,
}

structure ElasticLoadBalancingOfNiftyDescribeAutoScalingGroupsSet {
    @xmlName("elasticLoadBalancerName")
    @ec2QueryName("elasticLoadBalancerName")
    ElasticLoadBalancerName: String,
    @xmlName("elasticLoadBalancerPort")
    @ec2QueryName("elasticLoadBalancerPort")
    ElasticLoadBalancerPort: Integer,
    @xmlName("instancePort")
    @ec2QueryName("instancePort")
    InstancePort: Integer,
    @xmlName("protocol")
    @ec2QueryName("protocol")
    Protocol: String,
}

list ListOfNetworkInterfaceSetOfNiftyCreatePrivateLan {
    @xmlName("item")
    member: NetworkInterfaceSetOfNiftyCreatePrivateLan,
}

structure NetworkInterfaceSetOfNiftyCreatePrivateLan {
    @xmlName("ipAddress")
    @ec2QueryName("ipAddress")
    IpAddress: String,
    @xmlName("networkInterfaceId")
    @ec2QueryName("networkInterfaceId")
    NetworkInterfaceId: String,
}

list ListOfRemoteAccessVpnGatewaySetOfNiftyCreatePrivateLan {
    @xmlName("item")
    member: RemoteAccessVpnGatewaySetOfNiftyCreatePrivateLan,
}

structure RemoteAccessVpnGatewaySetOfNiftyCreatePrivateLan {
    @xmlName("deviceIndex")
    @ec2QueryName("deviceIndex")
    DeviceIndex: Integer,
    @xmlName("ipAddress")
    @ec2QueryName("ipAddress")
    IpAddress: String,
    @xmlName("remoteAccessVpnGatewayId")
    @ec2QueryName("remoteAccessVpnGatewayId")
    RemoteAccessVpnGatewayId: String,
    @xmlName("remoteAccessVpnGatewayName")
    @ec2QueryName("remoteAccessVpnGatewayName")
    RemoteAccessVpnGatewayName: String,
}

structure NiftyDeletePrivateLanRequest {
    @xmlName("NetworkId")
    @ec2QueryName("NetworkId")
    NetworkId: String,
    @xmlName("PrivateLanName")
    @ec2QueryName("PrivateLanName")
    PrivateLanName: String,
}

structure NiftyDeletePrivateLanResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("return")
    @ec2QueryName("return")
    Return: Boolean,
}

list ListOfRequestNetworkId {
    member: String,
}

list ListOfRequestPrivateLanName {
    member: String,
}

@enum([
  {
      name: "ZONE",
      value: "availabilityZone, availability-zone",
  },
  {
      name: "CIDR",
      value: "cidrBlock, cidr, cidr-block",
  },
  {
      name: "STATE",
      value: "state",
  },
  {
      name: "NETWORK_ID",
      value: "network-id",
  },
  {
      name: "PRIVATE_LAN_NAME",
      value: "private-lan-name",
  },
  {
      name: "ACCOUNTING_TYPE",
      value: "accountingType",
  },
  {
      name: "DESCRIPTION",
      value: "description",
  },
])
string NameOfFilterForNiftyDescribePrivateLans

structure RequestFilterOfNiftyDescribePrivateLans {
    @xmlName("Value")
    @ec2QueryName("Value")
    ListOfRequestValue: ListOfRequestValue,
    @xmlName("Name")
    @ec2QueryName("Name")
    Name: NameOfFilterForNiftyDescribePrivateLans,
}

list ListOfRequestFilterOfNiftyDescribePrivateLans {
    member: RequestFilterOfNiftyDescribePrivateLans,
}

structure NiftyDescribePrivateLansRequest {
    @xmlName("Filter")
    @ec2QueryName("Filter")
    Filter: ListOfRequestFilterOfNiftyDescribePrivateLans,
    @xmlName("NetworkId")
    @ec2QueryName("NetworkId")
    NetworkId: ListOfRequestNetworkId,
    @xmlName("PrivateLanName")
    @ec2QueryName("PrivateLanName")
    PrivateLanName: ListOfRequestPrivateLanName,
}

structure NiftyDescribePrivateLansResult {
    @xmlName("privateLanSet")
    @ec2QueryName("privateLanSet")
    PrivateLanSet: ListOfPrivateLanSet,
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
}

list ListOfPrivateLanSet {
    @xmlName("item")
    member: PrivateLanSet,
}

structure PrivateLanSet {
    @xmlName("accountingType")
    @ec2QueryName("accountingType")
    AccountingType: String,
    @xmlName("availabilityZone")
    @ec2QueryName("availabilityZone")
    AvailabilityZone: String,
    @xmlName("cidrBlock")
    @ec2QueryName("cidrBlock")
    CidrBlock: String,
    @xmlName("createdTime")
    @ec2QueryName("createdTime")
    CreatedTime: Timestamp,
    @xmlName("description")
    @ec2QueryName("description")
    Description: String,
    @xmlName("elasticLoadBalancingSet")
    @ec2QueryName("elasticLoadBalancingSet")
    ElasticLoadBalancingSet: ListOfElasticLoadBalancingOfNiftyDescribeAutoScalingGroupsSet,
    @xmlName("instancesSet")
    @ec2QueryName("instancesSet")
    InstancesSet: ListOfInstancesSetOfNiftyDescribePrivateLans,
    @xmlName("networkId")
    @ec2QueryName("networkId")
    NetworkId: String,
    @xmlName("networkInterfaceSet")
    @ec2QueryName("networkInterfaceSet")
    NetworkInterfaceSet: ListOfNetworkInterfaceSetOfNiftyDescribePrivateLans,
    @xmlName("nextMonthAccountingType")
    @ec2QueryName("nextMonthAccountingType")
    NextMonthAccountingType: String,
    @xmlName("privateLanName")
    @ec2QueryName("privateLanName")
    PrivateLanName: String,
    @xmlName("remoteAccessVpnGatewaySet")
    @ec2QueryName("remoteAccessVpnGatewaySet")
    RemoteAccessVpnGatewaySet: ListOfRemoteAccessVpnGatewaySetOfNiftyDescribePrivateLans,
    @xmlName("routerSet")
    @ec2QueryName("routerSet")
    RouterSet: ListOfRouterSetOfNiftyDescribePrivateLans,
    @xmlName("sharingStatus")
    @ec2QueryName("sharingStatus")
    SharingStatus: String,
    @xmlName("state")
    @ec2QueryName("state")
    State: String,
    @xmlName("tagSet")
    @ec2QueryName("tagSet")
    TagSet: ListOfTagSet,
    @xmlName("vpnGatewaySet")
    @ec2QueryName("vpnGatewaySet")
    VpnGatewaySet: ListOfVpnGatewaySetOfNiftyDescribePrivateLans,
}

list ListOfInstancesSetOfNiftyDescribePrivateLans {
    @xmlName("item")
    member: InstancesSetOfNiftyDescribePrivateLans,
}

structure InstancesSetOfNiftyDescribePrivateLans {
    @xmlName("deviceIndex")
    @ec2QueryName("deviceIndex")
    DeviceIndex: Integer,
    @xmlName("instanceId")
    @ec2QueryName("instanceId")
    InstanceId: String,
    @xmlName("instanceUniqueId")
    @ec2QueryName("instanceUniqueId")
    InstanceUniqueId: String,
    @xmlName("ipAddress")
    @ec2QueryName("ipAddress")
    IpAddress: String,
}

list ListOfRouterSetOfNiftyDescribePrivateLans {
    @xmlName("item")
    member: RouterSetOfNiftyDescribePrivateLans,
}

structure RouterSetOfNiftyDescribePrivateLans {
    @xmlName("deviceIndex")
    @ec2QueryName("deviceIndex")
    DeviceIndex: Integer,
    @xmlName("ipAddress")
    @ec2QueryName("ipAddress")
    IpAddress: String,
    @xmlName("routerId")
    @ec2QueryName("routerId")
    RouterId: String,
    @xmlName("routerName")
    @ec2QueryName("routerName")
    RouterName: String,
}

list ListOfVpnGatewaySetOfNiftyDescribePrivateLans {
    @xmlName("item")
    member: VpnGatewaySetOfNiftyDescribePrivateLans,
}

structure VpnGatewaySetOfNiftyDescribePrivateLans {
    @xmlName("deviceIndex")
    @ec2QueryName("deviceIndex")
    DeviceIndex: Integer,
    @xmlName("ipAddress")
    @ec2QueryName("ipAddress")
    IpAddress: String,
    @xmlName("niftyVpnGatewayName")
    @ec2QueryName("niftyVpnGatewayName")
    NiftyVpnGatewayName: String,
    @xmlName("vpnGatewayId")
    @ec2QueryName("vpnGatewayId")
    VpnGatewayId: String,
}

list ListOfNetworkInterfaceSetOfNiftyDescribePrivateLans {
    @xmlName("item")
    member: NetworkInterfaceSetOfNiftyDescribePrivateLans,
}

structure NetworkInterfaceSetOfNiftyDescribePrivateLans {
    @xmlName("ipAddress")
    @ec2QueryName("ipAddress")
    IpAddress: String,
    @xmlName("networkInterfaceId")
    @ec2QueryName("networkInterfaceId")
    NetworkInterfaceId: String,
}

list ListOfRemoteAccessVpnGatewaySetOfNiftyDescribePrivateLans {
    @xmlName("item")
    member: RemoteAccessVpnGatewaySetOfNiftyDescribePrivateLans,
}

structure RemoteAccessVpnGatewaySetOfNiftyDescribePrivateLans {
    @xmlName("deviceIndex")
    @ec2QueryName("deviceIndex")
    DeviceIndex: Integer,
    @xmlName("ipAddress")
    @ec2QueryName("ipAddress")
    IpAddress: String,
    @xmlName("remoteAccessVpnGatewayId")
    @ec2QueryName("remoteAccessVpnGatewayId")
    RemoteAccessVpnGatewayId: String,
    @xmlName("remoteAccessVpnGatewayName")
    @ec2QueryName("remoteAccessVpnGatewayName")
    RemoteAccessVpnGatewayName: String,
}

@enum([
  {
      name: "PRIVATE_LAN_NAME",
      value: "privateLanName",
  },
  {
      name: "CIDR_BLOCK",
      value: "cidrBlock",
  },
  {
      name: "ACCOUNTING_TYPE",
      value: "accountingType",
  },
  {
      name: "DESCRIPTION",
      value: "description",
  },
])
string AttributeOfNiftyModifyPrivateLanAttributeRequest

structure NiftyModifyPrivateLanAttributeRequest {
    @required
    @xmlName("Attribute")
    @ec2QueryName("Attribute")
    Attribute: AttributeOfNiftyModifyPrivateLanAttributeRequest,
    @xmlName("NetworkId")
    @ec2QueryName("NetworkId")
    NetworkId: String,
    @xmlName("PrivateLanName")
    @ec2QueryName("PrivateLanName")
    PrivateLanName: String,
    @required
    @xmlName("Value")
    @ec2QueryName("Value")
    Value: String,
}

structure NiftyModifyPrivateLanAttributeResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("return")
    @ec2QueryName("return")
    Return: Boolean,
}

@enum([
  {
      name: "MONTHLY",
      value: "1",
  },
  {
      name: "HOURLY",
      value: "2",
  },
])
string AccountingTypeOfNiftyCreateRouterRequest

@enum([
  {
      name: "SMALL",
      value: "small",
  },
  {
      name: "MEDIUM",
      value: "medium",
  },
  {
      name: "LARGE",
      value: "large",
  },
])
string TypeOfNiftyCreateRouterRequest

structure RequestNetworkInterfaceOfNiftyCreateRouter {
    @xmlName("DeviceIndex")
    @ec2QueryName("DeviceIndex")
    DeviceIndex: Integer,
    @xmlName("Dhcp")
    @ec2QueryName("Dhcp")
    Dhcp: Boolean,
    @xmlName("DhcpConfigId")
    @ec2QueryName("DhcpConfigId")
    DhcpConfigId: String,
    @xmlName("DhcpOptionsId")
    @ec2QueryName("DhcpOptionsId")
    DhcpOptionsId: String,
    @xmlName("IpAddress")
    @ec2QueryName("IpAddress")
    IpAddress: String,
    @xmlName("SecurityGroupId")
    @ec2QueryName("SecurityGroupId")
    ListOfRequestSecurityGroupId: ListOfRequestSecurityGroupId,
    @xmlName("NetworkId")
    @ec2QueryName("NetworkId")
    NetworkId: String,
    @xmlName("NetworkName")
    @ec2QueryName("NetworkName")
    NetworkName: String,
}

list ListOfRequestNetworkInterfaceOfNiftyCreateRouter {
    member: RequestNetworkInterfaceOfNiftyCreateRouter,
}

structure NiftyCreateRouterRequest {
    @xmlName("AccountingType")
    @ec2QueryName("AccountingType")
    AccountingType: AccountingTypeOfNiftyCreateRouterRequest,
    @xmlName("AvailabilityZone")
    @ec2QueryName("AvailabilityZone")
    AvailabilityZone: String,
    @xmlName("Description")
    @ec2QueryName("Description")
    Description: String,
    @xmlName("NetworkInterface")
    @ec2QueryName("NetworkInterface")
    NetworkInterface: ListOfRequestNetworkInterfaceOfNiftyCreateRouter,
    @xmlName("RouterName")
    @ec2QueryName("RouterName")
    RouterName: String,
    @xmlName("SecurityGroup")
    @ec2QueryName("SecurityGroup")
    SecurityGroup: ListOfRequestSecurityGroup,
    @xmlName("Type")
    @ec2QueryName("Type")
    Type: TypeOfNiftyCreateRouterRequest,
}

structure NiftyCreateRouterResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("router")
    @ec2QueryName("router")
    Router: Router,
}

structure Router {
    @xmlName("accountingType")
    @ec2QueryName("accountingType")
    AccountingType: String,
    @xmlName("availabilityZone")
    @ec2QueryName("availabilityZone")
    AvailabilityZone: String,
    @xmlName("backupInformation")
    @ec2QueryName("backupInformation")
    BackupInformation: BackupInformation,
    @xmlName("description")
    @ec2QueryName("description")
    Description: String,
    @xmlName("groupSet")
    @ec2QueryName("groupSet")
    GroupSet: ListOfGroupSet,
    @xmlName("networkInterfaceSet")
    @ec2QueryName("networkInterfaceSet")
    NetworkInterfaceSet: ListOfNetworkInterfaceSetOfNiftyCreateRouter,
    @xmlName("nextMonthAccountingType")
    @ec2QueryName("nextMonthAccountingType")
    NextMonthAccountingType: String,
    @xmlName("routerId")
    @ec2QueryName("routerId")
    RouterId: String,
    @xmlName("routerName")
    @ec2QueryName("routerName")
    RouterName: String,
    @xmlName("state")
    @ec2QueryName("state")
    State: String,
    @xmlName("type")
    @ec2QueryName("type")
    Type: String,
    @xmlName("versionInformation")
    @ec2QueryName("versionInformation")
    VersionInformation: VersionInformationOfNiftyCreateRouter,
}

structure VersionInformationOfNiftyCreateRouter {
    @xmlName("isLatest")
    @ec2QueryName("isLatest")
    IsLatest: Boolean,
    @xmlName("version")
    @ec2QueryName("version")
    Version: String,
}

list ListOfNetworkInterfaceSetOfNiftyCreateRouter {
    @xmlName("item")
    member: NetworkInterfaceSetOfNiftyCreateRouter,
}

structure NetworkInterfaceSetOfNiftyCreateRouter {
    @xmlName("dhcp")
    @ec2QueryName("dhcp")
    Dhcp: Boolean,
    @xmlName("dhcpConfigId")
    @ec2QueryName("dhcpConfigId")
    DhcpConfigId: String,
    @xmlName("dhcpOptionsId")
    @ec2QueryName("dhcpOptionsId")
    DhcpOptionsId: String,
    @xmlName("ipAddress")
    @ec2QueryName("ipAddress")
    IpAddress: String,
    @xmlName("networkId")
    @ec2QueryName("networkId")
    NetworkId: String,
    @xmlName("networkName")
    @ec2QueryName("networkName")
    NetworkName: String,
}

structure BackupInformation {
    @xmlName("isBackup")
    @ec2QueryName("isBackup")
    IsBackup: Boolean,
}

structure NiftyDeleteRouterRequest {
    @xmlName("RouterId")
    @ec2QueryName("RouterId")
    RouterId: String,
    @xmlName("RouterName")
    @ec2QueryName("RouterName")
    RouterName: String,
}

structure NiftyDeleteRouterResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("return")
    @ec2QueryName("return")
    Return: Boolean,
}

list ListOfRequestRouterId {
    member: String,
}

list ListOfRequestRouterName {
    member: String,
}

@enum([
  {
      name: "AVAILABILITY_ZONE",
      value: "availability-zone",
  },
  {
      name: "STATE",
      value: "state",
  },
  {
      name: "ROUTER_ID",
      value: "router-id",
  },
  {
      name: "ROUTER_NAME",
      value: "router-name",
  },
  {
      name: "DESCRIPTION",
      value: "description",
  },
  {
      name: "ACCOUNTING_TYPE",
      value: "accountingType",
  },
  {
      name: "TYPE",
      value: "type",
  },
  {
      name: "IP_ADDRESS",
      value: "ip-address",
  },
  {
      name: "VERSION",
      value: "version",
  },
  {
      name: "LATEST_VERSION_INFORMATION",
      value: "latest-version-information",
  },
])
string NameOfFilterForNiftyDescribeRouters

structure RequestFilterOfNiftyDescribeRouters {
    @xmlName("Value")
    @ec2QueryName("Value")
    ListOfRequestValue: ListOfRequestValue,
    @xmlName("Name")
    @ec2QueryName("Name")
    Name: NameOfFilterForNiftyDescribeRouters,
}

list ListOfRequestFilterOfNiftyDescribeRouters {
    member: RequestFilterOfNiftyDescribeRouters,
}

structure NiftyDescribeRoutersRequest {
    @xmlName("Filter")
    @ec2QueryName("Filter")
    Filter: ListOfRequestFilterOfNiftyDescribeRouters,
    @xmlName("RouterId")
    @ec2QueryName("RouterId")
    RouterId: ListOfRequestRouterId,
    @xmlName("RouterName")
    @ec2QueryName("RouterName")
    RouterName: ListOfRequestRouterName,
}

structure NiftyDescribeRoutersResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("routerSet")
    @ec2QueryName("routerSet")
    RouterSet: ListOfRouterSetOfNiftyDescribeRouters,
}

list ListOfRouterSetOfNiftyDescribeRouters {
    @xmlName("item")
    member: RouterSetOfNiftyDescribeRouters,
}

structure RouterSetOfNiftyDescribeRouters {
    @xmlName("accountingType")
    @ec2QueryName("accountingType")
    AccountingType: String,
    @xmlName("availabilityZone")
    @ec2QueryName("availabilityZone")
    AvailabilityZone: String,
    @xmlName("backupInformation")
    @ec2QueryName("backupInformation")
    BackupInformation: BackupInformationOfNiftyDescribeRouters,
    @xmlName("createdTime")
    @ec2QueryName("createdTime")
    CreatedTime: Timestamp,
    @xmlName("description")
    @ec2QueryName("description")
    Description: String,
    @xmlName("groupSet")
    @ec2QueryName("groupSet")
    GroupSet: ListOfGroupSet,
    @xmlName("natTableAssociationId")
    @ec2QueryName("natTableAssociationId")
    NatTableAssociationId: String,
    @xmlName("natTableId")
    @ec2QueryName("natTableId")
    NatTableId: String,
    @xmlName("networkInterfaceSet")
    @ec2QueryName("networkInterfaceSet")
    NetworkInterfaceSet: ListOfNetworkInterfaceSetOfNiftyDescribeRouters,
    @xmlName("nextMonthAccountingType")
    @ec2QueryName("nextMonthAccountingType")
    NextMonthAccountingType: String,
    @xmlName("routerId")
    @ec2QueryName("routerId")
    RouterId: String,
    @xmlName("routerName")
    @ec2QueryName("routerName")
    RouterName: String,
    @xmlName("routeTableAssociationId")
    @ec2QueryName("routeTableAssociationId")
    RouteTableAssociationId: String,
    @xmlName("routeTableId")
    @ec2QueryName("routeTableId")
    RouteTableId: String,
    @xmlName("state")
    @ec2QueryName("state")
    State: String,
    @xmlName("tagSet")
    @ec2QueryName("tagSet")
    TagSet: ListOfTagSet,
    @xmlName("type")
    @ec2QueryName("type")
    Type: String,
    @xmlName("versionInformation")
    @ec2QueryName("versionInformation")
    VersionInformation: VersionInformationOfNiftyDescribeRouters,
}

structure VersionInformationOfNiftyDescribeRouters {
    @xmlName("isLatest")
    @ec2QueryName("isLatest")
    IsLatest: Boolean,
    @xmlName("version")
    @ec2QueryName("version")
    Version: String,
}

list ListOfNetworkInterfaceSetOfNiftyDescribeRouters {
    @xmlName("item")
    member: NetworkInterfaceSetOfNiftyDescribeRouters,
}

structure NetworkInterfaceSetOfNiftyDescribeRouters {
    @xmlName("cidrBlock")
    @ec2QueryName("cidrBlock")
    CidrBlock: String,
    @xmlName("description")
    @ec2QueryName("description")
    Description: String,
    @xmlName("deviceIndex")
    @ec2QueryName("deviceIndex")
    DeviceIndex: Integer,
    @xmlName("dhcp")
    @ec2QueryName("dhcp")
    Dhcp: Boolean,
    @xmlName("dhcpConfigId")
    @ec2QueryName("dhcpConfigId")
    DhcpConfigId: String,
    @xmlName("dhcpOptionsId")
    @ec2QueryName("dhcpOptionsId")
    DhcpOptionsId: String,
    @xmlName("ipAddress")
    @ec2QueryName("ipAddress")
    IpAddress: String,
    @xmlName("networkId")
    @ec2QueryName("networkId")
    NetworkId: String,
    @xmlName("networkName")
    @ec2QueryName("networkName")
    NetworkName: String,
}

structure BackupInformationOfNiftyDescribeRouters {
    @xmlName("expirationDate")
    @ec2QueryName("expirationDate")
    ExpirationDate: Timestamp,
    @xmlName("isBackup")
    @ec2QueryName("isBackup")
    IsBackup: Boolean,
}

structure RequestRouter {
    @xmlName("NiftyReboot")
    @ec2QueryName("NiftyReboot")
    NiftyReboot: NiftyRebootOfRouterForNiftyRebootRouters,
    @xmlName("RouterId")
    @ec2QueryName("RouterId")
    RouterId: String,
    @xmlName("RouterName")
    @ec2QueryName("RouterName")
    RouterName: String,
}

list ListOfRequestRouter {
    member: RequestRouter,
}

@enum([
  {
      name: "FORCE",
      value: "force",
  },
  {
      name: "TRUE",
      value: "true",
  },
])
string NiftyRebootOfRouterForNiftyRebootRouters

structure NiftyRebootRoutersRequest {
    @xmlName("Router")
    @ec2QueryName("Router")
    Router: ListOfRequestRouter,
}

structure NiftyRebootRoutersResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("return")
    @ec2QueryName("return")
    Return: Boolean,
}

@enum([
  {
      name: "ROUTER_NAME",
      value: "routerName",
  },
  {
      name: "DESCRIPTION",
      value: "description",
  },
  {
      name: "ACCOUNTING_TYPE",
      value: "accountingType",
  },
  {
      name: "TYPE",
      value: "type",
  },
  {
      name: "GROUP_ID",
      value: "groupId",
  },
])
string AttributeOfNiftyModifyRouterAttributeRequest

structure NiftyModifyRouterAttributeRequest {
    @xmlName("Agreement")
    @ec2QueryName("Agreement")
    Agreement: Boolean,
    @required
    @xmlName("Attribute")
    @ec2QueryName("Attribute")
    Attribute: AttributeOfNiftyModifyRouterAttributeRequest,
    @xmlName("RouterId")
    @ec2QueryName("RouterId")
    RouterId: String,
    @xmlName("RouterName")
    @ec2QueryName("RouterName")
    RouterName: String,
    @required
    @xmlName("Value")
    @ec2QueryName("Value")
    Value: String,
}

structure NiftyModifyRouterAttributeResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("return")
    @ec2QueryName("return")
    Return: Boolean,
}

structure RequestNetworkInterfaceOfNiftyUpdateRouterNetworkInterfaces {
    @xmlName("DeviceIndex")
    @ec2QueryName("DeviceIndex")
    DeviceIndex: Integer,
    @xmlName("Dhcp")
    @ec2QueryName("Dhcp")
    Dhcp: Boolean,
    @xmlName("DhcpConfigId")
    @ec2QueryName("DhcpConfigId")
    DhcpConfigId: String,
    @xmlName("DhcpOptionsId")
    @ec2QueryName("DhcpOptionsId")
    DhcpOptionsId: String,
    @xmlName("IpAddress")
    @ec2QueryName("IpAddress")
    IpAddress: String,
    @xmlName("SecurityGroupId")
    @ec2QueryName("SecurityGroupId")
    ListOfRequestSecurityGroupId: ListOfRequestSecurityGroupId,
    @xmlName("NetworkId")
    @ec2QueryName("NetworkId")
    NetworkId: String,
    @xmlName("NetworkName")
    @ec2QueryName("NetworkName")
    NetworkName: String,
}

list ListOfRequestNetworkInterfaceOfNiftyUpdateRouterNetworkInterfaces {
    member: RequestNetworkInterfaceOfNiftyUpdateRouterNetworkInterfaces,
}

@enum([
  {
      name: "FORCE",
      value: "force",
  },
  {
      name: "TRUE",
      value: "true",
  },
])
string NiftyRebootOfNiftyUpdateRouterNetworkInterfacesRequest

structure NiftyUpdateRouterNetworkInterfacesRequest {
    @xmlName("Agreement")
    @ec2QueryName("Agreement")
    Agreement: Boolean,
    @xmlName("NetworkInterface")
    @ec2QueryName("NetworkInterface")
    NetworkInterface: ListOfRequestNetworkInterfaceOfNiftyUpdateRouterNetworkInterfaces,
    @xmlName("NiftyReboot")
    @ec2QueryName("NiftyReboot")
    NiftyReboot: NiftyRebootOfNiftyUpdateRouterNetworkInterfacesRequest,
    @xmlName("RouterId")
    @ec2QueryName("RouterId")
    RouterId: String,
    @xmlName("RouterName")
    @ec2QueryName("RouterName")
    RouterName: String,
}

structure NiftyUpdateRouterNetworkInterfacesResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("return")
    @ec2QueryName("return")
    Return: Boolean,
}

structure NiftyReplaceRouterLatestVersionRequest {
    @xmlName("Agreement")
    @ec2QueryName("Agreement")
    Agreement: Boolean,
    @xmlName("RouterId")
    @ec2QueryName("RouterId")
    RouterId: String,
    @xmlName("RouterName")
    @ec2QueryName("RouterName")
    RouterName: String,
}

structure NiftyReplaceRouterLatestVersionResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("return")
    @ec2QueryName("return")
    Return: Boolean,
}

structure NiftyRestoreRouterPreviousVersionRequest {
    @xmlName("RouterId")
    @ec2QueryName("RouterId")
    RouterId: String,
    @xmlName("RouterName")
    @ec2QueryName("RouterName")
    RouterName: String,
}

structure NiftyRestoreRouterPreviousVersionResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("return")
    @ec2QueryName("return")
    Return: Boolean,
}

structure NiftyReleaseRouterBackupStateRequest {
    @xmlName("RouterId")
    @ec2QueryName("RouterId")
    RouterId: String,
    @xmlName("RouterName")
    @ec2QueryName("RouterName")
    RouterName: String,
}

structure NiftyReleaseRouterBackupStateResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("return")
    @ec2QueryName("return")
    Return: Boolean,
}

structure CreateRouteTableRequest {
    @xmlName("VpcId")
    @ec2QueryName("VpcId")
    VpcId: String,
}

structure CreateRouteTableResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("routeTable")
    @ec2QueryName("routeTable")
    RouteTable: RouteTable,
}

structure RouteTable {
    @xmlName("associationSet")
    @ec2QueryName("associationSet")
    AssociationSet: String,
    @xmlName("elasticLoadBalancerAssociationSet")
    @ec2QueryName("elasticLoadBalancerAssociationSet")
    ElasticLoadBalancerAssociationSet: String,
    @xmlName("routeTableId")
    @ec2QueryName("routeTableId")
    RouteTableId: String,
    @xmlName("tagSet")
    @ec2QueryName("tagSet")
    TagSet: ListOfTagSet,
}

structure DeleteRouteTableRequest {
    @required
    @xmlName("RouteTableId")
    @ec2QueryName("RouteTableId")
    RouteTableId: String,
}

structure DeleteRouteTableResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("return")
    @ec2QueryName("return")
    Return: Boolean,
}

list ListOfRequestRouteTableId {
    member: String,
}

@enum([
  {
      name: "ASSOCIATION_ROUTE_TABLE_ASSOCIATION_ID",
      value: "association.route-table-association-id",
  },
  {
      name: "ASSOCIATION_ROUTE_TABLE_ID",
      value: "association.route-table-id",
  },
  {
      name: "ASSOCIATION_ROUTER_ID",
      value: "association.router-id",
  },
  {
      name: "ASSOCIATION_ROUTER_NAME",
      value: "association.router-name",
  },
  {
      name: "ASSOCIATION_MAIN",
      value: "association.main",
  },
  {
      name: "ROUTE_TABLE_ID",
      value: "route-table-id",
  },
  {
      name: "ROUTE_DESTINATION_CIDR_BLOCK",
      value: "route.destination-cidr-block",
  },
  {
      name: "ROUTE_GATEWAY_ID",
      value: "route.gateway-id",
  },
  {
      name: "ROUTE_VPC_PEERING_CONNECTION_ID",
      value: "route.vpc-peering-connection-id",
  },
  {
      name: "ROUTE_ORIGIN",
      value: "route.origin",
  },
  {
      name: "ROUTE_STATE",
      value: "route.state",
  },
  {
      name: "ROUTE_IP_ADDRESS",
      value: "route.ip-address",
  },
  {
      name: "ROUTE_NETWORK_ID",
      value: "route.network-id",
  },
])
string NameOfFilterForDescribeRouteTables

structure RequestFilterOfDescribeRouteTables {
    @xmlName("Value")
    @ec2QueryName("Value")
    ListOfRequestValue: ListOfRequestValue,
    @xmlName("Name")
    @ec2QueryName("Name")
    Name: NameOfFilterForDescribeRouteTables,
}

list ListOfRequestFilterOfDescribeRouteTables {
    member: RequestFilterOfDescribeRouteTables,
}

structure DescribeRouteTablesRequest {
    @xmlName("Filter")
    @ec2QueryName("Filter")
    Filter: ListOfRequestFilterOfDescribeRouteTables,
    @xmlName("RouteTableId")
    @ec2QueryName("RouteTableId")
    RouteTableId: ListOfRequestRouteTableId,
}

structure DescribeRouteTablesResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("routeTableSet")
    @ec2QueryName("routeTableSet")
    RouteTableSet: ListOfRouteTableSet,
}

list ListOfRouteTableSet {
    @xmlName("item")
    member: RouteTableSet,
}

structure RouteTableSet {
    @xmlName("associationSet")
    @ec2QueryName("associationSet")
    AssociationSet: ListOfAssociationSet,
    @xmlName("elasticLoadBalancerAssociationSet")
    @ec2QueryName("elasticLoadBalancerAssociationSet")
    ElasticLoadBalancerAssociationSet: ListOfElasticLoadBalancerAssociationSet,
    @xmlName("propagatingVgwSet")
    @ec2QueryName("propagatingVgwSet")
    PropagatingVgwSet: ListOfPropagatingVgwSet,
    @xmlName("routeSet")
    @ec2QueryName("routeSet")
    RouteSet: ListOfRouteSet,
    @xmlName("routeTableId")
    @ec2QueryName("routeTableId")
    RouteTableId: String,
    @xmlName("tagSet")
    @ec2QueryName("tagSet")
    TagSet: ListOfTagSet,
}

list ListOfRouteSet {
    @xmlName("item")
    member: RouteSet,
}

structure RouteSet {
    @xmlName("destinationCidrBlock")
    @ec2QueryName("destinationCidrBlock")
    DestinationCidrBlock: String,
    @xmlName("ipAddress")
    @ec2QueryName("ipAddress")
    IpAddress: String,
    @xmlName("networkId")
    @ec2QueryName("networkId")
    NetworkId: String,
    @xmlName("networkName")
    @ec2QueryName("networkName")
    NetworkName: String,
    @xmlName("origin")
    @ec2QueryName("origin")
    Origin: String,
    @xmlName("priority")
    @ec2QueryName("priority")
    Priority: String,
    @xmlName("state")
    @ec2QueryName("state")
    State: String,
    @xmlName("vpcPeeringConnectionId")
    @ec2QueryName("vpcPeeringConnectionId")
    VpcPeeringConnectionId: String,
}

list ListOfAssociationSet {
    @xmlName("item")
    member: AssociationSet,
}

structure AssociationSet {
    @xmlName("main")
    @ec2QueryName("main")
    Main: Boolean,
    @xmlName("routerId")
    @ec2QueryName("routerId")
    RouterId: String,
    @xmlName("routerName")
    @ec2QueryName("routerName")
    RouterName: String,
    @xmlName("routeTableAssociationId")
    @ec2QueryName("routeTableAssociationId")
    RouteTableAssociationId: String,
    @xmlName("routeTableId")
    @ec2QueryName("routeTableId")
    RouteTableId: String,
}

list ListOfPropagatingVgwSet {
    @xmlName("item")
    member: PropagatingVgwSet,
}

structure PropagatingVgwSet {
    @xmlName("gatewayId")
    @ec2QueryName("gatewayId")
    GatewayId: String,
    @xmlName("niftyGatewayName")
    @ec2QueryName("niftyGatewayName")
    NiftyGatewayName: String,
    @xmlName("routeTableAssociationId")
    @ec2QueryName("routeTableAssociationId")
    RouteTableAssociationId: String,
}

list ListOfElasticLoadBalancerAssociationSet {
    @xmlName("item")
    member: ElasticLoadBalancerAssociationSet,
}

structure ElasticLoadBalancerAssociationSet {
    @xmlName("elasticLoadBalancerId")
    @ec2QueryName("elasticLoadBalancerId")
    ElasticLoadBalancerId: String,
    @xmlName("elasticLoadBalancerName")
    @ec2QueryName("elasticLoadBalancerName")
    ElasticLoadBalancerName: String,
    @xmlName("main")
    @ec2QueryName("main")
    Main: Boolean,
    @xmlName("routeTableAssociationId")
    @ec2QueryName("routeTableAssociationId")
    RouteTableAssociationId: String,
    @xmlName("routeTableId")
    @ec2QueryName("routeTableId")
    RouteTableId: String,
}

structure AssociateRouteTableRequest {
    @xmlName("Agreement")
    @ec2QueryName("Agreement")
    Agreement: Boolean,
    @xmlName("RouterId")
    @ec2QueryName("RouterId")
    RouterId: String,
    @xmlName("RouterName")
    @ec2QueryName("RouterName")
    RouterName: String,
    @required
    @xmlName("RouteTableId")
    @ec2QueryName("RouteTableId")
    RouteTableId: String,
    @xmlName("SubnetId")
    @ec2QueryName("SubnetId")
    SubnetId: String,
}

structure AssociateRouteTableResult {
    @xmlName("associationId")
    @ec2QueryName("associationId")
    AssociationId: String,
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
}

structure DisassociateRouteTableRequest {
    @xmlName("Agreement")
    @ec2QueryName("Agreement")
    Agreement: Boolean,
    @required
    @xmlName("AssociationId")
    @ec2QueryName("AssociationId")
    AssociationId: String,
}

structure DisassociateRouteTableResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("return")
    @ec2QueryName("return")
    Return: Boolean,
}

structure ReplaceRouteTableAssociationRequest {
    @xmlName("Agreement")
    @ec2QueryName("Agreement")
    Agreement: Boolean,
    @required
    @xmlName("AssociationId")
    @ec2QueryName("AssociationId")
    AssociationId: String,
    @required
    @xmlName("RouteTableId")
    @ec2QueryName("RouteTableId")
    RouteTableId: String,
}

structure ReplaceRouteTableAssociationResult {
    @xmlName("newAssociationId")
    @ec2QueryName("newAssociationId")
    NewAssociationId: String,
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
}

structure CreateRouteRequest {
    @required
    @xmlName("DestinationCidrBlock")
    @ec2QueryName("DestinationCidrBlock")
    DestinationCidrBlock: String,
    @xmlName("GatewayId")
    @ec2QueryName("GatewayId")
    GatewayId: String,
    @xmlName("InstanceId")
    @ec2QueryName("InstanceId")
    InstanceId: String,
    @xmlName("IpAddress")
    @ec2QueryName("IpAddress")
    IpAddress: String,
    @xmlName("NetworkId")
    @ec2QueryName("NetworkId")
    NetworkId: String,
    @xmlName("NetworkInterfaceId")
    @ec2QueryName("NetworkInterfaceId")
    NetworkInterfaceId: String,
    @xmlName("NetworkName")
    @ec2QueryName("NetworkName")
    NetworkName: String,
    @required
    @xmlName("RouteTableId")
    @ec2QueryName("RouteTableId")
    RouteTableId: String,
    @xmlName("VpcPeeringConnectionId")
    @ec2QueryName("VpcPeeringConnectionId")
    VpcPeeringConnectionId: String,
}

structure CreateRouteResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("return")
    @ec2QueryName("return")
    Return: Boolean,
}

structure DeleteRouteRequest {
    @required
    @xmlName("DestinationCidrBlock")
    @ec2QueryName("DestinationCidrBlock")
    DestinationCidrBlock: String,
    @required
    @xmlName("RouteTableId")
    @ec2QueryName("RouteTableId")
    RouteTableId: String,
}

structure DeleteRouteResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("return")
    @ec2QueryName("return")
    Return: Boolean,
}

structure ReplaceRouteRequest {
    @required
    @xmlName("DestinationCidrBlock")
    @ec2QueryName("DestinationCidrBlock")
    DestinationCidrBlock: String,
    @xmlName("GatewayId")
    @ec2QueryName("GatewayId")
    GatewayId: String,
    @xmlName("InstanceId")
    @ec2QueryName("InstanceId")
    InstanceId: String,
    @xmlName("IpAddress")
    @ec2QueryName("IpAddress")
    IpAddress: String,
    @xmlName("NetworkId")
    @ec2QueryName("NetworkId")
    NetworkId: String,
    @xmlName("NetworkInterfaceId")
    @ec2QueryName("NetworkInterfaceId")
    NetworkInterfaceId: String,
    @xmlName("NetworkName")
    @ec2QueryName("NetworkName")
    NetworkName: String,
    @required
    @xmlName("RouteTableId")
    @ec2QueryName("RouteTableId")
    RouteTableId: String,
    @xmlName("VpcPeeringConnectionId")
    @ec2QueryName("VpcPeeringConnectionId")
    VpcPeeringConnectionId: String,
}

structure ReplaceRouteResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("return")
    @ec2QueryName("return")
    Return: Boolean,
}

structure NiftyCreateNatTableRequest {}

structure NiftyCreateNatTableResult {
    @xmlName("natTable")
    @ec2QueryName("natTable")
    NatTable: NatTable,
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
}

structure NatTable {
    @xmlName("natTableId")
    @ec2QueryName("natTableId")
    NatTableId: String,
    @xmlName("tagSet")
    @ec2QueryName("tagSet")
    TagSet: ListOfTagSet,
}

structure NiftyDeleteNatTableRequest {
    @required
    @xmlName("NatTableId")
    @ec2QueryName("NatTableId")
    NatTableId: String,
}

structure NiftyDeleteNatTableResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("return")
    @ec2QueryName("return")
    Return: Boolean,
}

list ListOfRequestNatTableId {
    member: String,
}

@enum([
  {
      name: "ASSOCIATION_ASSOCIATION_ID",
      value: "association.association-id",
  },
  {
      name: "ASSOCIATION_NAT_TABLE_ID",
      value: "association.nat-table-id",
  },
  {
      name: "ASSOCIATION_ROUTER_ID",
      value: "association.router-id",
  },
  {
      name: "NAT_TABLE_ID",
      value: "nat-table-id",
  },
  {
      name: "NAT_RULE_NAT_TYPE",
      value: "nat-rule.nat-type",
  },
  {
      name: "NAT_RULE_RULE_NUMBER",
      value: "nat-rule.rule-number",
  },
  {
      name: "NAT_RULE_DESCRIPTION",
      value: "nat-rule.description",
  },
  {
      name: "NAT_RULE_PROTOCOL",
      value: "nat-rule.protocol",
  },
  {
      name: "NAT_RULE_OUTBOUND_INTERFACE_NETWORK_ID",
      value: "nat-rule.outbound-interface.network-id",
  },
  {
      name: "NAT_RULE_OUTBOUND_INTERFACE_NETWORK_NAME",
      value: "nat-rule.outbound-interface.network-name",
  },
  {
      name: "NAT_RULE_INBOUND_INTERFACE_NETWORK_ID",
      value: "nat-rule.inbound-interface.network-id",
  },
  {
      name: "NAT_RULE_INBOUND_INTERFACE_NETWORK_NAME",
      value: "nat-rule.inbound-interface.network-name",
  },
  {
      name: "NAT_RULE_DESTINATION_ADDRESS",
      value: "nat-rule.destination.address",
  },
  {
      name: "NAT_RULE_DESTINATION_PORT",
      value: "nat-rule.destination.port",
  },
  {
      name: "NAT_RULE_SOURCE_ADDRESS",
      value: "nat-rule.source.address",
  },
  {
      name: "NAT_RULE_SOURCE_PORT",
      value: "nat-rule.source.port",
  },
  {
      name: "NAT_RULE_TRANSLATION_ADDRESS",
      value: "nat-rule.translation.address",
  },
  {
      name: "NAT_RULE_TRANSLATION_PORT",
      value: "nat-rule.translation.port",
  },
])
string NameOfFilterForNiftyDescribeNatTables

structure RequestFilterOfNiftyDescribeNatTables {
    @xmlName("Value")
    @ec2QueryName("Value")
    ListOfRequestValue: ListOfRequestValue,
    @xmlName("Name")
    @ec2QueryName("Name")
    Name: NameOfFilterForNiftyDescribeNatTables,
}

list ListOfRequestFilterOfNiftyDescribeNatTables {
    member: RequestFilterOfNiftyDescribeNatTables,
}

structure NiftyDescribeNatTablesRequest {
    @xmlName("Filter")
    @ec2QueryName("Filter")
    Filter: ListOfRequestFilterOfNiftyDescribeNatTables,
    @xmlName("NatTableId")
    @ec2QueryName("NatTableId")
    NatTableId: ListOfRequestNatTableId,
}

structure NiftyDescribeNatTablesResult {
    @xmlName("natTableSet")
    @ec2QueryName("natTableSet")
    NatTableSet: ListOfNatTableSet,
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
}

list ListOfNatTableSet {
    @xmlName("item")
    member: NatTableSet,
}

structure NatTableSet {
    @xmlName("associationSet")
    @ec2QueryName("associationSet")
    AssociationSet: ListOfAssociationSetOfNiftyDescribeNatTables,
    @xmlName("natRuleSet")
    @ec2QueryName("natRuleSet")
    NatRuleSet: ListOfNatRuleSet,
    @xmlName("natTableId")
    @ec2QueryName("natTableId")
    NatTableId: String,
    @xmlName("tagSet")
    @ec2QueryName("tagSet")
    TagSet: ListOfTagSet,
}

list ListOfNatRuleSet {
    @xmlName("item")
    member: NatRuleSet,
}

structure NatRuleSet {
    @xmlName("description")
    @ec2QueryName("description")
    Description: String,
    @xmlName("destination")
    @ec2QueryName("destination")
    Destination: Destination,
    @xmlName("inboundInterface")
    @ec2QueryName("inboundInterface")
    InboundInterface: InboundInterface,
    @xmlName("natType")
    @ec2QueryName("natType")
    NatType: String,
    @xmlName("outboundInterface")
    @ec2QueryName("outboundInterface")
    OutboundInterface: OutboundInterface,
    @xmlName("protocol")
    @ec2QueryName("protocol")
    Protocol: String,
    @xmlName("ruleNumber")
    @ec2QueryName("ruleNumber")
    RuleNumber: String,
    @xmlName("source")
    @ec2QueryName("source")
    Source: Source,
    @xmlName("translation")
    @ec2QueryName("translation")
    Translation: Translation,
}

structure OutboundInterface {
    @xmlName("networkId")
    @ec2QueryName("networkId")
    NetworkId: String,
    @xmlName("networkName")
    @ec2QueryName("networkName")
    NetworkName: String,
}

structure InboundInterface {
    @xmlName("networkId")
    @ec2QueryName("networkId")
    NetworkId: String,
    @xmlName("networkName")
    @ec2QueryName("networkName")
    NetworkName: String,
}

structure Destination {
    @xmlName("port")
    @ec2QueryName("port")
    Port: Integer,
}

structure Source {
    @xmlName("address")
    @ec2QueryName("address")
    Address: String,
    @xmlName("port")
    @ec2QueryName("port")
    Port: Integer,
}

structure Translation {
    @xmlName("address")
    @ec2QueryName("address")
    Address: String,
    @xmlName("port")
    @ec2QueryName("port")
    Port: Integer,
}

list ListOfAssociationSetOfNiftyDescribeNatTables {
    @xmlName("item")
    member: AssociationSetOfNiftyDescribeNatTables,
}

structure AssociationSetOfNiftyDescribeNatTables {
    @xmlName("associationId")
    @ec2QueryName("associationId")
    AssociationId: String,
    @xmlName("natTableId")
    @ec2QueryName("natTableId")
    NatTableId: String,
    @xmlName("routerId")
    @ec2QueryName("routerId")
    RouterId: String,
    @xmlName("routerName")
    @ec2QueryName("routerName")
    RouterName: String,
}

structure NiftyAssociateNatTableRequest {
    @xmlName("Agreement")
    @ec2QueryName("Agreement")
    Agreement: Boolean,
    @required
    @xmlName("NatTableId")
    @ec2QueryName("NatTableId")
    NatTableId: String,
    @xmlName("RouterId")
    @ec2QueryName("RouterId")
    RouterId: String,
    @xmlName("RouterName")
    @ec2QueryName("RouterName")
    RouterName: String,
}

structure NiftyAssociateNatTableResult {
    @xmlName("associationId")
    @ec2QueryName("associationId")
    AssociationId: String,
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
}

structure NiftyDisassociateNatTableRequest {
    @xmlName("Agreement")
    @ec2QueryName("Agreement")
    Agreement: Boolean,
    @required
    @xmlName("AssociationId")
    @ec2QueryName("AssociationId")
    AssociationId: String,
}

structure NiftyDisassociateNatTableResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("return")
    @ec2QueryName("return")
    Return: Boolean,
}

structure NiftyReplaceNatTableAssociationRequest {
    @xmlName("Agreement")
    @ec2QueryName("Agreement")
    Agreement: Boolean,
    @required
    @xmlName("AssociationId")
    @ec2QueryName("AssociationId")
    AssociationId: String,
    @required
    @xmlName("NatTableId")
    @ec2QueryName("NatTableId")
    NatTableId: String,
}

structure NiftyReplaceNatTableAssociationResult {
    @xmlName("newAssociationId")
    @ec2QueryName("newAssociationId")
    NewAssociationId: String,
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
}

@enum([
  {
      name: "SNAT",
      value: "snat",
  },
  {
      name: "DNAT",
      value: "dnat",
  },
])
string NatTypeOfNiftyCreateNatRuleRequest

@enum([
  {
      name: "ALL",
      value: "ALL",
  },
  {
      name: "TCP",
      value: "TCP",
  },
  {
      name: "UDP",
      value: "UDP",
  },
  {
      name: "TCP_UDP",
      value: "TCP_UDP",
  },
  {
      name: "ICMP",
      value: "ICMP",
  },
])
string ProtocolOfNiftyCreateNatRuleRequest

structure RequestOutboundInterface {
    @xmlName("NetworkId")
    @ec2QueryName("NetworkId")
    NetworkId: String,
    @xmlName("NetworkName")
    @ec2QueryName("NetworkName")
    NetworkName: String,
}

structure RequestInboundInterface {
    @xmlName("NetworkId")
    @ec2QueryName("NetworkId")
    NetworkId: String,
    @xmlName("NetworkName")
    @ec2QueryName("NetworkName")
    NetworkName: String,
}

structure RequestDestination {
    @xmlName("Port")
    @ec2QueryName("Port")
    Port: Integer,
}

structure RequestSource {
    @xmlName("Address")
    @ec2QueryName("Address")
    Address: String,
    @xmlName("Port")
    @ec2QueryName("Port")
    Port: Integer,
}

structure RequestTranslation {
    @xmlName("Address")
    @ec2QueryName("Address")
    Address: String,
    @xmlName("Port")
    @ec2QueryName("Port")
    Port: Integer,
}

structure NiftyCreateNatRuleRequest {
    @xmlName("Description")
    @ec2QueryName("Description")
    Description: String,
    @xmlName("Destination")
    @ec2QueryName("Destination")
    Destination: RequestDestination,
    @xmlName("InboundInterface")
    @ec2QueryName("InboundInterface")
    InboundInterface: RequestInboundInterface,
    @required
    @xmlName("NatTableId")
    @ec2QueryName("NatTableId")
    NatTableId: String,
    @required
    @xmlName("NatType")
    @ec2QueryName("NatType")
    NatType: NatTypeOfNiftyCreateNatRuleRequest,
    @xmlName("OutboundInterface")
    @ec2QueryName("OutboundInterface")
    OutboundInterface: RequestOutboundInterface,
    @required
    @xmlName("Protocol")
    @ec2QueryName("Protocol")
    Protocol: ProtocolOfNiftyCreateNatRuleRequest,
    @required
    @xmlName("RuleNumber")
    @ec2QueryName("RuleNumber")
    RuleNumber: String,
    @xmlName("Source")
    @ec2QueryName("Source")
    Source: RequestSource,
    @xmlName("Translation")
    @ec2QueryName("Translation")
    Translation: RequestTranslation,
}

structure NiftyCreateNatRuleResult {
    @xmlName("natRule")
    @ec2QueryName("natRule")
    NatRule: NatRule,
    @xmlName("natTableId")
    @ec2QueryName("natTableId")
    NatTableId: String,
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
}

structure NatRule {
    @xmlName("description")
    @ec2QueryName("description")
    Description: String,
    @xmlName("destination")
    @ec2QueryName("destination")
    Destination: Destination,
    @xmlName("inboundInterface")
    @ec2QueryName("inboundInterface")
    InboundInterface: InboundInterface,
    @xmlName("natType")
    @ec2QueryName("natType")
    NatType: String,
    @xmlName("outboundInterface")
    @ec2QueryName("outboundInterface")
    OutboundInterface: OutboundInterface,
    @xmlName("protocol")
    @ec2QueryName("protocol")
    Protocol: String,
    @xmlName("ruleNumber")
    @ec2QueryName("ruleNumber")
    RuleNumber: String,
    @xmlName("source")
    @ec2QueryName("source")
    Source: Source,
    @xmlName("translation")
    @ec2QueryName("translation")
    Translation: Translation,
}

@enum([
  {
      name: "SNAT",
      value: "snat",
  },
  {
      name: "DNAT",
      value: "dnat",
  },
])
string NatTypeOfNiftyDeleteNatRuleRequest

structure NiftyDeleteNatRuleRequest {
    @required
    @xmlName("NatTableId")
    @ec2QueryName("NatTableId")
    NatTableId: String,
    @required
    @xmlName("NatType")
    @ec2QueryName("NatType")
    NatType: NatTypeOfNiftyDeleteNatRuleRequest,
    @required
    @xmlName("RuleNumber")
    @ec2QueryName("RuleNumber")
    RuleNumber: String,
}

structure NiftyDeleteNatRuleResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("return")
    @ec2QueryName("return")
    Return: Boolean,
}

@enum([
  {
      name: "SNAT",
      value: "snat",
  },
  {
      name: "DNAT",
      value: "dnat",
  },
])
string NatTypeOfNiftyReplaceNatRuleRequest

@enum([
  {
      name: "ALL",
      value: "ALL",
  },
  {
      name: "TCP",
      value: "TCP",
  },
  {
      name: "UDP",
      value: "UDP",
  },
  {
      name: "TCP_UDP",
      value: "TCP_UDP",
  },
  {
      name: "ICMP",
      value: "ICMP",
  },
])
string ProtocolOfNiftyReplaceNatRuleRequest

structure NiftyReplaceNatRuleRequest {
    @xmlName("Description")
    @ec2QueryName("Description")
    Description: String,
    @xmlName("Destination")
    @ec2QueryName("Destination")
    Destination: RequestDestination,
    @xmlName("InboundInterface")
    @ec2QueryName("InboundInterface")
    InboundInterface: RequestInboundInterface,
    @required
    @xmlName("NatTableId")
    @ec2QueryName("NatTableId")
    NatTableId: String,
    @required
    @xmlName("NatType")
    @ec2QueryName("NatType")
    NatType: NatTypeOfNiftyReplaceNatRuleRequest,
    @xmlName("OutboundInterface")
    @ec2QueryName("OutboundInterface")
    OutboundInterface: RequestOutboundInterface,
    @required
    @xmlName("Protocol")
    @ec2QueryName("Protocol")
    Protocol: ProtocolOfNiftyReplaceNatRuleRequest,
    @required
    @xmlName("RuleNumber")
    @ec2QueryName("RuleNumber")
    RuleNumber: String,
    @xmlName("Source")
    @ec2QueryName("Source")
    Source: RequestSource,
    @xmlName("Translation")
    @ec2QueryName("Translation")
    Translation: RequestTranslation,
}

structure NiftyReplaceNatRuleResult {
    @xmlName("natRule")
    @ec2QueryName("natRule")
    NatRule: NatRule,
    @xmlName("natTableId")
    @ec2QueryName("natTableId")
    NatTableId: String,
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
}

structure NiftyEnableDhcpRequest {
    @xmlName("Agreement")
    @ec2QueryName("Agreement")
    Agreement: Boolean,
    @xmlName("DhcpConfigId")
    @ec2QueryName("DhcpConfigId")
    DhcpConfigId: String,
    @xmlName("DhcpOptionsId")
    @ec2QueryName("DhcpOptionsId")
    DhcpOptionsId: String,
    @xmlName("NetworkId")
    @ec2QueryName("NetworkId")
    NetworkId: String,
    @xmlName("NetworkName")
    @ec2QueryName("NetworkName")
    NetworkName: String,
    @xmlName("RouterId")
    @ec2QueryName("RouterId")
    RouterId: String,
    @xmlName("RouterName")
    @ec2QueryName("RouterName")
    RouterName: String,
}

structure NiftyEnableDhcpResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("return")
    @ec2QueryName("return")
    Return: Boolean,
}

structure NiftyDisableDhcpRequest {
    @xmlName("Agreement")
    @ec2QueryName("Agreement")
    Agreement: Boolean,
    @xmlName("NetworkId")
    @ec2QueryName("NetworkId")
    NetworkId: String,
    @xmlName("NetworkName")
    @ec2QueryName("NetworkName")
    NetworkName: String,
    @xmlName("RouterId")
    @ec2QueryName("RouterId")
    RouterId: String,
    @xmlName("RouterName")
    @ec2QueryName("RouterName")
    RouterName: String,
}

structure NiftyDisableDhcpResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("return")
    @ec2QueryName("return")
    Return: Boolean,
}

@enum([
  {
      name: "DEFAULT_ROUTER",
      value: "default-router",
  },
  {
      name: "DOMAIN_NAME",
      value: "domain-name",
  },
  {
      name: "DOMAIN_NAME_SERVERS",
      value: "domain-name-servers",
  },
  {
      name: "NTP_SERVERS",
      value: "ntp-servers",
  },
  {
      name: "NETBIOS_NAME_SERVERS",
      value: "netbios-name-servers",
  },
  {
      name: "NETBIOS_NODE_TYPE",
      value: "netbios-node-type",
  },
  {
      name: "LEASE_TIME",
      value: "lease-time",
  },
])
string KeyOfDhcpConfigurationForCreateDhcpOptions

structure RequestDhcpConfiguration {
    @required
    @xmlName("Key")
    @ec2QueryName("Key")
    Key: KeyOfDhcpConfigurationForCreateDhcpOptions,
    @required
    @xmlName("Value")
    @ec2QueryName("Value")
    ListOfRequestValue: ListOfRequestValue,
}

list ListOfRequestDhcpConfiguration {
    member: RequestDhcpConfiguration,
}

structure CreateDhcpOptionsRequest {
    @required
    @xmlName("DhcpConfiguration")
    @ec2QueryName("DhcpConfiguration")
    DhcpConfiguration: ListOfRequestDhcpConfiguration,
}

structure CreateDhcpOptionsResult {
    @xmlName("dhcpOptions")
    @ec2QueryName("dhcpOptions")
    DhcpOptions: DhcpOptions,
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
}

structure DhcpOptions {
    @xmlName("dhcpConfigurationSet")
    @ec2QueryName("dhcpConfigurationSet")
    DhcpConfigurationSet: ListOfDhcpConfigurationSet,
    @xmlName("dhcpOptionsId")
    @ec2QueryName("dhcpOptionsId")
    DhcpOptionsId: String,
}

list ListOfDhcpConfigurationSet {
    @xmlName("item")
    member: DhcpConfigurationSet,
}

structure DhcpConfigurationSet {
    @xmlName("key")
    @ec2QueryName("key")
    Key: String,
    @xmlName("valueSet")
    @ec2QueryName("valueSet")
    ValueSet: ListOfValueSet,
}

list ListOfValueSet {
    @xmlName("item")
    member: ValueSet,
}

structure ValueSet {
    @xmlName("value")
    @ec2QueryName("value")
    Value: String,
}

structure DeleteDhcpOptionsRequest {
    @required
    @xmlName("DhcpOptionsId")
    @ec2QueryName("DhcpOptionsId")
    DhcpOptionsId: String,
}

structure DeleteDhcpOptionsResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("return")
    @ec2QueryName("return")
    Return: Boolean,
}

list ListOfRequestDhcpOptionsId {
    member: String,
}

@enum([
  {
      name: "DHCP_OPTIONS_ID",
      value: "dhcp-options-id",
  },
  {
      name: "KEY",
      value: "key",
  },
  {
      name: "VALUE",
      value: "value",
  },
])
string NameOfFilterForDescribeDhcpOptions

structure RequestFilterOfDescribeDhcpOptions {
    @xmlName("Value")
    @ec2QueryName("Value")
    ListOfRequestValue: ListOfRequestValue,
    @xmlName("Name")
    @ec2QueryName("Name")
    Name: NameOfFilterForDescribeDhcpOptions,
}

list ListOfRequestFilterOfDescribeDhcpOptions {
    member: RequestFilterOfDescribeDhcpOptions,
}

structure DescribeDhcpOptionsRequest {
    @xmlName("DhcpOptionsId")
    @ec2QueryName("DhcpOptionsId")
    DhcpOptionsId: ListOfRequestDhcpOptionsId,
    @xmlName("Filter")
    @ec2QueryName("Filter")
    Filter: ListOfRequestFilterOfDescribeDhcpOptions,
}

structure DescribeDhcpOptionsResult {
    @xmlName("dhcpOptionsSet")
    @ec2QueryName("dhcpOptionsSet")
    DhcpOptionsSet: ListOfDhcpOptionsSet,
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
}

list ListOfDhcpOptionsSet {
    @xmlName("item")
    member: DhcpOptionsSet,
}

structure DhcpOptionsSet {
    @xmlName("dhcpConfigurationSet")
    @ec2QueryName("dhcpConfigurationSet")
    DhcpConfigurationSet: ListOfDhcpConfigurationSet,
    @xmlName("dhcpOptionsId")
    @ec2QueryName("dhcpOptionsId")
    DhcpOptionsId: String,
}

structure NiftyReplaceDhcpOptionRequest {
    @xmlName("Agreement")
    @ec2QueryName("Agreement")
    Agreement: Boolean,
    @required
    @xmlName("DhcpOptionsId")
    @ec2QueryName("DhcpOptionsId")
    DhcpOptionsId: String,
    @xmlName("NetworkId")
    @ec2QueryName("NetworkId")
    NetworkId: String,
    @xmlName("NetworkName")
    @ec2QueryName("NetworkName")
    NetworkName: String,
    @xmlName("RouterId")
    @ec2QueryName("RouterId")
    RouterId: String,
    @xmlName("RouterName")
    @ec2QueryName("RouterName")
    RouterName: String,
}

structure NiftyReplaceDhcpOptionResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("return")
    @ec2QueryName("return")
    Return: Boolean,
}

structure NiftyReplaceDhcpConfigRequest {
    @xmlName("Agreement")
    @ec2QueryName("Agreement")
    Agreement: Boolean,
    @required
    @xmlName("DhcpConfigId")
    @ec2QueryName("DhcpConfigId")
    DhcpConfigId: String,
    @xmlName("NetworkId")
    @ec2QueryName("NetworkId")
    NetworkId: String,
    @xmlName("NetworkName")
    @ec2QueryName("NetworkName")
    NetworkName: String,
    @xmlName("RouterId")
    @ec2QueryName("RouterId")
    RouterId: String,
    @xmlName("RouterName")
    @ec2QueryName("RouterName")
    RouterName: String,
}

structure NiftyReplaceDhcpConfigResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("return")
    @ec2QueryName("return")
    Return: Boolean,
}

structure NiftyDescribeDhcpStatusRequest {
    @xmlName("RouterId")
    @ec2QueryName("RouterId")
    RouterId: String,
    @xmlName("RouterName")
    @ec2QueryName("RouterName")
    RouterName: String,
}

structure NiftyDescribeDhcpStatusResult {
    @xmlName("dhcpStatusInformationSet")
    @ec2QueryName("dhcpStatusInformationSet")
    DhcpStatusInformationSet: ListOfDhcpStatusInformationSet,
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("routerId")
    @ec2QueryName("routerId")
    RouterId: String,
    @xmlName("routerName")
    @ec2QueryName("routerName")
    RouterName: String,
}

list ListOfDhcpStatusInformationSet {
    @xmlName("item")
    member: DhcpStatusInformationSet,
}

structure DhcpStatusInformationSet {
    @xmlName("dhcpIpAddressInformation")
    @ec2QueryName("dhcpIpAddressInformation")
    DhcpIpAddressInformation: DhcpIpAddressInformation,
    @xmlName("networkId")
    @ec2QueryName("networkId")
    NetworkId: String,
    @xmlName("privateLanName")
    @ec2QueryName("privateLanName")
    PrivateLanName: String,
}

structure DhcpIpAddressInformation {
    @xmlName("dhcpIpAddressSet")
    @ec2QueryName("dhcpIpAddressSet")
    DhcpIpAddressSet: ListOfDhcpIpAddressSet,
    @xmlName("ipAddressPoolSet")
    @ec2QueryName("ipAddressPoolSet")
    IpAddressPoolSet: ListOfIpAddressPoolSet,
}

list ListOfIpAddressPoolSet {
    @xmlName("item")
    member: IpAddressPoolSet,
}

structure IpAddressPoolSet {
    @xmlName("description")
    @ec2QueryName("description")
    Description: String,
    @xmlName("startIpAddress")
    @ec2QueryName("startIpAddress")
    StartIpAddress: String,
    @xmlName("stopIpAddress")
    @ec2QueryName("stopIpAddress")
    StopIpAddress: String,
}

list ListOfDhcpIpAddressSet {
    @xmlName("item")
    member: DhcpIpAddressSet,
}

structure DhcpIpAddressSet {
    @xmlName("clientName")
    @ec2QueryName("clientName")
    ClientName: String,
    @xmlName("description")
    @ec2QueryName("description")
    Description: String,
    @xmlName("ipAddress")
    @ec2QueryName("ipAddress")
    IpAddress: String,
    @xmlName("leaseExpiration")
    @ec2QueryName("leaseExpiration")
    LeaseExpiration: Timestamp,
    @xmlName("leaseType")
    @ec2QueryName("leaseType")
    LeaseType: String,
    @xmlName("macAddress")
    @ec2QueryName("macAddress")
    MacAddress: String,
}

structure NiftyCreateDhcpConfigRequest {}

structure NiftyCreateDhcpConfigResult {
    @xmlName("dhcpConfig")
    @ec2QueryName("dhcpConfig")
    DhcpConfig: DhcpConfig,
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
}

structure DhcpConfig {
    @xmlName("dhcpConfigId")
    @ec2QueryName("dhcpConfigId")
    DhcpConfigId: String,
}

structure NiftyDeleteDhcpConfigRequest {
    @required
    @xmlName("DhcpConfigId")
    @ec2QueryName("DhcpConfigId")
    DhcpConfigId: String,
}

structure NiftyDeleteDhcpConfigResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("return")
    @ec2QueryName("return")
    Return: Boolean,
}

list ListOfRequestDhcpConfigId {
    member: String,
}

@enum([
  {
      name: "DHCP_CONFIG_ID",
      value: "dhcp-config-id",
  },
  {
      name: "IPADDRESS_POOL_START",
      value: "ipaddress-pool-start",
  },
  {
      name: "IPADDRESS_POOL_STOP",
      value: "ipaddress-pool-stop",
  },
  {
      name: "IPADDRESS_POOL_DESCRIPTION",
      value: "ipaddress-pool-description",
  },
  {
      name: "STATIC_MAPPING_IPADDRESS",
      value: "static-mapping-ipaddress",
  },
  {
      name: "STATIC_MAPPING_MACADDRESS",
      value: "static-mapping-macaddress",
  },
  {
      name: "STATIC_MAPPING_DESCRIPTION",
      value: "static-mapping-description",
  },
])
string NameOfFilterForNiftyDescribeDhcpConfigs

structure RequestFilterOfNiftyDescribeDhcpConfigs {
    @xmlName("Value")
    @ec2QueryName("Value")
    ListOfRequestValue: ListOfRequestValue,
    @xmlName("Name")
    @ec2QueryName("Name")
    Name: NameOfFilterForNiftyDescribeDhcpConfigs,
}

list ListOfRequestFilterOfNiftyDescribeDhcpConfigs {
    member: RequestFilterOfNiftyDescribeDhcpConfigs,
}

structure NiftyDescribeDhcpConfigsRequest {
    @xmlName("DhcpConfigId")
    @ec2QueryName("DhcpConfigId")
    DhcpConfigId: ListOfRequestDhcpConfigId,
    @xmlName("Filter")
    @ec2QueryName("Filter")
    Filter: ListOfRequestFilterOfNiftyDescribeDhcpConfigs,
}

structure NiftyDescribeDhcpConfigsResult {
    @xmlName("dhcpConfigsSet")
    @ec2QueryName("dhcpConfigsSet")
    DhcpConfigsSet: ListOfDhcpConfigsSet,
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
}

list ListOfDhcpConfigsSet {
    @xmlName("item")
    member: DhcpConfigsSet,
}

structure DhcpConfigsSet {
    @xmlName("dhcpConfigId")
    @ec2QueryName("dhcpConfigId")
    DhcpConfigId: String,
    @xmlName("ipAddressPoolsSet")
    @ec2QueryName("ipAddressPoolsSet")
    IpAddressPoolsSet: ListOfIpAddressPoolsSet,
    @xmlName("staticMappingsSet")
    @ec2QueryName("staticMappingsSet")
    StaticMappingsSet: ListOfStaticMappingsSet,
}

list ListOfIpAddressPoolsSet {
    @xmlName("item")
    member: IpAddressPoolsSet,
}

structure IpAddressPoolsSet {
    @xmlName("description")
    @ec2QueryName("description")
    Description: String,
    @xmlName("startIpAddress")
    @ec2QueryName("startIpAddress")
    StartIpAddress: String,
    @xmlName("stopIpAddress")
    @ec2QueryName("stopIpAddress")
    StopIpAddress: String,
}

list ListOfStaticMappingsSet {
    @xmlName("item")
    member: StaticMappingsSet,
}

structure StaticMappingsSet {
    @xmlName("description")
    @ec2QueryName("description")
    Description: String,
    @xmlName("ipAddress")
    @ec2QueryName("ipAddress")
    IpAddress: String,
    @xmlName("macAddress")
    @ec2QueryName("macAddress")
    MacAddress: String,
}

structure NiftyCreateDhcpStaticMappingRequest {
    @xmlName("Description")
    @ec2QueryName("Description")
    Description: String,
    @required
    @xmlName("DhcpConfigId")
    @ec2QueryName("DhcpConfigId")
    DhcpConfigId: String,
    @required
    @xmlName("IpAddress")
    @ec2QueryName("IpAddress")
    IpAddress: String,
    @required
    @xmlName("MacAddress")
    @ec2QueryName("MacAddress")
    MacAddress: String,
}

structure NiftyCreateDhcpStaticMappingResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("return")
    @ec2QueryName("return")
    Return: Boolean,
}

structure NiftyDeleteDhcpStaticMappingRequest {
    @required
    @xmlName("DhcpConfigId")
    @ec2QueryName("DhcpConfigId")
    DhcpConfigId: String,
    @required
    @xmlName("IpAddress")
    @ec2QueryName("IpAddress")
    IpAddress: String,
    @required
    @xmlName("MacAddress")
    @ec2QueryName("MacAddress")
    MacAddress: String,
}

structure NiftyDeleteDhcpStaticMappingResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("return")
    @ec2QueryName("return")
    Return: Boolean,
}

structure NiftyCreateDhcpIpAddressPoolRequest {
    @xmlName("Description")
    @ec2QueryName("Description")
    Description: String,
    @required
    @xmlName("DhcpConfigId")
    @ec2QueryName("DhcpConfigId")
    DhcpConfigId: String,
    @required
    @xmlName("StartIpAddress")
    @ec2QueryName("StartIpAddress")
    StartIpAddress: String,
    @required
    @xmlName("StopIpAddress")
    @ec2QueryName("StopIpAddress")
    StopIpAddress: String,
}

structure NiftyCreateDhcpIpAddressPoolResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("return")
    @ec2QueryName("return")
    Return: Boolean,
}

structure NiftyDeleteDhcpIpAddressPoolRequest {
    @required
    @xmlName("DhcpConfigId")
    @ec2QueryName("DhcpConfigId")
    DhcpConfigId: String,
    @required
    @xmlName("StartIpAddress")
    @ec2QueryName("StartIpAddress")
    StartIpAddress: String,
    @required
    @xmlName("StopIpAddress")
    @ec2QueryName("StopIpAddress")
    StopIpAddress: String,
}

structure NiftyDeleteDhcpIpAddressPoolResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("return")
    @ec2QueryName("return")
    Return: Boolean,
}

structure RequestListenInterface {
    @xmlName("NetworkId")
    @ec2QueryName("NetworkId")
    NetworkId: String,
    @xmlName("NetworkName")
    @ec2QueryName("NetworkName")
    NetworkName: String,
}

structure RequestBypassInterface {
    @xmlName("NetworkId")
    @ec2QueryName("NetworkId")
    NetworkId: String,
    @xmlName("NetworkName")
    @ec2QueryName("NetworkName")
    NetworkName: String,
}

structure RequestOption {
    @xmlName("NameServer")
    @ec2QueryName("NameServer")
    NameServer: String,
}

structure NiftyCreateWebProxyRequest {
    @xmlName("Agreement")
    @ec2QueryName("Agreement")
    Agreement: Boolean,
    @xmlName("BypassInterface")
    @ec2QueryName("BypassInterface")
    BypassInterface: RequestBypassInterface,
    @xmlName("Description")
    @ec2QueryName("Description")
    Description: String,
    @xmlName("ListenInterface")
    @ec2QueryName("ListenInterface")
    ListenInterface: RequestListenInterface,
    @required
    @xmlName("ListenPort")
    @ec2QueryName("ListenPort")
    ListenPort: String,
    @xmlName("Option")
    @ec2QueryName("Option")
    Option: RequestOption,
    @xmlName("RouterId")
    @ec2QueryName("RouterId")
    RouterId: String,
    @xmlName("RouterName")
    @ec2QueryName("RouterName")
    RouterName: String,
}

structure NiftyCreateWebProxyResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("webProxy")
    @ec2QueryName("webProxy")
    WebProxy: WebProxy,
}

structure WebProxy {
    @xmlName("bypassInterface")
    @ec2QueryName("bypassInterface")
    BypassInterface: BypassInterface,
    @xmlName("description")
    @ec2QueryName("description")
    Description: String,
    @xmlName("listenInterface")
    @ec2QueryName("listenInterface")
    ListenInterface: ListenInterface,
    @xmlName("listenPort")
    @ec2QueryName("listenPort")
    ListenPort: String,
    @xmlName("option")
    @ec2QueryName("option")
    Option: OptionOfNiftyCreateWebProxy,
    @xmlName("routerId")
    @ec2QueryName("routerId")
    RouterId: String,
    @xmlName("routerName")
    @ec2QueryName("routerName")
    RouterName: String,
}

structure ListenInterface {
    @xmlName("networkId")
    @ec2QueryName("networkId")
    NetworkId: String,
    @xmlName("networkName")
    @ec2QueryName("networkName")
    NetworkName: String,
}

structure BypassInterface {
    @xmlName("networkId")
    @ec2QueryName("networkId")
    NetworkId: String,
    @xmlName("networkName")
    @ec2QueryName("networkName")
    NetworkName: String,
}

structure OptionOfNiftyCreateWebProxy {
    @xmlName("nameServer")
    @ec2QueryName("nameServer")
    NameServer: String,
}

structure NiftyDeleteWebProxyRequest {
    @xmlName("Agreement")
    @ec2QueryName("Agreement")
    Agreement: Boolean,
    @xmlName("RouterId")
    @ec2QueryName("RouterId")
    RouterId: String,
    @xmlName("RouterName")
    @ec2QueryName("RouterName")
    RouterName: String,
}

structure NiftyDeleteWebProxyResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("return")
    @ec2QueryName("return")
    Return: Boolean,
}

@enum([
  {
      name: "ROUTER_ID",
      value: "router-id",
  },
  {
      name: "ROUTER_NAME",
      value: "router-name",
  },
  {
      name: "LISTEN_NETWORK_ID",
      value: "listen-network-id",
  },
  {
      name: "LISTEN_NETWORK_NAME",
      value: "listen-network-name",
  },
  {
      name: "LISTEN_PORT",
      value: "listen-port",
  },
  {
      name: "PROXY_BYPASS_NETWORK_ID",
      value: "proxy-bypass-network-id",
  },
  {
      name: "PROXY_BYPASS_NETWORK_NAME",
      value: "proxy-bypass-network-name",
  },
  {
      name: "OPTION_NAME_SERVER",
      value: "option-name-server",
  },
])
string NameOfFilterForNiftyDescribeWebProxies

structure RequestFilterOfNiftyDescribeWebProxies {
    @xmlName("Value")
    @ec2QueryName("Value")
    ListOfRequestValue: ListOfRequestValue,
    @xmlName("Name")
    @ec2QueryName("Name")
    Name: NameOfFilterForNiftyDescribeWebProxies,
}

list ListOfRequestFilterOfNiftyDescribeWebProxies {
    member: RequestFilterOfNiftyDescribeWebProxies,
}

structure NiftyDescribeWebProxiesRequest {
    @xmlName("Filter")
    @ec2QueryName("Filter")
    Filter: ListOfRequestFilterOfNiftyDescribeWebProxies,
    @xmlName("RouterId")
    @ec2QueryName("RouterId")
    RouterId: ListOfRequestRouterId,
    @xmlName("RouterName")
    @ec2QueryName("RouterName")
    RouterName: ListOfRequestRouterName,
}

structure NiftyDescribeWebProxiesResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("webProxy")
    @ec2QueryName("webProxy")
    WebProxy: ListOfWebProxyOfNiftyDescribeWebProxies,
}

list ListOfWebProxyOfNiftyDescribeWebProxies {
    @xmlName("item")
    member: WebProxyOfNiftyDescribeWebProxies,
}

structure WebProxyOfNiftyDescribeWebProxies {
    @xmlName("bypassInterface")
    @ec2QueryName("bypassInterface")
    BypassInterface: BypassInterface,
    @xmlName("description")
    @ec2QueryName("description")
    Description: String,
    @xmlName("listenInterface")
    @ec2QueryName("listenInterface")
    ListenInterface: ListenInterface,
    @xmlName("listenPort")
    @ec2QueryName("listenPort")
    ListenPort: String,
    @xmlName("option")
    @ec2QueryName("option")
    Option: OptionOfNiftyDescribeWebProxies,
    @xmlName("routerId")
    @ec2QueryName("routerId")
    RouterId: String,
    @xmlName("routerName")
    @ec2QueryName("routerName")
    RouterName: String,
}

structure OptionOfNiftyDescribeWebProxies {
    @xmlName("nameServer")
    @ec2QueryName("nameServer")
    NameServer: String,
}

@enum([
  {
      name: "LISTENINTERFACE_NETWORKID",
      value: "listenInterface.NetworkId",
  },
  {
      name: "LISTENINTERFACE_NETWORKNAME",
      value: "listenInterface.NetworkName",
  },
  {
      name: "LISTEN_PORT",
      value: "listenPort",
  },
  {
      name: "BYPASSINTERFACE_NETWORKID",
      value: "bypassInterface.NetworkId",
  },
  {
      name: "BYPASSINTERFACE_NETWORKNAME",
      value: "bypassInterface.NetworkName",
  },
  {
      name: "OPTION_NAMESERVER",
      value: "option-nameServer",
  },
  {
      name: "DESCRIPTION",
      value: "description",
  },
])
string AttributeOfNiftyModifyWebProxyAttributeRequest

structure NiftyModifyWebProxyAttributeRequest {
    @xmlName("Agreement")
    @ec2QueryName("Agreement")
    Agreement: Boolean,
    @xmlName("Attribute")
    @ec2QueryName("Attribute")
    Attribute: AttributeOfNiftyModifyWebProxyAttributeRequest,
    @xmlName("RouterId")
    @ec2QueryName("RouterId")
    RouterId: String,
    @xmlName("RouterName")
    @ec2QueryName("RouterName")
    RouterName: String,
    @required
    @xmlName("Value")
    @ec2QueryName("Value")
    Value: String,
}

structure NiftyModifyWebProxyAttributeResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("return")
    @ec2QueryName("return")
    Return: Boolean,
}

@enum([
  {
      name: "SMALL",
      value: "small",
  },
  {
      name: "MEDIUM",
      value: "medium",
  },
  {
      name: "LARGE",
      value: "large",
  },
])
string NiftyVpnGatewayTypeOfCreateVpnGatewayRequest

structure RequestPlacementOfCreateVpnGateway {
    @xmlName("AvailabilityZone")
    @ec2QueryName("AvailabilityZone")
    AvailabilityZone: String,
}

@enum([
  {
      name: "MONTHLY",
      value: "1",
  },
  {
      name: "HOURLY",
      value: "2",
  },
])
string AccountingTypeOfCreateVpnGatewayRequest

structure RequestNiftyNetwork {
    @xmlName("IpAddress")
    @ec2QueryName("IpAddress")
    IpAddress: String,
    @xmlName("NetworkId")
    @ec2QueryName("NetworkId")
    NetworkId: String,
    @xmlName("NetworkName")
    @ec2QueryName("NetworkName")
    NetworkName: String,
}

structure CreateVpnGatewayRequest {
    @xmlName("AccountingType")
    @ec2QueryName("AccountingType")
    AccountingType: AccountingTypeOfCreateVpnGatewayRequest,
    @xmlName("NiftyNetwork")
    @ec2QueryName("NiftyNetwork")
    NiftyNetwork: RequestNiftyNetwork,
    @xmlName("NiftyRedundancy")
    @ec2QueryName("NiftyRedundancy")
    NiftyRedundancy: Boolean,
    @xmlName("NiftyVpnGatewayDescription")
    @ec2QueryName("NiftyVpnGatewayDescription")
    NiftyVpnGatewayDescription: String,
    @xmlName("NiftyVpnGatewayName")
    @ec2QueryName("NiftyVpnGatewayName")
    NiftyVpnGatewayName: String,
    @xmlName("NiftyVpnGatewayType")
    @ec2QueryName("NiftyVpnGatewayType")
    NiftyVpnGatewayType: NiftyVpnGatewayTypeOfCreateVpnGatewayRequest,
    @xmlName("Placement")
    @ec2QueryName("Placement")
    Placement: RequestPlacementOfCreateVpnGateway,
    @xmlName("SecurityGroup")
    @ec2QueryName("SecurityGroup")
    SecurityGroup: ListOfRequestSecurityGroup,
    @xmlName("Type")
    @ec2QueryName("Type")
    Type: String,
}

structure CreateVpnGatewayResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("vpnGateway")
    @ec2QueryName("vpnGateway")
    VpnGateway: VpnGateway,
}

structure VpnGateway {
    @xmlName("accountingType")
    @ec2QueryName("accountingType")
    AccountingType: String,
    @xmlName("availabilityZone")
    @ec2QueryName("availabilityZone")
    AvailabilityZone: String,
    @xmlName("backupInformation")
    @ec2QueryName("backupInformation")
    BackupInformation: BackupInformation,
    @xmlName("groupSet")
    @ec2QueryName("groupSet")
    GroupSet: ListOfGroupSet,
    @xmlName("networkInterfaceSet")
    @ec2QueryName("networkInterfaceSet")
    NetworkInterfaceSet: ListOfNetworkInterfaceSetOfCreateVpnGateway,
    @xmlName("nextMonthAccountingType")
    @ec2QueryName("nextMonthAccountingType")
    NextMonthAccountingType: String,
    @xmlName("niftyRedundancy")
    @ec2QueryName("niftyRedundancy")
    NiftyRedundancy: Boolean,
    @xmlName("niftyVpnGatewayDescription")
    @ec2QueryName("niftyVpnGatewayDescription")
    NiftyVpnGatewayDescription: String,
    @xmlName("niftyVpnGatewayName")
    @ec2QueryName("niftyVpnGatewayName")
    NiftyVpnGatewayName: String,
    @xmlName("niftyVpnGatewayType")
    @ec2QueryName("niftyVpnGatewayType")
    NiftyVpnGatewayType: String,
    @xmlName("state")
    @ec2QueryName("state")
    State: String,
    @xmlName("versionInformation")
    @ec2QueryName("versionInformation")
    VersionInformation: VersionInformationOfCreateVpnGateway,
    @xmlName("vpnGatewayId")
    @ec2QueryName("vpnGatewayId")
    VpnGatewayId: String,
}

structure VersionInformationOfCreateVpnGateway {
    @xmlName("isLatest")
    @ec2QueryName("isLatest")
    IsLatest: Boolean,
    @xmlName("version")
    @ec2QueryName("version")
    Version: String,
}

list ListOfNetworkInterfaceSetOfCreateVpnGateway {
    @xmlName("item")
    member: NetworkInterfaceSetOfCreateVpnGateway,
}

structure NetworkInterfaceSetOfCreateVpnGateway {
    @xmlName("ipAddress")
    @ec2QueryName("ipAddress")
    IpAddress: String,
    @xmlName("networkId")
    @ec2QueryName("networkId")
    NetworkId: String,
    @xmlName("networkName")
    @ec2QueryName("networkName")
    NetworkName: String,
}

structure DeleteVpnGatewayRequest {
    @xmlName("NiftyVpnGatewayName")
    @ec2QueryName("NiftyVpnGatewayName")
    NiftyVpnGatewayName: String,
    @xmlName("VpnGatewayId")
    @ec2QueryName("VpnGatewayId")
    VpnGatewayId: String,
}

structure DeleteVpnGatewayResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("return")
    @ec2QueryName("return")
    Return: Boolean,
}

list ListOfRequestVpnGatewayId {
    member: String,
}

list ListOfRequestNiftyVpnGatewayName {
    member: String,
}

@enum([
  {
      name: "ATTACHMENT_STATE",
      value: "attachment.state",
  },
  {
      name: "ATTACHMENT_VPC_ID",
      value: "attachment.vpc-id",
  },
  {
      name: "AVAILABILITY_ZONE",
      value: "availability-zone",
  },
  {
      name: "STATE",
      value: "state",
  },
  {
      name: "TYPE",
      value: "type",
  },
  {
      name: "VPN_GATEWAY_ID",
      value: "vpn-gateway-id",
  },
  {
      name: "NIFTY_VPN_GATEWAY_NAME",
      value: "nifty-vpn-gateway-name",
  },
  {
      name: "NIFTY_VPN_GATEWAY_TYPE",
      value: "nifty-vpn-gateway-type",
  },
  {
      name: "NIFTY_VPN_GATEWAY_DESCRIPTION",
      value: "nifty-vpn-gateway-description",
  },
  {
      name: "NIFTY_VPN_GATEWAY_ACCOUNTINGTYPE",
      value: "nifty-vpn-gateway-accountingType",
  },
  {
      name: "IP_ADDRESS",
      value: "ip-address",
  },
  {
      name: "LATEST_VERSION_INFORMATION",
      value: "latest-version-information",
  },
  {
      name: "VERSION",
      value: "version",
  },
])
string NameOfFilterForDescribeVpnGateways

structure RequestFilterOfDescribeVpnGateways {
    @xmlName("Value")
    @ec2QueryName("Value")
    ListOfRequestValue: ListOfRequestValue,
    @xmlName("Name")
    @ec2QueryName("Name")
    Name: NameOfFilterForDescribeVpnGateways,
}

list ListOfRequestFilterOfDescribeVpnGateways {
    member: RequestFilterOfDescribeVpnGateways,
}

structure DescribeVpnGatewaysRequest {
    @xmlName("Filter")
    @ec2QueryName("Filter")
    Filter: ListOfRequestFilterOfDescribeVpnGateways,
    @xmlName("NiftyVpnGatewayName")
    @ec2QueryName("NiftyVpnGatewayName")
    NiftyVpnGatewayName: ListOfRequestNiftyVpnGatewayName,
    @xmlName("VpnGatewayId")
    @ec2QueryName("VpnGatewayId")
    VpnGatewayId: ListOfRequestVpnGatewayId,
}

structure DescribeVpnGatewaysResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("vpnGatewaySet")
    @ec2QueryName("vpnGatewaySet")
    VpnGatewaySet: ListOfVpnGatewaySetOfDescribeVpnGateways,
}

list ListOfVpnGatewaySetOfDescribeVpnGateways {
    @xmlName("item")
    member: VpnGatewaySetOfDescribeVpnGateways,
}

structure VpnGatewaySetOfDescribeVpnGateways {
    @xmlName("accountingType")
    @ec2QueryName("accountingType")
    AccountingType: String,
    @xmlName("attachments")
    @ec2QueryName("attachments")
    Attachments: String,
    @xmlName("availabilityZone")
    @ec2QueryName("availabilityZone")
    AvailabilityZone: String,
    @xmlName("backupInformation")
    @ec2QueryName("backupInformation")
    BackupInformation: BackupInformationOfDescribeVpnGateways,
    @xmlName("createdTime")
    @ec2QueryName("createdTime")
    CreatedTime: Timestamp,
    @xmlName("groupSet")
    @ec2QueryName("groupSet")
    GroupSet: ListOfGroupSet,
    @xmlName("networkInterfaceSet")
    @ec2QueryName("networkInterfaceSet")
    NetworkInterfaceSet: ListOfNetworkInterfaceSetOfDescribeVpnGateways,
    @xmlName("nextMonthAccountingType")
    @ec2QueryName("nextMonthAccountingType")
    NextMonthAccountingType: String,
    @xmlName("niftyRedundancy")
    @ec2QueryName("niftyRedundancy")
    NiftyRedundancy: Boolean,
    @xmlName("niftyVpnGatewayDescription")
    @ec2QueryName("niftyVpnGatewayDescription")
    NiftyVpnGatewayDescription: String,
    @xmlName("niftyVpnGatewayName")
    @ec2QueryName("niftyVpnGatewayName")
    NiftyVpnGatewayName: String,
    @xmlName("niftyVpnGatewayType")
    @ec2QueryName("niftyVpnGatewayType")
    NiftyVpnGatewayType: String,
    @xmlName("routeTableAssociationId")
    @ec2QueryName("routeTableAssociationId")
    RouteTableAssociationId: String,
    @xmlName("routeTableId")
    @ec2QueryName("routeTableId")
    RouteTableId: String,
    @xmlName("state")
    @ec2QueryName("state")
    State: String,
    @xmlName("tagSet")
    @ec2QueryName("tagSet")
    TagSet: ListOfTagSet,
    @xmlName("versionInformation")
    @ec2QueryName("versionInformation")
    VersionInformation: VersionInformationOfDescribeVpnGateways,
    @xmlName("vpnGatewayId")
    @ec2QueryName("vpnGatewayId")
    VpnGatewayId: String,
}

structure VersionInformationOfDescribeVpnGateways {
    @xmlName("isLatest")
    @ec2QueryName("isLatest")
    IsLatest: Boolean,
    @xmlName("version")
    @ec2QueryName("version")
    Version: String,
}

list ListOfNetworkInterfaceSetOfDescribeVpnGateways {
    @xmlName("item")
    member: NetworkInterfaceSetOfDescribeVpnGateways,
}

structure NetworkInterfaceSetOfDescribeVpnGateways {
    @xmlName("cidrBlock")
    @ec2QueryName("cidrBlock")
    CidrBlock: String,
    @xmlName("descriprion")
    @ec2QueryName("descriprion")
    Descriprion: String,
    @xmlName("deviceIndex")
    @ec2QueryName("deviceIndex")
    DeviceIndex: Integer,
    @xmlName("ipAddress")
    @ec2QueryName("ipAddress")
    IpAddress: String,
    @xmlName("networkId")
    @ec2QueryName("networkId")
    NetworkId: String,
    @xmlName("networkName")
    @ec2QueryName("networkName")
    NetworkName: String,
}

structure BackupInformationOfDescribeVpnGateways {
    @xmlName("expirationDate")
    @ec2QueryName("expirationDate")
    ExpirationDate: Timestamp,
    @xmlName("isBackup")
    @ec2QueryName("isBackup")
    IsBackup: Boolean,
}

structure NiftyDescribeVpnGatewayActivitiesRequest {
    @xmlName("NiftyVpnGatewayName")
    @ec2QueryName("NiftyVpnGatewayName")
    NiftyVpnGatewayName: String,
    @xmlName("VpnGatewayId")
    @ec2QueryName("VpnGatewayId")
    VpnGatewayId: String,
}

structure NiftyDescribeVpnGatewayActivitiesResult {
    @xmlName("analyzeResultSet")
    @ec2QueryName("analyzeResultSet")
    AnalyzeResultSet: ListOfAnalyzeResultSet,
    @xmlName("log")
    @ec2QueryName("log")
    Log: String,
    @xmlName("niftyVpnGatewayName")
    @ec2QueryName("niftyVpnGatewayName")
    NiftyVpnGatewayName: String,
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("vpnGatewayId")
    @ec2QueryName("vpnGatewayId")
    VpnGatewayId: String,
}

list ListOfAnalyzeResultSet {
    @xmlName("item")
    member: AnalyzeResultSet,
}

structure AnalyzeResultSet {
    @xmlName("analyzeCode")
    @ec2QueryName("analyzeCode")
    AnalyzeCode: String,
    @xmlName("line")
    @ec2QueryName("line")
    Line: String,
}

@enum([
  {
      name: "NIFTY_VPN_GATEWAY_NAME",
      value: "niftyVpnGatewayName",
  },
  {
      name: "NIFTY_VPN_GATEWAY_TYPE",
      value: "niftyVpnGatewayType",
  },
  {
      name: "NIFTY_VPN_GATEWAY_DESCRIPTION",
      value: "niftyVpnGatewayDescription",
  },
  {
      name: "NIFTY_VPN_GATEWAY_ACCOUNTING_TYPE",
      value: "niftyVpnGatewayAccountingType",
  },
  {
      name: "GROUP_ID",
      value: "groupId",
  },
])
string AttributeOfNiftyModifyVpnGatewayAttributeRequest

structure NiftyModifyVpnGatewayAttributeRequest {
    @xmlName("Agreement")
    @ec2QueryName("Agreement")
    Agreement: Boolean,
    @required
    @xmlName("Attribute")
    @ec2QueryName("Attribute")
    Attribute: AttributeOfNiftyModifyVpnGatewayAttributeRequest,
    @xmlName("NiftyVpnGatewayName")
    @ec2QueryName("NiftyVpnGatewayName")
    NiftyVpnGatewayName: String,
    @required
    @xmlName("Value")
    @ec2QueryName("Value")
    Value: String,
    @xmlName("VpnGatewayId")
    @ec2QueryName("VpnGatewayId")
    VpnGatewayId: String,
}

structure NiftyModifyVpnGatewayAttributeResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("return")
    @ec2QueryName("return")
    Return: Boolean,
}

structure RequestVpnGateway {
    @xmlName("NiftyReboot")
    @ec2QueryName("NiftyReboot")
    NiftyReboot: NiftyRebootOfVpnGatewayForNiftyRebootVpnGateways,
    @xmlName("NiftyVpnGatewayName")
    @ec2QueryName("NiftyVpnGatewayName")
    NiftyVpnGatewayName: String,
    @xmlName("VpnGatewayId")
    @ec2QueryName("VpnGatewayId")
    VpnGatewayId: String,
}

list ListOfRequestVpnGateway {
    member: RequestVpnGateway,
}

@enum([
  {
      name: "FORCE",
      value: "force",
  },
  {
      name: "TRUE",
      value: "true",
  },
])
string NiftyRebootOfVpnGatewayForNiftyRebootVpnGateways

structure NiftyRebootVpnGatewaysRequest {
    @xmlName("VpnGateway")
    @ec2QueryName("VpnGateway")
    VpnGateway: ListOfRequestVpnGateway,
}

structure NiftyRebootVpnGatewaysResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("return")
    @ec2QueryName("return")
    Return: Boolean,
}

structure NiftyAssociateRouteTableWithVpnGatewayRequest {
    @xmlName("Agreement")
    @ec2QueryName("Agreement")
    Agreement: Boolean,
    @xmlName("NiftyVpnGatewayName")
    @ec2QueryName("NiftyVpnGatewayName")
    NiftyVpnGatewayName: String,
    @required
    @xmlName("RouteTableId")
    @ec2QueryName("RouteTableId")
    RouteTableId: String,
    @xmlName("VpnGatewayId")
    @ec2QueryName("VpnGatewayId")
    VpnGatewayId: String,
}

structure NiftyAssociateRouteTableWithVpnGatewayResult {
    @xmlName("associationId")
    @ec2QueryName("associationId")
    AssociationId: String,
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
}

structure NiftyDisassociateRouteTableFromVpnGatewayRequest {
    @xmlName("Agreement")
    @ec2QueryName("Agreement")
    Agreement: Boolean,
    @required
    @xmlName("AssociationId")
    @ec2QueryName("AssociationId")
    AssociationId: String,
}

structure NiftyDisassociateRouteTableFromVpnGatewayResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("return")
    @ec2QueryName("return")
    Return: Boolean,
}

structure NiftyReplaceRouteTableAssociationWithVpnGatewayRequest {
    @xmlName("Agreement")
    @ec2QueryName("Agreement")
    Agreement: Boolean,
    @required
    @xmlName("AssociationId")
    @ec2QueryName("AssociationId")
    AssociationId: String,
    @required
    @xmlName("RouteTableId")
    @ec2QueryName("RouteTableId")
    RouteTableId: String,
}

structure NiftyReplaceRouteTableAssociationWithVpnGatewayResult {
    @xmlName("newAssociationId")
    @ec2QueryName("newAssociationId")
    NewAssociationId: String,
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
}

structure NiftyReplaceVpnGatewayLatestVersionRequest {
    @xmlName("Agreement")
    @ec2QueryName("Agreement")
    Agreement: Boolean,
    @xmlName("NiftyVpnGatewayName")
    @ec2QueryName("NiftyVpnGatewayName")
    NiftyVpnGatewayName: String,
    @xmlName("VpnGatewayId")
    @ec2QueryName("VpnGatewayId")
    VpnGatewayId: String,
}

structure NiftyReplaceVpnGatewayLatestVersionResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("return")
    @ec2QueryName("return")
    Return: Boolean,
}

structure NiftyRestoreVpnGatewayPreviousVersionRequest {
    @xmlName("NiftyVpnGatewayName")
    @ec2QueryName("NiftyVpnGatewayName")
    NiftyVpnGatewayName: String,
    @xmlName("VpnGatewayId")
    @ec2QueryName("VpnGatewayId")
    VpnGatewayId: String,
}

structure NiftyRestoreVpnGatewayPreviousVersionResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("return")
    @ec2QueryName("return")
    Return: Boolean,
}

structure NiftyReleaseVpnGatewayBackupStateRequest {
    @xmlName("NiftyVpnGatewayName")
    @ec2QueryName("NiftyVpnGatewayName")
    NiftyVpnGatewayName: String,
    @xmlName("VpnGatewayId")
    @ec2QueryName("VpnGatewayId")
    VpnGatewayId: String,
}

structure NiftyReleaseVpnGatewayBackupStateResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("return")
    @ec2QueryName("return")
    Return: Boolean,
}

structure RequestNetworkInterfaceOfNiftyUpdateVpnGatewayNetworkInterfaces {
    @xmlName("IpAddress")
    @ec2QueryName("IpAddress")
    IpAddress: String,
}

@enum([
  {
      name: "FORCE",
      value: "force",
  },
  {
      name: "TRUE",
      value: "true",
  },
])
string NiftyRebootOfNiftyUpdateVpnGatewayNetworkInterfacesRequest

structure NiftyUpdateVpnGatewayNetworkInterfacesRequest {
    @xmlName("Agreement")
    @ec2QueryName("Agreement")
    Agreement: Boolean,
    @xmlName("NetworkInterface")
    @ec2QueryName("NetworkInterface")
    NetworkInterface: RequestNetworkInterfaceOfNiftyUpdateVpnGatewayNetworkInterfaces,
    @xmlName("NiftyReboot")
    @ec2QueryName("NiftyReboot")
    NiftyReboot: NiftyRebootOfNiftyUpdateVpnGatewayNetworkInterfacesRequest,
    @xmlName("NiftyVpnGatewayName")
    @ec2QueryName("NiftyVpnGatewayName")
    NiftyVpnGatewayName: String,
    @xmlName("VpnGatewayId")
    @ec2QueryName("VpnGatewayId")
    VpnGatewayId: String,
}

structure NiftyUpdateVpnGatewayNetworkInterfacesResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("return")
    @ec2QueryName("return")
    Return: Boolean,
}

@enum([
  {
      name: "IPSEC",
      value: "IPsec",
  },
  {
      name: "IPSEC_VTI",
      value: "IPsec VTI",
  },
  {
      name: "L2TPV3_IPSEC",
      value: "L2TPv3 / IPsec",
  },
])
string TypeOfCreateCustomerGatewayRequest

structure CreateCustomerGatewayRequest {
    @xmlName("BgpAsn")
    @ec2QueryName("BgpAsn")
    BgpAsn: Integer,
    @required
    @xmlName("IpAddress")
    @ec2QueryName("IpAddress")
    IpAddress: String,
    @xmlName("NiftyCustomerGatewayDescription")
    @ec2QueryName("NiftyCustomerGatewayDescription")
    NiftyCustomerGatewayDescription: String,
    @xmlName("NiftyCustomerGatewayName")
    @ec2QueryName("NiftyCustomerGatewayName")
    NiftyCustomerGatewayName: String,
    @xmlName("NiftyLanSideCidrBlock")
    @ec2QueryName("NiftyLanSideCidrBlock")
    NiftyLanSideCidrBlock: String,
    @xmlName("NiftyLanSideIpAddress")
    @ec2QueryName("NiftyLanSideIpAddress")
    NiftyLanSideIpAddress: String,
    @xmlName("Type")
    @ec2QueryName("Type")
    Type: TypeOfCreateCustomerGatewayRequest,
}

structure CreateCustomerGatewayResult {
    @xmlName("customerGateway")
    @ec2QueryName("customerGateway")
    CustomerGateway: CustomerGateway,
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
}

structure CustomerGateway {
    @xmlName("createdTime")
    @ec2QueryName("createdTime")
    CreatedTime: Timestamp,
    @xmlName("customerGatewayId")
    @ec2QueryName("customerGatewayId")
    CustomerGatewayId: String,
    @xmlName("ipAddress")
    @ec2QueryName("ipAddress")
    IpAddress: String,
    @xmlName("niftyCustomerGatewayDescription")
    @ec2QueryName("niftyCustomerGatewayDescription")
    NiftyCustomerGatewayDescription: String,
    @xmlName("niftyCustomerGatewayName")
    @ec2QueryName("niftyCustomerGatewayName")
    NiftyCustomerGatewayName: String,
    @xmlName("niftyLanSideCidrBlock")
    @ec2QueryName("niftyLanSideCidrBlock")
    NiftyLanSideCidrBlock: String,
    @xmlName("niftyLanSideIpAddress")
    @ec2QueryName("niftyLanSideIpAddress")
    NiftyLanSideIpAddress: String,
    @xmlName("state")
    @ec2QueryName("state")
    State: String,
    @xmlName("tagSet")
    @ec2QueryName("tagSet")
    TagSet: ListOfTagSet,
}

structure DeleteCustomerGatewayRequest {
    @xmlName("CustomerGatewayId")
    @ec2QueryName("CustomerGatewayId")
    CustomerGatewayId: String,
    @xmlName("NiftyCustomerGatewayName")
    @ec2QueryName("NiftyCustomerGatewayName")
    NiftyCustomerGatewayName: String,
}

structure DeleteCustomerGatewayResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("return")
    @ec2QueryName("return")
    Return: Boolean,
}

list ListOfRequestCustomerGatewayId {
    member: String,
}

list ListOfRequestNiftyCustomerGatewayName {
    member: String,
}

@enum([
  {
      name: "CUSTOMER_GATEWAY_ID",
      value: "customer-gateway-id",
  },
  {
      name: "NIFTY_CUSTOMER_GATEWAY_NAME",
      value: "nifty-customer-gateway-name",
  },
  {
      name: "IP_ADDRESS",
      value: "ip-address",
  },
  {
      name: "STATE",
      value: "state",
  },
  {
      name: "NIFTY_CUSTOMER_GATEWAY_DESCRIPTION",
      value: "nifty-customer-gateway-description",
  },
])
string NameOfFilterForDescribeCustomerGateways

structure RequestFilterOfDescribeCustomerGateways {
    @xmlName("Value")
    @ec2QueryName("Value")
    ListOfRequestValue: ListOfRequestValue,
    @xmlName("Name")
    @ec2QueryName("Name")
    Name: NameOfFilterForDescribeCustomerGateways,
}

list ListOfRequestFilterOfDescribeCustomerGateways {
    member: RequestFilterOfDescribeCustomerGateways,
}

structure DescribeCustomerGatewaysRequest {
    @xmlName("CustomerGatewayId")
    @ec2QueryName("CustomerGatewayId")
    CustomerGatewayId: ListOfRequestCustomerGatewayId,
    @xmlName("Filter")
    @ec2QueryName("Filter")
    Filter: ListOfRequestFilterOfDescribeCustomerGateways,
    @xmlName("NiftyCustomerGatewayName")
    @ec2QueryName("NiftyCustomerGatewayName")
    NiftyCustomerGatewayName: ListOfRequestNiftyCustomerGatewayName,
}

structure DescribeCustomerGatewaysResult {
    @xmlName("customerGatewaySet")
    @ec2QueryName("customerGatewaySet")
    CustomerGatewaySet: ListOfCustomerGatewaySet,
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
}

list ListOfCustomerGatewaySet {
    @xmlName("item")
    member: CustomerGatewaySet,
}

structure CustomerGatewaySet {
    @xmlName("createdTime")
    @ec2QueryName("createdTime")
    CreatedTime: Timestamp,
    @xmlName("customerGatewayId")
    @ec2QueryName("customerGatewayId")
    CustomerGatewayId: String,
    @xmlName("ipAddress")
    @ec2QueryName("ipAddress")
    IpAddress: String,
    @xmlName("niftyCustomerGatewayDescription")
    @ec2QueryName("niftyCustomerGatewayDescription")
    NiftyCustomerGatewayDescription: String,
    @xmlName("niftyCustomerGatewayName")
    @ec2QueryName("niftyCustomerGatewayName")
    NiftyCustomerGatewayName: String,
    @xmlName("niftyLanSideCidrBlock")
    @ec2QueryName("niftyLanSideCidrBlock")
    NiftyLanSideCidrBlock: String,
    @xmlName("niftyLanSideIpAddress")
    @ec2QueryName("niftyLanSideIpAddress")
    NiftyLanSideIpAddress: String,
    @xmlName("state")
    @ec2QueryName("state")
    State: String,
    @xmlName("tagSet")
    @ec2QueryName("tagSet")
    TagSet: ListOfTagSet,
}

@enum([
  {
      name: "NIFTY_CUSTOMER_GATEWAY_NAME",
      value: "niftyCustomerGatewayName",
  },
  {
      name: "NIFTY_CUSTOMER_GATEWAY_DESCRIPTION",
      value: "niftyCustomerGatewayDescription",
  },
])
string AttributeOfNiftyModifyCustomerGatewayAttributeRequest

structure NiftyModifyCustomerGatewayAttributeRequest {
    @required
    @xmlName("Attribute")
    @ec2QueryName("Attribute")
    Attribute: AttributeOfNiftyModifyCustomerGatewayAttributeRequest,
    @xmlName("CustomerGatewayId")
    @ec2QueryName("CustomerGatewayId")
    CustomerGatewayId: String,
    @xmlName("NiftyCustomerGatewayName")
    @ec2QueryName("NiftyCustomerGatewayName")
    NiftyCustomerGatewayName: String,
    @required
    @xmlName("Value")
    @ec2QueryName("Value")
    Value: String,
}

structure NiftyModifyCustomerGatewayAttributeResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("return")
    @ec2QueryName("return")
    Return: Boolean,
}

@enum([
  {
      name: "IPSEC",
      value: "IPsec",
  },
  {
      name: "L2TPV3_IPSEC",
      value: "L2TPv3 / IPsec",
  },
  {
      name: "IPSEC_VTI",
      value: "IPsec VTI",
  },
])
string TypeOfCreateVpnConnectionRequest

@enum([
  {
      name: "L2TPV3",
      value: "L2TPv3",
  },
])
string TypeOfNiftyTunnelForCreateVpnConnection

structure RequestNiftyTunnel {
    @xmlName("DestinationPort")
    @ec2QueryName("DestinationPort")
    DestinationPort: String,
    @xmlName("Encapsulation")
    @ec2QueryName("Encapsulation")
    Encapsulation: EncapsulationOfNiftyTunnelForCreateVpnConnection,
    @xmlName("Mode")
    @ec2QueryName("Mode")
    Mode: ModeOfNiftyTunnelForCreateVpnConnection,
    @xmlName("PeerSessionId")
    @ec2QueryName("PeerSessionId")
    PeerSessionId: String,
    @xmlName("PeerTunnelId")
    @ec2QueryName("PeerTunnelId")
    PeerTunnelId: String,
    @xmlName("SessionId")
    @ec2QueryName("SessionId")
    SessionId: String,
    @xmlName("SourcePort")
    @ec2QueryName("SourcePort")
    SourcePort: String,
    @xmlName("TunnelId")
    @ec2QueryName("TunnelId")
    TunnelId: String,
    @xmlName("Type")
    @ec2QueryName("Type")
    Type: TypeOfNiftyTunnelForCreateVpnConnection,
}

@enum([
  {
      name: "UNMANAGED",
      value: "Unmanaged",
  },
  {
      name: "MANAGED",
      value: "Managed",
  },
])
string ModeOfNiftyTunnelForCreateVpnConnection

@enum([
  {
      name: "IP",
      value: "IP",
  },
  {
      name: "UDP",
      value: "UDP",
  },
])
string EncapsulationOfNiftyTunnelForCreateVpnConnection

@enum([
  {
      name: "AES128",
      value: "AES128",
  },
  {
      name: "AES256",
      value: "AES256",
  },
  {
      name: "ALGORITHM_3DES",
      value: "3DES",
  },
])
string EncryptionAlgorithmOfNiftyIpsecConfigurationForCreateVpnConnection

structure RequestNiftyIpsecConfiguration {
    @xmlName("DiffieHellmanGroup")
    @ec2QueryName("DiffieHellmanGroup")
    DiffieHellmanGroup: Integer,
    @xmlName("EncapsulatingSecurityPayloadLifetime")
    @ec2QueryName("EncapsulatingSecurityPayloadLifetime")
    EncapsulatingSecurityPayloadLifetime: Integer,
    @xmlName("EncryptionAlgorithm")
    @ec2QueryName("EncryptionAlgorithm")
    EncryptionAlgorithm: EncryptionAlgorithmOfNiftyIpsecConfigurationForCreateVpnConnection,
    @xmlName("HashAlgorithm")
    @ec2QueryName("HashAlgorithm")
    HashAlgorithm: HashAlgorithmOfNiftyIpsecConfigurationForCreateVpnConnection,
    @xmlName("InternetKeyExchange")
    @ec2QueryName("InternetKeyExchange")
    InternetKeyExchange: InternetKeyExchangeOfNiftyIpsecConfigurationForCreateVpnConnection,
    @xmlName("InternetKeyExchangeLifetime")
    @ec2QueryName("InternetKeyExchangeLifetime")
    InternetKeyExchangeLifetime: Integer,
    @xmlName("PreSharedKey")
    @ec2QueryName("PreSharedKey")
    PreSharedKey: String,
}

@enum([
  {
      name: "SHA1",
      value: "SHA1",
  },
  {
      name: "MD5",
      value: "MD5",
  },
  {
      name: "SHA256",
      value: "SHA256",
  },
  {
      name: "SHA384",
      value: "SHA384",
  },
  {
      name: "SHA512",
      value: "SHA512",
  },
])
string HashAlgorithmOfNiftyIpsecConfigurationForCreateVpnConnection

@enum([
  {
      name: "IKEV1",
      value: "IKEv1",
  },
  {
      name: "IKEV2",
      value: "IKEv2",
  },
])
string InternetKeyExchangeOfNiftyIpsecConfigurationForCreateVpnConnection

structure CreateVpnConnectionRequest {
    @xmlName("Agreement")
    @ec2QueryName("Agreement")
    Agreement: Boolean,
    @xmlName("CustomerGatewayId")
    @ec2QueryName("CustomerGatewayId")
    CustomerGatewayId: String,
    @xmlName("NiftyCustomerGatewayName")
    @ec2QueryName("NiftyCustomerGatewayName")
    NiftyCustomerGatewayName: String,
    @xmlName("NiftyIpsecConfiguration")
    @ec2QueryName("NiftyIpsecConfiguration")
    NiftyIpsecConfiguration: RequestNiftyIpsecConfiguration,
    @xmlName("NiftyTunnel")
    @ec2QueryName("NiftyTunnel")
    NiftyTunnel: RequestNiftyTunnel,
    @xmlName("NiftyVpnConnectionDescription")
    @ec2QueryName("NiftyVpnConnectionDescription")
    NiftyVpnConnectionDescription: String,
    @xmlName("NiftyVpnConnectionMtu")
    @ec2QueryName("NiftyVpnConnectionMtu")
    NiftyVpnConnectionMtu: String,
    @xmlName("NiftyVpnGatewayName")
    @ec2QueryName("NiftyVpnGatewayName")
    NiftyVpnGatewayName: String,
    @required
    @xmlName("Type")
    @ec2QueryName("Type")
    Type: TypeOfCreateVpnConnectionRequest,
    @xmlName("VpnGatewayId")
    @ec2QueryName("VpnGatewayId")
    VpnGatewayId: String,
}

structure CreateVpnConnectionResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("vpnConnection")
    @ec2QueryName("vpnConnection")
    VpnConnection: VpnConnection,
}

structure VpnConnection {
    @xmlName("createdTime")
    @ec2QueryName("createdTime")
    CreatedTime: Timestamp,
    @xmlName("customerGatewayId")
    @ec2QueryName("customerGatewayId")
    CustomerGatewayId: String,
    @xmlName("niftyCustomerGatewayName")
    @ec2QueryName("niftyCustomerGatewayName")
    NiftyCustomerGatewayName: String,
    @xmlName("niftyIpsecConfiguration")
    @ec2QueryName("niftyIpsecConfiguration")
    NiftyIpsecConfiguration: NiftyIpsecConfiguration,
    @xmlName("niftyTunnel")
    @ec2QueryName("niftyTunnel")
    NiftyTunnel: NiftyTunnel,
    @xmlName("niftyVpnConnectionDescription")
    @ec2QueryName("niftyVpnConnectionDescription")
    NiftyVpnConnectionDescription: String,
    @xmlName("niftyVpnGatewayName")
    @ec2QueryName("niftyVpnGatewayName")
    NiftyVpnGatewayName: String,
    @xmlName("state")
    @ec2QueryName("state")
    State: String,
    @xmlName("tagSet")
    @ec2QueryName("tagSet")
    TagSet: ListOfTagSet,
    @xmlName("type")
    @ec2QueryName("type")
    Type: String,
    @xmlName("vgwTelemetry")
    @ec2QueryName("vgwTelemetry")
    VgwTelemetry: ListOfVgwTelemetry,
    @xmlName("vpnConnectionId")
    @ec2QueryName("vpnConnectionId")
    VpnConnectionId: String,
    @xmlName("vpnGatewayId")
    @ec2QueryName("vpnGatewayId")
    VpnGatewayId: String,
}

list ListOfVgwTelemetry {
    @xmlName("item")
    member: VgwTelemetry,
}

structure VgwTelemetry {
    @xmlName("acceptedRouteCount")
    @ec2QueryName("acceptedRouteCount")
    AcceptedRouteCount: Integer,
    @xmlName("lastStatusChange")
    @ec2QueryName("lastStatusChange")
    LastStatusChange: Timestamp,
    @xmlName("outsideIpAddress")
    @ec2QueryName("outsideIpAddress")
    OutsideIpAddress: String,
    @xmlName("status")
    @ec2QueryName("status")
    Status: String,
    @xmlName("statusMessage")
    @ec2QueryName("statusMessage")
    StatusMessage: String,
}

structure NiftyTunnel {
    @xmlName("destinationPort")
    @ec2QueryName("destinationPort")
    DestinationPort: String,
    @xmlName("encapsulation")
    @ec2QueryName("encapsulation")
    Encapsulation: String,
    @xmlName("mode")
    @ec2QueryName("mode")
    Mode: String,
    @xmlName("peerSessionId")
    @ec2QueryName("peerSessionId")
    PeerSessionId: String,
    @xmlName("peerTunnelId")
    @ec2QueryName("peerTunnelId")
    PeerTunnelId: String,
    @xmlName("sessionId")
    @ec2QueryName("sessionId")
    SessionId: String,
    @xmlName("sourcePort")
    @ec2QueryName("sourcePort")
    SourcePort: String,
    @xmlName("tunnelId")
    @ec2QueryName("tunnelId")
    TunnelId: String,
    @xmlName("type")
    @ec2QueryName("type")
    Type: String,
}

structure NiftyIpsecConfiguration {
    @xmlName("diffieHellmanGroup")
    @ec2QueryName("diffieHellmanGroup")
    DiffieHellmanGroup: Integer,
    @xmlName("encapsulatingSecurityPayloadLifetime")
    @ec2QueryName("encapsulatingSecurityPayloadLifetime")
    EncapsulatingSecurityPayloadLifetime: Integer,
    @xmlName("encryptionAlgorithm")
    @ec2QueryName("encryptionAlgorithm")
    EncryptionAlgorithm: String,
    @xmlName("hashingAlgorithm")
    @ec2QueryName("hashingAlgorithm")
    HashingAlgorithm: String,
    @xmlName("internetKeyExchange")
    @ec2QueryName("internetKeyExchange")
    InternetKeyExchange: String,
    @xmlName("internetKeyExchangeLifetime")
    @ec2QueryName("internetKeyExchangeLifetime")
    InternetKeyExchangeLifetime: Integer,
    @xmlName("mtu")
    @ec2QueryName("mtu")
    Mtu: String,
    @xmlName("preSharedKey")
    @ec2QueryName("preSharedKey")
    PreSharedKey: String,
}

structure DeleteVpnConnectionRequest {
    @xmlName("Agreement")
    @ec2QueryName("Agreement")
    Agreement: Boolean,
    @required
    @xmlName("VpnConnectionId")
    @ec2QueryName("VpnConnectionId")
    VpnConnectionId: String,
}

structure DeleteVpnConnectionResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("return")
    @ec2QueryName("return")
    Return: Boolean,
}

list ListOfRequestVpnConnectionId {
    member: String,
}

@enum([
  {
      name: "CUSTOMER_GATEWAY_CONFIGURATION",
      value: "customer-gateway-configuration",
  },
  {
      name: "CUSTOMER_GATEWAY_ID",
      value: "customer-gateway-id",
  },
  {
      name: "NIFTY_CUSTOMER_GATEWAY_NAME",
      value: "nifty-customer-gateway-name",
  },
  {
      name: "STATE",
      value: "state",
  },
  {
      name: "OPTION_STATIC_ROUTES_ONLY",
      value: "option.static-routes-only",
  },
  {
      name: "ROUTE_DESTINATION_CIDR_BLOCK",
      value: "route.destination-cidr-block",
  },
  {
      name: "TYPE",
      value: "type",
  },
  {
      name: "VPN_CONNECTION_ID",
      value: "vpn-connection-id",
  },
  {
      name: "VPN_GATEWAY_ID",
      value: "vpn-gateway-id",
  },
  {
      name: "NIFTY_VPN_GATEWAY_NAME",
      value: "nifty-vpn-gateway-name",
  },
  {
      name: "NIFTY_VPN_CONNECTION_DESCRIPTION",
      value: "nifty-vpn-connection-description",
  },
  {
      name: "NIFTY_INTERNET_KEY_EXCHANGE",
      value: "nifty-internet-key-exchange",
  },
])
string NameOfFilterForDescribeVpnConnections

structure RequestFilterOfDescribeVpnConnections {
    @xmlName("Value")
    @ec2QueryName("Value")
    ListOfRequestValue: ListOfRequestValue,
    @xmlName("Name")
    @ec2QueryName("Name")
    Name: NameOfFilterForDescribeVpnConnections,
}

list ListOfRequestFilterOfDescribeVpnConnections {
    member: RequestFilterOfDescribeVpnConnections,
}

structure DescribeVpnConnectionsRequest {
    @xmlName("Filter")
    @ec2QueryName("Filter")
    Filter: ListOfRequestFilterOfDescribeVpnConnections,
    @xmlName("VpnConnectionId")
    @ec2QueryName("VpnConnectionId")
    VpnConnectionId: ListOfRequestVpnConnectionId,
}

structure DescribeVpnConnectionsResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("vpnConnectionSet")
    @ec2QueryName("vpnConnectionSet")
    VpnConnectionSet: ListOfVpnConnectionSet,
}

list ListOfVpnConnectionSet {
    @xmlName("item")
    member: VpnConnectionSet,
}

structure VpnConnectionSet {
    @xmlName("createdTime")
    @ec2QueryName("createdTime")
    CreatedTime: Timestamp,
    @xmlName("customerGatewayConfiguration")
    @ec2QueryName("customerGatewayConfiguration")
    CustomerGatewayConfiguration: String,
    @xmlName("customerGatewayId")
    @ec2QueryName("customerGatewayId")
    CustomerGatewayId: String,
    @xmlName("niftyCustomerGatewayName")
    @ec2QueryName("niftyCustomerGatewayName")
    NiftyCustomerGatewayName: String,
    @xmlName("niftyIpsecConfiguration")
    @ec2QueryName("niftyIpsecConfiguration")
    NiftyIpsecConfiguration: NiftyIpsecConfiguration,
    @xmlName("niftyTunnel")
    @ec2QueryName("niftyTunnel")
    NiftyTunnel: NiftyTunnel,
    @xmlName("niftyVpnConnectionDescription")
    @ec2QueryName("niftyVpnConnectionDescription")
    NiftyVpnConnectionDescription: String,
    @xmlName("niftyVpnGatewayName")
    @ec2QueryName("niftyVpnGatewayName")
    NiftyVpnGatewayName: String,
    @xmlName("state")
    @ec2QueryName("state")
    State: String,
    @xmlName("tagSet")
    @ec2QueryName("tagSet")
    TagSet: ListOfTagSet,
    @xmlName("type")
    @ec2QueryName("type")
    Type: String,
    @xmlName("vgwTelemetry")
    @ec2QueryName("vgwTelemetry")
    VgwTelemetry: ListOfVgwTelemetry,
    @xmlName("vpnConnectionId")
    @ec2QueryName("vpnConnectionId")
    VpnConnectionId: String,
    @xmlName("vpnGatewayId")
    @ec2QueryName("vpnGatewayId")
    VpnGatewayId: String,
}

list ListOfRequestInstanceUniqueId {
    member: String,
}

structure RequestPlacementOfNiftyCreateSeparateInstanceRule {
    @required
    @xmlName("AvailabilityZone")
    @ec2QueryName("AvailabilityZone")
    AvailabilityZone: String,
}

structure NiftyCreateSeparateInstanceRuleRequest {
    @xmlName("InstanceId")
    @ec2QueryName("InstanceId")
    InstanceId: ListOfRequestInstanceId,
    @xmlName("InstanceUniqueId")
    @ec2QueryName("InstanceUniqueId")
    InstanceUniqueId: ListOfRequestInstanceUniqueId,
    @required
    @xmlName("Placement")
    @ec2QueryName("Placement")
    Placement: RequestPlacementOfNiftyCreateSeparateInstanceRule,
    @xmlName("SeparateInstanceRuleDescription")
    @ec2QueryName("SeparateInstanceRuleDescription")
    SeparateInstanceRuleDescription: String,
    @required
    @xmlName("SeparateInstanceRuleName")
    @ec2QueryName("SeparateInstanceRuleName")
    SeparateInstanceRuleName: String,
}

structure NiftyCreateSeparateInstanceRuleResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("return")
    @ec2QueryName("return")
    Return: String,
}

structure NiftyDeleteSeparateInstanceRuleRequest {
    @required
    @xmlName("SeparateInstanceRuleName")
    @ec2QueryName("SeparateInstanceRuleName")
    SeparateInstanceRuleName: String,
}

structure NiftyDeleteSeparateInstanceRuleResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("return")
    @ec2QueryName("return")
    Return: String,
}

structure NiftyDeregisterInstancesFromSeparateInstanceRuleRequest {
    @xmlName("InstanceId")
    @ec2QueryName("InstanceId")
    InstanceId: ListOfRequestInstanceId,
    @xmlName("InstanceUniqueId")
    @ec2QueryName("InstanceUniqueId")
    InstanceUniqueId: ListOfRequestInstanceUniqueId,
    @required
    @xmlName("SeparateInstanceRuleName")
    @ec2QueryName("SeparateInstanceRuleName")
    SeparateInstanceRuleName: String,
}

structure NiftyDeregisterInstancesFromSeparateInstanceRuleResult {
    @xmlName("instancesSet")
    @ec2QueryName("instancesSet")
    InstancesSet: ListOfInstancesSetOfNiftyDeregisterInstancesFromSeparateInstanceRule,
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
}

list ListOfInstancesSetOfNiftyDeregisterInstancesFromSeparateInstanceRule {
    @xmlName("item")
    member: InstancesSetOfNiftyDeregisterInstancesFromSeparateInstanceRule,
}

structure InstancesSetOfNiftyDeregisterInstancesFromSeparateInstanceRule {
    @xmlName("instanceId")
    @ec2QueryName("instanceId")
    InstanceId: String,
    @xmlName("instanceUniqueId")
    @ec2QueryName("instanceUniqueId")
    InstanceUniqueId: String,
}

list ListOfRequestSeparateInstanceRuleName {
    member: String,
}

@enum([
  {
      name: "DESCRIPTION",
      value: "description",
  },
  {
      name: "INSTANCE_ID",
      value: "instanceId",
  },
  {
      name: "INSTANCE_UNIQUE_ID",
      value: "instanceUniqueId",
  },
])
string NameOfFilterForNiftyDescribeSeparateInstanceRules

structure RequestFilterOfNiftyDescribeSeparateInstanceRules {
    @xmlName("Value")
    @ec2QueryName("Value")
    ListOfRequestValue: ListOfRequestValue,
    @xmlName("Name")
    @ec2QueryName("Name")
    Name: NameOfFilterForNiftyDescribeSeparateInstanceRules,
}

list ListOfRequestFilterOfNiftyDescribeSeparateInstanceRules {
    member: RequestFilterOfNiftyDescribeSeparateInstanceRules,
}

structure NiftyDescribeSeparateInstanceRulesRequest {
    @xmlName("Filter")
    @ec2QueryName("Filter")
    Filter: ListOfRequestFilterOfNiftyDescribeSeparateInstanceRules,
    @xmlName("SeparateInstanceRuleName")
    @ec2QueryName("SeparateInstanceRuleName")
    SeparateInstanceRuleName: ListOfRequestSeparateInstanceRuleName,
}

structure NiftyDescribeSeparateInstanceRulesResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("separateInstanceRulesInfo")
    @ec2QueryName("separateInstanceRulesInfo")
    SeparateInstanceRulesInfo: ListOfSeparateInstanceRulesInfo,
}

list ListOfSeparateInstanceRulesInfo {
    @xmlName("item")
    member: SeparateInstanceRulesInfo,
}

structure SeparateInstanceRulesInfo {
    @xmlName("availabilityZone")
    @ec2QueryName("availabilityZone")
    AvailabilityZone: String,
    @xmlName("instancesSet")
    @ec2QueryName("instancesSet")
    InstancesSet: ListOfInstancesSetOfNiftyDescribeSeparateInstanceRules,
    @xmlName("separateInstanceRuleDescription")
    @ec2QueryName("separateInstanceRuleDescription")
    SeparateInstanceRuleDescription: String,
    @xmlName("separateInstanceRuleName")
    @ec2QueryName("separateInstanceRuleName")
    SeparateInstanceRuleName: String,
    @xmlName("separateInstanceRuleStatus")
    @ec2QueryName("separateInstanceRuleStatus")
    SeparateInstanceRuleStatus: String,
}

list ListOfInstancesSetOfNiftyDescribeSeparateInstanceRules {
    @xmlName("item")
    member: InstancesSetOfNiftyDescribeSeparateInstanceRules,
}

structure InstancesSetOfNiftyDescribeSeparateInstanceRules {
    @xmlName("instanceId")
    @ec2QueryName("instanceId")
    InstanceId: String,
    @xmlName("instanceUniqueId")
    @ec2QueryName("instanceUniqueId")
    InstanceUniqueId: String,
}

structure NiftyRegisterInstancesWithSeparateInstanceRuleRequest {
    @xmlName("InstanceId")
    @ec2QueryName("InstanceId")
    InstanceId: ListOfRequestInstanceId,
    @xmlName("InstanceUniqueId")
    @ec2QueryName("InstanceUniqueId")
    InstanceUniqueId: ListOfRequestInstanceUniqueId,
    @required
    @xmlName("SeparateInstanceRuleName")
    @ec2QueryName("SeparateInstanceRuleName")
    SeparateInstanceRuleName: String,
}

structure NiftyRegisterInstancesWithSeparateInstanceRuleResult {
    @xmlName("instancesSet")
    @ec2QueryName("instancesSet")
    InstancesSet: ListOfInstancesSetOfNiftyRegisterInstancesWithSeparateInstanceRule,
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
}

list ListOfInstancesSetOfNiftyRegisterInstancesWithSeparateInstanceRule {
    @xmlName("item")
    member: InstancesSetOfNiftyRegisterInstancesWithSeparateInstanceRule,
}

structure InstancesSetOfNiftyRegisterInstancesWithSeparateInstanceRule {
    @xmlName("instanceId")
    @ec2QueryName("instanceId")
    InstanceId: String,
    @xmlName("instanceUniqueId")
    @ec2QueryName("instanceUniqueId")
    InstanceUniqueId: String,
}

structure NiftyUpdateSeparateInstanceRuleRequest {
    @xmlName("SeparateInstanceRuleDescriptionUpdate")
    @ec2QueryName("SeparateInstanceRuleDescriptionUpdate")
    SeparateInstanceRuleDescriptionUpdate: String,
    @required
    @xmlName("SeparateInstanceRuleName")
    @ec2QueryName("SeparateInstanceRuleName")
    SeparateInstanceRuleName: String,
    @xmlName("SeparateInstanceRuleNameUpdate")
    @ec2QueryName("SeparateInstanceRuleNameUpdate")
    SeparateInstanceRuleNameUpdate: String,
}

structure NiftyUpdateSeparateInstanceRuleResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("return")
    @ec2QueryName("return")
    Return: String,
}

@enum([
  {
      name: "E_MINI",
      value: "e-mini",
  },
  {
      name: "H2_MINI",
      value: "h2-mini",
  },
  {
      name: "MINI",
      value: "mini",
  },
  {
      name: "C_SMALL",
      value: "c-small",
  },
  {
      name: "E_SMALL",
      value: "e-small",
  },
  {
      name: "H2_SMALL",
      value: "h2-small",
  },
  {
      name: "SMALL",
      value: "small",
  },
  {
      name: "C_SMALL2",
      value: "c-small2",
  },
  {
      name: "E_SMALL2",
      value: "e-small2",
  },
  {
      name: "H2_SMALL2",
      value: "h2-small2",
  },
  {
      name: "SMALL2",
      value: "small2",
  },
  {
      name: "C_SMALL4",
      value: "c-small4",
  },
  {
      name: "E_SMALL4",
      value: "e-small4",
  },
  {
      name: "H2_SMALL4",
      value: "h2-small4",
  },
  {
      name: "SMALL4",
      value: "small4",
  },
  {
      name: "E_SMALL8",
      value: "e-small8",
  },
  {
      name: "H2_SMALL8",
      value: "h2-small8",
  },
  {
      name: "SMALL8",
      value: "small8",
  },
  {
      name: "E_SMALL16",
      value: "e-small16",
  },
  {
      name: "H2_SMALL16",
      value: "h2-small16",
  },
  {
      name: "SMALL16",
      value: "small16",
  },
  {
      name: "C_MEDIUM",
      value: "c-medium",
  },
  {
      name: "E_MEDIUM",
      value: "e-medium",
  },
  {
      name: "H2_MEDIUM",
      value: "h2-medium",
  },
  {
      name: "MEDIUM",
      value: "medium",
  },
  {
      name: "C_MEDIUM4",
      value: "c-medium4",
  },
  {
      name: "E_MEDIUM4",
      value: "e-medium4",
  },
  {
      name: "H2_MEDIUM4",
      value: "h2-medium4",
  },
  {
      name: "MEDIUM4",
      value: "medium4",
  },
  {
      name: "C_MEDIUM8",
      value: "c-medium8",
  },
  {
      name: "E_MEDIUM8",
      value: "e-medium8",
  },
  {
      name: "H2_MEDIUM8",
      value: "h2-medium8",
  },
  {
      name: "MEDIUM8",
      value: "medium8",
  },
  {
      name: "E_MEDIUM16",
      value: "e-medium16",
  },
  {
      name: "H2_MEDIUM16",
      value: "h2-medium16",
  },
  {
      name: "MEDIUM16",
      value: "medium16",
  },
  {
      name: "E_MEDIUM24",
      value: "e-medium24",
  },
  {
      name: "H2_MEDIUM24",
      value: "h2-medium24",
  },
  {
      name: "MEDIUM24",
      value: "medium24",
  },
  {
      name: "C_LARGE",
      value: "c-large",
  },
  {
      name: "E_LARGE",
      value: "e-large",
  },
  {
      name: "H2_LARGE",
      value: "h2-large",
  },
  {
      name: "LARGE",
      value: "large",
  },
  {
      name: "C_LARGE8",
      value: "c-large8",
  },
  {
      name: "E_LARGE8",
      value: "e-large8",
  },
  {
      name: "H2_LARGE8",
      value: "h2-large8",
  },
  {
      name: "LARGE8",
      value: "large8",
  },
  {
      name: "E_LARGE16",
      value: "e-large16",
  },
  {
      name: "H2_LARGE16",
      value: "h2-large16",
  },
  {
      name: "LARGE16",
      value: "large16",
  },
  {
      name: "E_LARGE24",
      value: "e-large24",
  },
  {
      name: "H2_LARGE24",
      value: "h2-large24",
  },
  {
      name: "LARGE24",
      value: "large24",
  },
  {
      name: "E_LARGE32",
      value: "e-large32",
  },
  {
      name: "H2_LARGE32",
      value: "h2-large32",
  },
  {
      name: "LARGE32",
      value: "large32",
  },
  {
      name: "E_EXTRA_LARGE8",
      value: "e-extra-large8",
  },
  {
      name: "H2_EXTRA_LARGE8",
      value: "h2-extra-large8",
  },
  {
      name: "EXTRA_LARGE8",
      value: "extra-large8",
  },
  {
      name: "E_EXTRA_LARGE16",
      value: "e-extra-large16",
  },
  {
      name: "H2_EXTRA_LARGE16",
      value: "h2-extra-large16",
  },
  {
      name: "EXTRA_LARGE16",
      value: "extra-large16",
  },
  {
      name: "E_EXTRA_LARGE24",
      value: "e-extra-large24",
  },
  {
      name: "H2_EXTRA_LARGE24",
      value: "h2-extra-large24",
  },
  {
      name: "EXTRA_LARGE24",
      value: "extra-large24",
  },
  {
      name: "E_EXTRA_LARGE32",
      value: "e-extra-large32",
  },
  {
      name: "H2_EXTRA_LARGE32",
      value: "h2-extra-large32",
  },
  {
      name: "EXTRA_LARGE32",
      value: "extra-large32",
  },
  {
      name: "E_EXTRA_LARGE48",
      value: "e-extra-large48",
  },
  {
      name: "H2_EXTRA_LARGE48",
      value: "h2-extra-large48",
  },
  {
      name: "EXTRA_LARGE48",
      value: "extra-large48",
  },
  {
      name: "E_DOUBLE_LARGE16",
      value: "e-double-large16",
  },
  {
      name: "H2_DOUBLE_LARGE16",
      value: "h2-double-large16",
  },
  {
      name: "DOUBLE_LARGE16",
      value: "double-large16",
  },
  {
      name: "E_DOUBLE_LARGE24",
      value: "e-double-large24",
  },
  {
      name: "H2_DOUBLE_LARGE24",
      value: "h2-double-large24",
  },
  {
      name: "DOUBLE_LARGE24",
      value: "double-large24",
  },
  {
      name: "E_DOUBLE_LARGE32",
      value: "e-double-large32",
  },
  {
      name: "H2_DOUBLE_LARGE32",
      value: "h2-double-large32",
  },
  {
      name: "DOUBLE_LARGE32",
      value: "double-large32",
  },
  {
      name: "E_DOUBLE_LARGE48",
      value: "e-double-large48",
  },
  {
      name: "H2_DOUBLE_LARGE48",
      value: "h2-double-large48",
  },
  {
      name: "DOUBLE_LARGE48",
      value: "double-large48",
  },
  {
      name: "E_DOUBLE_LARGE64",
      value: "e-double-large64",
  },
  {
      name: "H2_DOUBLE_LARGE64",
      value: "h2-double-large64",
  },
  {
      name: "DOUBLE_LARGE64",
      value: "double-large64",
  },
  {
      name: "E_DOUBLE_LARGE96",
      value: "e-double-large96",
  },
  {
      name: "H2_DOUBLE_LARGE96",
      value: "h2-double-large96",
  },
  {
      name: "DOUBLE_LARGE96",
      value: "double-large96",
  },
  {
      name: "H2_TRIPLE_LARGE32",
      value: "h2-triple-large32",
  },
  {
      name: "TRIPLE_LARGE32",
      value: "triple-large32",
  },
  {
      name: "H2_TRIPLE_LARGE48",
      value: "h2-triple-large48",
  },
  {
      name: "TRIPLE_LARGE48",
      value: "triple-large48",
  },
  {
      name: "H2_TRIPLE_LARGE64",
      value: "h2-triple-large64",
  },
  {
      name: "TRIPLE_LARGE64",
      value: "triple-large64",
  },
  {
      name: "H2_TRIPLE_LARGE96",
      value: "h2-triple-large96",
  },
  {
      name: "TRIPLE_LARGE96",
      value: "triple-large96",
  },
  {
      name: "H2_TRIPLE_LARGE128",
      value: "h2-triple-large128",
  },
  {
      name: "TRIPLE_LARGE128",
      value: "triple-large128",
  },
  {
      name: "H2_QUAD_LARGE64",
      value: "h2-quad-large64",
  },
  {
      name: "QUAD_LARGE64",
      value: "quad-large64",
  },
  {
      name: "H2_QUAD_LARGE96",
      value: "h2-quad-large96",
  },
  {
      name: "QUAD_LARGE96",
      value: "quad-large96",
  },
  {
      name: "H2_QUAD_LARGE128",
      value: "h2-quad-large128",
  },
  {
      name: "QUAD_LARGE128",
      value: "quad-large128",
  },
  {
      name: "H2_SEPTA_LARGE128",
      value: "h2-septa-large128",
  },
  {
      name: "SEPTA_LARGE128",
      value: "septa-large128",
  },
])
string InstanceTypeOfCopyFromBackupInstanceRequest

@enum([
  {
      name: "MONTHLY",
      value: "1",
  },
  {
      name: "HOURLY",
      value: "2",
  },
])
string AccountingTypeOfCopyFromBackupInstanceRequest

structure RequestNetworkInterfaceOfCopyFromBackupInstance {
    @xmlName("IpAddress")
    @ec2QueryName("IpAddress")
    IpAddress: String,
    @xmlName("NetworkId")
    @ec2QueryName("NetworkId")
    NetworkId: String,
    @xmlName("NetworkName")
    @ec2QueryName("NetworkName")
    NetworkName: String,
}

list ListOfRequestNetworkInterfaceOfCopyFromBackupInstance {
    member: RequestNetworkInterfaceOfCopyFromBackupInstance,
}

structure CopyFromBackupInstanceRequest {
    @xmlName("AccountingType")
    @ec2QueryName("AccountingType")
    AccountingType: AccountingTypeOfCopyFromBackupInstanceRequest,
    @required
    @xmlName("BackupInstanceUniqueId")
    @ec2QueryName("BackupInstanceUniqueId")
    BackupInstanceUniqueId: String,
    @xmlName("Description")
    @ec2QueryName("Description")
    Description: String,
    @xmlName("DisableApiTermination")
    @ec2QueryName("DisableApiTermination")
    DisableApiTermination: Boolean,
    @xmlName("InstanceId")
    @ec2QueryName("InstanceId")
    InstanceId: String,
    @xmlName("InstanceType")
    @ec2QueryName("InstanceType")
    InstanceType: InstanceTypeOfCopyFromBackupInstanceRequest,
    @xmlName("NetworkInterface")
    @ec2QueryName("NetworkInterface")
    NetworkInterface: ListOfRequestNetworkInterfaceOfCopyFromBackupInstance,
    @xmlName("SecurityGroup")
    @ec2QueryName("SecurityGroup")
    SecurityGroup: ListOfRequestSecurityGroup,
}

structure CopyFromBackupInstanceResult {
    @xmlName("groupSet")
    @ec2QueryName("groupSet")
    GroupSet: ListOfGroupSet,
    @xmlName("instance")
    @ec2QueryName("instance")
    Instance: Instance,
    @xmlName("ownerId")
    @ec2QueryName("ownerId")
    OwnerId: String,
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("reservationId")
    @ec2QueryName("reservationId")
    ReservationId: String,
    @xmlName("return")
    @ec2QueryName("return")
    Return: Boolean,
}

structure Instance {
    @xmlName("accountingType")
    @ec2QueryName("accountingType")
    AccountingType: String,
    @xmlName("admin")
    @ec2QueryName("admin")
    Admin: String,
    @xmlName("amiLaunchIndex")
    @ec2QueryName("amiLaunchIndex")
    AmiLaunchIndex: String,
    @xmlName("architecture")
    @ec2QueryName("architecture")
    Architecture: String,
    @xmlName("blockDeviceMapping")
    @ec2QueryName("blockDeviceMapping")
    BlockDeviceMapping: ListOfBlockDeviceMappingOfCopyFromBackupInstance,
    @xmlName("description")
    @ec2QueryName("description")
    Description: String,
    @xmlName("dnsName")
    @ec2QueryName("dnsName")
    DnsName: String,
    @xmlName("imageId")
    @ec2QueryName("imageId")
    ImageId: String,
    @xmlName("instanceId")
    @ec2QueryName("instanceId")
    InstanceId: String,
    @xmlName("instanceLifecycle")
    @ec2QueryName("instanceLifecycle")
    InstanceLifecycle: String,
    @xmlName("instanceState")
    @ec2QueryName("instanceState")
    InstanceState: InstanceState,
    @xmlName("instanceType")
    @ec2QueryName("instanceType")
    InstanceType: String,
    @xmlName("instanceUniqueId")
    @ec2QueryName("instanceUniqueId")
    InstanceUniqueId: String,
    @xmlName("ipAddress")
    @ec2QueryName("ipAddress")
    IpAddress: String,
    @xmlName("ipAddressV6")
    @ec2QueryName("ipAddressV6")
    IpAddressV6: String,
    @xmlName("ipType")
    @ec2QueryName("ipType")
    IpType: String,
    @xmlName("kernelId")
    @ec2QueryName("kernelId")
    KernelId: String,
    @xmlName("keyName")
    @ec2QueryName("keyName")
    KeyName: String,
    @xmlName("launchTime")
    @ec2QueryName("launchTime")
    LaunchTime: String,
    @xmlName("monitoring")
    @ec2QueryName("monitoring")
    Monitoring: Monitoring,
    @xmlName("networkInterfaceSet")
    @ec2QueryName("networkInterfaceSet")
    NetworkInterfaceSet: ListOfNetworkInterfaceSetOfCopyFromBackupInstance,
    @xmlName("niftyPrivateIpType")
    @ec2QueryName("niftyPrivateIpType")
    NiftyPrivateIpType: String,
    @xmlName("placement")
    @ec2QueryName("placement")
    Placement: Placement,
    @xmlName("platform")
    @ec2QueryName("platform")
    Platform: String,
    @xmlName("privateDnsName")
    @ec2QueryName("privateDnsName")
    PrivateDnsName: String,
    @xmlName("privateIpAddress")
    @ec2QueryName("privateIpAddress")
    PrivateIpAddress: String,
    @xmlName("privateIpAddressV6")
    @ec2QueryName("privateIpAddressV6")
    PrivateIpAddressV6: String,
    @xmlName("productCodes")
    @ec2QueryName("productCodes")
    ProductCodes: ListOfProductCodes,
    @xmlName("ramdiskId")
    @ec2QueryName("ramdiskId")
    RamdiskId: String,
    @xmlName("reason")
    @ec2QueryName("reason")
    Reason: String,
    @xmlName("rootDeviceName")
    @ec2QueryName("rootDeviceName")
    RootDeviceName: String,
    @xmlName("rootDeviceType")
    @ec2QueryName("rootDeviceType")
    RootDeviceType: String,
    @xmlName("spotInstanceRequestId")
    @ec2QueryName("spotInstanceRequestId")
    SpotInstanceRequestId: String,
    @xmlName("stateReason")
    @ec2QueryName("stateReason")
    StateReason: StateReason,
    @xmlName("subnetId")
    @ec2QueryName("subnetId")
    SubnetId: String,
    @xmlName("vpcId")
    @ec2QueryName("vpcId")
    VpcId: String,
}

list ListOfBlockDeviceMappingOfCopyFromBackupInstance {
    @xmlName("item")
    member: BlockDeviceMappingOfCopyFromBackupInstance,
}

structure BlockDeviceMappingOfCopyFromBackupInstance {
    @xmlName("deviceName")
    @ec2QueryName("deviceName")
    DeviceName: String,
    @xmlName("ebs")
    @ec2QueryName("ebs")
    Ebs: EbsOfCopyFromBackupInstance,
}

structure EbsOfCopyFromBackupInstance {
    @xmlName("attachTime")
    @ec2QueryName("attachTime")
    AttachTime: String,
    @xmlName("deleteOnTermination")
    @ec2QueryName("deleteOnTermination")
    DeleteOnTermination: Boolean,
    @xmlName("status")
    @ec2QueryName("status")
    Status: String,
    @xmlName("volumeId")
    @ec2QueryName("volumeId")
    VolumeId: String,
}

list ListOfNetworkInterfaceSetOfCopyFromBackupInstance {
    @xmlName("item")
    member: NetworkInterfaceSetOfCopyFromBackupInstance,
}

structure NetworkInterfaceSetOfCopyFromBackupInstance {
    @xmlName("association")
    @ec2QueryName("association")
    Association: AssociationOfCopyFromBackupInstance,
    @xmlName("attachment")
    @ec2QueryName("attachment")
    Attachment: AttachmentOfCopyFromBackupInstance,
    @xmlName("description")
    @ec2QueryName("description")
    Description: String,
    @xmlName("groupSet")
    @ec2QueryName("groupSet")
    GroupSet: ListOfGroupSet,
    @xmlName("macAddress")
    @ec2QueryName("macAddress")
    MacAddress: String,
    @xmlName("networkInterfaceId")
    @ec2QueryName("networkInterfaceId")
    NetworkInterfaceId: String,
    @xmlName("niftyNetworkId")
    @ec2QueryName("niftyNetworkId")
    NiftyNetworkId: String,
    @xmlName("niftyNetworkName")
    @ec2QueryName("niftyNetworkName")
    NiftyNetworkName: String,
    @xmlName("ownerId")
    @ec2QueryName("ownerId")
    OwnerId: String,
    @xmlName("privateDnsName")
    @ec2QueryName("privateDnsName")
    PrivateDnsName: String,
    @xmlName("privateIpAddress")
    @ec2QueryName("privateIpAddress")
    PrivateIpAddress: String,
    @xmlName("privateIpAddressesSet")
    @ec2QueryName("privateIpAddressesSet")
    PrivateIpAddressesSet: ListOfPrivateIpAddressesSetOfCopyFromBackupInstance,
    @xmlName("sourceDestCheck")
    @ec2QueryName("sourceDestCheck")
    SourceDestCheck: String,
    @xmlName("status")
    @ec2QueryName("status")
    Status: String,
    @xmlName("subnetId")
    @ec2QueryName("subnetId")
    SubnetId: String,
    @xmlName("vpcId")
    @ec2QueryName("vpcId")
    VpcId: String,
}

structure AttachmentOfCopyFromBackupInstance {
    @xmlName("attachmentId")
    @ec2QueryName("attachmentId")
    AttachmentId: String,
    @xmlName("attachTime")
    @ec2QueryName("attachTime")
    AttachTime: String,
    @xmlName("deleteOnTermination")
    @ec2QueryName("deleteOnTermination")
    DeleteOnTermination: Boolean,
    @xmlName("deviceIndex")
    @ec2QueryName("deviceIndex")
    DeviceIndex: Integer,
    @xmlName("instanceId")
    @ec2QueryName("instanceId")
    InstanceId: String,
    @xmlName("instanceOwnerId")
    @ec2QueryName("instanceOwnerId")
    InstanceOwnerId: String,
    @xmlName("status")
    @ec2QueryName("status")
    Status: String,
}

structure AssociationOfCopyFromBackupInstance {
    @xmlName("allocationId")
    @ec2QueryName("allocationId")
    AllocationId: String,
    @xmlName("associationId")
    @ec2QueryName("associationId")
    AssociationId: String,
    @xmlName("ipOwnerId")
    @ec2QueryName("ipOwnerId")
    IpOwnerId: String,
    @xmlName("publicDnsName")
    @ec2QueryName("publicDnsName")
    PublicDnsName: String,
    @xmlName("publicIp")
    @ec2QueryName("publicIp")
    PublicIp: String,
    @xmlName("publicIpV6")
    @ec2QueryName("publicIpV6")
    PublicIpV6: String,
}

list ListOfPrivateIpAddressesSetOfCopyFromBackupInstance {
    @xmlName("item")
    member: PrivateIpAddressesSetOfCopyFromBackupInstance,
}

structure PrivateIpAddressesSetOfCopyFromBackupInstance {
    @xmlName("association")
    @ec2QueryName("association")
    Association: AssociationOfCopyFromBackupInstance,
    @xmlName("primary")
    @ec2QueryName("primary")
    Primary: String,
    @xmlName("privateDnsName")
    @ec2QueryName("privateDnsName")
    PrivateDnsName: String,
    @xmlName("privateIpAddress")
    @ec2QueryName("privateIpAddress")
    PrivateIpAddress: String,
}

structure CreateBackupInstancesRequest {
    @required
    @xmlName("InstanceBackupRuleId")
    @ec2QueryName("InstanceBackupRuleId")
    InstanceBackupRuleId: String,
}

structure CreateBackupInstancesResult {
    @xmlName("instanceBackupRule")
    @ec2QueryName("instanceBackupRule")
    InstanceBackupRule: InstanceBackupRuleOfCreateBackupInstances,
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("return")
    @ec2QueryName("return")
    Return: Boolean,
}

structure InstanceBackupRuleOfCreateBackupInstances {
    @xmlName("availabilityZone")
    @ec2QueryName("availabilityZone")
    AvailabilityZone: String,
    @xmlName("backupInstanceMaxCount")
    @ec2QueryName("backupInstanceMaxCount")
    BackupInstanceMaxCount: Integer,
    @xmlName("description")
    @ec2QueryName("description")
    Description: String,
    @xmlName("instanceBackupRuleId")
    @ec2QueryName("instanceBackupRuleId")
    InstanceBackupRuleId: String,
    @xmlName("instanceBackupRuleName")
    @ec2QueryName("instanceBackupRuleName")
    InstanceBackupRuleName: String,
    @xmlName("instancesSet")
    @ec2QueryName("instancesSet")
    InstancesSet: ListOfInstancesSetOfCreateBackupInstances,
    @xmlName("regionName")
    @ec2QueryName("regionName")
    RegionName: String,
    @xmlName("status")
    @ec2QueryName("status")
    Status: String,
    @xmlName("timeSlotId")
    @ec2QueryName("timeSlotId")
    TimeSlotId: String,
}

list ListOfInstancesSetOfCreateBackupInstances {
    @xmlName("item")
    member: InstancesSetOfCreateBackupInstances,
}

structure InstancesSetOfCreateBackupInstances {
    @xmlName("backupInstancesSet")
    @ec2QueryName("backupInstancesSet")
    BackupInstancesSet: ListOfBackupInstancesSet,
    @xmlName("instanceId")
    @ec2QueryName("instanceId")
    InstanceId: String,
    @xmlName("instanceUniqueId")
    @ec2QueryName("instanceUniqueId")
    InstanceUniqueId: String,
}

list ListOfBackupInstancesSet {
    @xmlName("item")
    member: BackupInstancesSet,
}

structure BackupInstancesSet {
    @xmlName("backupInstanceCreateTime")
    @ec2QueryName("backupInstanceCreateTime")
    BackupInstanceCreateTime: String,
    @xmlName("backupInstanceUniqueId")
    @ec2QueryName("backupInstanceUniqueId")
    BackupInstanceUniqueId: String,
    @xmlName("status")
    @ec2QueryName("status")
    Status: String,
}

@enum([
  {
      name: "FROM_0_00_TO_1_59",
      value: "1",
  },
  {
      name: "FROM_2_00_TO_3_59",
      value: "2",
  },
  {
      name: "FROM_4_00_TO_5_59",
      value: "3",
  },
  {
      name: "FROM_6_00_TO_7_59",
      value: "4",
  },
  {
      name: "FROM_8_00_TO_9_59",
      value: "5",
  },
  {
      name: "FROM_10_00_TO_11_59",
      value: "6",
  },
  {
      name: "FROM_12_00_TO_13_59",
      value: "7",
  },
  {
      name: "FROM_14_00_TO_15_59",
      value: "8",
  },
  {
      name: "FROM_16_00_TO_17_59",
      value: "9",
  },
  {
      name: "FROM_18_00_TO_19_59",
      value: "10",
  },
  {
      name: "FROM_20_00_TO_21_59",
      value: "11",
  },
  {
      name: "FROM_22_00_TO_23_59",
      value: "12",
  },
])
string TimeSlotIdOfCreateInstanceBackupRuleRequest

structure CreateInstanceBackupRuleRequest {
    @required
    @xmlName("BackupInstanceMaxCount")
    @ec2QueryName("BackupInstanceMaxCount")
    BackupInstanceMaxCount: Integer,
    @xmlName("Description")
    @ec2QueryName("Description")
    Description: String,
    @xmlName("InstanceBackupRuleName")
    @ec2QueryName("InstanceBackupRuleName")
    InstanceBackupRuleName: String,
    @required
    @xmlName("InstanceUniqueId")
    @ec2QueryName("InstanceUniqueId")
    InstanceUniqueId: ListOfRequestInstanceUniqueId,
    @required
    @xmlName("TimeSlotId")
    @ec2QueryName("TimeSlotId")
    TimeSlotId: TimeSlotIdOfCreateInstanceBackupRuleRequest,
}

structure CreateInstanceBackupRuleResult {
    @xmlName("instanceBackupRule")
    @ec2QueryName("instanceBackupRule")
    InstanceBackupRule: InstanceBackupRuleOfCreateInstanceBackupRule,
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("return")
    @ec2QueryName("return")
    Return: Boolean,
}

structure InstanceBackupRuleOfCreateInstanceBackupRule {
    @xmlName("availabilityZone")
    @ec2QueryName("availabilityZone")
    AvailabilityZone: String,
    @xmlName("backupInstanceMaxCount")
    @ec2QueryName("backupInstanceMaxCount")
    BackupInstanceMaxCount: Integer,
    @xmlName("description")
    @ec2QueryName("description")
    Description: String,
    @xmlName("instanceBackupRuleId")
    @ec2QueryName("instanceBackupRuleId")
    InstanceBackupRuleId: String,
    @xmlName("instanceBackupRuleName")
    @ec2QueryName("instanceBackupRuleName")
    InstanceBackupRuleName: String,
    @xmlName("instancesSet")
    @ec2QueryName("instancesSet")
    InstancesSet: ListOfInstancesSetOfCreateInstanceBackupRule,
    @xmlName("regionName")
    @ec2QueryName("regionName")
    RegionName: String,
    @xmlName("status")
    @ec2QueryName("status")
    Status: String,
    @xmlName("timeSlotId")
    @ec2QueryName("timeSlotId")
    TimeSlotId: String,
}

list ListOfInstancesSetOfCreateInstanceBackupRule {
    @xmlName("item")
    member: InstancesSetOfCreateInstanceBackupRule,
}

structure InstancesSetOfCreateInstanceBackupRule {
    @xmlName("backupInstancesSet")
    @ec2QueryName("backupInstancesSet")
    BackupInstancesSet: String,
    @xmlName("instanceId")
    @ec2QueryName("instanceId")
    InstanceId: String,
    @xmlName("instanceUniqueId")
    @ec2QueryName("instanceUniqueId")
    InstanceUniqueId: String,
}

structure DeleteInstanceBackupRuleRequest {
    @required
    @xmlName("InstanceBackupRuleId")
    @ec2QueryName("InstanceBackupRuleId")
    InstanceBackupRuleId: String,
}

structure DeleteInstanceBackupRuleResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("return")
    @ec2QueryName("return")
    Return: Boolean,
}

structure DescribeInstanceBackupRuleActivitiesRequest {
    @xmlName("Duration")
    @ec2QueryName("Duration")
    Duration: Integer,
    @xmlName("EndDateTime")
    @ec2QueryName("EndDateTime")
    EndDateTime: String,
    @required
    @xmlName("InstanceBackupRuleId")
    @ec2QueryName("InstanceBackupRuleId")
    InstanceBackupRuleId: String,
    @xmlName("MaxRecords")
    @ec2QueryName("MaxRecords")
    MaxRecords: Integer,
}

structure DescribeInstanceBackupRuleActivitiesResult {
    @xmlName("activitiesSet")
    @ec2QueryName("activitiesSet")
    ActivitiesSet: ListOfActivitiesSet,
    @xmlName("instanceBackupRuleId")
    @ec2QueryName("instanceBackupRuleId")
    InstanceBackupRuleId: String,
    @xmlName("instanceBackupRuleName")
    @ec2QueryName("instanceBackupRuleName")
    InstanceBackupRuleName: String,
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
}

list ListOfActivitiesSet {
    @xmlName("item")
    member: ActivitiesSet,
}

structure ActivitiesSet {
    @xmlName("backupInstanceUniqueId")
    @ec2QueryName("backupInstanceUniqueId")
    BackupInstanceUniqueId: String,
    @xmlName("detail")
    @ec2QueryName("detail")
    Detail: String,
    @xmlName("endDateTime")
    @ec2QueryName("endDateTime")
    EndDateTime: String,
    @xmlName("instanceUniqueId")
    @ec2QueryName("instanceUniqueId")
    InstanceUniqueId: String,
    @xmlName("operation")
    @ec2QueryName("operation")
    Operation: String,
    @xmlName("startDateTime")
    @ec2QueryName("startDateTime")
    StartDateTime: String,
    @xmlName("status")
    @ec2QueryName("status")
    Status: String,
}

list ListOfRequestInstanceBackupRuleId {
    member: String,
}

structure DescribeInstanceBackupRulesRequest {
    @xmlName("InstanceBackupRuleId")
    @ec2QueryName("InstanceBackupRuleId")
    InstanceBackupRuleId: ListOfRequestInstanceBackupRuleId,
}

structure DescribeInstanceBackupRulesResult {
    @xmlName("instanceBackupRulesSet")
    @ec2QueryName("instanceBackupRulesSet")
    InstanceBackupRulesSet: ListOfInstanceBackupRulesSet,
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
}

list ListOfInstanceBackupRulesSet {
    @xmlName("item")
    member: InstanceBackupRulesSet,
}

structure InstanceBackupRulesSet {
    @xmlName("availabilityZone")
    @ec2QueryName("availabilityZone")
    AvailabilityZone: String,
    @xmlName("backupInstanceMaxCount")
    @ec2QueryName("backupInstanceMaxCount")
    BackupInstanceMaxCount: Integer,
    @xmlName("description")
    @ec2QueryName("description")
    Description: String,
    @xmlName("instanceBackupRuleId")
    @ec2QueryName("instanceBackupRuleId")
    InstanceBackupRuleId: String,
    @xmlName("instanceBackupRuleName")
    @ec2QueryName("instanceBackupRuleName")
    InstanceBackupRuleName: String,
    @xmlName("instancesSet")
    @ec2QueryName("instancesSet")
    InstancesSet: ListOfInstancesSetOfDescribeInstanceBackupRules,
    @xmlName("regionName")
    @ec2QueryName("regionName")
    RegionName: String,
    @xmlName("status")
    @ec2QueryName("status")
    Status: String,
    @xmlName("timeSlotId")
    @ec2QueryName("timeSlotId")
    TimeSlotId: String,
}

list ListOfInstancesSetOfDescribeInstanceBackupRules {
    @xmlName("item")
    member: InstancesSetOfDescribeInstanceBackupRules,
}

structure InstancesSetOfDescribeInstanceBackupRules {
    @xmlName("backupInstancesSet")
    @ec2QueryName("backupInstancesSet")
    BackupInstancesSet: ListOfBackupInstancesSet,
    @xmlName("instanceId")
    @ec2QueryName("instanceId")
    InstanceId: String,
    @xmlName("instanceUniqueId")
    @ec2QueryName("instanceUniqueId")
    InstanceUniqueId: String,
}

@enum([
  {
      name: "FROM_0_00_TO_1_59",
      value: "1",
  },
  {
      name: "FROM_2_00_TO_3_59",
      value: "2",
  },
  {
      name: "FROM_4_00_TO_5_59",
      value: "3",
  },
  {
      name: "FROM_6_00_TO_7_59",
      value: "4",
  },
  {
      name: "FROM_8_00_TO_9_59",
      value: "5",
  },
  {
      name: "FROM_10_00_TO_11_59",
      value: "6",
  },
  {
      name: "FROM_12_00_TO_13_59",
      value: "7",
  },
  {
      name: "FROM_14_00_TO_15_59",
      value: "8",
  },
  {
      name: "FROM_16_00_TO_17_59",
      value: "9",
  },
  {
      name: "FROM_18_00_TO_19_59",
      value: "10",
  },
  {
      name: "FROM_20_00_TO_21_59",
      value: "11",
  },
  {
      name: "FROM_22_00_TO_23_59",
      value: "12",
  },
])
string TimeSlotIdOfModifyInstanceBackupRuleAttributeRequest

structure ModifyInstanceBackupRuleAttributeRequest {
    @xmlName("BackupInstanceMaxCount")
    @ec2QueryName("BackupInstanceMaxCount")
    BackupInstanceMaxCount: Integer,
    @xmlName("Description")
    @ec2QueryName("Description")
    Description: String,
    @required
    @xmlName("InstanceBackupRuleId")
    @ec2QueryName("InstanceBackupRuleId")
    InstanceBackupRuleId: String,
    @xmlName("InstanceBackupRuleName")
    @ec2QueryName("InstanceBackupRuleName")
    InstanceBackupRuleName: String,
    @xmlName("TimeSlotId")
    @ec2QueryName("TimeSlotId")
    TimeSlotId: TimeSlotIdOfModifyInstanceBackupRuleAttributeRequest,
}

structure ModifyInstanceBackupRuleAttributeResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("return")
    @ec2QueryName("return")
    Return: Boolean,
}

structure RefreshInstanceBackupRuleRequest {
    @required
    @xmlName("InstanceBackupRuleId")
    @ec2QueryName("InstanceBackupRuleId")
    InstanceBackupRuleId: String,
}

structure RefreshInstanceBackupRuleResult {
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
    @xmlName("return")
    @ec2QueryName("return")
    Return: Boolean,
}

list ListOfRequestZoneName {
    member: String,
}

structure DescribeAvailabilityZonesRequest {
    @xmlName("ZoneName")
    @ec2QueryName("ZoneName")
    ZoneName: ListOfRequestZoneName,
}

structure DescribeAvailabilityZonesResult {
    @xmlName("availabilityZoneInfo")
    @ec2QueryName("availabilityZoneInfo")
    AvailabilityZoneInfo: ListOfAvailabilityZoneInfo,
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
}

list ListOfAvailabilityZoneInfo {
    @xmlName("item")
    member: AvailabilityZoneInfo,
}

structure AvailabilityZoneInfo {
    @xmlName("isDefault")
    @ec2QueryName("isDefault")
    IsDefault: Boolean,
    @xmlName("messageSet")
    @ec2QueryName("messageSet")
    MessageSet: String,
    @xmlName("regionName")
    @ec2QueryName("regionName")
    RegionName: String,
    @xmlName("securityGroupSupported")
    @ec2QueryName("securityGroupSupported")
    SecurityGroupSupported: Boolean,
    @xmlName("zoneName")
    @ec2QueryName("zoneName")
    ZoneName: String,
    @xmlName("zoneState")
    @ec2QueryName("zoneState")
    ZoneState: String,
}

list ListOfRequestRegionName {
    member: String,
}

structure RequestFilterOfDescribeRegions {
    @xmlName("Value")
    @ec2QueryName("Value")
    ListOfRequestValue: ListOfRequestValue,
    @xmlName("Name")
    @ec2QueryName("Name")
    Name: String,
}

list ListOfRequestFilterOfDescribeRegions {
    member: RequestFilterOfDescribeRegions,
}

structure DescribeRegionsRequest {
    @xmlName("Filter")
    @ec2QueryName("Filter")
    Filter: ListOfRequestFilterOfDescribeRegions,
    @xmlName("RegionName")
    @ec2QueryName("RegionName")
    RegionName: ListOfRequestRegionName,
}

structure DescribeRegionsResult {
    @xmlName("regionInfo")
    @ec2QueryName("regionInfo")
    RegionInfo: ListOfRegionInfo,
    @xmlName("requestId")
    @ec2QueryName("requestId")
    RequestId: String,
}

list ListOfRegionInfo {
    @xmlName("item")
    member: RegionInfo,
}

structure RegionInfo {
    @xmlName("isDefault")
    @ec2QueryName("isDefault")
    IsDefault: Boolean,
    @xmlName("messageSet")
    @ec2QueryName("messageSet")
    MessageSet: ListOfMessageSet,
    @xmlName("regionEndpoint")
    @ec2QueryName("regionEndpoint")
    RegionEndpoint: String,
    @xmlName("regionName")
    @ec2QueryName("regionName")
    RegionName: String,
}

list ListOfMessageSet {
    @xmlName("item")
    member: String,
}

@enum([
  {
      name: "LB",
      value: "LB",
  },
])
string FunctionNameOfAssociateUsersRequest

structure RequestUsers {
    @required
    @xmlName("UserId")
    @ec2QueryName("UserId")
    UserId: String,
}

structure ListOfRequestUsers {
    @xmlName("member")
    @ec2QueryName("member")
    Member: ListOfRequestUsersMember,
}

structure AssociateUsersRequest {
    @required
    @xmlName("FunctionName")
    @ec2QueryName("FunctionName")
    FunctionName: FunctionNameOfAssociateUsersRequest,
    @required
    @xmlName("Users")
    @ec2QueryName("Users")
    Users: ListOfRequestUsers,
}

structure AssociateUsersResultWrapper {
    @xmlName("AssociateUsersResult")
    @ec2QueryName("AssociateUsersResult")
    AssociateUsersResult: AssociateUsersResult,
    @xmlName("ResponseMetadata")
    @ec2QueryName("ResponseMetadata")
    ResponseMetadata: ResponseMetadata,
}

structure AssociateUsersResult {
    @xmlName("Users")
    @ec2QueryName("Users")
    Users: ListOfUsers,
}

list ListOfUsers {
    @xmlName("member")
    member: Users,
}

structure Users {
    @xmlName("UserId")
    @ec2QueryName("UserId")
    UserId: String,
}

@enum([
  {
      name: "LB",
      value: "LB",
  },
])
string FunctionNameOfDissociateUsersRequest

structure DissociateUsersRequest {
    @required
    @xmlName("FunctionName")
    @ec2QueryName("FunctionName")
    FunctionName: FunctionNameOfDissociateUsersRequest,
    @required
    @xmlName("Users")
    @ec2QueryName("Users")
    Users: ListOfRequestUsers,
}

structure DissociateUsersResultWrapper {
    @xmlName("DissociateUsersResult")
    @ec2QueryName("DissociateUsersResult")
    DissociateUsersResult: DissociateUsersResult,
    @xmlName("ResponseMetadata")
    @ec2QueryName("ResponseMetadata")
    ResponseMetadata: ResponseMetadata,
}

structure DissociateUsersResult {
    @xmlName("Users")
    @ec2QueryName("Users")
    Users: ListOfUsers,
}

@enum([
  {
      name: "LB",
      value: "LB",
  },
])
string FunctionNameOfDescribeAssociatedUsersRequest

structure DescribeAssociatedUsersRequest {
    @required
    @xmlName("FunctionName")
    @ec2QueryName("FunctionName")
    FunctionName: FunctionNameOfDescribeAssociatedUsersRequest,
}

structure DescribeAssociatedUsersResultWrapper {
    @xmlName("DescribeAssociatedUsersResult")
    @ec2QueryName("DescribeAssociatedUsersResult")
    DescribeAssociatedUsersResult: DescribeAssociatedUsersResult,
    @xmlName("ResponseMetadata")
    @ec2QueryName("ResponseMetadata")
    ResponseMetadata: ResponseMetadata,
}

structure DescribeAssociatedUsersResult {
    @xmlName("Users")
    @ec2QueryName("Users")
    Users: ListOfUsers,
}

list ListOfRequestListenersMember {
    @xmlName("member")
    member: RequestListeners,
}

list ListOfRequestAvailabilityZonesMember {
    @xmlName("member")
    member: String,
}

list ListOfRequestInstancesMember {
    @xmlName("member")
    member: RequestInstances,
}

list ListOfRequestInstancesOfDescribeInstanceHealthMember {
    @xmlName("member")
    member: RequestInstancesOfDescribeInstanceHealth,
}

list ListOfRequestLoadBalancerNamesMember {
    @xmlName("member")
    member: RequestLoadBalancerNames,
}

list ListOfRequestListenersOfRegisterPortWithLoadBalancerMember {
    @xmlName("member")
    member: RequestListenersOfRegisterPortWithLoadBalancer,
}

list ListOfRequestIPAddressesMember {
    @xmlName("member")
    member: RequestIPAddresses,
}

list ListOfRequestExpectationMember {
    @xmlName("member")
    member: RequestExpectation,
}

list ListOfRequestListenersOfNiftyCreateElasticLoadBalancerMember {
    @xmlName("member")
    member: RequestListenersOfNiftyCreateElasticLoadBalancer,
}

list ListOfRequestInstancesOfNiftyCreateElasticLoadBalancerMember {
    @xmlName("member")
    member: RequestInstancesOfNiftyCreateElasticLoadBalancer,
}

list ListOfRequestInstancesOfNiftyDeregisterInstancesFromElasticLoadBalancerMember {
    @xmlName("member")
    member: RequestInstancesOfNiftyDeregisterInstancesFromElasticLoadBalancer,
}

list ListOfRequestInstancesOfNiftyDescribeInstanceElasticLoadBalancerHealthMember {
    @xmlName("member")
    member: RequestInstancesOfNiftyDescribeInstanceElasticLoadBalancerHealth,
}

list ListOfRequestAdditionalAttributesMember {
    @xmlName("member")
    member: RequestAdditionalAttributes,
}

list ListOfRequestInstancesOfNiftyRegisterInstancesWithElasticLoadBalancerMember {
    @xmlName("member")
    member: RequestInstancesOfNiftyRegisterInstancesWithElasticLoadBalancer,
}

list ListOfRequestListenersOfNiftyRegisterPortWithElasticLoadBalancerMember {
    @xmlName("member")
    member: RequestListenersOfNiftyRegisterPortWithElasticLoadBalancer,
}

list ListOfRequestUsersMember {
    @xmlName("member")
    member: RequestUsers,
}

@ec2Query
@xmlNamespace(uri: "https://computing.api.nifcloud.com/api/")
@service(
    sdkId: "computing",
    arnNamespace: "computing",
    endpointPrefix: "computing"
)
service Computing {
    version: "3.0",
    operations: [
        DescribeInstanceAttribute,
        DescribeInstances,
        ModifyInstanceAttribute,
        RebootInstances,
        RunInstances,
        StartInstances,
        StopInstances,
        TerminateInstances,
        CopyInstances,
        CancelCopyInstances,
        ImportInstanceOperation,
        NiftyCreateInstanceSnapshot,
        NiftyModifyInstanceSnapshotAttribute,
        NiftyDescribeInstanceSnapshots,
        NiftyDeleteInstanceSnapshot,
        NiftyRestoreInstanceSnapshot,
        NiftyRetryImportInstance,
        NiftyUpdateInstanceNetworkInterfaces,
        AttachVolume,
        CreateVolume,
        DeleteVolume,
        DescribeVolumes,
        DetachVolume,
        ModifyVolumeAttribute,
        ExtendVolumeSize,
        CreateKeyPair,
        DeleteKeyPair,
        DescribeKeyPairs,
        NiftyModifyKeyPairAttribute,
        ImportKeyPair,
        DescribeImages,
        CreateImageOperation,
        DeleteImage,
        ModifyImageAttribute,
        NiftyAssociateImage,
        AttachIsoImage,
        DeleteIsoImage,
        DescribeIsoImages,
        DetachIsoImage,
        UploadIsoImage,
        ConfigureHealthCheck,
        CreateLoadBalancer,
        DeleteLoadBalancer,
        DeregisterInstancesFromLoadBalancer,
        DescribeInstanceHealth,
        DescribeLoadBalancers,
        RegisterInstancesWithLoadBalancer,
        RegisterPortWithLoadBalancer,
        SetFilterForLoadBalancer,
        UpdateLoadBalancer,
        UpdateLoadBalancerOption,
        SetLoadBalancerListenerSSLCertificate,
        UnsetLoadBalancerListenerSSLCertificate,
        ClearLoadBalancerSession,
        NiftySetLoadBalancerSSLPoliciesOfListener,
        NiftyUnsetLoadBalancerSSLPoliciesOfListener,
        NiftyDescribeLoadBalancerSSLPolicies,
        NiftyConfigureElasticLoadBalancerHealthCheck,
        NiftyCreateElasticLoadBalancer,
        NiftyDeleteElasticLoadBalancer,
        NiftyDeregisterInstancesFromElasticLoadBalancer,
        NiftyDescribeInstanceElasticLoadBalancerHealth,
        NiftyDescribeElasticLoadBalancers,
        NiftyModifyElasticLoadBalancerAttributes,
        NiftyRegisterInstancesWithElasticLoadBalancer,
        NiftyRegisterPortWithElasticLoadBalancer,
        NiftyUpdateElasticLoadBalancer,
        NiftyReplaceElasticLoadBalancerLatestVersion,
        NiftyReplaceElasticLoadBalancerListenerSSLCertificate,
        NiftyAssociateRouteTableWithElasticLoadBalancer,
        NiftyReplaceRouteTableAssociationWithElasticLoadBalancer,
        NiftyDisassociateRouteTableFromElasticLoadBalancer,
        AuthorizeSecurityGroupIngress,
        CreateSecurityGroup,
        DeleteSecurityGroup,
        DeregisterInstancesFromSecurityGroup,
        DescribeSecurityActivities,
        DescribeSecurityGroups,
        RegisterInstancesWithSecurityGroup,
        RevokeSecurityGroupIngress,
        UpdateSecurityGroup,
        NiftyRegisterRoutersWithSecurityGroup,
        NiftyDeregisterRoutersFromSecurityGroup,
        NiftyRegisterVpnGatewaysWithSecurityGroup,
        NiftyDeregisterVpnGatewaysFromSecurityGroup,
        CreateSslCertificate,
        DeleteSslCertificate,
        DescribeSslCertificates,
        DescribeSslCertificateAttribute,
        DownloadSslCertificate,
        ModifySslCertificateAttribute,
        RegisterCorporateInfoForCertificate,
        UploadSslCertificate,
        NiftyDescribeCorporateInfoForCertificate,
        DescribeResources,
        DescribeServiceStatus,
        DescribeUsage,
        DescribeUserActivities,
        DescribeUploads,
        CancelUpload,
        AllocateAddress,
        AssociateAddress,
        NiftyModifyAddressAttribute,
        DescribeAddresses,
        DisassociateAddress,
        ReleaseAddress,
        AssociateMultiIpAddressGroup,
        CreateMultiIpAddressGroup,
        DeleteMultiIpAddressGroup,
        DescribeMultiIpAddressGroups,
        DisassociateMultiIpAddressGroup,
        IncreaseMultiIpAddressCount,
        ModifyMultiIpAddressGroupAttribute,
        ReleaseMultiIpAddresses,
        CreateNetworkInterface,
        DescribeNetworkInterfaces,
        AttachNetworkInterface,
        DetachNetworkInterface,
        DeleteNetworkInterface,
        ModifyNetworkInterfaceAttribute,
        NiftyCreateAutoScalingGroup,
        NiftyDescribeAutoScalingGroups,
        NiftyDescribeScalingActivities,
        NiftyUpdateAutoScalingGroup,
        NiftyDeleteAutoScalingGroup,
        NiftyCreateAlarm,
        NiftyDescribeAlarms,
        NiftyUpdateAlarm,
        NiftyDeleteAlarm,
        NiftyDescribeAlarmsPartitions,
        NiftyDescribePerformanceChart,
        NiftyDescribeAlarmHistory,
        NiftyDescribeAlarmRulesActivities,
        NiftyCreatePrivateLan,
        NiftyDeletePrivateLan,
        NiftyDescribePrivateLans,
        NiftyModifyPrivateLanAttribute,
        NiftyCreateRouter,
        NiftyDeleteRouter,
        NiftyDescribeRouters,
        NiftyRebootRouters,
        NiftyModifyRouterAttribute,
        NiftyUpdateRouterNetworkInterfaces,
        NiftyReplaceRouterLatestVersion,
        NiftyRestoreRouterPreviousVersion,
        NiftyReleaseRouterBackupState,
        CreateRouteTable,
        DeleteRouteTable,
        DescribeRouteTables,
        AssociateRouteTable,
        DisassociateRouteTable,
        ReplaceRouteTableAssociation,
        CreateRoute,
        DeleteRoute,
        ReplaceRoute,
        NiftyCreateNatTable,
        NiftyDeleteNatTable,
        NiftyDescribeNatTables,
        NiftyAssociateNatTable,
        NiftyDisassociateNatTable,
        NiftyReplaceNatTableAssociation,
        NiftyCreateNatRule,
        NiftyDeleteNatRule,
        NiftyReplaceNatRule,
        NiftyEnableDhcp,
        NiftyDisableDhcp,
        CreateDhcpOptions,
        DeleteDhcpOptions,
        DescribeDhcpOptions,
        NiftyReplaceDhcpOption,
        NiftyReplaceDhcpConfig,
        NiftyDescribeDhcpStatus,
        NiftyCreateDhcpConfig,
        NiftyDeleteDhcpConfig,
        NiftyDescribeDhcpConfigs,
        NiftyCreateDhcpStaticMapping,
        NiftyDeleteDhcpStaticMapping,
        NiftyCreateDhcpIpAddressPool,
        NiftyDeleteDhcpIpAddressPool,
        NiftyCreateWebProxy,
        NiftyDeleteWebProxy,
        NiftyDescribeWebProxies,
        NiftyModifyWebProxyAttribute,
        CreateVpnGateway,
        DeleteVpnGateway,
        DescribeVpnGateways,
        NiftyDescribeVpnGatewayActivities,
        NiftyModifyVpnGatewayAttribute,
        NiftyRebootVpnGateways,
        NiftyAssociateRouteTableWithVpnGateway,
        NiftyDisassociateRouteTableFromVpnGateway,
        NiftyReplaceRouteTableAssociationWithVpnGateway,
        NiftyReplaceVpnGatewayLatestVersion,
        NiftyRestoreVpnGatewayPreviousVersion,
        NiftyReleaseVpnGatewayBackupState,
        NiftyUpdateVpnGatewayNetworkInterfaces,
        CreateCustomerGateway,
        DeleteCustomerGateway,
        DescribeCustomerGateways,
        NiftyModifyCustomerGatewayAttribute,
        CreateVpnConnection,
        DeleteVpnConnection,
        DescribeVpnConnections,
        NiftyCreateSeparateInstanceRule,
        NiftyDeleteSeparateInstanceRule,
        NiftyDeregisterInstancesFromSeparateInstanceRule,
        NiftyDescribeSeparateInstanceRules,
        NiftyRegisterInstancesWithSeparateInstanceRule,
        NiftyUpdateSeparateInstanceRule,
        CopyFromBackupInstance,
        CreateBackupInstances,
        CreateInstanceBackupRule,
        DeleteInstanceBackupRule,
        DescribeInstanceBackupRuleActivities,
        DescribeInstanceBackupRules,
        ModifyInstanceBackupRuleAttribute,
        RefreshInstanceBackupRule,
        DescribeAvailabilityZones,
        DescribeRegions,
        AssociateUsers,
        DissociateUsers,
        DescribeAssociatedUsers,
    ],
}


operation DescribeInstanceAttribute {
    input: DescribeInstanceAttributeRequest,
    output: DescribeInstanceAttributeResult,
}

@waitable(
    InstanceExists: {
        acceptors: [
            {
                state: "success",
                matcher: {
                    output: {
                         path: "length(ReservationSet[]) > `0`",
                         comparator: "booleanEquals",
                         expected: "true",
                    },
                },
            },
            {
                state: "retry",
                matcher: {
                    errorType: "Client.InvalidParameterNotFound.Instance",
                },
            },
        ],
        minDelay: 20,
    },
    InstanceRunning: {
        acceptors: [
            {
                state: "success",
                matcher: {
                    output: {
                         path: "ReservationSet[].InstancesSet[].InstanceState.Name",
                         comparator: "allStringEquals",
                         expected: "running",
                    },
                },
            },
            {
                state: "retry",
                matcher: {
                    errorType: "Client.InvalidParameterNotFound.Instance",
                },
            },
        ],
        minDelay: 20,
    },
    InstanceStopped: {
        acceptors: [
            {
                state: "success",
                matcher: {
                    output: {
                         path: "ReservationSet[].InstancesSet[].InstanceState.Name",
                         comparator: "allStringEquals",
                         expected: "stopped",
                    },
                },
            },
        ],
        minDelay: 20,
    },
    InstanceWarning: {
        acceptors: [
            {
                state: "success",
                matcher: {
                    output: {
                         path: "ReservationSet[].InstancesSet[].InstanceState.Name",
                         comparator: "allStringEquals",
                         expected: "warning",
                    },
                },
            },
        ],
        minDelay: 20,
    },
    InstanceSuspending: {
        acceptors: [
            {
                state: "success",
                matcher: {
                    output: {
                         path: "ReservationSet[].InstancesSet[].InstanceState.Name",
                         comparator: "allStringEquals",
                         expected: "suspending",
                    },
                },
            },
        ],
        minDelay: 20,
    },
    InstanceImportError: {
        acceptors: [
            {
                state: "success",
                matcher: {
                    output: {
                         path: "ReservationSet[].InstancesSet[].InstanceState.Name",
                         comparator: "allStringEquals",
                         expected: "import_error",
                    },
                },
            },
        ],
        minDelay: 20,
    },
    InstanceDeleted: {
        acceptors: [
            {
                state: "success",
                matcher: {
                    errorType: "Client.InvalidParameterNotFound.Instance",
                },
            },
            {
                state: "retry",
                matcher: {
                    output: {
                         path: "length(ReservationSet[]) > `0`",
                         comparator: "booleanEquals",
                         expected: "true",
                    },
                },
            },
        ],
        minDelay: 20,
    },
)
operation DescribeInstances {
    input: DescribeInstancesRequest,
    output: DescribeInstancesResult,
}

operation ModifyInstanceAttribute {
    input: ModifyInstanceAttributeRequest,
    output: ModifyInstanceAttributeResult,
}

operation RebootInstances {
    input: RebootInstancesRequest,
    output: RebootInstancesResult,
}

operation RunInstances {
    input: RunInstancesRequest,
    output: RunInstancesResult,
}

operation StartInstances {
    input: StartInstancesRequest,
    output: StartInstancesResult,
}

operation StopInstances {
    input: StopInstancesRequest,
    output: StopInstancesResult,
}

operation TerminateInstances {
    input: TerminateInstancesRequest,
    output: TerminateInstancesResult,
}

operation CopyInstances {
    input: CopyInstancesRequest,
    output: CopyInstancesResult,
}

operation CancelCopyInstances {
    input: CancelCopyInstancesRequest,
    output: CancelCopyInstancesResult,
}

operation ImportInstanceOperation {
    input: ImportInstanceRequest,
    output: ImportInstanceResult,
}

operation NiftyCreateInstanceSnapshot {
    input: NiftyCreateInstanceSnapshotRequest,
    output: NiftyCreateInstanceSnapshotResult,
}

operation NiftyModifyInstanceSnapshotAttribute {
    input: NiftyModifyInstanceSnapshotAttributeRequest,
    output: NiftyModifyInstanceSnapshotAttributeResult,
}

@waitable(
    SnapshotExists: {
        acceptors: [
            {
                state: "success",
                matcher: {
                    output: {
                         path: "length(SnapshotInfoSet[]) > `0`",
                         comparator: "booleanEquals",
                         expected: "true",
                    },
                },
            },
            {
                state: "retry",
                matcher: {
                    errorType: "Client.InvalidParameterNotFound.Snapshot",
                },
            },
        ],
        minDelay: 20,
    },
    SnapshotNormal: {
        acceptors: [
            {
                state: "success",
                matcher: {
                    output: {
                         path: "SnapshotInfoSet[].Status",
                         comparator: "allStringEquals",
                         expected: "normal",
                    },
                },
            },
        ],
        minDelay: 20,
    },
    SnapshotDeleted: {
        acceptors: [
            {
                state: "success",
                matcher: {
                    errorType: "Client.InvalidParameterNotFound.Snapshot",
                },
            },
            {
                state: "retry",
                matcher: {
                    output: {
                         path: "length(SnapshotInfoSet[]) > `0`",
                         comparator: "booleanEquals",
                         expected: "true",
                    },
                },
            },
        ],
        minDelay: 20,
    },
)
operation NiftyDescribeInstanceSnapshots {
    input: NiftyDescribeInstanceSnapshotsRequest,
    output: NiftyDescribeInstanceSnapshotsResult,
}

operation NiftyDeleteInstanceSnapshot {
    input: NiftyDeleteInstanceSnapshotRequest,
    output: NiftyDeleteInstanceSnapshotResult,
}

operation NiftyRestoreInstanceSnapshot {
    input: NiftyRestoreInstanceSnapshotRequest,
    output: NiftyRestoreInstanceSnapshotResult,
}

operation NiftyRetryImportInstance {
    input: NiftyRetryImportInstanceRequest,
    output: NiftyRetryImportInstanceResult,
}

operation NiftyUpdateInstanceNetworkInterfaces {
    input: NiftyUpdateInstanceNetworkInterfacesRequest,
    output: NiftyUpdateInstanceNetworkInterfacesResult,
}

operation AttachVolume {
    input: AttachVolumeRequest,
    output: AttachVolumeResult,
}

operation CreateVolume {
    input: CreateVolumeRequest,
    output: CreateVolumeResult,
}

operation DeleteVolume {
    input: DeleteVolumeRequest,
    output: DeleteVolumeResult,
}

@waitable(
    VolumeExists: {
        acceptors: [
            {
                state: "success",
                matcher: {
                    output: {
                         path: "length(VolumeSet[]) > `0`",
                         comparator: "booleanEquals",
                         expected: "true",
                    },
                },
            },
            {
                state: "retry",
                matcher: {
                    errorType: "Client.InvalidParameterNotFound.Volume",
                },
            },
        ],
        minDelay: 20,
    },
    VolumeAvailable: {
        acceptors: [
            {
                state: "success",
                matcher: {
                    output: {
                         path: "VolumeSet[].Status",
                         comparator: "allStringEquals",
                         expected: "available",
                    },
                },
            },
        ],
        minDelay: 20,
    },
    VolumeInUse: {
        acceptors: [
            {
                state: "success",
                matcher: {
                    output: {
                         path: "VolumeSet[].Status",
                         comparator: "allStringEquals",
                         expected: "in-use",
                    },
                },
            },
        ],
        minDelay: 20,
    },
    VolumeDeleted: {
        acceptors: [
            {
                state: "success",
                matcher: {
                    errorType: "Client.InvalidParameterNotFound.Volume",
                },
            },
            {
                state: "retry",
                matcher: {
                    output: {
                         path: "length(VolumeSet[]) > `0`",
                         comparator: "booleanEquals",
                         expected: "true",
                    },
                },
            },
        ],
        minDelay: 20,
    },
    VolumeAttached: {
        acceptors: [
            {
                state: "success",
                matcher: {
                    output: {
                         path: "VolumeSet[].AttachmentSet[].Status",
                         comparator: "allStringEquals",
                         expected: "attached",
                    },
                },
            },
        ],
        minDelay: 20,
    },
)
operation DescribeVolumes {
    input: DescribeVolumesRequest,
    output: DescribeVolumesResult,
}

operation DetachVolume {
    input: DetachVolumeRequest,
    output: DetachVolumeResult,
}

operation ModifyVolumeAttribute {
    input: ModifyVolumeAttributeRequest,
    output: ModifyVolumeAttributeResult,
}

operation ExtendVolumeSize {
    input: ExtendVolumeSizeRequest,
    output: ExtendVolumeSizeResult,
}

operation CreateKeyPair {
    input: CreateKeyPairRequest,
    output: CreateKeyPairResult,
}

operation DeleteKeyPair {
    input: DeleteKeyPairRequest,
    output: DeleteKeyPairResult,
}

operation DescribeKeyPairs {
    input: DescribeKeyPairsRequest,
    output: DescribeKeyPairsResult,
}

operation NiftyModifyKeyPairAttribute {
    input: NiftyModifyKeyPairAttributeRequest,
    output: NiftyModifyKeyPairAttributeResult,
}

operation ImportKeyPair {
    input: ImportKeyPairRequest,
    output: ImportKeyPairResult,
}

operation DescribeImages {
    input: DescribeImagesRequest,
    output: DescribeImagesResult,
}

operation CreateImageOperation {
    input: CreateImageRequest,
    output: CreateImageResult,
}

operation DeleteImage {
    input: DeleteImageRequest,
    output: DeleteImageResult,
}

operation ModifyImageAttribute {
    input: ModifyImageAttributeRequest,
    output: ModifyImageAttributeResult,
}

operation NiftyAssociateImage {
    input: NiftyAssociateImageRequest,
    output: NiftyAssociateImageResult,
}

operation AttachIsoImage {
    input: AttachIsoImageRequest,
    output: AttachIsoImageResult,
}

operation DeleteIsoImage {
    input: DeleteIsoImageRequest,
    output: DeleteIsoImageResult,
}

operation DescribeIsoImages {
    input: DescribeIsoImagesRequest,
    output: DescribeIsoImagesResult,
}

operation DetachIsoImage {
    input: DetachIsoImageRequest,
    output: DetachIsoImageResult,
}

operation UploadIsoImage {
    input: UploadIsoImageRequest,
    output: UploadIsoImageResult,
}

operation ConfigureHealthCheck {
    input: ConfigureHealthCheckRequest,
    output: ConfigureHealthCheckResultWrapper,
}

operation CreateLoadBalancer {
    input: CreateLoadBalancerRequest,
    output: CreateLoadBalancerResultWrapper,
}

operation DeleteLoadBalancer {
    input: DeleteLoadBalancerRequest,
    output: DeleteLoadBalancerResultWrapper,
}

operation DeregisterInstancesFromLoadBalancer {
    input: DeregisterInstancesFromLoadBalancerRequest,
    output: DeregisterInstancesFromLoadBalancerResultWrapper,
}

operation DescribeInstanceHealth {
    input: DescribeInstanceHealthRequest,
    output: DescribeInstanceHealthResultWrapper,
}

@waitable(
    LoadBalancerExists: {
        acceptors: [
            {
                state: "success",
                matcher: {
                    output: {
                         path: "length(DescribeLoadBalancersResult.LoadBalancerDescriptions[]) > `0`",
                         comparator: "booleanEquals",
                         expected: "true",
                    },
                },
            },
            {
                state: "retry",
                matcher: {
                    errorType: "Client.InvalidParameterNotFound.LoadBalancer",
                },
            },
        ],
        minDelay: 20,
    },
    LoadBalancerInService: {
        acceptors: [
            {
                state: "success",
                matcher: {
                    output: {
                         path: "DescribeLoadBalancersResult.LoadBalancerDescriptions[].HealthCheck.InstanceStates[].State",
                         comparator: "allStringEquals",
                         expected: "InService",
                    },
                },
            },
        ],
        minDelay: 20,
    },
    LoadBalancerDeleted: {
        acceptors: [
            {
                state: "success",
                matcher: {
                    errorType: "Client.InvalidParameterNotFound.LoadBalancer",
                },
            },
            {
                state: "retry",
                matcher: {
                    output: {
                         path: "length(DescribeLoadBalancersResult.LoadBalancerDescriptions[]) > `0`",
                         comparator: "booleanEquals",
                         expected: "true",
                    },
                },
            },
        ],
        minDelay: 20,
    },
)
operation DescribeLoadBalancers {
    input: DescribeLoadBalancersRequest,
    output: DescribeLoadBalancersResultWrapper,
}

operation RegisterInstancesWithLoadBalancer {
    input: RegisterInstancesWithLoadBalancerRequest,
    output: RegisterInstancesWithLoadBalancerResultWrapper,
}

operation RegisterPortWithLoadBalancer {
    input: RegisterPortWithLoadBalancerRequest,
    output: RegisterPortWithLoadBalancerResultWrapper,
}

operation SetFilterForLoadBalancer {
    input: SetFilterForLoadBalancerRequest,
    output: SetFilterForLoadBalancerResultWrapper,
}

operation UpdateLoadBalancer {
    input: UpdateLoadBalancerRequest,
    output: UpdateLoadBalancerResult,
}

operation UpdateLoadBalancerOption {
    input: UpdateLoadBalancerOptionRequest,
    output: UpdateLoadBalancerOptionResult,
}

operation SetLoadBalancerListenerSSLCertificate {
    input: SetLoadBalancerListenerSSLCertificateRequest,
    output: SetLoadBalancerListenerSSLCertificateResultWrapper,
}

operation UnsetLoadBalancerListenerSSLCertificate {
    input: UnsetLoadBalancerListenerSSLCertificateRequest,
    output: UnsetLoadBalancerListenerSSLCertificateResultWrapper,
}

operation ClearLoadBalancerSession {
    input: ClearLoadBalancerSessionRequest,
    output: ClearLoadBalancerSessionResultWrapper,
}

operation NiftySetLoadBalancerSSLPoliciesOfListener {
    input: NiftySetLoadBalancerSSLPoliciesOfListenerRequest,
    output: NiftySetLoadBalancerSSLPoliciesOfListenerResult,
}

operation NiftyUnsetLoadBalancerSSLPoliciesOfListener {
    input: NiftyUnsetLoadBalancerSSLPoliciesOfListenerRequest,
    output: NiftyUnsetLoadBalancerSSLPoliciesOfListenerResult,
}

operation NiftyDescribeLoadBalancerSSLPolicies {
    input: NiftyDescribeLoadBalancerSSLPoliciesRequest,
    output: NiftyDescribeLoadBalancerSSLPoliciesResultWrapper,
}

operation NiftyConfigureElasticLoadBalancerHealthCheck {
    input: NiftyConfigureElasticLoadBalancerHealthCheckRequest,
    output: NiftyConfigureElasticLoadBalancerHealthCheckResultWrapper,
}

operation NiftyCreateElasticLoadBalancer {
    input: NiftyCreateElasticLoadBalancerRequest,
    output: NiftyCreateElasticLoadBalancerResultWrapper,
}

operation NiftyDeleteElasticLoadBalancer {
    input: NiftyDeleteElasticLoadBalancerRequest,
    output: NiftyDeleteElasticLoadBalancerResultWrapper,
}

operation NiftyDeregisterInstancesFromElasticLoadBalancer {
    input: NiftyDeregisterInstancesFromElasticLoadBalancerRequest,
    output: NiftyDeregisterInstancesFromElasticLoadBalancerResultWrapper,
}

operation NiftyDescribeInstanceElasticLoadBalancerHealth {
    input: NiftyDescribeInstanceElasticLoadBalancerHealthRequest,
    output: NiftyDescribeInstanceElasticLoadBalancerHealthResultWrapper,
}

@waitable(
    ElasticLoadBalancerExists: {
        acceptors: [
            {
                state: "success",
                matcher: {
                    output: {
                         path: "length(NiftyDescribeElasticLoadBalancersResult.ElasticLoadBalancerDescriptions[]) > `0`",
                         comparator: "booleanEquals",
                         expected: "true",
                    },
                },
            },
            {
                state: "retry",
                matcher: {
                    errorType: "Client.InvalidParameterNotFound.ElasticLoadBalancer",
                },
            },
        ],
        minDelay: 20,
    },
    ElasticLoadBalancerAvailable: {
        acceptors: [
            {
                state: "success",
                matcher: {
                    output: {
                         path: "NiftyDescribeElasticLoadBalancersResult.ElasticLoadBalancerDescriptions[].State",
                         comparator: "allStringEquals",
                         expected: "available",
                    },
                },
            },
        ],
        minDelay: 20,
    },
    ElasticLoadBalancerDeleted: {
        acceptors: [
            {
                state: "success",
                matcher: {
                    errorType: "Client.InvalidParameterNotFound.ElasticLoadBalancer",
                },
            },
            {
                state: "success",
                matcher: {
                    errorType: "Client.InvalidParameterNotFound.Protocol.or.ElasticLoadBalancerPort",
                },
            },
            {
                state: "success",
                matcher: {
                    errorType: "Client.InvalidParameterNotFound.ElasticLoadBalancerPort",
                },
            },
            {
                state: "retry",
                matcher: {
                    output: {
                         path: "length(NiftyDescribeElasticLoadBalancersResult.ElasticLoadBalancerDescriptions[]) > `0`",
                         comparator: "booleanEquals",
                         expected: "true",
                    },
                },
            },
        ],
        minDelay: 20,
    },
)
operation NiftyDescribeElasticLoadBalancers {
    input: NiftyDescribeElasticLoadBalancersRequest,
    output: NiftyDescribeElasticLoadBalancersResultWrapper,
}

operation NiftyModifyElasticLoadBalancerAttributes {
    input: NiftyModifyElasticLoadBalancerAttributesRequest,
    output: NiftyModifyElasticLoadBalancerAttributesResult,
}

operation NiftyRegisterInstancesWithElasticLoadBalancer {
    input: NiftyRegisterInstancesWithElasticLoadBalancerRequest,
    output: NiftyRegisterInstancesWithElasticLoadBalancerResultWrapper,
}

operation NiftyRegisterPortWithElasticLoadBalancer {
    input: NiftyRegisterPortWithElasticLoadBalancerRequest,
    output: NiftyRegisterPortWithElasticLoadBalancerResultWrapper,
}

operation NiftyUpdateElasticLoadBalancer {
    input: NiftyUpdateElasticLoadBalancerRequest,
    output: NiftyUpdateElasticLoadBalancerResult,
}

operation NiftyReplaceElasticLoadBalancerLatestVersion {
    input: NiftyReplaceElasticLoadBalancerLatestVersionRequest,
    output: NiftyReplaceElasticLoadBalancerLatestVersionResultWrapper,
}

operation NiftyReplaceElasticLoadBalancerListenerSSLCertificate {
    input: NiftyReplaceElasticLoadBalancerListenerSSLCertificateRequest,
    output: NiftyReplaceElasticLoadBalancerListenerSSLCertificateResultWrapper,
}

operation NiftyAssociateRouteTableWithElasticLoadBalancer {
    input: NiftyAssociateRouteTableWithElasticLoadBalancerRequest,
    output: NiftyAssociateRouteTableWithElasticLoadBalancerResult,
}

operation NiftyReplaceRouteTableAssociationWithElasticLoadBalancer {
    input: NiftyReplaceRouteTableAssociationWithElasticLoadBalancerRequest,
    output: NiftyReplaceRouteTableAssociationWithElasticLoadBalancerResult,
}

operation NiftyDisassociateRouteTableFromElasticLoadBalancer {
    input: NiftyDisassociateRouteTableFromElasticLoadBalancerRequest,
    output: NiftyDisassociateRouteTableFromElasticLoadBalancerResult,
}

operation AuthorizeSecurityGroupIngress {
    input: AuthorizeSecurityGroupIngressRequest,
    output: AuthorizeSecurityGroupIngressResult,
}

operation CreateSecurityGroup {
    input: CreateSecurityGroupRequest,
    output: CreateSecurityGroupResult,
}

operation DeleteSecurityGroup {
    input: DeleteSecurityGroupRequest,
    output: DeleteSecurityGroupResult,
}

operation DeregisterInstancesFromSecurityGroup {
    input: DeregisterInstancesFromSecurityGroupRequest,
    output: DeregisterInstancesFromSecurityGroupResult,
}

operation DescribeSecurityActivities {
    input: DescribeSecurityActivitiesRequest,
    output: DescribeSecurityActivitiesResult,
}

@waitable(
    SecurityGroupExists: {
        acceptors: [
            {
                state: "success",
                matcher: {
                    output: {
                         path: "length(SecurityGroupInfo[]) > `0`",
                         comparator: "booleanEquals",
                         expected: "true",
                    },
                },
            },
            {
                state: "retry",
                matcher: {
                    errorType: "Client.InvalidParameterNotFound.SecurityGroup",
                },
            },
        ],
        minDelay: 20,
    },
    SecurityGroupApplied: {
        acceptors: [
            {
                state: "success",
                matcher: {
                    output: {
                         path: "SecurityGroupInfo[].GroupStatus",
                         comparator: "allStringEquals",
                         expected: "applied",
                    },
                },
            },
        ],
        minDelay: 20,
    },
    SecurityGroupDeleted: {
        acceptors: [
            {
                state: "success",
                matcher: {
                    output: {
                         path: "length(SecurityGroupInfo[]) < `1`",
                         comparator: "booleanEquals",
                         expected: "true",
                    },
                },
            },
            {
                state: "retry",
                matcher: {
                    output: {
                         path: "length(SecurityGroupInfo[]) > `0`",
                         comparator: "booleanEquals",
                         expected: "true",
                    },
                },
            },
        ],
        minDelay: 20,
    },
)
operation DescribeSecurityGroups {
    input: DescribeSecurityGroupsRequest,
    output: DescribeSecurityGroupsResult,
}

operation RegisterInstancesWithSecurityGroup {
    input: RegisterInstancesWithSecurityGroupRequest,
    output: RegisterInstancesWithSecurityGroupResult,
}

operation RevokeSecurityGroupIngress {
    input: RevokeSecurityGroupIngressRequest,
    output: RevokeSecurityGroupIngressResult,
}

operation UpdateSecurityGroup {
    input: UpdateSecurityGroupRequest,
    output: UpdateSecurityGroupResult,
}

operation NiftyRegisterRoutersWithSecurityGroup {
    input: NiftyRegisterRoutersWithSecurityGroupRequest,
    output: NiftyRegisterRoutersWithSecurityGroupResult,
}

operation NiftyDeregisterRoutersFromSecurityGroup {
    input: NiftyDeregisterRoutersFromSecurityGroupRequest,
    output: NiftyDeregisterRoutersFromSecurityGroupResult,
}

operation NiftyRegisterVpnGatewaysWithSecurityGroup {
    input: NiftyRegisterVpnGatewaysWithSecurityGroupRequest,
    output: NiftyRegisterVpnGatewaysWithSecurityGroupResult,
}

operation NiftyDeregisterVpnGatewaysFromSecurityGroup {
    input: NiftyDeregisterVpnGatewaysFromSecurityGroupRequest,
    output: NiftyDeregisterVpnGatewaysFromSecurityGroupResult,
}

operation CreateSslCertificate {
    input: CreateSslCertificateRequest,
    output: CreateSslCertificateResult,
}

operation DeleteSslCertificate {
    input: DeleteSslCertificateRequest,
    output: DeleteSslCertificateResult,
}

operation DescribeSslCertificates {
    input: DescribeSslCertificatesRequest,
    output: DescribeSslCertificatesResult,
}

operation DescribeSslCertificateAttribute {
    input: DescribeSslCertificateAttributeRequest,
    output: DescribeSslCertificateAttributeResult,
}

operation DownloadSslCertificate {
    input: DownloadSslCertificateRequest,
    output: DownloadSslCertificateResult,
}

operation ModifySslCertificateAttribute {
    input: ModifySslCertificateAttributeRequest,
    output: ModifySslCertificateAttributeResult,
}

operation RegisterCorporateInfoForCertificate {
    input: RegisterCorporateInfoForCertificateRequest,
    output: RegisterCorporateInfoForCertificateResult,
}

operation UploadSslCertificate {
    input: UploadSslCertificateRequest,
    output: UploadSslCertificateResult,
}

operation NiftyDescribeCorporateInfoForCertificate {
    input: NiftyDescribeCorporateInfoForCertificateRequest,
    output: NiftyDescribeCorporateInfoForCertificateResult,
}

operation DescribeResources {
    input: DescribeResourcesRequest,
    output: DescribeResourcesResult,
}

operation DescribeServiceStatus {
    input: DescribeServiceStatusRequest,
    output: DescribeServiceStatusResult,
}

operation DescribeUsage {
    input: DescribeUsageRequest,
    output: DescribeUsageResult,
}

operation DescribeUserActivities {
    input: DescribeUserActivitiesRequest,
    output: DescribeUserActivitiesResult,
}

operation DescribeUploads {
    input: DescribeUploadsRequest,
    output: DescribeUploadsResult,
}

operation CancelUpload {
    input: CancelUploadRequest,
    output: CancelUploadResult,
}

operation AllocateAddress {
    input: AllocateAddressRequest,
    output: AllocateAddressResult,
}

operation AssociateAddress {
    input: AssociateAddressRequest,
    output: AssociateAddressResult,
}

operation NiftyModifyAddressAttribute {
    input: NiftyModifyAddressAttributeRequest,
    output: NiftyModifyAddressAttributeResult,
}

operation DescribeAddresses {
    input: DescribeAddressesRequest,
    output: DescribeAddressesResult,
}

operation DisassociateAddress {
    input: DisassociateAddressRequest,
    output: DisassociateAddressResult,
}

operation ReleaseAddress {
    input: ReleaseAddressRequest,
    output: ReleaseAddressResult,
}

operation AssociateMultiIpAddressGroup {
    input: AssociateMultiIpAddressGroupRequest,
    output: AssociateMultiIpAddressGroupResult,
}

operation CreateMultiIpAddressGroup {
    input: CreateMultiIpAddressGroupRequest,
    output: CreateMultiIpAddressGroupResult,
}

operation DeleteMultiIpAddressGroup {
    input: DeleteMultiIpAddressGroupRequest,
    output: DeleteMultiIpAddressGroupResult,
}

operation DescribeMultiIpAddressGroups {
    input: DescribeMultiIpAddressGroupsRequest,
    output: DescribeMultiIpAddressGroupsResult,
}

operation DisassociateMultiIpAddressGroup {
    input: DisassociateMultiIpAddressGroupRequest,
    output: DisassociateMultiIpAddressGroupResult,
}

operation IncreaseMultiIpAddressCount {
    input: IncreaseMultiIpAddressCountRequest,
    output: IncreaseMultiIpAddressCountResult,
}

operation ModifyMultiIpAddressGroupAttribute {
    input: ModifyMultiIpAddressGroupAttributeRequest,
    output: ModifyMultiIpAddressGroupAttributeResult,
}

operation ReleaseMultiIpAddresses {
    input: ReleaseMultiIpAddressesRequest,
    output: ReleaseMultiIpAddressesResult,
}

operation CreateNetworkInterface {
    input: CreateNetworkInterfaceRequest,
    output: CreateNetworkInterfaceResult,
}

operation DescribeNetworkInterfaces {
    input: DescribeNetworkInterfacesRequest,
    output: DescribeNetworkInterfacesResult,
}

operation AttachNetworkInterface {
    input: AttachNetworkInterfaceRequest,
    output: AttachNetworkInterfaceResult,
}

operation DetachNetworkInterface {
    input: DetachNetworkInterfaceRequest,
    output: DetachNetworkInterfaceResult,
}

operation DeleteNetworkInterface {
    input: DeleteNetworkInterfaceRequest,
    output: DeleteNetworkInterfaceResult,
}

operation ModifyNetworkInterfaceAttribute {
    input: ModifyNetworkInterfaceAttributeRequest,
    output: ModifyNetworkInterfaceAttributeResult,
}

operation NiftyCreateAutoScalingGroup {
    input: NiftyCreateAutoScalingGroupRequest,
    output: NiftyCreateAutoScalingGroupResult,
}

operation NiftyDescribeAutoScalingGroups {
    input: NiftyDescribeAutoScalingGroupsRequest,
    output: NiftyDescribeAutoScalingGroupsResult,
}

operation NiftyDescribeScalingActivities {
    input: NiftyDescribeScalingActivitiesRequest,
    output: NiftyDescribeScalingActivitiesResult,
}

operation NiftyUpdateAutoScalingGroup {
    input: NiftyUpdateAutoScalingGroupRequest,
    output: NiftyUpdateAutoScalingGroupResult,
}

operation NiftyDeleteAutoScalingGroup {
    input: NiftyDeleteAutoScalingGroupRequest,
    output: NiftyDeleteAutoScalingGroupResult,
}

operation NiftyCreateAlarm {
    input: NiftyCreateAlarmRequest,
    output: NiftyCreateAlarmResult,
}

operation NiftyDescribeAlarms {
    input: NiftyDescribeAlarmsRequest,
    output: NiftyDescribeAlarmsResult,
}

operation NiftyUpdateAlarm {
    input: NiftyUpdateAlarmRequest,
    output: NiftyUpdateAlarmResult,
}

operation NiftyDeleteAlarm {
    input: NiftyDeleteAlarmRequest,
    output: NiftyDeleteAlarmResult,
}

operation NiftyDescribeAlarmsPartitions {
    input: NiftyDescribeAlarmsPartitionsRequest,
    output: NiftyDescribeAlarmsPartitionsResult,
}

operation NiftyDescribePerformanceChart {
    input: NiftyDescribePerformanceChartRequest,
    output: NiftyDescribePerformanceChartResult,
}

operation NiftyDescribeAlarmHistory {
    input: NiftyDescribeAlarmHistoryRequest,
    output: NiftyDescribeAlarmHistoryResult,
}

operation NiftyDescribeAlarmRulesActivities {
    input: NiftyDescribeAlarmRulesActivitiesRequest,
    output: NiftyDescribeAlarmRulesActivitiesResult,
}

operation NiftyCreatePrivateLan {
    input: NiftyCreatePrivateLanRequest,
    output: NiftyCreatePrivateLanResult,
}

operation NiftyDeletePrivateLan {
    input: NiftyDeletePrivateLanRequest,
    output: NiftyDeletePrivateLanResult,
}

@waitable(
    PrivateLanExists: {
        acceptors: [
            {
                state: "success",
                matcher: {
                    output: {
                         path: "length(PrivateLanSet[]) > `0`",
                         comparator: "booleanEquals",
                         expected: "true",
                    },
                },
            },
            {
                state: "retry",
                matcher: {
                    errorType: "Client.InvalidParameterNotFound.PrivateLanName",
                },
            },
        ],
        minDelay: 20,
    },
    PrivateLanAvailable: {
        acceptors: [
            {
                state: "success",
                matcher: {
                    output: {
                         path: "PrivateLanSet[].State",
                         comparator: "allStringEquals",
                         expected: "available",
                    },
                },
            },
        ],
        minDelay: 20,
    },
    PrivateLanDeleted: {
        acceptors: [
            {
                state: "success",
                matcher: {
                    errorType: "Client.InvalidParameterNotFound.PrivateLanName",
                },
            },
            {
                state: "retry",
                matcher: {
                    output: {
                         path: "length(PrivateLanSet[]) > `0`",
                         comparator: "booleanEquals",
                         expected: "true",
                    },
                },
            },
        ],
        minDelay: 20,
    },
)
operation NiftyDescribePrivateLans {
    input: NiftyDescribePrivateLansRequest,
    output: NiftyDescribePrivateLansResult,
}

operation NiftyModifyPrivateLanAttribute {
    input: NiftyModifyPrivateLanAttributeRequest,
    output: NiftyModifyPrivateLanAttributeResult,
}

operation NiftyCreateRouter {
    input: NiftyCreateRouterRequest,
    output: NiftyCreateRouterResult,
}

operation NiftyDeleteRouter {
    input: NiftyDeleteRouterRequest,
    output: NiftyDeleteRouterResult,
}

@waitable(
    RouterExists: {
        acceptors: [
            {
                state: "success",
                matcher: {
                    output: {
                         path: "length(RouterSet[]) > `0`",
                         comparator: "booleanEquals",
                         expected: "true",
                    },
                },
            },
            {
                state: "retry",
                matcher: {
                    errorType: "Client.InvalidParameterNotFound.RouterId",
                },
            },
            {
                state: "retry",
                matcher: {
                    errorType: "Client.InvalidParameterNotFound.RouterName",
                },
            },
        ],
        minDelay: 20,
    },
    RouterAvailable: {
        acceptors: [
            {
                state: "success",
                matcher: {
                    output: {
                         path: "RouterSet[].State",
                         comparator: "allStringEquals",
                         expected: "available",
                    },
                },
            },
        ],
        minDelay: 20,
    },
    RouterStopped: {
        acceptors: [
            {
                state: "success",
                matcher: {
                    output: {
                         path: "RouterSet[].State",
                         comparator: "allStringEquals",
                         expected: "stopped",
                    },
                },
            },
        ],
        minDelay: 20,
    },
    RouterWarning: {
        acceptors: [
            {
                state: "success",
                matcher: {
                    output: {
                         path: "RouterSet[].State",
                         comparator: "allStringEquals",
                         expected: "warning",
                    },
                },
            },
        ],
        minDelay: 20,
    },
    RouterDeleted: {
        acceptors: [
            {
                state: "success",
                matcher: {
                    errorType: "Client.InvalidParameterNotFound.RouterId",
                },
            },
            {
                state: "success",
                matcher: {
                    errorType: "Client.InvalidParameterNotFound.RouterName",
                },
            },
            {
                state: "retry",
                matcher: {
                    output: {
                         path: "length(RouterSet[]) > `0`",
                         comparator: "booleanEquals",
                         expected: "true",
                    },
                },
            },
        ],
        minDelay: 20,
    },
)
operation NiftyDescribeRouters {
    input: NiftyDescribeRoutersRequest,
    output: NiftyDescribeRoutersResult,
}

operation NiftyRebootRouters {
    input: NiftyRebootRoutersRequest,
    output: NiftyRebootRoutersResult,
}

operation NiftyModifyRouterAttribute {
    input: NiftyModifyRouterAttributeRequest,
    output: NiftyModifyRouterAttributeResult,
}

operation NiftyUpdateRouterNetworkInterfaces {
    input: NiftyUpdateRouterNetworkInterfacesRequest,
    output: NiftyUpdateRouterNetworkInterfacesResult,
}

operation NiftyReplaceRouterLatestVersion {
    input: NiftyReplaceRouterLatestVersionRequest,
    output: NiftyReplaceRouterLatestVersionResult,
}

operation NiftyRestoreRouterPreviousVersion {
    input: NiftyRestoreRouterPreviousVersionRequest,
    output: NiftyRestoreRouterPreviousVersionResult,
}

operation NiftyReleaseRouterBackupState {
    input: NiftyReleaseRouterBackupStateRequest,
    output: NiftyReleaseRouterBackupStateResult,
}

operation CreateRouteTable {
    input: CreateRouteTableRequest,
    output: CreateRouteTableResult,
}

operation DeleteRouteTable {
    input: DeleteRouteTableRequest,
    output: DeleteRouteTableResult,
}

operation DescribeRouteTables {
    input: DescribeRouteTablesRequest,
    output: DescribeRouteTablesResult,
}

operation AssociateRouteTable {
    input: AssociateRouteTableRequest,
    output: AssociateRouteTableResult,
}

operation DisassociateRouteTable {
    input: DisassociateRouteTableRequest,
    output: DisassociateRouteTableResult,
}

operation ReplaceRouteTableAssociation {
    input: ReplaceRouteTableAssociationRequest,
    output: ReplaceRouteTableAssociationResult,
}

operation CreateRoute {
    input: CreateRouteRequest,
    output: CreateRouteResult,
}

operation DeleteRoute {
    input: DeleteRouteRequest,
    output: DeleteRouteResult,
}

operation ReplaceRoute {
    input: ReplaceRouteRequest,
    output: ReplaceRouteResult,
}

operation NiftyCreateNatTable {
    input: NiftyCreateNatTableRequest,
    output: NiftyCreateNatTableResult,
}

operation NiftyDeleteNatTable {
    input: NiftyDeleteNatTableRequest,
    output: NiftyDeleteNatTableResult,
}

operation NiftyDescribeNatTables {
    input: NiftyDescribeNatTablesRequest,
    output: NiftyDescribeNatTablesResult,
}

operation NiftyAssociateNatTable {
    input: NiftyAssociateNatTableRequest,
    output: NiftyAssociateNatTableResult,
}

operation NiftyDisassociateNatTable {
    input: NiftyDisassociateNatTableRequest,
    output: NiftyDisassociateNatTableResult,
}

operation NiftyReplaceNatTableAssociation {
    input: NiftyReplaceNatTableAssociationRequest,
    output: NiftyReplaceNatTableAssociationResult,
}

operation NiftyCreateNatRule {
    input: NiftyCreateNatRuleRequest,
    output: NiftyCreateNatRuleResult,
}

operation NiftyDeleteNatRule {
    input: NiftyDeleteNatRuleRequest,
    output: NiftyDeleteNatRuleResult,
}

operation NiftyReplaceNatRule {
    input: NiftyReplaceNatRuleRequest,
    output: NiftyReplaceNatRuleResult,
}

operation NiftyEnableDhcp {
    input: NiftyEnableDhcpRequest,
    output: NiftyEnableDhcpResult,
}

operation NiftyDisableDhcp {
    input: NiftyDisableDhcpRequest,
    output: NiftyDisableDhcpResult,
}

operation CreateDhcpOptions {
    input: CreateDhcpOptionsRequest,
    output: CreateDhcpOptionsResult,
}

operation DeleteDhcpOptions {
    input: DeleteDhcpOptionsRequest,
    output: DeleteDhcpOptionsResult,
}

operation DescribeDhcpOptions {
    input: DescribeDhcpOptionsRequest,
    output: DescribeDhcpOptionsResult,
}

operation NiftyReplaceDhcpOption {
    input: NiftyReplaceDhcpOptionRequest,
    output: NiftyReplaceDhcpOptionResult,
}

operation NiftyReplaceDhcpConfig {
    input: NiftyReplaceDhcpConfigRequest,
    output: NiftyReplaceDhcpConfigResult,
}

operation NiftyDescribeDhcpStatus {
    input: NiftyDescribeDhcpStatusRequest,
    output: NiftyDescribeDhcpStatusResult,
}

operation NiftyCreateDhcpConfig {
    input: NiftyCreateDhcpConfigRequest,
    output: NiftyCreateDhcpConfigResult,
}

operation NiftyDeleteDhcpConfig {
    input: NiftyDeleteDhcpConfigRequest,
    output: NiftyDeleteDhcpConfigResult,
}

operation NiftyDescribeDhcpConfigs {
    input: NiftyDescribeDhcpConfigsRequest,
    output: NiftyDescribeDhcpConfigsResult,
}

operation NiftyCreateDhcpStaticMapping {
    input: NiftyCreateDhcpStaticMappingRequest,
    output: NiftyCreateDhcpStaticMappingResult,
}

operation NiftyDeleteDhcpStaticMapping {
    input: NiftyDeleteDhcpStaticMappingRequest,
    output: NiftyDeleteDhcpStaticMappingResult,
}

operation NiftyCreateDhcpIpAddressPool {
    input: NiftyCreateDhcpIpAddressPoolRequest,
    output: NiftyCreateDhcpIpAddressPoolResult,
}

operation NiftyDeleteDhcpIpAddressPool {
    input: NiftyDeleteDhcpIpAddressPoolRequest,
    output: NiftyDeleteDhcpIpAddressPoolResult,
}

operation NiftyCreateWebProxy {
    input: NiftyCreateWebProxyRequest,
    output: NiftyCreateWebProxyResult,
}

operation NiftyDeleteWebProxy {
    input: NiftyDeleteWebProxyRequest,
    output: NiftyDeleteWebProxyResult,
}

operation NiftyDescribeWebProxies {
    input: NiftyDescribeWebProxiesRequest,
    output: NiftyDescribeWebProxiesResult,
}

operation NiftyModifyWebProxyAttribute {
    input: NiftyModifyWebProxyAttributeRequest,
    output: NiftyModifyWebProxyAttributeResult,
}

operation CreateVpnGateway {
    input: CreateVpnGatewayRequest,
    output: CreateVpnGatewayResult,
}

operation DeleteVpnGateway {
    input: DeleteVpnGatewayRequest,
    output: DeleteVpnGatewayResult,
}

@waitable(
    VpnGatewayExists: {
        acceptors: [
            {
                state: "success",
                matcher: {
                    output: {
                         path: "length(VpnGatewaySet[]) > `0`",
                         comparator: "booleanEquals",
                         expected: "true",
                    },
                },
            },
            {
                state: "retry",
                matcher: {
                    errorType: "Client.InvalidParameterNotFound.VpnGatewayName",
                },
            },
            {
                state: "retry",
                matcher: {
                    errorType: "Client.InvalidParameterNotFound.VpnGatewayId",
                },
            },
        ],
        minDelay: 20,
    },
    VpnGatewayAvailable: {
        acceptors: [
            {
                state: "success",
                matcher: {
                    output: {
                         path: "VpnGatewaySet[].State",
                         comparator: "allStringEquals",
                         expected: "available",
                    },
                },
            },
        ],
        minDelay: 20,
    },
    VpnGatewayStopped: {
        acceptors: [
            {
                state: "success",
                matcher: {
                    output: {
                         path: "VpnGatewaySet[].State",
                         comparator: "allStringEquals",
                         expected: "stopped",
                    },
                },
            },
        ],
        minDelay: 20,
    },
    VpnGatewayWarning: {
        acceptors: [
            {
                state: "success",
                matcher: {
                    output: {
                         path: "VpnGatewaySet[].State",
                         comparator: "allStringEquals",
                         expected: "warning",
                    },
                },
            },
        ],
        minDelay: 20,
    },
    VpnGatewayDeleted: {
        acceptors: [
            {
                state: "success",
                matcher: {
                    errorType: "Client.InvalidParameterNotFound.VpnGatewayName",
                },
            },
            {
                state: "success",
                matcher: {
                    errorType: "Client.InvalidParameterNotFound.VpnGatewayId",
                },
            },
            {
                state: "retry",
                matcher: {
                    output: {
                         path: "length(VpnGatewaySet[]) > `0`",
                         comparator: "booleanEquals",
                         expected: "true",
                    },
                },
            },
        ],
        minDelay: 20,
    },
)
operation DescribeVpnGateways {
    input: DescribeVpnGatewaysRequest,
    output: DescribeVpnGatewaysResult,
}

operation NiftyDescribeVpnGatewayActivities {
    input: NiftyDescribeVpnGatewayActivitiesRequest,
    output: NiftyDescribeVpnGatewayActivitiesResult,
}

operation NiftyModifyVpnGatewayAttribute {
    input: NiftyModifyVpnGatewayAttributeRequest,
    output: NiftyModifyVpnGatewayAttributeResult,
}

operation NiftyRebootVpnGateways {
    input: NiftyRebootVpnGatewaysRequest,
    output: NiftyRebootVpnGatewaysResult,
}

operation NiftyAssociateRouteTableWithVpnGateway {
    input: NiftyAssociateRouteTableWithVpnGatewayRequest,
    output: NiftyAssociateRouteTableWithVpnGatewayResult,
}

operation NiftyDisassociateRouteTableFromVpnGateway {
    input: NiftyDisassociateRouteTableFromVpnGatewayRequest,
    output: NiftyDisassociateRouteTableFromVpnGatewayResult,
}

operation NiftyReplaceRouteTableAssociationWithVpnGateway {
    input: NiftyReplaceRouteTableAssociationWithVpnGatewayRequest,
    output: NiftyReplaceRouteTableAssociationWithVpnGatewayResult,
}

operation NiftyReplaceVpnGatewayLatestVersion {
    input: NiftyReplaceVpnGatewayLatestVersionRequest,
    output: NiftyReplaceVpnGatewayLatestVersionResult,
}

operation NiftyRestoreVpnGatewayPreviousVersion {
    input: NiftyRestoreVpnGatewayPreviousVersionRequest,
    output: NiftyRestoreVpnGatewayPreviousVersionResult,
}

operation NiftyReleaseVpnGatewayBackupState {
    input: NiftyReleaseVpnGatewayBackupStateRequest,
    output: NiftyReleaseVpnGatewayBackupStateResult,
}

operation NiftyUpdateVpnGatewayNetworkInterfaces {
    input: NiftyUpdateVpnGatewayNetworkInterfacesRequest,
    output: NiftyUpdateVpnGatewayNetworkInterfacesResult,
}

operation CreateCustomerGateway {
    input: CreateCustomerGatewayRequest,
    output: CreateCustomerGatewayResult,
}

operation DeleteCustomerGateway {
    input: DeleteCustomerGatewayRequest,
    output: DeleteCustomerGatewayResult,
}

@waitable(
    CustomerGatewayExists: {
        acceptors: [
            {
                state: "success",
                matcher: {
                    output: {
                         path: "length(CustomerGatewaySet[]) > `0`",
                         comparator: "booleanEquals",
                         expected: "true",
                    },
                },
            },
            {
                state: "retry",
                matcher: {
                    errorType: "Client.InvalidParameterNotFound.CustomerGatewayName",
                },
            },
            {
                state: "retry",
                matcher: {
                    errorType: "Client.InvalidParameterNotFound.CustomerGatewayId",
                },
            },
        ],
        minDelay: 20,
    },
    CustomerGatewayAvailable: {
        acceptors: [
            {
                state: "success",
                matcher: {
                    output: {
                         path: "CustomerGatewaySet[].State",
                         comparator: "allStringEquals",
                         expected: "available",
                    },
                },
            },
        ],
        minDelay: 20,
    },
    CustomerGatewayStopped: {
        acceptors: [
            {
                state: "success",
                matcher: {
                    output: {
                         path: "CustomerGatewaySet[].State",
                         comparator: "allStringEquals",
                         expected: "stopped",
                    },
                },
            },
        ],
        minDelay: 20,
    },
    CustomerGatewayWarning: {
        acceptors: [
            {
                state: "success",
                matcher: {
                    output: {
                         path: "CustomerGatewaySet[].State",
                         comparator: "allStringEquals",
                         expected: "warning",
                    },
                },
            },
        ],
        minDelay: 20,
    },
    CustomerGatewayDeleted: {
        acceptors: [
            {
                state: "success",
                matcher: {
                    errorType: "Client.InvalidParameterNotFound.CustomerGatewayName",
                },
            },
            {
                state: "success",
                matcher: {
                    errorType: "Client.InvalidParameterNotFound.CustomerGatewayId",
                },
            },
            {
                state: "retry",
                matcher: {
                    output: {
                         path: "length(CustomerGatewaySet[]) > `0`",
                         comparator: "booleanEquals",
                         expected: "true",
                    },
                },
            },
        ],
        minDelay: 20,
    },
)
operation DescribeCustomerGateways {
    input: DescribeCustomerGatewaysRequest,
    output: DescribeCustomerGatewaysResult,
}

operation NiftyModifyCustomerGatewayAttribute {
    input: NiftyModifyCustomerGatewayAttributeRequest,
    output: NiftyModifyCustomerGatewayAttributeResult,
}

operation CreateVpnConnection {
    input: CreateVpnConnectionRequest,
    output: CreateVpnConnectionResult,
}

operation DeleteVpnConnection {
    input: DeleteVpnConnectionRequest,
    output: DeleteVpnConnectionResult,
}

@waitable(
    VpnConnectionExists: {
        acceptors: [
            {
                state: "success",
                matcher: {
                    output: {
                         path: "length(VpnConnectionSet[]) > `0`",
                         comparator: "booleanEquals",
                         expected: "true",
                    },
                },
            },
            {
                state: "retry",
                matcher: {
                    errorType: "Client.InvalidParameterNotFound.VpnConnectionId",
                },
            },
        ],
        minDelay: 20,
    },
    VpnConnectionAvailable: {
        acceptors: [
            {
                state: "success",
                matcher: {
                    output: {
                         path: "VpnConnectionSet[].State",
                         comparator: "allStringEquals",
                         expected: "available",
                    },
                },
            },
        ],
        minDelay: 20,
    },
    VpnConnectionDeleted: {
        acceptors: [
            {
                state: "success",
                matcher: {
                    errorType: "Client.InvalidParameterNotFound.VpnConnectionId",
                },
            },
            {
                state: "retry",
                matcher: {
                    output: {
                         path: "length(VpnConnectionSet[]) > `0`",
                         comparator: "booleanEquals",
                         expected: "true",
                    },
                },
            },
        ],
        minDelay: 20,
    },
)
operation DescribeVpnConnections {
    input: DescribeVpnConnectionsRequest,
    output: DescribeVpnConnectionsResult,
}

operation NiftyCreateSeparateInstanceRule {
    input: NiftyCreateSeparateInstanceRuleRequest,
    output: NiftyCreateSeparateInstanceRuleResult,
}

operation NiftyDeleteSeparateInstanceRule {
    input: NiftyDeleteSeparateInstanceRuleRequest,
    output: NiftyDeleteSeparateInstanceRuleResult,
}

operation NiftyDeregisterInstancesFromSeparateInstanceRule {
    input: NiftyDeregisterInstancesFromSeparateInstanceRuleRequest,
    output: NiftyDeregisterInstancesFromSeparateInstanceRuleResult,
}

operation NiftyDescribeSeparateInstanceRules {
    input: NiftyDescribeSeparateInstanceRulesRequest,
    output: NiftyDescribeSeparateInstanceRulesResult,
}

operation NiftyRegisterInstancesWithSeparateInstanceRule {
    input: NiftyRegisterInstancesWithSeparateInstanceRuleRequest,
    output: NiftyRegisterInstancesWithSeparateInstanceRuleResult,
}

operation NiftyUpdateSeparateInstanceRule {
    input: NiftyUpdateSeparateInstanceRuleRequest,
    output: NiftyUpdateSeparateInstanceRuleResult,
}

operation CopyFromBackupInstance {
    input: CopyFromBackupInstanceRequest,
    output: CopyFromBackupInstanceResult,
}

operation CreateBackupInstances {
    input: CreateBackupInstancesRequest,
    output: CreateBackupInstancesResult,
}

operation CreateInstanceBackupRule {
    input: CreateInstanceBackupRuleRequest,
    output: CreateInstanceBackupRuleResult,
}

operation DeleteInstanceBackupRule {
    input: DeleteInstanceBackupRuleRequest,
    output: DeleteInstanceBackupRuleResult,
}

operation DescribeInstanceBackupRuleActivities {
    input: DescribeInstanceBackupRuleActivitiesRequest,
    output: DescribeInstanceBackupRuleActivitiesResult,
}

operation DescribeInstanceBackupRules {
    input: DescribeInstanceBackupRulesRequest,
    output: DescribeInstanceBackupRulesResult,
}

operation ModifyInstanceBackupRuleAttribute {
    input: ModifyInstanceBackupRuleAttributeRequest,
    output: ModifyInstanceBackupRuleAttributeResult,
}

operation RefreshInstanceBackupRule {
    input: RefreshInstanceBackupRuleRequest,
    output: RefreshInstanceBackupRuleResult,
}

operation DescribeAvailabilityZones {
    input: DescribeAvailabilityZonesRequest,
    output: DescribeAvailabilityZonesResult,
}

operation DescribeRegions {
    input: DescribeRegionsRequest,
    output: DescribeRegionsResult,
}

operation AssociateUsers {
    input: AssociateUsersRequest,
    output: AssociateUsersResultWrapper,
}

operation DissociateUsers {
    input: DissociateUsersRequest,
    output: DissociateUsersResultWrapper,
}

operation DescribeAssociatedUsers {
    input: DescribeAssociatedUsersRequest,
    output: DescribeAssociatedUsersResultWrapper,
}
