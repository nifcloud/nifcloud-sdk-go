namespace com.nifcloud.api.nas

use aws.auth#sigv4
use aws.api#service
use aws.protocols#restJson1
use aws.protocols#restXml
use aws.protocols#awsQuery
use aws.protocols#ec2Query
use smithy.waiters#waitable
use aws.protocols#ec2QueryName


list ListOfRequestNASSecurityGroups {
    @xmlName("member")
    member: String,
}

@enum([
  {
      name: "NFS",
      value: "nfs",
  },
  {
      name: "CIFS",
      value: "cifs",
  },
])
string ProtocolOfCreateNASInstanceRequest

structure CreateNASInstanceRequest {
    @required
    @xmlName("AllocatedStorage")
    AllocatedStorage: Integer,
    @xmlName("AvailabilityZone")
    AvailabilityZone: String,
    @xmlName("MasterPrivateAddress")
    MasterPrivateAddress: String,
    @xmlName("MasterUsername")
    MasterUsername: String,
    @xmlName("MasterUserPassword")
    MasterUserPassword: String,
    @xmlName("NASInstanceDescription")
    NASInstanceDescription: String,
    @required
    @xmlName("NASInstanceIdentifier")
    NASInstanceIdentifier: String,
    @xmlName("NASInstanceType")
    NASInstanceType: Integer,
    @xmlName("NASSecurityGroups")
    NASSecurityGroups: ListOfRequestNASSecurityGroups,
    @xmlName("NetworkId")
    NetworkId: String,
    @required
    @xmlName("Protocol")
    Protocol: ProtocolOfCreateNASInstanceRequest,
}

structure CreateNASInstanceResult {
    @xmlName("NASInstance")
    NASInstance: NASInstance,
    @xmlName("ResponseMetadata")
    ResponseMetadata: ResponseMetadata,
}

structure NASInstance {
    @xmlName("AllocatedStorage")
    AllocatedStorage: Integer,
    @xmlName("AuthenticationType")
    AuthenticationType: Integer,
    @xmlName("AvailabilityZone")
    AvailabilityZone: String,
    @xmlName("Endpoint")
    Endpoint: Endpoint,
    @xmlName("MasterUsername")
    MasterUsername: String,
    @xmlName("NASInstanceClass")
    NASInstanceClass: String,
    @xmlName("NASInstanceDescription")
    NASInstanceDescription: String,
    @xmlName("NASInstanceErrorInfo")
    NASInstanceErrorInfo: NASInstanceErrorInfo,
    @xmlName("NASInstanceIdentifier")
    NASInstanceIdentifier: String,
    @xmlName("NASInstanceStatus")
    NASInstanceStatus: String,
    @xmlName("NASInstanceType")
    NASInstanceType: Integer,
    @xmlName("NASSecurityGroups")
    NASSecurityGroups: ListOfNASSecurityGroups,
    @xmlName("NetworkId")
    NetworkId: String,
    @xmlName("NoRootSquash")
    NoRootSquash: Boolean,
    @xmlName("Protocol")
    Protocol: String,
    @xmlName("StorageType")
    StorageType: Integer,
    @xmlName("UpgradeRequired")
    UpgradeRequired: Boolean,
}

structure ResponseMetadata {
    @xmlName("RequestId")
    RequestId: String,
}

structure NASInstanceErrorInfo {
    @xmlName("NASInstanceErrorCode")
    NASInstanceErrorCode: String,
    @xmlName("NASInstanceErrorMessage")
    NASInstanceErrorMessage: String,
}

list ListOfNASSecurityGroups {
    @xmlName("NASSecurityGroup")
    member: NASSecurityGroups,
}

structure NASSecurityGroups {
    @xmlName("NASSecurityGroupName")
    NASSecurityGroupName: String,
    @xmlName("Status")
    Status: String,
}

structure Endpoint {
    @xmlName("Address")
    Address: String,
    @xmlName("PrivateAddress")
    PrivateAddress: String,
}

structure DeleteNASInstanceRequest {
    @required
    @xmlName("NASInstanceIdentifier")
    NASInstanceIdentifier: String,
}

structure DeleteNASInstanceResult {
    @xmlName("NASInstance")
    NASInstance: NASInstance,
    @xmlName("ResponseMetadata")
    ResponseMetadata: ResponseMetadata,
}

structure DescribeNASInstancesRequest {
    @xmlName("NASInstanceIdentifier")
    NASInstanceIdentifier: String,
}

structure DescribeNASInstancesResult {
    @xmlName("NASInstances")
    NASInstances: ListOfNASInstances,
    @xmlName("ResponseMetadata")
    ResponseMetadata: ResponseMetadata,
}

list ListOfNASInstances {
    @xmlName("NASInstance")
    member: NASInstances,
}

structure NASInstances {
    @xmlName("AllocatedStorage")
    AllocatedStorage: Integer,
    @xmlName("AuthenticationType")
    AuthenticationType: Integer,
    @xmlName("AvailabilityZone")
    AvailabilityZone: String,
    @xmlName("Endpoint")
    Endpoint: Endpoint,
    @xmlName("MasterUsername")
    MasterUsername: String,
    @xmlName("NASInstanceClass")
    NASInstanceClass: String,
    @xmlName("NASInstanceDescription")
    NASInstanceDescription: String,
    @xmlName("NASInstanceErrorInfo")
    NASInstanceErrorInfo: NASInstanceErrorInfo,
    @xmlName("NASInstanceIdentifier")
    NASInstanceIdentifier: String,
    @xmlName("NASInstanceStatus")
    NASInstanceStatus: String,
    @xmlName("NASInstanceType")
    NASInstanceType: Integer,
    @xmlName("NASSecurityGroups")
    NASSecurityGroups: ListOfNASSecurityGroups,
    @xmlName("NetworkId")
    NetworkId: String,
    @xmlName("NoRootSquash")
    NoRootSquash: Boolean,
    @xmlName("Protocol")
    Protocol: String,
    @xmlName("StorageType")
    StorageType: Integer,
    @xmlName("UpgradeRequired")
    UpgradeRequired: Boolean,
}

structure ModifyNASInstanceRequest {
    @xmlName("AllocatedStorage")
    AllocatedStorage: Integer,
    @xmlName("AuthenticationType")
    AuthenticationType: Integer,
    @xmlName("MasterPrivateAddress")
    MasterPrivateAddress: String,
    @xmlName("MasterUserPassword")
    MasterUserPassword: String,
    @xmlName("NASInstanceDescription")
    NASInstanceDescription: String,
    @required
    @xmlName("NASInstanceIdentifier")
    NASInstanceIdentifier: String,
    @xmlName("NASSecurityGroups")
    NASSecurityGroups: ListOfRequestNASSecurityGroups,
    @xmlName("NetworkId")
    NetworkId: String,
    @xmlName("NewNASInstanceIdentifier")
    NewNASInstanceIdentifier: String,
    @xmlName("NoRootSquash")
    NoRootSquash: Boolean,
}

structure ModifyNASInstanceResult {
    @xmlName("NASInstance")
    NASInstance: NASInstance,
    @xmlName("ResponseMetadata")
    ResponseMetadata: ResponseMetadata,
}

@enum([
  {
      name: "NORMAL",
      value: "0",
  },
  {
      name: "FORCE",
      value: "1",
  },
])
string SessionClearTypeOfClearNASSessionRequest

structure ClearNASSessionRequest {
    @required
    @xmlName("NASInstanceIdentifier")
    NASInstanceIdentifier: String,
    @xmlName("SessionClearType")
    SessionClearType: SessionClearTypeOfClearNASSessionRequest,
}

structure ClearNASSessionResult {
    @xmlName("NASInstance")
    NASInstance: NASInstance,
    @xmlName("ResponseMetadata")
    ResponseMetadata: ResponseMetadata,
}

structure UpgradeNASInstanceRequest {
    @required
    @xmlName("NASInstanceIdentifier")
    NASInstanceIdentifier: String,
}

structure UpgradeNASInstanceResult {
    @xmlName("NASInstance")
    NASInstance: NASInstance,
    @xmlName("ResponseMetadata")
    ResponseMetadata: ResponseMetadata,
}

structure CreateNASSecurityGroupRequest {
    @required
    @xmlName("AvailabilityZone")
    AvailabilityZone: String,
    @xmlName("NASSecurityGroupDescription")
    NASSecurityGroupDescription: String,
    @required
    @xmlName("NASSecurityGroupName")
    NASSecurityGroupName: String,
}

structure CreateNASSecurityGroupResult {
    @xmlName("NASSecurityGroup")
    NASSecurityGroup: NASSecurityGroup,
    @xmlName("ResponseMetadata")
    ResponseMetadata: ResponseMetadata,
}

structure NASSecurityGroup {
    @xmlName("AvailabilityZone")
    AvailabilityZone: String,
    @xmlName("IPRanges")
    IPRanges: ListOfIPRanges,
    @xmlName("NASSecurityGroupDescription")
    NASSecurityGroupDescription: String,
    @xmlName("NASSecurityGroupName")
    NASSecurityGroupName: String,
    @xmlName("OwnerId")
    OwnerId: String,
    @xmlName("SecurityGroups")
    SecurityGroups: ListOfSecurityGroups,
}

list ListOfSecurityGroups {
    @xmlName("SecurityGroup")
    member: SecurityGroups,
}

structure SecurityGroups {
    @xmlName("SecurityGroupName")
    SecurityGroupName: String,
    @xmlName("SecurityGroupOwnerId")
    SecurityGroupOwnerId: String,
    @xmlName("Status")
    Status: String,
}

list ListOfIPRanges {
    @xmlName("IPRange")
    member: IPRanges,
}

structure IPRanges {
    @xmlName("CIDRIP")
    CIDRIP: String,
    @xmlName("Status")
    Status: String,
}

structure AuthorizeNASSecurityGroupIngressRequest {
    @xmlName("CIDRIP")
    CIDRIP: String,
    @required
    @xmlName("NASSecurityGroupName")
    NASSecurityGroupName: String,
    @xmlName("SecurityGroupName")
    SecurityGroupName: String,
}

structure AuthorizeNASSecurityGroupIngressResult {
    @xmlName("NASSecurityGroup")
    NASSecurityGroup: NASSecurityGroup,
    @xmlName("ResponseMetadata")
    ResponseMetadata: ResponseMetadata,
}

structure DeleteNASSecurityGroupRequest {
    @required
    @xmlName("NASSecurityGroupName")
    NASSecurityGroupName: String,
}

structure DeleteNASSecurityGroupResult {
    @xmlName("ResponseMetadata")
    ResponseMetadata: ResponseMetadata,
}

structure DescribeNASSecurityGroupsRequest {
    @xmlName("NASSecurityGroupName")
    NASSecurityGroupName: String,
}

structure DescribeNASSecurityGroupsResult {
    @xmlName("NASSecurityGroups")
    NASSecurityGroups: ListOfNASSecurityGroupsOfDescribeNASSecurityGroups,
    @xmlName("ResponseMetadata")
    ResponseMetadata: ResponseMetadata,
}

list ListOfNASSecurityGroupsOfDescribeNASSecurityGroups {
    @xmlName("NASSecurityGroup")
    member: NASSecurityGroupsOfDescribeNASSecurityGroups,
}

structure NASSecurityGroupsOfDescribeNASSecurityGroups {
    @xmlName("AvailabilityZone")
    AvailabilityZone: String,
    @xmlName("IPRanges")
    IPRanges: ListOfIPRanges,
    @xmlName("NASSecurityGroupDescription")
    NASSecurityGroupDescription: String,
    @xmlName("NASSecurityGroupName")
    NASSecurityGroupName: String,
    @xmlName("OwnerId")
    OwnerId: String,
    @xmlName("SecurityGroups")
    SecurityGroups: ListOfSecurityGroups,
}

structure ModifyNASSecurityGroupRequest {
    @xmlName("NASSecurityGroupDescription")
    NASSecurityGroupDescription: String,
    @required
    @xmlName("NASSecurityGroupName")
    NASSecurityGroupName: String,
    @xmlName("NewNASSecurityGroupName")
    NewNASSecurityGroupName: String,
}

structure ModifyNASSecurityGroupResult {
    @xmlName("NASSecurityGroup")
    NASSecurityGroup: NASSecurityGroup,
    @xmlName("ResponseMetadata")
    ResponseMetadata: ResponseMetadata,
}

structure RevokeNASSecurityGroupIngressRequest {
    @xmlName("CIDRIP")
    CIDRIP: String,
    @required
    @xmlName("NASSecurityGroupName")
    NASSecurityGroupName: String,
    @xmlName("SecurityGroupName")
    SecurityGroupName: String,
}

structure RevokeNASSecurityGroupIngressResult {
    @xmlName("NASSecurityGroup")
    NASSecurityGroup: NASSecurityGroup,
    @xmlName("ResponseMetadata")
    ResponseMetadata: ResponseMetadata,
}

structure RequestDimensions {
    @required
    @xmlName("Name")
    Name: String,
    @required
    @xmlName("Value")
    Value: String,
}

list ListOfRequestDimensions {
    @xmlName("member")
    member: RequestDimensions,
}

@enum([
  {
      name: "FREE_STORAGE_SPACE",
      value: "FreeStorageSpace",
  },
  {
      name: "USED_STORAGE_SPACE",
      value: "UsedStorageSpace",
  },
  {
      name: "READ_IOPS",
      value: "ReadIOPS",
  },
  {
      name: "WRITE_IOPS",
      value: "WriteIOPS",
  },
  {
      name: "READ_THROUGHPUT",
      value: "ReadThroughput",
  },
  {
      name: "WRITE_THROUGHPUT",
      value: "WriteThroughput",
  },
  {
      name: "ACTIVE_CONNECTIONS",
      value: "ActiveConnections",
  },
  {
      name: "GLOBAL_READ_TRAFFIC",
      value: "GlobalReadTraffic",
  },
  {
      name: "PRIVATE_READ_TRAFFIC",
      value: "PrivateReadTraffic",
  },
  {
      name: "GLOBAL_WRITE_TRAFFIC",
      value: "GlobalWriteTraffic",
  },
  {
      name: "PRIVATE_WRITE_TRAFFIC",
      value: "PrivateWriteTraffic",
  },
])
string MetricNameOfGetMetricStatisticsRequest

structure GetMetricStatisticsRequest {
    @required
    @xmlName("Dimensions")
    Dimensions: ListOfRequestDimensions,
    @xmlName("EndTime")
    EndTime: Timestamp,
    @required
    @xmlName("MetricName")
    MetricName: MetricNameOfGetMetricStatisticsRequest,
    @xmlName("StartTime")
    StartTime: Timestamp,
}

structure GetMetricStatisticsResult {
    @xmlName("Datapoints")
    Datapoints: ListOfDatapoints,
    @xmlName("Label")
    Label: String,
    @xmlName("ResponseMetadata")
    ResponseMetadata: ResponseMetadata,
}

list ListOfDatapoints {
    @xmlName("member")
    member: Datapoints,
}

structure Datapoints {
    @xmlName("SampleCount")
    SampleCount: Integer,
    @xmlName("Sum")
    Sum: Double,
    @xmlName("TargetName")
    TargetName: String,
    @xmlName("Timestamp")
    Timestamp: Timestamp,
}

@awsQuery
@sigv4(name: "nas")
@xmlNamespace(uri: "https://nas.api.nifcloud.com/")
@service(
    sdkId: "nas",
    arnNamespace: "nas",
    endpointPrefix: "nas"
)
service NAS {
    version: "N2016-02-24",
    operations: [
        CreateNASInstance,
        DeleteNASInstance,
        DescribeNASInstances,
        ModifyNASInstance,
        ClearNASSession,
        UpgradeNASInstance,
        CreateNASSecurityGroup,
        AuthorizeNASSecurityGroupIngress,
        DeleteNASSecurityGroup,
        DescribeNASSecurityGroups,
        ModifyNASSecurityGroup,
        RevokeNASSecurityGroupIngress,
        GetMetricStatistics,
    ],
}


operation CreateNASInstance {
    input: CreateNASInstanceRequest,
    output: CreateNASInstanceResult,
}

operation DeleteNASInstance {
    input: DeleteNASInstanceRequest,
    output: DeleteNASInstanceResult,
}

@waitable(
    NASInstanceExists: {
        acceptors: [
            {
                state: "success",
                matcher: {
                    output: {
                         path: "length(NASInstances[]) > `0`",
                         comparator: "booleanEquals",
                         expected: "true",
                    },
                },
            },
            {
                state: "retry",
                matcher: {
                    errorType: "Client.InvalidParameter.NotFound.NASInstanceIdentifier",
                },
            },
        ],
        minDelay: 40,
    },
    NASInstanceAvailable: {
        acceptors: [
            {
                state: "success",
                matcher: {
                    output: {
                         path: "NASInstances[].NASInstanceStatus",
                         comparator: "allStringEquals",
                         expected: "available",
                    },
                },
            },
            {
                state: "failure",
                matcher: {
                    output: {
                         path: "NASInstances[].NASInstanceStatus",
                         comparator: "allStringEquals",
                         expected: "failed",
                    },
                },
            },
        ],
        minDelay: 40,
    },
    NASInstanceFailed: {
        acceptors: [
            {
                state: "success",
                matcher: {
                    output: {
                         path: "NASInstances[].NASInstanceStatus",
                         comparator: "allStringEquals",
                         expected: "failed",
                    },
                },
            },
        ],
        minDelay: 40,
    },
    NASInstanceStorageFull: {
        acceptors: [
            {
                state: "success",
                matcher: {
                    output: {
                         path: "NASInstances[].NASInstanceStatus",
                         comparator: "allStringEquals",
                         expected: "storage-full",
                    },
                },
            },
        ],
        minDelay: 40,
    },
    NASInstanceDeleted: {
        acceptors: [
            {
                state: "success",
                matcher: {
                    errorType: "Client.InvalidParameter.NotFound.NASInstanceIdentifier",
                },
            },
            {
                state: "retry",
                matcher: {
                    output: {
                         path: "length(NASInstances[]) > `0`",
                         comparator: "booleanEquals",
                         expected: "true",
                    },
                },
            },
        ],
        minDelay: 40,
    },
)
operation DescribeNASInstances {
    input: DescribeNASInstancesRequest,
    output: DescribeNASInstancesResult,
}

operation ModifyNASInstance {
    input: ModifyNASInstanceRequest,
    output: ModifyNASInstanceResult,
}

operation ClearNASSession {
    input: ClearNASSessionRequest,
    output: ClearNASSessionResult,
}

operation UpgradeNASInstance {
    input: UpgradeNASInstanceRequest,
    output: UpgradeNASInstanceResult,
}

operation CreateNASSecurityGroup {
    input: CreateNASSecurityGroupRequest,
    output: CreateNASSecurityGroupResult,
}

operation AuthorizeNASSecurityGroupIngress {
    input: AuthorizeNASSecurityGroupIngressRequest,
    output: AuthorizeNASSecurityGroupIngressResult,
}

operation DeleteNASSecurityGroup {
    input: DeleteNASSecurityGroupRequest,
}

@waitable(
    NASSecurityGroupExists: {
        acceptors: [
            {
                state: "success",
                matcher: {
                    output: {
                         path: "length(NASSecurityGroups[]) > `0`",
                         comparator: "booleanEquals",
                         expected: "true",
                    },
                },
            },
            {
                state: "retry",
                matcher: {
                    errorType: "Client.InvalidParameter.NotFound.NASSecurityGroupName",
                },
            },
        ],
        minDelay: 20,
    },
    NASSecurityGroupSecurityGroupsAuthorized: {
        acceptors: [
            {
                state: "success",
                matcher: {
                    output: {
                         path: "NASSecurityGroups[].SecurityGroups[].Status",
                         comparator: "allStringEquals",
                         expected: "authorized",
                    },
                },
            },
        ],
        minDelay: 20,
    },
    NASSecurityGroupSecurityGroupsAuthFailed: {
        acceptors: [
            {
                state: "success",
                matcher: {
                    output: {
                         path: "NASSecurityGroups[].SecurityGroups[].Status",
                         comparator: "allStringEquals",
                         expected: "auth-failed",
                    },
                },
            },
        ],
        minDelay: 20,
    },
    NASSecurityGroupSecurityGroupsRevokeFailed: {
        acceptors: [
            {
                state: "success",
                matcher: {
                    output: {
                         path: "NASSecurityGroups[].SecurityGroups[].Status",
                         comparator: "allStringEquals",
                         expected: "revoke-failed",
                    },
                },
            },
        ],
        minDelay: 20,
    },
    NASSecurityGroupSecurityGroupsEmptied: {
        acceptors: [
            {
                state: "success",
                matcher: {
                    output: {
                         path: "length(NASSecurityGroups[0].SecurityGroups[]) == `0`",
                         comparator: "booleanEquals",
                         expected: "true",
                    },
                },
            },
        ],
        minDelay: 20,
    },
    NASSecurityGroupIPRangesAuthorized: {
        acceptors: [
            {
                state: "success",
                matcher: {
                    output: {
                         path: "NASSecurityGroups[].IPRanges[].Status",
                         comparator: "allStringEquals",
                         expected: "authorized",
                    },
                },
            },
        ],
        minDelay: 20,
    },
    NASSecurityGroupIPRangesAuthFailed: {
        acceptors: [
            {
                state: "success",
                matcher: {
                    output: {
                         path: "NASSecurityGroups[].IPRanges[].Status",
                         comparator: "allStringEquals",
                         expected: "auth-failed",
                    },
                },
            },
        ],
        minDelay: 20,
    },
    NASSecurityGroupIPRangesRevokeFailed: {
        acceptors: [
            {
                state: "success",
                matcher: {
                    output: {
                         path: "NASSecurityGroups[].IPRanges[].Status",
                         comparator: "allStringEquals",
                         expected: "revoke-failed",
                    },
                },
            },
        ],
        minDelay: 20,
    },
    NASSecurityGroupIPRangesEmptied: {
        acceptors: [
            {
                state: "success",
                matcher: {
                    output: {
                         path: "length(NASSecurityGroups[0].IPRanges[]) == `0`",
                         comparator: "booleanEquals",
                         expected: "true",
                    },
                },
            },
        ],
        minDelay: 20,
    },
    NASSecurityGroupDeleted: {
        acceptors: [
            {
                state: "success",
                matcher: {
                    errorType: "Client.InvalidParameter.NotFound.NASSecurityGroupName",
                },
            },
            {
                state: "retry",
                matcher: {
                    output: {
                         path: "length(NASSecurityGroups[]) > `0`",
                         comparator: "booleanEquals",
                         expected: "true",
                    },
                },
            },
        ],
        minDelay: 20,
    },
)
operation DescribeNASSecurityGroups {
    input: DescribeNASSecurityGroupsRequest,
    output: DescribeNASSecurityGroupsResult,
}

operation ModifyNASSecurityGroup {
    input: ModifyNASSecurityGroupRequest,
    output: ModifyNASSecurityGroupResult,
}

operation RevokeNASSecurityGroupIngress {
    input: RevokeNASSecurityGroupIngressRequest,
    output: RevokeNASSecurityGroupIngressResult,
}

operation GetMetricStatistics {
    input: GetMetricStatisticsRequest,
    output: GetMetricStatisticsResult,
}
