namespace com.nifcloud.api.rdb

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
      name: "MONTHLY",
      value: "1",
  },
  {
      name: "HOURLY",
      value: "2",
  },
])
string AccountingTypeOfCreateDBInstanceRequest

@enum([
  {
      name: "DB_MINI",
      value: "db.mini",
  },
  {
      name: "DB_E_SMALL",
      value: "db.e-small",
  },
  {
      name: "DB_SMALL",
      value: "db.small",
  },
  {
      name: "DB_E_SMALL2",
      value: "db.e-small2",
  },
  {
      name: "DB_SMALL2",
      value: "db.small2",
  },
  {
      name: "DB_E_SMALL4",
      value: "db.e-small4",
  },
  {
      name: "DB_SMALL4",
      value: "db.small4",
  },
  {
      name: "DB_E_SMALL8",
      value: "db.e-small8",
  },
  {
      name: "DB_SMALL8",
      value: "db.small8",
  },
  {
      name: "DB_E_SMALL16",
      value: "db.e-small16",
  },
  {
      name: "DB_SMALL16",
      value: "db.small16",
  },
  {
      name: "DB_E_MEDIUM",
      value: "db.e-medium",
  },
  {
      name: "DB_MEDIUM",
      value: "db.medium",
  },
  {
      name: "DB_E_MEDIUM4",
      value: "db.e-medium4",
  },
  {
      name: "DB_MEDIUM4",
      value: "db.medium4",
  },
  {
      name: "DB_E_MEDIUM8",
      value: "db.e-medium8",
  },
  {
      name: "DB_MEDIUM8",
      value: "db.medium8",
  },
  {
      name: "DB_E_MEDIUM16",
      value: "db.e-medium16",
  },
  {
      name: "DB_MEDIUM16",
      value: "db.medium16",
  },
  {
      name: "DB_E_MEDIUM24",
      value: "db.e-medium24",
  },
  {
      name: "DB_MEDIUM24",
      value: "db.medium24",
  },
  {
      name: "DB_E_LARGE",
      value: "db.e-large",
  },
  {
      name: "DB_LARGE",
      value: "db.large",
  },
  {
      name: "DB_E_LARGE8",
      value: "db.e-large8",
  },
  {
      name: "DB_LARGE8",
      value: "db.large8",
  },
  {
      name: "DB_E_LARGE16",
      value: "db.e-large16",
  },
  {
      name: "DB_LARGE16",
      value: "db.large16",
  },
  {
      name: "DB_E_LARGE24",
      value: "db.e-large24",
  },
  {
      name: "DB_LARGE24",
      value: "db.large24",
  },
  {
      name: "DB_E_LARGE32",
      value: "db.e-large32",
  },
  {
      name: "DB_LARGE32",
      value: "db.large32",
  },
  {
      name: "DB_E_EXTRA_LARGE8",
      value: "db.e-extra-large8",
  },
  {
      name: "DB_EXTRA_LARGE8",
      value: "db.extra-large8",
  },
  {
      name: "DB_E_EXTRA_LARGE16",
      value: "db.e-extra-large16",
  },
  {
      name: "DB_EXTRA_LARGE16",
      value: "db.extra-large16",
  },
  {
      name: "DB_E_EXTRA_LARGE24",
      value: "db.e-extra-large24",
  },
  {
      name: "DB_EXTRA_LARGE24",
      value: "db.extra-large24",
  },
  {
      name: "DB_E_EXTRA_LARGE32",
      value: "db.e-extra-large32",
  },
  {
      name: "DB_EXTRA_LARGE32",
      value: "db.extra-large32",
  },
  {
      name: "DB_E_EXTRA_LARGE48",
      value: "db.e-extra-large48",
  },
  {
      name: "DB_EXTRA_LARGE48",
      value: "db.extra-large48",
  },
  {
      name: "DB_E_DOUBLE_LARGE16",
      value: "db.e-double-large16",
  },
  {
      name: "DB_DOUBLE_LARGE16",
      value: "db.double-large16",
  },
  {
      name: "DB_E_DOUBLE_LARGE24",
      value: "db.e-double-large24",
  },
  {
      name: "DB_DOUBLE_LARGE24",
      value: "db.double-large24",
  },
  {
      name: "DB_E_DOUBLE_LARGE32",
      value: "db.e-double-large32",
  },
  {
      name: "DB_DOUBLE_LARGE32",
      value: "db.double-large32",
  },
  {
      name: "DB_E_DOUBLE_LARGE48",
      value: "db.e-double-large48",
  },
  {
      name: "DB_DOUBLE_LARGE48",
      value: "db.double-large48",
  },
  {
      name: "DB_E_DOUBLE_LARGE64",
      value: "db.e-double-large64",
  },
  {
      name: "DB_DOUBLE_LARGE64",
      value: "db.double-large64",
  },
  {
      name: "DB_E_DOUBLE_LARGE96",
      value: "db.e-double-large96",
  },
  {
      name: "DB_DOUBLE_LARGE96",
      value: "db.double-large96",
  },
  {
      name: "DB_TRIPLE_LARGE32",
      value: "db.triple-large32",
  },
  {
      name: "DB_TRIPLE_LARGE48",
      value: "db.triple-large48",
  },
  {
      name: "DB_TRIPLE_LARGE64",
      value: "db.triple-large64",
  },
  {
      name: "DB_TRIPLE_LARGE96",
      value: "db.triple-large96",
  },
  {
      name: "DB_TRIPLE_LARGE128",
      value: "db.triple-large128",
  },
  {
      name: "DB_QUAD_LARGE64",
      value: "db.quad-large64",
  },
  {
      name: "DB_QUAD_LARGE96",
      value: "db.quad-large96",
  },
  {
      name: "DB_QUAD_LARGE128",
      value: "db.quad-large128",
  },
  {
      name: "DB_SEPTA_LARGE128",
      value: "db.septa-large128",
  },
])
string DBInstanceClassOfCreateDBInstanceRequest

list ListOfRequestDBSecurityGroups {
    @xmlName("member")
    member: String,
}

@enum([
  {
      name: "MYSQL",
      value: "MySQL",
  },
  {
      name: "POSTGRES",
      value: "postgres",
  },
])
string EngineOfCreateDBInstanceRequest

list ListOfRequestVpcSecurityGroupIds {
    @xmlName("member")
    member: String,
}

structure CreateDBInstanceRequest {
    @xmlName("AccountingType")
    AccountingType: AccountingTypeOfCreateDBInstanceRequest,
    @required
    @xmlName("AllocatedStorage")
    AllocatedStorage: Integer,
    @xmlName("AutoMinorVersionUpgrade")
    AutoMinorVersionUpgrade: Boolean,
    @xmlName("AvailabilityZone")
    AvailabilityZone: String,
    @xmlName("BackupRetentionPeriod")
    BackupRetentionPeriod: Integer,
    @xmlName("CharacterSetName")
    CharacterSetName: String,
    @required
    @xmlName("DBInstanceClass")
    DBInstanceClass: DBInstanceClassOfCreateDBInstanceRequest,
    @required
    @xmlName("DBInstanceIdentifier")
    DBInstanceIdentifier: String,
    @xmlName("DBName")
    DBName: String,
    @xmlName("DBParameterGroupName")
    DBParameterGroupName: String,
    @xmlName("DBSecurityGroups")
    DBSecurityGroups: ListOfRequestDBSecurityGroups,
    @xmlName("DBSubnetGroupName")
    DBSubnetGroupName: String,
    @required
    @xmlName("Engine")
    Engine: EngineOfCreateDBInstanceRequest,
    @xmlName("EngineVersion")
    EngineVersion: String,
    @xmlName("Iops")
    Iops: Integer,
    @xmlName("LicenseModel")
    LicenseModel: String,
    @required
    @xmlName("MasterUsername")
    MasterUsername: String,
    @required
    @xmlName("MasterUserPassword")
    MasterUserPassword: String,
    @xmlName("MultiAZ")
    MultiAZ: Boolean,
    @xmlName("NiftyMasterPrivateAddress")
    NiftyMasterPrivateAddress: String,
    @xmlName("NiftyNetworkId")
    NiftyNetworkId: String,
    @xmlName("NiftySlavePrivateAddress")
    NiftySlavePrivateAddress: String,
    @xmlName("NiftyStorageType")
    NiftyStorageType: Integer,
    @xmlName("NiftyVirtualPrivateAddress")
    NiftyVirtualPrivateAddress: String,
    @xmlName("OptionGroupName")
    OptionGroupName: String,
    @xmlName("Port")
    Port: Integer,
    @xmlName("PreferredBackupWindow")
    PreferredBackupWindow: String,
    @xmlName("PreferredMaintenanceWindow")
    PreferredMaintenanceWindow: String,
    @xmlName("PubliclyAccessible")
    PubliclyAccessible: Boolean,
    @xmlName("VpcSecurityGroupIds")
    VpcSecurityGroupIds: ListOfRequestVpcSecurityGroupIds,
}

structure CreateDBInstanceResult {
    @xmlName("DBInstance")
    DBInstance: DBInstance,
    @xmlName("ResponseMetadata")
    ResponseMetadata: ResponseMetadata,
}

structure DBInstance {
    @xmlName("AccountingType")
    AccountingType: String,
    @xmlName("AllocatedStorage")
    AllocatedStorage: Integer,
    @xmlName("AutoMinorVersionUpgrade")
    AutoMinorVersionUpgrade: Boolean,
    @xmlName("AvailabilityZone")
    AvailabilityZone: String,
    @xmlName("BackupRetentionPeriod")
    BackupRetentionPeriod: Integer,
    @xmlName("BinlogRetentionPeriod")
    BinlogRetentionPeriod: Integer,
    @xmlName("CACertificateIdentifier")
    CACertificateIdentifier: String,
    @xmlName("DBInstanceClass")
    DBInstanceClass: String,
    @xmlName("DBInstanceIdentifier")
    DBInstanceIdentifier: String,
    @xmlName("DBInstanceStatus")
    DBInstanceStatus: String,
    @xmlName("DBName")
    DBName: String,
    @xmlName("DBParameterGroups")
    DBParameterGroups: ListOfDBParameterGroups,
    @xmlName("DBSecurityGroups")
    DBSecurityGroups: ListOfDBSecurityGroups,
    @xmlName("Endpoint")
    Endpoint: Endpoint,
    @xmlName("Engine")
    Engine: String,
    @xmlName("EngineVersion")
    EngineVersion: String,
    @xmlName("ExternalReplicationInfo")
    ExternalReplicationInfo: ExternalReplicationInfo,
    @xmlName("InstanceCreateTime")
    InstanceCreateTime: Timestamp,
    @xmlName("LatestRestorableTime")
    LatestRestorableTime: Timestamp,
    @xmlName("LicenseModel")
    LicenseModel: String,
    @xmlName("MasterUsername")
    MasterUsername: String,
    @xmlName("MultiAZ")
    MultiAZ: Boolean,
    @xmlName("NextMonthAccountingType")
    NextMonthAccountingType: String,
    @xmlName("NiftyMasterPrivateAddress")
    NiftyMasterPrivateAddress: String,
    @xmlName("NiftyMultiAZType")
    NiftyMultiAZType: String,
    @xmlName("NiftyNetworkId")
    NiftyNetworkId: String,
    @xmlName("NiftySlavePrivateAddress")
    NiftySlavePrivateAddress: String,
    @xmlName("NiftyStorageType")
    NiftyStorageType: Integer,
    @xmlName("OptionGroupMemberships")
    OptionGroupMemberships: ListOfOptionGroupMemberships,
    @xmlName("PendingModifiedValues")
    PendingModifiedValues: PendingModifiedValues,
    @xmlName("PreferredBackupWindow")
    PreferredBackupWindow: String,
    @xmlName("PreferredMaintenanceWindow")
    PreferredMaintenanceWindow: String,
    @xmlName("PubliclyAccessible")
    PubliclyAccessible: Boolean,
    @xmlName("ReadReplicaDBInstanceIdentifiers")
    ReadReplicaDBInstanceIdentifiers: ListOfReadReplicaDBInstanceIdentifiers,
    @xmlName("ReadReplicaSourceDBInstanceIdentifier")
    ReadReplicaSourceDBInstanceIdentifier: String,
    @xmlName("SecondaryAvailabilityZone")
    SecondaryAvailabilityZone: String,
    @xmlName("StatusInfos")
    StatusInfos: ListOfStatusInfos,
    @xmlName("VpcSecurityGroups")
    VpcSecurityGroups: String,
}

structure ResponseMetadata {
    @xmlName("RequestId")
    RequestId: String,
}

list ListOfDBParameterGroups {
    @xmlName("DBParameterGroup")
    member: DBParameterGroups,
}

structure DBParameterGroups {
    @xmlName("DBParameterGroupName")
    DBParameterGroupName: String,
    @xmlName("ParameterApplyStatus")
    ParameterApplyStatus: String,
}

list ListOfDBSecurityGroups {
    @xmlName("DBSecurityGroup")
    member: DBSecurityGroups,
}

structure DBSecurityGroups {
    @xmlName("DBSecurityGroupName")
    DBSecurityGroupName: String,
    @xmlName("Status")
    Status: String,
}

structure Endpoint {
    @xmlName("Address")
    Address: String,
    @xmlName("NiftyPrivateAddress")
    NiftyPrivateAddress: String,
    @xmlName("Port")
    Port: Integer,
}

structure ExternalReplicationInfo {
    @xmlName("ExternalMasterAddress")
    ExternalMasterAddress: String,
    @xmlName("ExternalReplicationMessage")
    ExternalReplicationMessage: String,
    @xmlName("ExternalReplicationStatus")
    ExternalReplicationStatus: String,
    @xmlName("ReplicationAddresses")
    ReplicationAddresses: ListOfReplicationAddresses,
    @xmlName("ReplicationPrivateAddresses")
    ReplicationPrivateAddresses: ListOfReplicationPrivateAddresses,
}

list ListOfReplicationAddresses {
    @xmlName("ReplicationAddress")
    member: String,
}

list ListOfReplicationPrivateAddresses {
    @xmlName("ReplicationPrivateAddress")
    member: String,
}

list ListOfOptionGroupMemberships {
    @xmlName("OptionGroupMembership")
    member: OptionGroupMemberships,
}

structure OptionGroupMemberships {
    @xmlName("OptionGroupName")
    OptionGroupName: String,
    @xmlName("Status")
    Status: String,
}

structure PendingModifiedValues {
    @xmlName("AllocatedStorage")
    AllocatedStorage: Integer,
    @xmlName("BackupRetentionPeriod")
    BackupRetentionPeriod: Integer,
    @xmlName("DBInstanceClass")
    DBInstanceClass: String,
    @xmlName("DBInstanceIdentifier")
    DBInstanceIdentifier: String,
    @xmlName("EngineVersion")
    EngineVersion: String,
    @xmlName("MasterUserPassword")
    MasterUserPassword: String,
    @xmlName("MultiAZ")
    MultiAZ: Boolean,
    @xmlName("Port")
    Port: Integer,
}

list ListOfReadReplicaDBInstanceIdentifiers {
    @xmlName("ReadReplicaDBInstanceIdentifier")
    member: String,
}

list ListOfStatusInfos {
    @xmlName("DBInstanceStatusInfo")
    member: StatusInfos,
}

structure StatusInfos {
    @xmlName("Message")
    Message: String,
    @xmlName("Normal")
    Normal: Boolean,
    @xmlName("Status")
    Status: String,
    @xmlName("StatusType")
    StatusType: String,
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
string AccountingTypeOfCreateDBInstanceReadReplicaRequest

@enum([
  {
      name: "DB_MINI",
      value: "db.mini",
  },
  {
      name: "DB_E_SMALL",
      value: "db.e-small",
  },
  {
      name: "DB_SMALL",
      value: "db.small",
  },
  {
      name: "DB_E_SMALL2",
      value: "db.e-small2",
  },
  {
      name: "DB_SMALL2",
      value: "db.small2",
  },
  {
      name: "DB_E_SMALL4",
      value: "db.e-small4",
  },
  {
      name: "DB_SMALL4",
      value: "db.small4",
  },
  {
      name: "DB_E_SMALL8",
      value: "db.e-small8",
  },
  {
      name: "DB_SMALL8",
      value: "db.small8",
  },
  {
      name: "DB_E_SMALL16",
      value: "db.e-small16",
  },
  {
      name: "DB_SMALL16",
      value: "db.small16",
  },
  {
      name: "DB_E_MEDIUM",
      value: "db.e-medium",
  },
  {
      name: "DB_MEDIUM",
      value: "db.medium",
  },
  {
      name: "DB_E_MEDIUM4",
      value: "db.e-medium4",
  },
  {
      name: "DB_MEDIUM4",
      value: "db.medium4",
  },
  {
      name: "DB_E_MEDIUM8",
      value: "db.e-medium8",
  },
  {
      name: "DB_MEDIUM8",
      value: "db.medium8",
  },
  {
      name: "DB_E_MEDIUM16",
      value: "db.e-medium16",
  },
  {
      name: "DB_MEDIUM16",
      value: "db.medium16",
  },
  {
      name: "DB_E_MEDIUM24",
      value: "db.e-medium24",
  },
  {
      name: "DB_MEDIUM24",
      value: "db.medium24",
  },
  {
      name: "DB_E_LARGE",
      value: "db.e-large",
  },
  {
      name: "DB_LARGE",
      value: "db.large",
  },
  {
      name: "DB_E_LARGE8",
      value: "db.e-large8",
  },
  {
      name: "DB_LARGE8",
      value: "db.large8",
  },
  {
      name: "DB_E_LARGE16",
      value: "db.e-large16",
  },
  {
      name: "DB_LARGE16",
      value: "db.large16",
  },
  {
      name: "DB_E_LARGE24",
      value: "db.e-large24",
  },
  {
      name: "DB_LARGE24",
      value: "db.large24",
  },
  {
      name: "DB_E_LARGE32",
      value: "db.e-large32",
  },
  {
      name: "DB_LARGE32",
      value: "db.large32",
  },
  {
      name: "DB_E_EXTRA_LARGE8",
      value: "db.e-extra-large8",
  },
  {
      name: "DB_EXTRA_LARGE8",
      value: "db.extra-large8",
  },
  {
      name: "DB_E_EXTRA_LARGE16",
      value: "db.e-extra-large16",
  },
  {
      name: "DB_EXTRA_LARGE16",
      value: "db.extra-large16",
  },
  {
      name: "DB_E_EXTRA_LARGE24",
      value: "db.e-extra-large24",
  },
  {
      name: "DB_EXTRA_LARGE24",
      value: "db.extra-large24",
  },
  {
      name: "DB_E_EXTRA_LARGE32",
      value: "db.e-extra-large32",
  },
  {
      name: "DB_EXTRA_LARGE32",
      value: "db.extra-large32",
  },
  {
      name: "DB_E_EXTRA_LARGE48",
      value: "db.e-extra-large48",
  },
  {
      name: "DB_EXTRA_LARGE48",
      value: "db.extra-large48",
  },
  {
      name: "DB_E_DOUBLE_LARGE16",
      value: "db.e-double-large16",
  },
  {
      name: "DB_DOUBLE_LARGE16",
      value: "db.double-large16",
  },
  {
      name: "DB_E_DOUBLE_LARGE24",
      value: "db.e-double-large24",
  },
  {
      name: "DB_DOUBLE_LARGE24",
      value: "db.double-large24",
  },
  {
      name: "DB_E_DOUBLE_LARGE32",
      value: "db.e-double-large32",
  },
  {
      name: "DB_DOUBLE_LARGE32",
      value: "db.double-large32",
  },
  {
      name: "DB_E_DOUBLE_LARGE48",
      value: "db.e-double-large48",
  },
  {
      name: "DB_DOUBLE_LARGE48",
      value: "db.double-large48",
  },
  {
      name: "DB_E_DOUBLE_LARGE64",
      value: "db.e-double-large64",
  },
  {
      name: "DB_DOUBLE_LARGE64",
      value: "db.double-large64",
  },
  {
      name: "DB_E_DOUBLE_LARGE96",
      value: "db.e-double-large96",
  },
  {
      name: "DB_DOUBLE_LARGE96",
      value: "db.double-large96",
  },
  {
      name: "DB_TRIPLE_LARGE32",
      value: "db.triple-large32",
  },
  {
      name: "DB_TRIPLE_LARGE48",
      value: "db.triple-large48",
  },
  {
      name: "DB_TRIPLE_LARGE64",
      value: "db.triple-large64",
  },
  {
      name: "DB_TRIPLE_LARGE96",
      value: "db.triple-large96",
  },
  {
      name: "DB_TRIPLE_LARGE128",
      value: "db.triple-large128",
  },
  {
      name: "DB_QUAD_LARGE64",
      value: "db.quad-large64",
  },
  {
      name: "DB_QUAD_LARGE96",
      value: "db.quad-large96",
  },
  {
      name: "DB_QUAD_LARGE128",
      value: "db.quad-large128",
  },
  {
      name: "DB_SEPTA_LARGE128",
      value: "db.septa-large128",
  },
])
string DBInstanceClassOfCreateDBInstanceReadReplicaRequest

structure CreateDBInstanceReadReplicaRequest {
    @xmlName("AccountingType")
    AccountingType: AccountingTypeOfCreateDBInstanceReadReplicaRequest,
    @xmlName("AutoMinorVersionUpgrade")
    AutoMinorVersionUpgrade: Boolean,
    @xmlName("AvailabilityZone")
    AvailabilityZone: String,
    @xmlName("DBInstanceClass")
    DBInstanceClass: DBInstanceClassOfCreateDBInstanceReadReplicaRequest,
    @required
    @xmlName("DBInstanceIdentifier")
    DBInstanceIdentifier: String,
    @xmlName("Iops")
    Iops: Integer,
    @xmlName("NiftyReadReplicaPrivateAddress")
    NiftyReadReplicaPrivateAddress: String,
    @xmlName("NiftyStorageType")
    NiftyStorageType: Integer,
    @xmlName("OptionGroupName")
    OptionGroupName: String,
    @xmlName("Port")
    Port: Integer,
    @xmlName("PubliclyAccessible")
    PubliclyAccessible: Boolean,
    @required
    @xmlName("SourceDBInstanceIdentifier")
    SourceDBInstanceIdentifier: String,
}

structure CreateDBInstanceReadReplicaResult {
    @xmlName("DBInstance")
    DBInstance: DBInstance,
    @xmlName("ResponseMetadata")
    ResponseMetadata: ResponseMetadata,
}

structure DeleteDBInstanceRequest {
    @required
    @xmlName("DBInstanceIdentifier")
    DBInstanceIdentifier: String,
    @xmlName("FinalDBSnapshotIdentifier")
    FinalDBSnapshotIdentifier: String,
    @xmlName("SkipFinalSnapshot")
    SkipFinalSnapshot: Boolean,
}

structure DeleteDBInstanceResult {
    @xmlName("DBInstance")
    DBInstance: DBInstance,
    @xmlName("ResponseMetadata")
    ResponseMetadata: ResponseMetadata,
}

@enum([
  {
      name: "DB_NORMAL",
      value: "0",
  },
  {
      name: "DB_FORCE",
      value: "1",
  },
  {
      name: "OS_NORMAL",
      value: "2",
  },
  {
      name: "OS_FORCE",
      value: "3",
  },
])
string NiftyRebootTypeOfRebootDBInstanceRequest

structure RebootDBInstanceRequest {
    @required
    @xmlName("DBInstanceIdentifier")
    DBInstanceIdentifier: String,
    @xmlName("ForceFailover")
    ForceFailover: Boolean,
    @xmlName("NiftyRebootType")
    NiftyRebootType: NiftyRebootTypeOfRebootDBInstanceRequest,
}

structure RebootDBInstanceResult {
    @xmlName("DBInstance")
    DBInstance: DBInstance,
    @xmlName("ResponseMetadata")
    ResponseMetadata: ResponseMetadata,
}

list ListOfRequestFilters {
    @xmlName("member")
    member: String,
}

structure DescribeDBInstancesRequest {
    @xmlName("DBInstanceIdentifier")
    DBInstanceIdentifier: String,
    @xmlName("Filter")
    Filter: String,
    @xmlName("FilterName")
    FilterName: String,
    @xmlName("Filters")
    Filters: ListOfRequestFilters,
    @xmlName("FilterValue")
    FilterValue: String,
    @xmlName("Marker")
    Marker: String,
    @xmlName("MaxRecords")
    MaxRecords: Integer,
}

structure DescribeDBInstancesResult {
    @xmlName("DBInstances")
    DBInstances: ListOfDBInstances,
    @xmlName("Marker")
    Marker: String,
    @xmlName("ResponseMetadata")
    ResponseMetadata: ResponseMetadata,
}

list ListOfDBInstances {
    @xmlName("DBInstance")
    member: DBInstances,
}

structure DBInstances {
    @xmlName("AccountingType")
    AccountingType: String,
    @xmlName("AllocatedStorage")
    AllocatedStorage: Integer,
    @xmlName("AutoMinorVersionUpgrade")
    AutoMinorVersionUpgrade: Boolean,
    @xmlName("AvailabilityZone")
    AvailabilityZone: String,
    @xmlName("BackupRetentionPeriod")
    BackupRetentionPeriod: Integer,
    @xmlName("BinlogRetentionPeriod")
    BinlogRetentionPeriod: Integer,
    @xmlName("CACertificateIdentifier")
    CACertificateIdentifier: String,
    @xmlName("DBInstanceClass")
    DBInstanceClass: String,
    @xmlName("DBInstanceIdentifier")
    DBInstanceIdentifier: String,
    @xmlName("DBInstanceStatus")
    DBInstanceStatus: String,
    @xmlName("DBName")
    DBName: String,
    @xmlName("DBParameterGroups")
    DBParameterGroups: ListOfDBParameterGroups,
    @xmlName("DBSecurityGroups")
    DBSecurityGroups: ListOfDBSecurityGroups,
    @xmlName("Endpoint")
    Endpoint: Endpoint,
    @xmlName("Engine")
    Engine: String,
    @xmlName("EngineVersion")
    EngineVersion: String,
    @xmlName("ExternalReplicationInfo")
    ExternalReplicationInfo: ExternalReplicationInfo,
    @xmlName("InstanceCreateTime")
    InstanceCreateTime: Timestamp,
    @xmlName("LatestRestorableTime")
    LatestRestorableTime: Timestamp,
    @xmlName("LicenseModel")
    LicenseModel: String,
    @xmlName("MasterUsername")
    MasterUsername: String,
    @xmlName("MultiAZ")
    MultiAZ: Boolean,
    @xmlName("NextMonthAccountingType")
    NextMonthAccountingType: String,
    @xmlName("NiftyMasterPrivateAddress")
    NiftyMasterPrivateAddress: String,
    @xmlName("NiftyMultiAZType")
    NiftyMultiAZType: String,
    @xmlName("NiftyNetworkId")
    NiftyNetworkId: String,
    @xmlName("NiftySlavePrivateAddress")
    NiftySlavePrivateAddress: String,
    @xmlName("NiftyStorageType")
    NiftyStorageType: Integer,
    @xmlName("OptionGroupMemberships")
    OptionGroupMemberships: ListOfOptionGroupMemberships,
    @xmlName("PendingModifiedValues")
    PendingModifiedValues: PendingModifiedValues,
    @xmlName("PreferredBackupWindow")
    PreferredBackupWindow: String,
    @xmlName("PreferredMaintenanceWindow")
    PreferredMaintenanceWindow: String,
    @xmlName("PubliclyAccessible")
    PubliclyAccessible: Boolean,
    @xmlName("ReadReplicaDBInstanceIdentifiers")
    ReadReplicaDBInstanceIdentifiers: ListOfReadReplicaDBInstanceIdentifiers,
    @xmlName("ReadReplicaSourceDBInstanceIdentifier")
    ReadReplicaSourceDBInstanceIdentifier: String,
    @xmlName("SecondaryAvailabilityZone")
    SecondaryAvailabilityZone: String,
    @xmlName("StatusInfos")
    StatusInfos: ListOfStatusInfos,
    @xmlName("VpcSecurityGroups")
    VpcSecurityGroups: String,
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
string AccountingTypeOfModifyDBInstanceRequest

@enum([
  {
      name: "DB_MINI",
      value: "db.mini",
  },
  {
      name: "DB_E_SMALL",
      value: "db.e-small",
  },
  {
      name: "DB_SMALL",
      value: "db.small",
  },
  {
      name: "DB_E_SMALL2",
      value: "db.e-small2",
  },
  {
      name: "DB_SMALL2",
      value: "db.small2",
  },
  {
      name: "DB_E_SMALL4",
      value: "db.e-small4",
  },
  {
      name: "DB_SMALL4",
      value: "db.small4",
  },
  {
      name: "DB_E_SMALL8",
      value: "db.e-small8",
  },
  {
      name: "DB_SMALL8",
      value: "db.small8",
  },
  {
      name: "DB_E_SMALL16",
      value: "db.e-small16",
  },
  {
      name: "DB_SMALL16",
      value: "db.small16",
  },
  {
      name: "DB_E_MEDIUM",
      value: "db.e-medium",
  },
  {
      name: "DB_MEDIUM",
      value: "db.medium",
  },
  {
      name: "DB_E_MEDIUM4",
      value: "db.e-medium4",
  },
  {
      name: "DB_MEDIUM4",
      value: "db.medium4",
  },
  {
      name: "DB_E_MEDIUM8",
      value: "db.e-medium8",
  },
  {
      name: "DB_MEDIUM8",
      value: "db.medium8",
  },
  {
      name: "DB_E_MEDIUM16",
      value: "db.e-medium16",
  },
  {
      name: "DB_MEDIUM16",
      value: "db.medium16",
  },
  {
      name: "DB_E_MEDIUM24",
      value: "db.e-medium24",
  },
  {
      name: "DB_MEDIUM24",
      value: "db.medium24",
  },
  {
      name: "DB_E_LARGE",
      value: "db.e-large",
  },
  {
      name: "DB_LARGE",
      value: "db.large",
  },
  {
      name: "DB_E_LARGE8",
      value: "db.e-large8",
  },
  {
      name: "DB_LARGE8",
      value: "db.large8",
  },
  {
      name: "DB_E_LARGE16",
      value: "db.e-large16",
  },
  {
      name: "DB_LARGE16",
      value: "db.large16",
  },
  {
      name: "DB_E_LARGE24",
      value: "db.e-large24",
  },
  {
      name: "DB_LARGE24",
      value: "db.large24",
  },
  {
      name: "DB_E_LARGE32",
      value: "db.e-large32",
  },
  {
      name: "DB_LARGE32",
      value: "db.large32",
  },
  {
      name: "DB_E_EXTRA_LARGE8",
      value: "db.e-extra-large8",
  },
  {
      name: "DB_EXTRA_LARGE8",
      value: "db.extra-large8",
  },
  {
      name: "DB_E_EXTRA_LARGE16",
      value: "db.e-extra-large16",
  },
  {
      name: "DB_EXTRA_LARGE16",
      value: "db.extra-large16",
  },
  {
      name: "DB_E_EXTRA_LARGE24",
      value: "db.e-extra-large24",
  },
  {
      name: "DB_EXTRA_LARGE24",
      value: "db.extra-large24",
  },
  {
      name: "DB_E_EXTRA_LARGE32",
      value: "db.e-extra-large32",
  },
  {
      name: "DB_EXTRA_LARGE32",
      value: "db.extra-large32",
  },
  {
      name: "DB_E_EXTRA_LARGE48",
      value: "db.e-extra-large48",
  },
  {
      name: "DB_EXTRA_LARGE48",
      value: "db.extra-large48",
  },
  {
      name: "DB_E_DOUBLE_LARGE16",
      value: "db.e-double-large16",
  },
  {
      name: "DB_DOUBLE_LARGE16",
      value: "db.double-large16",
  },
  {
      name: "DB_E_DOUBLE_LARGE24",
      value: "db.e-double-large24",
  },
  {
      name: "DB_DOUBLE_LARGE24",
      value: "db.double-large24",
  },
  {
      name: "DB_E_DOUBLE_LARGE32",
      value: "db.e-double-large32",
  },
  {
      name: "DB_DOUBLE_LARGE32",
      value: "db.double-large32",
  },
  {
      name: "DB_E_DOUBLE_LARGE48",
      value: "db.e-double-large48",
  },
  {
      name: "DB_DOUBLE_LARGE48",
      value: "db.double-large48",
  },
  {
      name: "DB_E_DOUBLE_LARGE64",
      value: "db.e-double-large64",
  },
  {
      name: "DB_DOUBLE_LARGE64",
      value: "db.double-large64",
  },
  {
      name: "DB_E_DOUBLE_LARGE96",
      value: "db.e-double-large96",
  },
  {
      name: "DB_DOUBLE_LARGE96",
      value: "db.double-large96",
  },
  {
      name: "DB_TRIPLE_LARGE32",
      value: "db.triple-large32",
  },
  {
      name: "DB_TRIPLE_LARGE48",
      value: "db.triple-large48",
  },
  {
      name: "DB_TRIPLE_LARGE64",
      value: "db.triple-large64",
  },
  {
      name: "DB_TRIPLE_LARGE96",
      value: "db.triple-large96",
  },
  {
      name: "DB_TRIPLE_LARGE128",
      value: "db.triple-large128",
  },
  {
      name: "DB_QUAD_LARGE64",
      value: "db.quad-large64",
  },
  {
      name: "DB_QUAD_LARGE96",
      value: "db.quad-large96",
  },
  {
      name: "DB_QUAD_LARGE128",
      value: "db.quad-large128",
  },
  {
      name: "DB_SEPTA_LARGE128",
      value: "db.septa-large128",
  },
])
string DBInstanceClassOfModifyDBInstanceRequest

structure ModifyDBInstanceRequest {
    @xmlName("AccountingType")
    AccountingType: AccountingTypeOfModifyDBInstanceRequest,
    @xmlName("AllocatedStorage")
    AllocatedStorage: Integer,
    @xmlName("AllowMajorVersionUpgrade")
    AllowMajorVersionUpgrade: Boolean,
    @xmlName("ApplyImmediately")
    ApplyImmediately: Boolean,
    @xmlName("AutoMinorVersionUpgrade")
    AutoMinorVersionUpgrade: Boolean,
    @xmlName("BackupRetentionPeriod")
    BackupRetentionPeriod: Integer,
    @xmlName("BinlogRetentionPeriod")
    BinlogRetentionPeriod: Integer,
    @xmlName("CACertificateIdentifier")
    CACertificateIdentifier: String,
    @xmlName("CustomBinlogRetentionPeriod")
    CustomBinlogRetentionPeriod: Boolean,
    @xmlName("DBInstanceClass")
    DBInstanceClass: DBInstanceClassOfModifyDBInstanceRequest,
    @required
    @xmlName("DBInstanceIdentifier")
    DBInstanceIdentifier: String,
    @xmlName("DBParameterGroupName")
    DBParameterGroupName: String,
    @xmlName("DBSecurityGroups")
    DBSecurityGroups: ListOfRequestDBSecurityGroups,
    @xmlName("EngineVersion")
    EngineVersion: String,
    @xmlName("Iops")
    Iops: Integer,
    @xmlName("MasterUserPassword")
    MasterUserPassword: String,
    @xmlName("MultiAZ")
    MultiAZ: Boolean,
    @xmlName("NewDBInstanceIdentifier")
    NewDBInstanceIdentifier: String,
    @xmlName("NiftySlavePrivateAddress")
    NiftySlavePrivateAddress: String,
    @xmlName("OptionGroupName")
    OptionGroupName: String,
    @xmlName("PreferredBackupWindow")
    PreferredBackupWindow: String,
    @xmlName("PreferredMaintenanceWindow")
    PreferredMaintenanceWindow: String,
    @xmlName("VpcSecurityGroupIds")
    VpcSecurityGroupIds: ListOfRequestVpcSecurityGroupIds,
}

structure ModifyDBInstanceResult {
    @xmlName("DBInstance")
    DBInstance: DBInstance,
    @xmlName("ResponseMetadata")
    ResponseMetadata: ResponseMetadata,
}

structure ModifyDBInstanceNetworkRequest {
    @required
    @xmlName("DBInstanceIdentifier")
    DBInstanceIdentifier: String,
    @xmlName("NiftyMasterPrivateAddress")
    NiftyMasterPrivateAddress: String,
    @xmlName("NiftyNetworkId")
    NiftyNetworkId: String,
    @xmlName("NiftySlavePrivateAddress")
    NiftySlavePrivateAddress: String,
    @xmlName("NiftyVirtualPrivateAddress")
    NiftyVirtualPrivateAddress: String,
}

structure ModifyDBInstanceNetworkResult {
    @xmlName("DBInstance")
    DBInstance: DBInstance,
    @xmlName("ResponseMetadata")
    ResponseMetadata: ResponseMetadata,
}

structure UpgradeDBEngineVersionRequest {
    @xmlName("AllowMajorVersionUpgrade")
    AllowMajorVersionUpgrade: Boolean,
    @required
    @xmlName("DBInstanceIdentifier")
    DBInstanceIdentifier: String,
    @xmlName("DBParameterGroupName")
    DBParameterGroupName: String,
    @required
    @xmlName("EngineVersion")
    EngineVersion: String,
    @xmlName("PreUpgradeDBSnapshotIdentifier")
    PreUpgradeDBSnapshotIdentifier: String,
    @xmlName("SkipPreUpgradeSnapshot")
    SkipPreUpgradeSnapshot: Boolean,
}

structure UpgradeDBEngineVersionResult {
    @xmlName("DBInstance")
    DBInstance: DBInstance,
    @xmlName("Marker")
    Marker: String,
    @xmlName("ResponseMetadata")
    ResponseMetadata: ResponseMetadata,
}

@enum([
  {
      name: "MYSQL5_6",
      value: "mysql5.6",
  },
  {
      name: "MYSQL5_7",
      value: "mysql5.7",
  },
  {
      name: "POSTGRES9_3",
      value: "postgres9.3",
  },
  {
      name: "POSTGRES9_6",
      value: "postgres9.6",
  },
  {
      name: "POSTGRES11",
      value: "postgres11",
  },
  {
      name: "POSTGRES13",
      value: "postgres13",
  },
])
string DBParameterGroupFamilyOfDescribeDBEngineVersionsRequest

@enum([
  {
      name: "MYSQL",
      value: "MySQL",
  },
  {
      name: "POSTGRES",
      value: "postgres",
  },
])
string EngineOfDescribeDBEngineVersionsRequest

structure DescribeDBEngineVersionsRequest {
    @xmlName("DBParameterGroupFamily")
    DBParameterGroupFamily: DBParameterGroupFamilyOfDescribeDBEngineVersionsRequest,
    @xmlName("DefaultOnly")
    DefaultOnly: Boolean,
    @xmlName("Engine")
    Engine: EngineOfDescribeDBEngineVersionsRequest,
    @xmlName("EngineVersion")
    EngineVersion: String,
    @xmlName("IncludeAll")
    IncludeAll: Boolean,
    @xmlName("ListSupportedCharacterSets")
    ListSupportedCharacterSets: Boolean,
    @xmlName("Marker")
    Marker: String,
    @xmlName("MaxRecords")
    MaxRecords: Integer,
}

structure DescribeDBEngineVersionsResult {
    @xmlName("DBEngineVersions")
    DBEngineVersions: ListOfDBEngineVersions,
    @xmlName("Marker")
    Marker: String,
    @xmlName("ResponseMetadata")
    ResponseMetadata: ResponseMetadata,
}

list ListOfDBEngineVersions {
    @xmlName("DBEngineVersion")
    member: DBEngineVersions,
}

structure DBEngineVersions {
    @xmlName("DBEngineDescription")
    DBEngineDescription: String,
    @xmlName("DBEngineVersionDescription")
    DBEngineVersionDescription: String,
    @xmlName("DBParameterGroupFamily")
    DBParameterGroupFamily: String,
    @xmlName("Engine")
    Engine: String,
    @xmlName("EngineVersion")
    EngineVersion: String,
    @xmlName("Status")
    Status: String,
    @xmlName("ValidUpgradeTarget")
    ValidUpgradeTarget: ListOfValidUpgradeTarget,
}

list ListOfValidUpgradeTarget {
    @xmlName("UpgradeTarget")
    member: ValidUpgradeTarget,
}

structure ValidUpgradeTarget {
    @xmlName("AutoUpgrade")
    AutoUpgrade: Boolean,
    @xmlName("DBParameterGroupFamily")
    DBParameterGroupFamily: String,
    @xmlName("Description")
    Description: String,
    @xmlName("Engine")
    Engine: String,
    @xmlName("EngineVersion")
    EngineVersion: String,
    @xmlName("IsMajorVersionUpgrade")
    IsMajorVersionUpgrade: Boolean,
}

@enum([
  {
      name: "DB_MINI",
      value: "db.mini",
  },
  {
      name: "DB_E_SMALL",
      value: "db.e-small",
  },
  {
      name: "DB_SMALL",
      value: "db.small",
  },
  {
      name: "DB_E_SMALL2",
      value: "db.e-small2",
  },
  {
      name: "DB_SMALL2",
      value: "db.small2",
  },
  {
      name: "DB_E_SMALL4",
      value: "db.e-small4",
  },
  {
      name: "DB_SMALL4",
      value: "db.small4",
  },
  {
      name: "DB_E_SMALL8",
      value: "db.e-small8",
  },
  {
      name: "DB_SMALL8",
      value: "db.small8",
  },
  {
      name: "DB_E_SMALL16",
      value: "db.e-small16",
  },
  {
      name: "DB_SMALL16",
      value: "db.small16",
  },
  {
      name: "DB_E_MEDIUM",
      value: "db.e-medium",
  },
  {
      name: "DB_MEDIUM",
      value: "db.medium",
  },
  {
      name: "DB_E_MEDIUM4",
      value: "db.e-medium4",
  },
  {
      name: "DB_MEDIUM4",
      value: "db.medium4",
  },
  {
      name: "DB_E_MEDIUM8",
      value: "db.e-medium8",
  },
  {
      name: "DB_MEDIUM8",
      value: "db.medium8",
  },
  {
      name: "DB_E_MEDIUM16",
      value: "db.e-medium16",
  },
  {
      name: "DB_MEDIUM16",
      value: "db.medium16",
  },
  {
      name: "DB_E_MEDIUM24",
      value: "db.e-medium24",
  },
  {
      name: "DB_MEDIUM24",
      value: "db.medium24",
  },
  {
      name: "DB_E_LARGE",
      value: "db.e-large",
  },
  {
      name: "DB_LARGE",
      value: "db.large",
  },
  {
      name: "DB_E_LARGE8",
      value: "db.e-large8",
  },
  {
      name: "DB_LARGE8",
      value: "db.large8",
  },
  {
      name: "DB_E_LARGE16",
      value: "db.e-large16",
  },
  {
      name: "DB_LARGE16",
      value: "db.large16",
  },
  {
      name: "DB_E_LARGE24",
      value: "db.e-large24",
  },
  {
      name: "DB_LARGE24",
      value: "db.large24",
  },
  {
      name: "DB_E_LARGE32",
      value: "db.e-large32",
  },
  {
      name: "DB_LARGE32",
      value: "db.large32",
  },
  {
      name: "DB_E_EXTRA_LARGE8",
      value: "db.e-extra-large8",
  },
  {
      name: "DB_EXTRA_LARGE8",
      value: "db.extra-large8",
  },
  {
      name: "DB_E_EXTRA_LARGE16",
      value: "db.e-extra-large16",
  },
  {
      name: "DB_EXTRA_LARGE16",
      value: "db.extra-large16",
  },
  {
      name: "DB_E_EXTRA_LARGE24",
      value: "db.e-extra-large24",
  },
  {
      name: "DB_EXTRA_LARGE24",
      value: "db.extra-large24",
  },
  {
      name: "DB_E_EXTRA_LARGE32",
      value: "db.e-extra-large32",
  },
  {
      name: "DB_EXTRA_LARGE32",
      value: "db.extra-large32",
  },
  {
      name: "DB_E_EXTRA_LARGE48",
      value: "db.e-extra-large48",
  },
  {
      name: "DB_EXTRA_LARGE48",
      value: "db.extra-large48",
  },
  {
      name: "DB_E_DOUBLE_LARGE16",
      value: "db.e-double-large16",
  },
  {
      name: "DB_DOUBLE_LARGE16",
      value: "db.double-large16",
  },
  {
      name: "DB_E_DOUBLE_LARGE24",
      value: "db.e-double-large24",
  },
  {
      name: "DB_DOUBLE_LARGE24",
      value: "db.double-large24",
  },
  {
      name: "DB_E_DOUBLE_LARGE32",
      value: "db.e-double-large32",
  },
  {
      name: "DB_DOUBLE_LARGE32",
      value: "db.double-large32",
  },
  {
      name: "DB_E_DOUBLE_LARGE48",
      value: "db.e-double-large48",
  },
  {
      name: "DB_DOUBLE_LARGE48",
      value: "db.double-large48",
  },
  {
      name: "DB_E_DOUBLE_LARGE64",
      value: "db.e-double-large64",
  },
  {
      name: "DB_DOUBLE_LARGE64",
      value: "db.double-large64",
  },
  {
      name: "DB_E_DOUBLE_LARGE96",
      value: "db.e-double-large96",
  },
  {
      name: "DB_DOUBLE_LARGE96",
      value: "db.double-large96",
  },
  {
      name: "DB_TRIPLE_LARGE32",
      value: "db.triple-large32",
  },
  {
      name: "DB_TRIPLE_LARGE48",
      value: "db.triple-large48",
  },
  {
      name: "DB_TRIPLE_LARGE64",
      value: "db.triple-large64",
  },
  {
      name: "DB_TRIPLE_LARGE96",
      value: "db.triple-large96",
  },
  {
      name: "DB_TRIPLE_LARGE128",
      value: "db.triple-large128",
  },
  {
      name: "DB_QUAD_LARGE64",
      value: "db.quad-large64",
  },
  {
      name: "DB_QUAD_LARGE96",
      value: "db.quad-large96",
  },
  {
      name: "DB_QUAD_LARGE128",
      value: "db.quad-large128",
  },
  {
      name: "DB_SEPTA_LARGE128",
      value: "db.septa-large128",
  },
])
string DBInstanceClassOfDescribeOrderableDBInstanceOptionsRequest

@enum([
  {
      name: "MYSQL",
      value: "MySQL",
  },
  {
      name: "POSTGRES",
      value: "postgres",
  },
])
string EngineOfDescribeOrderableDBInstanceOptionsRequest

structure DescribeOrderableDBInstanceOptionsRequest {
    @xmlName("DBInstanceClass")
    DBInstanceClass: DBInstanceClassOfDescribeOrderableDBInstanceOptionsRequest,
    @xmlName("Engine")
    Engine: EngineOfDescribeOrderableDBInstanceOptionsRequest,
    @xmlName("EngineVersion")
    EngineVersion: String,
    @xmlName("LicenseModel")
    LicenseModel: String,
    @xmlName("Marker")
    Marker: String,
    @xmlName("MaxRecords")
    MaxRecords: Integer,
    @xmlName("Vpc")
    Vpc: Boolean,
}

structure DescribeOrderableDBInstanceOptionsResult {
    @xmlName("Marker")
    Marker: String,
    @xmlName("OrderableDBInstanceOptions")
    OrderableDBInstanceOptions: ListOfOrderableDBInstanceOptions,
    @xmlName("ResponseMetadata")
    ResponseMetadata: ResponseMetadata,
}

list ListOfOrderableDBInstanceOptions {
    @xmlName("OrderableDBInstanceOption")
    member: OrderableDBInstanceOptions,
}

structure OrderableDBInstanceOptions {
    @xmlName("AvailabilityZones")
    AvailabilityZones: ListOfAvailabilityZones,
    @xmlName("DBInstanceClass")
    DBInstanceClass: String,
    @xmlName("Engine")
    Engine: String,
    @xmlName("EngineVersion")
    EngineVersion: String,
    @xmlName("LicenseModel")
    LicenseModel: String,
    @xmlName("MultiAZCapable")
    MultiAZCapable: Boolean,
    @xmlName("ReadReplicaCapable")
    ReadReplicaCapable: Boolean,
    @xmlName("Vpc")
    Vpc: Boolean,
}

list ListOfAvailabilityZones {
    @xmlName("AvailabilityZone")
    member: AvailabilityZones,
}

structure AvailabilityZones {
    @xmlName("Name")
    Name: String,
    @xmlName("NiftyStorageTypes")
    NiftyStorageTypes: ListOfNiftyStorageTypes,
    @xmlName("ProvisionedIopsCapable")
    ProvisionedIopsCapable: Boolean,
}

list ListOfNiftyStorageTypes {
    @xmlName("NiftyStorageType")
    member: Integer,
}

structure CopyDBSnapshotRequest {
    @required
    @xmlName("SourceDBSnapshotIdentifier")
    SourceDBSnapshotIdentifier: String,
    @required
    @xmlName("TargetDBSnapshotIdentifier")
    TargetDBSnapshotIdentifier: String,
}

structure CopyDBSnapshotResult {
    @xmlName("DBSnapshot")
    DBSnapshot: DBSnapshot,
    @xmlName("ResponseMetadata")
    ResponseMetadata: ResponseMetadata,
}

structure DBSnapshot {
    @xmlName("AllocatedStorage")
    AllocatedStorage: Integer,
    @xmlName("AvailabilityZone")
    AvailabilityZone: String,
    @xmlName("DBInstanceIdentifier")
    DBInstanceIdentifier: String,
    @xmlName("DBSnapshotIdentifier")
    DBSnapshotIdentifier: String,
    @xmlName("Engine")
    Engine: String,
    @xmlName("EngineVersion")
    EngineVersion: String,
    @xmlName("InstanceCreateTime")
    InstanceCreateTime: Timestamp,
    @xmlName("LicenseModel")
    LicenseModel: String,
    @xmlName("MasterUsername")
    MasterUsername: String,
    @xmlName("OptionGroupName")
    OptionGroupName: String,
    @xmlName("Port")
    Port: Integer,
    @xmlName("SnapshotCreateTime")
    SnapshotCreateTime: Timestamp,
    @xmlName("SnapshotType")
    SnapshotType: String,
    @xmlName("Status")
    Status: String,
}

structure CreateDBSnapshotRequest {
    @required
    @xmlName("DBInstanceIdentifier")
    DBInstanceIdentifier: String,
    @required
    @xmlName("DBSnapshotIdentifier")
    DBSnapshotIdentifier: String,
}

structure CreateDBSnapshotResult {
    @xmlName("DBSnapshot")
    DBSnapshot: DBSnapshot,
    @xmlName("ResponseMetadata")
    ResponseMetadata: ResponseMetadata,
}

structure DeleteDBSnapshotRequest {
    @required
    @xmlName("DBSnapshotIdentifier")
    DBSnapshotIdentifier: String,
}

structure DeleteDBSnapshotResult {
    @xmlName("DBSnapshot")
    DBSnapshot: DBSnapshot,
    @xmlName("ResponseMetadata")
    ResponseMetadata: ResponseMetadata,
}

@enum([
  {
      name: "AUTOMATED",
      value: "automated",
  },
  {
      name: "MANUAL",
      value: "manual",
  },
])
string SnapshotTypeOfDescribeDBSnapshotsRequest

structure DescribeDBSnapshotsRequest {
    @xmlName("DBInstanceIdentifier")
    DBInstanceIdentifier: String,
    @xmlName("DBSnapshotIdentifier")
    DBSnapshotIdentifier: String,
    @xmlName("Filter")
    Filter: String,
    @xmlName("FilterName")
    FilterName: String,
    @xmlName("Filters")
    Filters: ListOfRequestFilters,
    @xmlName("FilterValue")
    FilterValue: String,
    @xmlName("Marker")
    Marker: String,
    @xmlName("MaxRecords")
    MaxRecords: Integer,
    @xmlName("SnapshotType")
    SnapshotType: SnapshotTypeOfDescribeDBSnapshotsRequest,
}

structure DescribeDBSnapshotsResult {
    @xmlName("DBSnapshots")
    DBSnapshots: ListOfDBSnapshots,
    @xmlName("Marker")
    Marker: String,
    @xmlName("ResponseMetadata")
    ResponseMetadata: ResponseMetadata,
}

list ListOfDBSnapshots {
    @xmlName("DBSnapshot")
    member: DBSnapshots,
}

structure DBSnapshots {
    @xmlName("AllocatedStorage")
    AllocatedStorage: Integer,
    @xmlName("AvailabilityZone")
    AvailabilityZone: String,
    @xmlName("DBInstanceIdentifier")
    DBInstanceIdentifier: String,
    @xmlName("DBSnapshotIdentifier")
    DBSnapshotIdentifier: String,
    @xmlName("Engine")
    Engine: String,
    @xmlName("EngineVersion")
    EngineVersion: String,
    @xmlName("InstanceCreateTime")
    InstanceCreateTime: Timestamp,
    @xmlName("LicenseModel")
    LicenseModel: String,
    @xmlName("MasterUsername")
    MasterUsername: String,
    @xmlName("OptionGroupName")
    OptionGroupName: String,
    @xmlName("Port")
    Port: Integer,
    @xmlName("SnapshotCreateTime")
    SnapshotCreateTime: Timestamp,
    @xmlName("SnapshotType")
    SnapshotType: String,
    @xmlName("Status")
    Status: String,
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
string AccountingTypeOfRestoreDBInstanceFromDBSnapshotRequest

@enum([
  {
      name: "DB_MINI",
      value: "db.mini",
  },
  {
      name: "DB_E_SMALL",
      value: "db.e-small",
  },
  {
      name: "DB_SMALL",
      value: "db.small",
  },
  {
      name: "DB_E_SMALL2",
      value: "db.e-small2",
  },
  {
      name: "DB_SMALL2",
      value: "db.small2",
  },
  {
      name: "DB_E_SMALL4",
      value: "db.e-small4",
  },
  {
      name: "DB_SMALL4",
      value: "db.small4",
  },
  {
      name: "DB_E_SMALL8",
      value: "db.e-small8",
  },
  {
      name: "DB_SMALL8",
      value: "db.small8",
  },
  {
      name: "DB_E_SMALL16",
      value: "db.e-small16",
  },
  {
      name: "DB_SMALL16",
      value: "db.small16",
  },
  {
      name: "DB_E_MEDIUM",
      value: "db.e-medium",
  },
  {
      name: "DB_MEDIUM",
      value: "db.medium",
  },
  {
      name: "DB_E_MEDIUM4",
      value: "db.e-medium4",
  },
  {
      name: "DB_MEDIUM4",
      value: "db.medium4",
  },
  {
      name: "DB_E_MEDIUM8",
      value: "db.e-medium8",
  },
  {
      name: "DB_MEDIUM8",
      value: "db.medium8",
  },
  {
      name: "DB_E_MEDIUM16",
      value: "db.e-medium16",
  },
  {
      name: "DB_MEDIUM16",
      value: "db.medium16",
  },
  {
      name: "DB_E_MEDIUM24",
      value: "db.e-medium24",
  },
  {
      name: "DB_MEDIUM24",
      value: "db.medium24",
  },
  {
      name: "DB_E_LARGE",
      value: "db.e-large",
  },
  {
      name: "DB_LARGE",
      value: "db.large",
  },
  {
      name: "DB_E_LARGE8",
      value: "db.e-large8",
  },
  {
      name: "DB_LARGE8",
      value: "db.large8",
  },
  {
      name: "DB_E_LARGE16",
      value: "db.e-large16",
  },
  {
      name: "DB_LARGE16",
      value: "db.large16",
  },
  {
      name: "DB_E_LARGE24",
      value: "db.e-large24",
  },
  {
      name: "DB_LARGE24",
      value: "db.large24",
  },
  {
      name: "DB_E_LARGE32",
      value: "db.e-large32",
  },
  {
      name: "DB_LARGE32",
      value: "db.large32",
  },
  {
      name: "DB_E_EXTRA_LARGE8",
      value: "db.e-extra-large8",
  },
  {
      name: "DB_EXTRA_LARGE8",
      value: "db.extra-large8",
  },
  {
      name: "DB_E_EXTRA_LARGE16",
      value: "db.e-extra-large16",
  },
  {
      name: "DB_EXTRA_LARGE16",
      value: "db.extra-large16",
  },
  {
      name: "DB_E_EXTRA_LARGE24",
      value: "db.e-extra-large24",
  },
  {
      name: "DB_EXTRA_LARGE24",
      value: "db.extra-large24",
  },
  {
      name: "DB_E_EXTRA_LARGE32",
      value: "db.e-extra-large32",
  },
  {
      name: "DB_EXTRA_LARGE32",
      value: "db.extra-large32",
  },
  {
      name: "DB_E_EXTRA_LARGE48",
      value: "db.e-extra-large48",
  },
  {
      name: "DB_EXTRA_LARGE48",
      value: "db.extra-large48",
  },
  {
      name: "DB_E_DOUBLE_LARGE16",
      value: "db.e-double-large16",
  },
  {
      name: "DB_DOUBLE_LARGE16",
      value: "db.double-large16",
  },
  {
      name: "DB_E_DOUBLE_LARGE24",
      value: "db.e-double-large24",
  },
  {
      name: "DB_DOUBLE_LARGE24",
      value: "db.double-large24",
  },
  {
      name: "DB_E_DOUBLE_LARGE32",
      value: "db.e-double-large32",
  },
  {
      name: "DB_DOUBLE_LARGE32",
      value: "db.double-large32",
  },
  {
      name: "DB_E_DOUBLE_LARGE48",
      value: "db.e-double-large48",
  },
  {
      name: "DB_DOUBLE_LARGE48",
      value: "db.double-large48",
  },
  {
      name: "DB_E_DOUBLE_LARGE64",
      value: "db.e-double-large64",
  },
  {
      name: "DB_DOUBLE_LARGE64",
      value: "db.double-large64",
  },
  {
      name: "DB_E_DOUBLE_LARGE96",
      value: "db.e-double-large96",
  },
  {
      name: "DB_DOUBLE_LARGE96",
      value: "db.double-large96",
  },
  {
      name: "DB_TRIPLE_LARGE32",
      value: "db.triple-large32",
  },
  {
      name: "DB_TRIPLE_LARGE48",
      value: "db.triple-large48",
  },
  {
      name: "DB_TRIPLE_LARGE64",
      value: "db.triple-large64",
  },
  {
      name: "DB_TRIPLE_LARGE96",
      value: "db.triple-large96",
  },
  {
      name: "DB_TRIPLE_LARGE128",
      value: "db.triple-large128",
  },
  {
      name: "DB_QUAD_LARGE64",
      value: "db.quad-large64",
  },
  {
      name: "DB_QUAD_LARGE96",
      value: "db.quad-large96",
  },
  {
      name: "DB_QUAD_LARGE128",
      value: "db.quad-large128",
  },
  {
      name: "DB_SEPTA_LARGE128",
      value: "db.septa-large128",
  },
])
string DBInstanceClassOfRestoreDBInstanceFromDBSnapshotRequest

list ListOfRequestNiftyDBSecurityGroups {
    @xmlName("member")
    member: String,
}

structure RestoreDBInstanceFromDBSnapshotRequest {
    @xmlName("AccountingType")
    AccountingType: AccountingTypeOfRestoreDBInstanceFromDBSnapshotRequest,
    @xmlName("AutoMinorVersionUpgrade")
    AutoMinorVersionUpgrade: Boolean,
    @xmlName("AvailabilityZone")
    AvailabilityZone: String,
    @required
    @xmlName("DBInstanceClass")
    DBInstanceClass: DBInstanceClassOfRestoreDBInstanceFromDBSnapshotRequest,
    @required
    @xmlName("DBInstanceIdentifier")
    DBInstanceIdentifier: String,
    @xmlName("DBName")
    DBName: String,
    @required
    @xmlName("DBSnapshotIdentifier")
    DBSnapshotIdentifier: String,
    @xmlName("DBSubnetGroupName")
    DBSubnetGroupName: String,
    @xmlName("Engine")
    Engine: String,
    @xmlName("Iops")
    Iops: Integer,
    @xmlName("LicenseModel")
    LicenseModel: String,
    @xmlName("MultiAZ")
    MultiAZ: Boolean,
    @xmlName("NiftyDBParameterGroupName")
    NiftyDBParameterGroupName: String,
    @xmlName("NiftyDBSecurityGroups")
    NiftyDBSecurityGroups: ListOfRequestNiftyDBSecurityGroups,
    @xmlName("NiftyMasterPrivateAddress")
    NiftyMasterPrivateAddress: String,
    @xmlName("NiftyNetworkId")
    NiftyNetworkId: String,
    @xmlName("NiftySlavePrivateAddress")
    NiftySlavePrivateAddress: String,
    @xmlName("NiftyStorageType")
    NiftyStorageType: Integer,
    @xmlName("NiftyVirtualPrivateAddress")
    NiftyVirtualPrivateAddress: String,
    @xmlName("OptionGroupName")
    OptionGroupName: String,
    @xmlName("Port")
    Port: Integer,
    @xmlName("PubliclyAccessible")
    PubliclyAccessible: Boolean,
}

structure RestoreDBInstanceFromDBSnapshotResult {
    @xmlName("DBInstance")
    DBInstance: DBInstance,
    @xmlName("ResponseMetadata")
    ResponseMetadata: ResponseMetadata,
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
string AccountingTypeOfRestoreDBInstanceToPointInTimeRequest

@enum([
  {
      name: "DB_MINI",
      value: "db.mini",
  },
  {
      name: "DB_E_SMALL",
      value: "db.e-small",
  },
  {
      name: "DB_SMALL",
      value: "db.small",
  },
  {
      name: "DB_E_SMALL2",
      value: "db.e-small2",
  },
  {
      name: "DB_SMALL2",
      value: "db.small2",
  },
  {
      name: "DB_E_SMALL4",
      value: "db.e-small4",
  },
  {
      name: "DB_SMALL4",
      value: "db.small4",
  },
  {
      name: "DB_E_SMALL8",
      value: "db.e-small8",
  },
  {
      name: "DB_SMALL8",
      value: "db.small8",
  },
  {
      name: "DB_E_SMALL16",
      value: "db.e-small16",
  },
  {
      name: "DB_SMALL16",
      value: "db.small16",
  },
  {
      name: "DB_E_MEDIUM",
      value: "db.e-medium",
  },
  {
      name: "DB_MEDIUM",
      value: "db.medium",
  },
  {
      name: "DB_E_MEDIUM4",
      value: "db.e-medium4",
  },
  {
      name: "DB_MEDIUM4",
      value: "db.medium4",
  },
  {
      name: "DB_E_MEDIUM8",
      value: "db.e-medium8",
  },
  {
      name: "DB_MEDIUM8",
      value: "db.medium8",
  },
  {
      name: "DB_E_MEDIUM16",
      value: "db.e-medium16",
  },
  {
      name: "DB_MEDIUM16",
      value: "db.medium16",
  },
  {
      name: "DB_E_MEDIUM24",
      value: "db.e-medium24",
  },
  {
      name: "DB_MEDIUM24",
      value: "db.medium24",
  },
  {
      name: "DB_E_LARGE",
      value: "db.e-large",
  },
  {
      name: "DB_LARGE",
      value: "db.large",
  },
  {
      name: "DB_E_LARGE8",
      value: "db.e-large8",
  },
  {
      name: "DB_LARGE8",
      value: "db.large8",
  },
  {
      name: "DB_E_LARGE16",
      value: "db.e-large16",
  },
  {
      name: "DB_LARGE16",
      value: "db.large16",
  },
  {
      name: "DB_E_LARGE24",
      value: "db.e-large24",
  },
  {
      name: "DB_LARGE24",
      value: "db.large24",
  },
  {
      name: "DB_E_LARGE32",
      value: "db.e-large32",
  },
  {
      name: "DB_LARGE32",
      value: "db.large32",
  },
  {
      name: "DB_E_EXTRA_LARGE8",
      value: "db.e-extra-large8",
  },
  {
      name: "DB_EXTRA_LARGE8",
      value: "db.extra-large8",
  },
  {
      name: "DB_E_EXTRA_LARGE16",
      value: "db.e-extra-large16",
  },
  {
      name: "DB_EXTRA_LARGE16",
      value: "db.extra-large16",
  },
  {
      name: "DB_E_EXTRA_LARGE24",
      value: "db.e-extra-large24",
  },
  {
      name: "DB_EXTRA_LARGE24",
      value: "db.extra-large24",
  },
  {
      name: "DB_E_EXTRA_LARGE32",
      value: "db.e-extra-large32",
  },
  {
      name: "DB_EXTRA_LARGE32",
      value: "db.extra-large32",
  },
  {
      name: "DB_E_EXTRA_LARGE48",
      value: "db.e-extra-large48",
  },
  {
      name: "DB_EXTRA_LARGE48",
      value: "db.extra-large48",
  },
  {
      name: "DB_E_DOUBLE_LARGE16",
      value: "db.e-double-large16",
  },
  {
      name: "DB_DOUBLE_LARGE16",
      value: "db.double-large16",
  },
  {
      name: "DB_E_DOUBLE_LARGE24",
      value: "db.e-double-large24",
  },
  {
      name: "DB_DOUBLE_LARGE24",
      value: "db.double-large24",
  },
  {
      name: "DB_E_DOUBLE_LARGE32",
      value: "db.e-double-large32",
  },
  {
      name: "DB_DOUBLE_LARGE32",
      value: "db.double-large32",
  },
  {
      name: "DB_E_DOUBLE_LARGE48",
      value: "db.e-double-large48",
  },
  {
      name: "DB_DOUBLE_LARGE48",
      value: "db.double-large48",
  },
  {
      name: "DB_E_DOUBLE_LARGE64",
      value: "db.e-double-large64",
  },
  {
      name: "DB_DOUBLE_LARGE64",
      value: "db.double-large64",
  },
  {
      name: "DB_E_DOUBLE_LARGE96",
      value: "db.e-double-large96",
  },
  {
      name: "DB_DOUBLE_LARGE96",
      value: "db.double-large96",
  },
  {
      name: "DB_TRIPLE_LARGE32",
      value: "db.triple-large32",
  },
  {
      name: "DB_TRIPLE_LARGE48",
      value: "db.triple-large48",
  },
  {
      name: "DB_TRIPLE_LARGE64",
      value: "db.triple-large64",
  },
  {
      name: "DB_TRIPLE_LARGE96",
      value: "db.triple-large96",
  },
  {
      name: "DB_TRIPLE_LARGE128",
      value: "db.triple-large128",
  },
  {
      name: "DB_QUAD_LARGE64",
      value: "db.quad-large64",
  },
  {
      name: "DB_QUAD_LARGE96",
      value: "db.quad-large96",
  },
  {
      name: "DB_QUAD_LARGE128",
      value: "db.quad-large128",
  },
  {
      name: "DB_SEPTA_LARGE128",
      value: "db.septa-large128",
  },
])
string DBInstanceClassOfRestoreDBInstanceToPointInTimeRequest

structure RestoreDBInstanceToPointInTimeRequest {
    @xmlName("AccountingType")
    AccountingType: AccountingTypeOfRestoreDBInstanceToPointInTimeRequest,
    @xmlName("AutoMinorVersionUpgrade")
    AutoMinorVersionUpgrade: Boolean,
    @xmlName("AvailabilityZone")
    AvailabilityZone: String,
    @xmlName("DBInstanceClass")
    DBInstanceClass: DBInstanceClassOfRestoreDBInstanceToPointInTimeRequest,
    @xmlName("DBName")
    DBName: String,
    @xmlName("DBSubnetGroupName")
    DBSubnetGroupName: String,
    @xmlName("Engine")
    Engine: String,
    @xmlName("Iops")
    Iops: Integer,
    @xmlName("LicenseModel")
    LicenseModel: String,
    @xmlName("MultiAZ")
    MultiAZ: Boolean,
    @xmlName("NiftyDBParameterGroupName")
    NiftyDBParameterGroupName: String,
    @xmlName("NiftyDBSecurityGroups")
    NiftyDBSecurityGroups: ListOfRequestNiftyDBSecurityGroups,
    @xmlName("NiftyMasterPrivateAddress")
    NiftyMasterPrivateAddress: String,
    @xmlName("NiftyNetworkId")
    NiftyNetworkId: String,
    @xmlName("NiftySlavePrivateAddress")
    NiftySlavePrivateAddress: String,
    @xmlName("NiftyStorageType")
    NiftyStorageType: Integer,
    @xmlName("NiftyVirtualPrivateAddress")
    NiftyVirtualPrivateAddress: String,
    @xmlName("OptionGroupName")
    OptionGroupName: String,
    @xmlName("Port")
    Port: Integer,
    @xmlName("PubliclyAccessible")
    PubliclyAccessible: Boolean,
    @xmlName("RestoreTime")
    RestoreTime: Timestamp,
    @required
    @xmlName("SourceDBInstanceIdentifier")
    SourceDBInstanceIdentifier: String,
    @required
    @xmlName("TargetDBInstanceIdentifier")
    TargetDBInstanceIdentifier: String,
    @xmlName("UseLatestRestorableTime")
    UseLatestRestorableTime: Boolean,
}

structure RestoreDBInstanceToPointInTimeResult {
    @xmlName("DBInstance")
    DBInstance: DBInstance,
    @xmlName("ResponseMetadata")
    ResponseMetadata: ResponseMetadata,
}

structure CreateDBParameterGroupRequest {
    @required
    @xmlName("DBParameterGroupFamily")
    DBParameterGroupFamily: String,
    @required
    @xmlName("DBParameterGroupName")
    DBParameterGroupName: String,
    @required
    @xmlName("Description")
    Description: String,
}

structure CreateDBParameterGroupResult {
    @xmlName("DBParameterGroup")
    DBParameterGroup: DBParameterGroup,
    @xmlName("ResponseMetadata")
    ResponseMetadata: ResponseMetadata,
}

structure DBParameterGroup {
    @xmlName("DBParameterGroupFamily")
    DBParameterGroupFamily: String,
    @xmlName("DBParameterGroupName")
    DBParameterGroupName: String,
    @xmlName("Description")
    Description: String,
}

structure DeleteDBParameterGroupRequest {
    @required
    @xmlName("DBParameterGroupName")
    DBParameterGroupName: String,
}

structure DeleteDBParameterGroupResult {
    @xmlName("ResponseMetadata")
    ResponseMetadata: ResponseMetadata,
}

@enum([
  {
      name: "USER",
      value: "user",
  },
  {
      name: "SYSTEM",
      value: "system",
  },
  {
      name: "ENGINE_DEFAULT",
      value: "engine-default",
  },
])
string SourceOfDescribeDBParametersRequest

structure DescribeDBParametersRequest {
    @required
    @xmlName("DBParameterGroupName")
    DBParameterGroupName: String,
    @xmlName("Marker")
    Marker: String,
    @xmlName("MaxRecords")
    MaxRecords: Integer,
    @xmlName("Source")
    Source: SourceOfDescribeDBParametersRequest,
}

structure DescribeDBParametersResult {
    @xmlName("Marker")
    Marker: String,
    @xmlName("Parameters")
    Parameters: ListOfParameters,
    @xmlName("ResponseMetadata")
    ResponseMetadata: ResponseMetadata,
}

list ListOfParameters {
    @xmlName("Parameter")
    member: Parameters,
}

structure Parameters {
    @xmlName("AllowedValues")
    AllowedValues: String,
    @xmlName("ApplyMethod")
    ApplyMethod: String,
    @xmlName("ApplyType")
    ApplyType: String,
    @xmlName("DataType")
    DataType: String,
    @xmlName("Description")
    Description: String,
    @xmlName("IsModifiable")
    IsModifiable: Boolean,
    @xmlName("MinimumEngineVersion")
    MinimumEngineVersion: String,
    @xmlName("ParameterName")
    ParameterName: String,
    @xmlName("ParameterValue")
    ParameterValue: String,
    @xmlName("Source")
    Source: String,
}

structure DescribeEngineDefaultParametersRequest {
    @required
    @xmlName("DBParameterGroupFamily")
    DBParameterGroupFamily: String,
    @xmlName("Marker")
    Marker: String,
    @xmlName("MaxRecords")
    MaxRecords: Integer,
}

structure DescribeEngineDefaultParametersResult {
    @xmlName("EngineDefaults")
    EngineDefaults: EngineDefaults,
    @xmlName("ResponseMetadata")
    ResponseMetadata: ResponseMetadata,
}

structure EngineDefaults {
    @xmlName("DBParameterGroupFamily")
    DBParameterGroupFamily: String,
    @xmlName("Marker")
    Marker: String,
    @xmlName("Parameters")
    Parameters: ListOfParameters,
}

structure DescribeDBParameterGroupsRequest {
    @xmlName("DBParameterGroupName")
    DBParameterGroupName: String,
    @xmlName("Filter")
    Filter: String,
    @xmlName("FilterName")
    FilterName: String,
    @xmlName("Filters")
    Filters: ListOfRequestFilters,
    @xmlName("FilterValue")
    FilterValue: String,
    @xmlName("Marker")
    Marker: String,
    @xmlName("MaxRecords")
    MaxRecords: Integer,
}

structure DescribeDBParameterGroupsResult {
    @xmlName("DBParameterGroups")
    DBParameterGroups: ListOfDBParameterGroupsOfDescribeDBParameterGroups,
    @xmlName("Marker")
    Marker: String,
    @xmlName("ResponseMetadata")
    ResponseMetadata: ResponseMetadata,
}

list ListOfDBParameterGroupsOfDescribeDBParameterGroups {
    @xmlName("DBParameterGroup")
    member: DBParameterGroupsOfDescribeDBParameterGroups,
}

structure DBParameterGroupsOfDescribeDBParameterGroups {
    @xmlName("DBParameterGroupFamily")
    DBParameterGroupFamily: String,
    @xmlName("DBParameterGroupName")
    DBParameterGroupName: String,
    @xmlName("Description")
    Description: String,
}

@enum([
  {
      name: "IMMEDIATE",
      value: "immediate",
  },
  {
      name: "PENDING_REBOOT",
      value: "pending-reboot",
  },
])
string ApplyMethodOfParametersForModifyDBParameterGroup

structure RequestParameters {
    @required
    @xmlName("ApplyMethod")
    ApplyMethod: ApplyMethodOfParametersForModifyDBParameterGroup,
    @required
    @xmlName("ParameterName")
    ParameterName: String,
    @required
    @xmlName("ParameterValue")
    ParameterValue: String,
}

list ListOfRequestParameters {
    @xmlName("member")
    member: RequestParameters,
}

structure ModifyDBParameterGroupRequest {
    @required
    @xmlName("DBParameterGroupName")
    DBParameterGroupName: String,
    @required
    @xmlName("Parameters")
    Parameters: ListOfRequestParameters,
}

structure ModifyDBParameterGroupResult {
    @xmlName("DBParameterGroupName")
    DBParameterGroupName: String,
    @xmlName("ResponseMetadata")
    ResponseMetadata: ResponseMetadata,
}

@enum([
  {
      name: "IMMEDIATE",
      value: "immediate",
  },
  {
      name: "PENDING_REBOOT",
      value: "pending-reboot",
  },
])
string ApplyMethodOfParametersForResetDBParameterGroup

structure RequestParametersOfResetDBParameterGroup {
    @xmlName("ApplyMethod")
    ApplyMethod: ApplyMethodOfParametersForResetDBParameterGroup,
    @xmlName("ParameterName")
    ParameterName: String,
}

list ListOfRequestParametersOfResetDBParameterGroup {
    @xmlName("member")
    member: RequestParametersOfResetDBParameterGroup,
}

structure ResetDBParameterGroupRequest {
    @required
    @xmlName("DBParameterGroupName")
    DBParameterGroupName: String,
    @xmlName("Parameters")
    Parameters: ListOfRequestParametersOfResetDBParameterGroup,
    @xmlName("ResetAllParameters")
    ResetAllParameters: Boolean,
}

structure ResetDBParameterGroupResult {
    @xmlName("DBParameterGroupName")
    DBParameterGroupName: String,
    @xmlName("ResponseMetadata")
    ResponseMetadata: ResponseMetadata,
}

structure CreateDBSecurityGroupRequest {
    @required
    @xmlName("DBSecurityGroupDescription")
    DBSecurityGroupDescription: String,
    @required
    @xmlName("DBSecurityGroupName")
    DBSecurityGroupName: String,
    @required
    @xmlName("NiftyAvailabilityZone")
    NiftyAvailabilityZone: String,
}

structure CreateDBSecurityGroupResult {
    @xmlName("DBSecurityGroup")
    DBSecurityGroup: DBSecurityGroup,
    @xmlName("ResponseMetadata")
    ResponseMetadata: ResponseMetadata,
}

structure DBSecurityGroup {
    @xmlName("DBSecurityGroupDescription")
    DBSecurityGroupDescription: String,
    @xmlName("DBSecurityGroupName")
    DBSecurityGroupName: String,
    @xmlName("EC2SecurityGroups")
    EC2SecurityGroups: ListOfEC2SecurityGroups,
    @xmlName("IPRanges")
    IPRanges: ListOfIPRanges,
    @xmlName("NiftyAvailabilityZone")
    NiftyAvailabilityZone: String,
    @xmlName("OwnerId")
    OwnerId: String,
}

list ListOfEC2SecurityGroups {
    @xmlName("EC2SecurityGroup")
    member: EC2SecurityGroups,
}

structure EC2SecurityGroups {
    @xmlName("EC2SecurityGroupName")
    EC2SecurityGroupName: String,
    @xmlName("EC2SecurityGroupOwnerId")
    EC2SecurityGroupOwnerId: String,
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

structure AuthorizeDBSecurityGroupIngressRequest {
    @xmlName("CIDRIP")
    CIDRIP: String,
    @required
    @xmlName("DBSecurityGroupName")
    DBSecurityGroupName: String,
    @xmlName("EC2SecurityGroupId")
    EC2SecurityGroupId: String,
    @xmlName("EC2SecurityGroupName")
    EC2SecurityGroupName: String,
    @xmlName("EC2SecurityGroupOwnerId")
    EC2SecurityGroupOwnerId: String,
}

structure AuthorizeDBSecurityGroupIngressResult {
    @xmlName("DBSecurityGroup")
    DBSecurityGroup: DBSecurityGroup,
    @xmlName("ResponseMetadata")
    ResponseMetadata: ResponseMetadata,
}

structure DeleteDBSecurityGroupRequest {
    @required
    @xmlName("DBSecurityGroupName")
    DBSecurityGroupName: String,
}

structure DeleteDBSecurityGroupResult {
    @xmlName("ResponseMetadata")
    ResponseMetadata: ResponseMetadata,
}

structure DescribeDBSecurityGroupsRequest {
    @xmlName("DBSecurityGroupName")
    DBSecurityGroupName: String,
    @xmlName("Filter")
    Filter: String,
    @xmlName("FilterName")
    FilterName: String,
    @xmlName("Filters")
    Filters: ListOfRequestFilters,
    @xmlName("FilterValue")
    FilterValue: String,
    @xmlName("Marker")
    Marker: String,
    @xmlName("MaxRecords")
    MaxRecords: Integer,
}

structure DescribeDBSecurityGroupsResult {
    @xmlName("DBSecurityGroups")
    DBSecurityGroups: ListOfDBSecurityGroupsOfDescribeDBSecurityGroups,
    @xmlName("Marker")
    Marker: String,
    @xmlName("ResponseMetadata")
    ResponseMetadata: ResponseMetadata,
}

list ListOfDBSecurityGroupsOfDescribeDBSecurityGroups {
    @xmlName("DBSecurityGroup")
    member: DBSecurityGroupsOfDescribeDBSecurityGroups,
}

structure DBSecurityGroupsOfDescribeDBSecurityGroups {
    @xmlName("DBSecurityGroupDescription")
    DBSecurityGroupDescription: String,
    @xmlName("DBSecurityGroupName")
    DBSecurityGroupName: String,
    @xmlName("EC2SecurityGroups")
    EC2SecurityGroups: ListOfEC2SecurityGroups,
    @xmlName("IPRanges")
    IPRanges: ListOfIPRanges,
    @xmlName("NiftyAvailabilityZone")
    NiftyAvailabilityZone: String,
    @xmlName("OwnerId")
    OwnerId: String,
}

structure RevokeDBSecurityGroupIngressRequest {
    @xmlName("CIDRIP")
    CIDRIP: String,
    @required
    @xmlName("DBSecurityGroupName")
    DBSecurityGroupName: String,
    @xmlName("EC2SecurityGroupId")
    EC2SecurityGroupId: String,
    @xmlName("EC2SecurityGroupName")
    EC2SecurityGroupName: String,
    @xmlName("EC2SecurityGroupOwnerId")
    EC2SecurityGroupOwnerId: String,
}

structure RevokeDBSecurityGroupIngressResult {
    @xmlName("DBSecurityGroup")
    DBSecurityGroup: DBSecurityGroup,
    @xmlName("ResponseMetadata")
    ResponseMetadata: ResponseMetadata,
}

list ListOfRequestEventCategories {
    @xmlName("member")
    member: String,
}

@enum([
  {
      name: "DB_INSTANCE",
      value: "db-instance",
  },
  {
      name: "DB_PARAMETER_GROUP",
      value: "db-parameter-group",
  },
  {
      name: "DB_SECURITY_GROUP",
      value: "db-security-group",
  },
  {
      name: "DB_SNAPSHOT",
      value: "db-snapshot",
  },
])
string SourceTypeOfDescribeEventsRequest

structure DescribeEventsRequest {
    @xmlName("Duration")
    Duration: Integer,
    @xmlName("EndTime")
    EndTime: Timestamp,
    @xmlName("EventCategories")
    EventCategories: ListOfRequestEventCategories,
    @xmlName("Marker")
    Marker: String,
    @xmlName("MaxRecords")
    MaxRecords: Integer,
    @xmlName("SourceIdentifier")
    SourceIdentifier: String,
    @xmlName("SourceType")
    SourceType: SourceTypeOfDescribeEventsRequest,
    @xmlName("StartTime")
    StartTime: Timestamp,
}

structure DescribeEventsResult {
    @xmlName("Events")
    Events: ListOfEvents,
    @xmlName("Marker")
    Marker: String,
    @xmlName("ResponseMetadata")
    ResponseMetadata: ResponseMetadata,
}

list ListOfEvents {
    @xmlName("Event")
    member: Events,
}

structure Events {
    @xmlName("Date")
    Date: Timestamp,
    @xmlName("EventCategories")
    EventCategories: ListOfEventCategories,
    @xmlName("Message")
    Message: String,
    @xmlName("SourceIdentifier")
    SourceIdentifier: String,
    @xmlName("SourceType")
    SourceType: String,
}

list ListOfEventCategories {
    @xmlName("EventCategory")
    member: String,
}

list ListOfRequestSourceIds {
    @xmlName("member")
    member: String,
}

@enum([
  {
      name: "DB_INSTANCE",
      value: "db-instance",
  },
  {
      name: "DB_PARAMETER_GROUP",
      value: "db-parameter-group",
  },
  {
      name: "DB_SECURITY_GROUP",
      value: "db-security-group",
  },
  {
      name: "DB_SNAPSHOT",
      value: "db-snapshot",
  },
])
string SourceTypeOfCreateEventSubscriptionRequest

list ListOfRequestNiftyEmailAddresses {
    @xmlName("member")
    member: String,
}

structure CreateEventSubscriptionRequest {
    @xmlName("Enabled")
    Enabled: Boolean,
    @xmlName("EventCategories")
    EventCategories: ListOfRequestEventCategories,
    @xmlName("NiftyDescription")
    NiftyDescription: String,
    @required
    @xmlName("NiftyEmailAddresses")
    NiftyEmailAddresses: ListOfRequestNiftyEmailAddresses,
    @xmlName("SourceIds")
    SourceIds: ListOfRequestSourceIds,
    @xmlName("SourceType")
    SourceType: SourceTypeOfCreateEventSubscriptionRequest,
    @required
    @xmlName("SubscriptionName")
    SubscriptionName: String,
}

structure CreateEventSubscriptionResult {
    @xmlName("EventSubscription")
    EventSubscription: EventSubscription,
    @xmlName("ResponseMetadata")
    ResponseMetadata: ResponseMetadata,
}

structure EventSubscription {
    @xmlName("CustSubscriptionId")
    CustSubscriptionId: String,
    @xmlName("Enabled")
    Enabled: Boolean,
    @xmlName("EventCategoriesList")
    EventCategoriesList: ListOfEventCategoriesList,
    @xmlName("NiftyDescription")
    NiftyDescription: String,
    @xmlName("NiftyEmailAddressesList")
    NiftyEmailAddressesList: ListOfNiftyEmailAddressesList,
    @xmlName("SourceIdsList")
    SourceIdsList: ListOfSourceIdsList,
    @xmlName("SourceType")
    SourceType: String,
    @xmlName("Status")
    Status: String,
    @xmlName("SubscriptionCreationTime")
    SubscriptionCreationTime: String,
}

list ListOfEventCategoriesList {
    @xmlName("EventCategory")
    member: String,
}

list ListOfSourceIdsList {
    @xmlName("SourceId")
    member: String,
}

list ListOfNiftyEmailAddressesList {
    @xmlName("NiftyEmailAddress")
    member: String,
}

@enum([
  {
      name: "SUBSCRIPTION_NAME",
      value: "SubscriptionName",
  },
  {
      name: "SOURCE_TYPE",
      value: "SourceType",
  },
  {
      name: "ENABLED",
      value: "Enabled",
  },
  {
      name: "NIFTY_DESCRIPTION",
      value: "NiftyDescription",
  },
])
string FilterNameOfNiftyFiltersForDescribeEventSubscriptions

structure RequestFilter {
    @xmlName("FilterName")
    FilterName: FilterNameOfNiftyFiltersForDescribeEventSubscriptions,
    @xmlName("FilterValue")
    FilterValue: String,
}

list ListOfRequestFilter {
    member: RequestFilter,
}

structure RequestNiftyFilters {
    @xmlName("Filter")
    ListOfRequestFilter: ListOfRequestFilter,
}

@enum([
  {
      name: "SUBSCRIPTION_NAME",
      value: "SubscriptionName",
  },
  {
      name: "SOURCE_TYPE",
      value: "SourceType",
  },
  {
      name: "ENABLED",
      value: "Enabled",
  },
  {
      name: "SUBSCRIPTION_CREATION_TIME",
      value: "SubscriptionCreationTime",
  },
])
string NIftySortKeyOfDescribeEventSubscriptionsRequest

structure DescribeEventSubscriptionsRequest {
    @xmlName("Marker")
    Marker: String,
    @xmlName("MaxRecords")
    MaxRecords: Integer,
    @xmlName("NiftyFilters")
    NiftyFilters: RequestNiftyFilters,
    @xmlName("NiftySortDesc")
    NiftySortDesc: Integer,
    @xmlName("NIftySortKey")
    NIftySortKey: NIftySortKeyOfDescribeEventSubscriptionsRequest,
    @xmlName("SubscriptionName")
    SubscriptionName: String,
}

structure DescribeEventSubscriptionsResult {
    @xmlName("EventSubscriptionsList")
    EventSubscriptionsList: ListOfEventSubscriptionsList,
    @xmlName("Marker")
    Marker: String,
    @xmlName("ResponseMetadata")
    ResponseMetadata: ResponseMetadata,
}

list ListOfEventSubscriptionsList {
    @xmlName("EventSubscription")
    member: EventSubscriptionsList,
}

structure EventSubscriptionsList {
    @xmlName("CustSubscriptionId")
    CustSubscriptionId: String,
    @xmlName("Enabled")
    Enabled: Boolean,
    @xmlName("EventCategoriesList")
    EventCategoriesList: ListOfEventCategoriesList,
    @xmlName("NiftyDescription")
    NiftyDescription: String,
    @xmlName("NiftyEmailAddressesList")
    NiftyEmailAddressesList: ListOfNiftyEmailAddressesList,
    @xmlName("SourceIdsList")
    SourceIdsList: ListOfSourceIdsList,
    @xmlName("SourceType")
    SourceType: String,
    @xmlName("Status")
    Status: String,
    @xmlName("SubscriptionCreationTime")
    SubscriptionCreationTime: String,
}

list ListOfRequestNiftySourceIds {
    @xmlName("member")
    member: String,
}

structure ModifyEventSubscriptionRequest {
    @xmlName("Enabled")
    Enabled: Boolean,
    @xmlName("EventCategories")
    EventCategories: ListOfRequestEventCategories,
    @xmlName("NiftyDescription")
    NiftyDescription: String,
    @xmlName("NiftyEmailAddresses")
    NiftyEmailAddresses: ListOfRequestNiftyEmailAddresses,
    @xmlName("NiftySourceIds")
    NiftySourceIds: ListOfRequestNiftySourceIds,
    @xmlName("SourceType")
    SourceType: String,
    @required
    @xmlName("SubscriptionName")
    SubscriptionName: String,
}

structure ModifyEventSubscriptionResult {
    @xmlName("EventSubscription")
    EventSubscription: EventSubscription,
    @xmlName("ResponseMetadata")
    ResponseMetadata: ResponseMetadata,
}

structure DeleteEventSubscriptionRequest {
    @required
    @xmlName("SubscriptionName")
    SubscriptionName: String,
}

structure DeleteEventSubscriptionResult {
    @xmlName("EventSubscription")
    EventSubscription: EventSubscription,
    @xmlName("ResponseMetadata")
    ResponseMetadata: ResponseMetadata,
}

structure AddSourceIdentifierToSubscriptionRequest {
    @required
    @xmlName("SourceIdentifier")
    SourceIdentifier: String,
    @required
    @xmlName("SubscriptionName")
    SubscriptionName: String,
}

structure AddSourceIdentifierToSubscriptionResult {
    @xmlName("EventSubscription")
    EventSubscription: EventSubscription,
    @xmlName("ResponseMetadata")
    ResponseMetadata: ResponseMetadata,
}

@enum([
  {
      name: "DB_INSTANCE",
      value: "db-instance",
  },
  {
      name: "DB_PARAMETER_GROUP",
      value: "db-parameter-group",
  },
  {
      name: "DB_SECURITY_GROUP",
      value: "db-security-group",
  },
  {
      name: "DB_SNAPSHOT",
      value: "db-snapshot",
  },
])
string SourceTypeOfDescribeEventCategoriesRequest

structure DescribeEventCategoriesRequest {
    @xmlName("SourceType")
    SourceType: SourceTypeOfDescribeEventCategoriesRequest,
}

structure DescribeEventCategoriesResult {
    @xmlName("EventCategoriesMapList")
    EventCategoriesMapList: ListOfEventCategoriesMapList,
    @xmlName("ResponseMetadata")
    ResponseMetadata: ResponseMetadata,
}

list ListOfEventCategoriesMapList {
    @xmlName("EventCategoriesMap")
    member: EventCategoriesMapList,
}

structure EventCategoriesMapList {
    @xmlName("EventCategories")
    EventCategories: ListOfEventCategories,
    @xmlName("SourceType")
    SourceType: String,
}

structure RemoveSourceIdentifierFromSubscriptionRequest {
    @required
    @xmlName("SourceIdentifier")
    SourceIdentifier: String,
    @required
    @xmlName("SubscriptionName")
    SubscriptionName: String,
}

structure RemoveSourceIdentifierFromSubscriptionResult {
    @xmlName("EventSubscription")
    EventSubscription: EventSubscription,
    @xmlName("ResponseMetadata")
    ResponseMetadata: ResponseMetadata,
}

structure DescribeDBLogFilesRequest {
    @required
    @xmlName("DBInstanceIdentifier")
    DBInstanceIdentifier: String,
    @xmlName("FileLastWritten")
    FileLastWritten: Long,
    @xmlName("FilenameContains")
    FilenameContains: String,
    @xmlName("FileSize")
    FileSize: Long,
    @xmlName("Marker")
    Marker: String,
    @xmlName("MaxRecords")
    MaxRecords: Integer,
}

structure DescribeDBLogFilesResult {
    @xmlName("DescribeDBLogFiles")
    DescribeDBLogFiles: ListOfDescribeDBLogFiles,
    @xmlName("Marker")
    Marker: String,
    @xmlName("ResponseMetadata")
    ResponseMetadata: ResponseMetadata,
}

list ListOfDescribeDBLogFiles {
    @xmlName("DescribeDBLogFilesDetails")
    member: DescribeDBLogFiles,
}

structure DescribeDBLogFiles {
    @xmlName("LastWritten")
    LastWritten: Long,
    @xmlName("LogFileName")
    LogFileName: String,
    @xmlName("Size")
    Size: Long,
}

structure DownloadDBLogFilePortionRequest {
    @required
    @xmlName("DBInstanceIdentifier")
    DBInstanceIdentifier: String,
    @xmlName("LogFileName")
    LogFileName: String,
    @xmlName("Marker")
    Marker: String,
    @xmlName("NumberOfLines")
    NumberOfLines: Integer,
}

structure DownloadDBLogFilePortionResult {
    @xmlName("AdditionalDataPending")
    AdditionalDataPending: Boolean,
    @xmlName("LogFileData")
    LogFileData: String,
    @xmlName("Marker")
    Marker: String,
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
      name: "BIN_LOG_DISK_USAGE",
      value: "BinLogDiskUsage",
  },
  {
      name: "CPU_UTILIZATION",
      value: "CPUUtilization",
  },
  {
      name: "DATABASE_CONNECTIONS",
      value: "DatabaseConnections",
  },
  {
      name: "DISK_QUEUE_DEPTH",
      value: "DiskQueueDepth",
  },
  {
      name: "FREEABLE_MEMORY",
      value: "FreeableMemory",
  },
  {
      name: "FREE_STORAGE_SPACE",
      value: "FreeStorageSpace",
  },
  {
      name: "REPLICA_LAG",
      value: "ReplicaLag",
  },
  {
      name: "SWAP_USAGE",
      value: "SwapUsage",
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
])
string MetricNameOfNiftyGetMetricStatisticsRequest

structure NiftyGetMetricStatisticsRequest {
    @required
    @xmlName("Dimensions")
    Dimensions: ListOfRequestDimensions,
    @xmlName("EndTime")
    EndTime: Timestamp,
    @required
    @xmlName("MetricName")
    MetricName: MetricNameOfNiftyGetMetricStatisticsRequest,
    @xmlName("StartTime")
    StartTime: Timestamp,
}

structure NiftyGetMetricStatisticsResult {
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
    @xmlName("NiftyTargetName")
    NiftyTargetName: String,
    @xmlName("SampleCount")
    SampleCount: Integer,
    @xmlName("Sum")
    Sum: Double,
    @xmlName("Timestamp")
    Timestamp: Timestamp,
}

structure DescribeCertificatesRequest {
    @xmlName("CertificateIdentifier")
    CertificateIdentifier: String,
    @xmlName("Filter")
    Filter: String,
    @xmlName("FilterName")
    FilterName: String,
    @xmlName("Filters")
    Filters: ListOfRequestFilters,
    @xmlName("FilterValue")
    FilterValue: String,
    @xmlName("Marker")
    Marker: String,
    @xmlName("MaxRecords")
    MaxRecords: Integer,
}

structure DescribeCertificatesResult {
    @xmlName("Certificates")
    Certificates: ListOfCertificates,
    @xmlName("Marker")
    Marker: String,
    @xmlName("ResponseMetadata")
    ResponseMetadata: ResponseMetadata,
}

list ListOfCertificates {
    @xmlName("Certificate")
    member: Certificates,
}

structure Certificates {
    @xmlName("CertificateIdentifier")
    CertificateIdentifier: String,
    @xmlName("CertificateType")
    CertificateType: String,
    @xmlName("Thumbprint")
    Thumbprint: String,
    @xmlName("ValidFrom")
    ValidFrom: Timestamp,
    @xmlName("ValidTill")
    ValidTill: Timestamp,
}

structure SetExternalMasterRequest {
    @required
    @xmlName("BinlogFileName")
    BinlogFileName: String,
    @required
    @xmlName("BinlogPosition")
    BinlogPosition: Integer,
    @required
    @xmlName("DBInstanceIdentifier")
    DBInstanceIdentifier: String,
    @required
    @xmlName("MasterHost")
    MasterHost: String,
    @xmlName("MasterPort")
    MasterPort: Integer,
    @required
    @xmlName("ReplicationUserName")
    ReplicationUserName: String,
    @required
    @xmlName("ReplicationUserPassword")
    ReplicationUserPassword: String,
}

structure SetExternalMasterResult {
    @xmlName("DBInstance")
    DBInstance: DBInstance,
    @xmlName("ResponseMetadata")
    ResponseMetadata: ResponseMetadata,
}

structure StartReplicationRequest {
    @required
    @xmlName("DBInstanceIdentifier")
    DBInstanceIdentifier: String,
}

structure StartReplicationResult {
    @xmlName("DBInstance")
    DBInstance: DBInstance,
    @xmlName("ResponseMetadata")
    ResponseMetadata: ResponseMetadata,
}

structure StopReplicationRequest {
    @required
    @xmlName("DBInstanceIdentifier")
    DBInstanceIdentifier: String,
}

structure StopReplicationResult {
    @xmlName("DBInstance")
    DBInstance: DBInstance,
    @xmlName("ResponseMetadata")
    ResponseMetadata: ResponseMetadata,
}

structure ResetExternalMasterRequest {
    @required
    @xmlName("DBInstanceIdentifier")
    DBInstanceIdentifier: String,
}

structure ResetExternalMasterResult {
    @xmlName("DBInstance")
    DBInstance: DBInstance,
    @xmlName("ResponseMetadata")
    ResponseMetadata: ResponseMetadata,
}

@awsQuery
@sigv4(name: "rdb")
@xmlNamespace(uri: "https://rdb.api.nifcloud.com/")
@service(
    sdkId: "rdb",
    arnNamespace: "rdb",
    endpointPrefix: "rdb"
)
service RDB {
    version: "2013-05-15N2013-12-16",
    operations: [
        CreateDBInstance,
        CreateDBInstanceReadReplica,
        DeleteDBInstance,
        RebootDBInstance,
        DescribeDBInstances,
        ModifyDBInstance,
        ModifyDBInstanceNetwork,
        UpgradeDBEngineVersion,
        DescribeDBEngineVersions,
        DescribeOrderableDBInstanceOptions,
        CopyDBSnapshot,
        CreateDBSnapshot,
        DeleteDBSnapshot,
        DescribeDBSnapshots,
        RestoreDBInstanceFromDBSnapshot,
        RestoreDBInstanceToPointInTime,
        CreateDBParameterGroup,
        DeleteDBParameterGroup,
        DescribeDBParameters,
        DescribeEngineDefaultParameters,
        DescribeDBParameterGroups,
        ModifyDBParameterGroup,
        ResetDBParameterGroup,
        CreateDBSecurityGroup,
        AuthorizeDBSecurityGroupIngress,
        DeleteDBSecurityGroup,
        DescribeDBSecurityGroups,
        RevokeDBSecurityGroupIngress,
        DescribeEvents,
        CreateEventSubscription,
        DescribeEventSubscriptions,
        ModifyEventSubscription,
        DeleteEventSubscription,
        AddSourceIdentifierToSubscription,
        DescribeEventCategories,
        RemoveSourceIdentifierFromSubscription,
        DescribeDBLogFilesOperation,
        DownloadDBLogFilePortion,
        NiftyGetMetricStatistics,
        DescribeCertificates,
        SetExternalMaster,
        StartReplication,
        StopReplication,
        ResetExternalMaster,
    ],
}


operation CreateDBInstance {
    input: CreateDBInstanceRequest,
    output: CreateDBInstanceResult,
}

operation CreateDBInstanceReadReplica {
    input: CreateDBInstanceReadReplicaRequest,
    output: CreateDBInstanceReadReplicaResult,
}

operation DeleteDBInstance {
    input: DeleteDBInstanceRequest,
    output: DeleteDBInstanceResult,
}

operation RebootDBInstance {
    input: RebootDBInstanceRequest,
    output: RebootDBInstanceResult,
}

@waitable(
    DBInstanceExists: {
        acceptors: [
            {
                state: "success",
                matcher: {
                    output: {
                         path: "length(DBInstances[]) > `0`",
                         comparator: "booleanEquals",
                         expected: "true",
                    },
                },
            },
            {
                state: "retry",
                matcher: {
                    errorType: "Client.InvalidParameterNotFound.DBInstance",
                },
            },
        ],
        minDelay: 40,
    },
    DBInstanceAvailable: {
        acceptors: [
            {
                state: "success",
                matcher: {
                    output: {
                         path: "DBInstances[].DBInstanceStatus",
                         comparator: "allStringEquals",
                         expected: "available",
                    },
                },
            },
            {
                state: "failure",
                matcher: {
                    output: {
                         path: "DBInstances[].DBInstanceStatus",
                         comparator: "allStringEquals",
                         expected: "failed",
                    },
                },
            },
        ],
        minDelay: 40,
    },
    DBInstanceFailed: {
        acceptors: [
            {
                state: "success",
                matcher: {
                    output: {
                         path: "DBInstances[].DBInstanceStatus",
                         comparator: "allStringEquals",
                         expected: "failed",
                    },
                },
            },
        ],
        minDelay: 40,
    },
    DBInstanceStorageFull: {
        acceptors: [
            {
                state: "success",
                matcher: {
                    output: {
                         path: "DBInstances[].DBInstanceStatus",
                         comparator: "allStringEquals",
                         expected: "storage-full",
                    },
                },
            },
        ],
        minDelay: 40,
    },
    DBInstanceDeleted: {
        acceptors: [
            {
                state: "success",
                matcher: {
                    errorType: "Client.InvalidParameterNotFound.DBInstance",
                },
            },
            {
                state: "retry",
                matcher: {
                    output: {
                         path: "length(DBInstances[]) > `0`",
                         comparator: "booleanEquals",
                         expected: "true",
                    },
                },
            },
        ],
        minDelay: 40,
    },
)
operation DescribeDBInstances {
    input: DescribeDBInstancesRequest,
    output: DescribeDBInstancesResult,
}

operation ModifyDBInstance {
    input: ModifyDBInstanceRequest,
    output: ModifyDBInstanceResult,
}

operation ModifyDBInstanceNetwork {
    input: ModifyDBInstanceNetworkRequest,
    output: ModifyDBInstanceNetworkResult,
}

operation UpgradeDBEngineVersion {
    input: UpgradeDBEngineVersionRequest,
    output: UpgradeDBEngineVersionResult,
}

operation DescribeDBEngineVersions {
    input: DescribeDBEngineVersionsRequest,
    output: DescribeDBEngineVersionsResult,
}

operation DescribeOrderableDBInstanceOptions {
    input: DescribeOrderableDBInstanceOptionsRequest,
    output: DescribeOrderableDBInstanceOptionsResult,
}

operation CopyDBSnapshot {
    input: CopyDBSnapshotRequest,
    output: CopyDBSnapshotResult,
}

operation CreateDBSnapshot {
    input: CreateDBSnapshotRequest,
    output: CreateDBSnapshotResult,
}

operation DeleteDBSnapshot {
    input: DeleteDBSnapshotRequest,
    output: DeleteDBSnapshotResult,
}

operation DescribeDBSnapshots {
    input: DescribeDBSnapshotsRequest,
    output: DescribeDBSnapshotsResult,
}

operation RestoreDBInstanceFromDBSnapshot {
    input: RestoreDBInstanceFromDBSnapshotRequest,
    output: RestoreDBInstanceFromDBSnapshotResult,
}

operation RestoreDBInstanceToPointInTime {
    input: RestoreDBInstanceToPointInTimeRequest,
    output: RestoreDBInstanceToPointInTimeResult,
}

operation CreateDBParameterGroup {
    input: CreateDBParameterGroupRequest,
    output: CreateDBParameterGroupResult,
}

operation DeleteDBParameterGroup {
    input: DeleteDBParameterGroupRequest,
}

operation DescribeDBParameters {
    input: DescribeDBParametersRequest,
    output: DescribeDBParametersResult,
}

operation DescribeEngineDefaultParameters {
    input: DescribeEngineDefaultParametersRequest,
    output: DescribeEngineDefaultParametersResult,
}

operation DescribeDBParameterGroups {
    input: DescribeDBParameterGroupsRequest,
    output: DescribeDBParameterGroupsResult,
}

operation ModifyDBParameterGroup {
    input: ModifyDBParameterGroupRequest,
    output: ModifyDBParameterGroupResult,
}

operation ResetDBParameterGroup {
    input: ResetDBParameterGroupRequest,
    output: ResetDBParameterGroupResult,
}

operation CreateDBSecurityGroup {
    input: CreateDBSecurityGroupRequest,
    output: CreateDBSecurityGroupResult,
}

operation AuthorizeDBSecurityGroupIngress {
    input: AuthorizeDBSecurityGroupIngressRequest,
    output: AuthorizeDBSecurityGroupIngressResult,
}

operation DeleteDBSecurityGroup {
    input: DeleteDBSecurityGroupRequest,
}

@waitable(
    DBSecurityGroupExists: {
        acceptors: [
            {
                state: "success",
                matcher: {
                    output: {
                         path: "length(DBSecurityGroups[]) > `0`",
                         comparator: "booleanEquals",
                         expected: "true",
                    },
                },
            },
            {
                state: "retry",
                matcher: {
                    errorType: "Client.InvalidParameterNotFound.DBSecurityGroup",
                },
            },
        ],
        minDelay: 20,
    },
    DBSecurityGroupEC2SecurityGroupsAuthorized: {
        acceptors: [
            {
                state: "success",
                matcher: {
                    output: {
                         path: "DBSecurityGroups[].EC2SecurityGroups[].Status",
                         comparator: "allStringEquals",
                         expected: "authorized",
                    },
                },
            },
        ],
        minDelay: 20,
    },
    DBSecurityGroupEC2SecurityGroupsAuthFailed: {
        acceptors: [
            {
                state: "success",
                matcher: {
                    output: {
                         path: "DBSecurityGroups[].EC2SecurityGroups[].Status",
                         comparator: "allStringEquals",
                         expected: "auth-failed",
                    },
                },
            },
        ],
        minDelay: 20,
    },
    DBSecurityGroupEC2SecurityGroupsRevokeFailed: {
        acceptors: [
            {
                state: "success",
                matcher: {
                    output: {
                         path: "DBSecurityGroups[].EC2SecurityGroups[].Status",
                         comparator: "allStringEquals",
                         expected: "revoke-failed",
                    },
                },
            },
        ],
        minDelay: 20,
    },
    DBSecurityGroupEC2SecurityGroupsEmptied: {
        acceptors: [
            {
                state: "success",
                matcher: {
                    output: {
                         path: "length(DBSecurityGroups[0].EC2SecurityGroups[]) == `0`",
                         comparator: "booleanEquals",
                         expected: "true",
                    },
                },
            },
        ],
        minDelay: 20,
    },
    DBSecurityGroupIPRangesAuthorized: {
        acceptors: [
            {
                state: "success",
                matcher: {
                    output: {
                         path: "DBSecurityGroups[].IPRanges[].Status",
                         comparator: "allStringEquals",
                         expected: "authorized",
                    },
                },
            },
        ],
        minDelay: 20,
    },
    DBSecurityGroupIPRangesAuthFailed: {
        acceptors: [
            {
                state: "success",
                matcher: {
                    output: {
                         path: "DBSecurityGroups[].IPRanges[].Status",
                         comparator: "allStringEquals",
                         expected: "auth-failed",
                    },
                },
            },
        ],
        minDelay: 20,
    },
    DBSecurityGroupIPRangesRevokeFailed: {
        acceptors: [
            {
                state: "success",
                matcher: {
                    output: {
                         path: "DBSecurityGroups[].IPRanges[].Status",
                         comparator: "allStringEquals",
                         expected: "revoke-failed",
                    },
                },
            },
        ],
        minDelay: 20,
    },
    DBSecurityGroupIPRangesEmptied: {
        acceptors: [
            {
                state: "success",
                matcher: {
                    output: {
                         path: "length(DBSecurityGroups[0].IPRanges[]) == `0`",
                         comparator: "booleanEquals",
                         expected: "true",
                    },
                },
            },
        ],
        minDelay: 20,
    },
    DBSecurityGroupDeleted: {
        acceptors: [
            {
                state: "success",
                matcher: {
                    errorType: "Client.InvalidParameterNotFound.DBSecurityGroup",
                },
            },
            {
                state: "retry",
                matcher: {
                    output: {
                         path: "length(DBSecurityGroups[]) > `0`",
                         comparator: "booleanEquals",
                         expected: "true",
                    },
                },
            },
        ],
        minDelay: 20,
    },
)
operation DescribeDBSecurityGroups {
    input: DescribeDBSecurityGroupsRequest,
    output: DescribeDBSecurityGroupsResult,
}

operation RevokeDBSecurityGroupIngress {
    input: RevokeDBSecurityGroupIngressRequest,
    output: RevokeDBSecurityGroupIngressResult,
}

operation DescribeEvents {
    input: DescribeEventsRequest,
    output: DescribeEventsResult,
}

operation CreateEventSubscription {
    input: CreateEventSubscriptionRequest,
    output: CreateEventSubscriptionResult,
}

operation DescribeEventSubscriptions {
    input: DescribeEventSubscriptionsRequest,
    output: DescribeEventSubscriptionsResult,
}

operation ModifyEventSubscription {
    input: ModifyEventSubscriptionRequest,
    output: ModifyEventSubscriptionResult,
}

operation DeleteEventSubscription {
    input: DeleteEventSubscriptionRequest,
    output: DeleteEventSubscriptionResult,
}

operation AddSourceIdentifierToSubscription {
    input: AddSourceIdentifierToSubscriptionRequest,
    output: AddSourceIdentifierToSubscriptionResult,
}

operation DescribeEventCategories {
    input: DescribeEventCategoriesRequest,
    output: DescribeEventCategoriesResult,
}

operation RemoveSourceIdentifierFromSubscription {
    input: RemoveSourceIdentifierFromSubscriptionRequest,
    output: RemoveSourceIdentifierFromSubscriptionResult,
}

operation DescribeDBLogFilesOperation {
    input: DescribeDBLogFilesRequest,
    output: DescribeDBLogFilesResult,
}

operation DownloadDBLogFilePortion {
    input: DownloadDBLogFilePortionRequest,
    output: DownloadDBLogFilePortionResult,
}

operation NiftyGetMetricStatistics {
    input: NiftyGetMetricStatisticsRequest,
    output: NiftyGetMetricStatisticsResult,
}

operation DescribeCertificates {
    input: DescribeCertificatesRequest,
    output: DescribeCertificatesResult,
}

operation SetExternalMaster {
    input: SetExternalMasterRequest,
    output: SetExternalMasterResult,
}

operation StartReplication {
    input: StartReplicationRequest,
    output: StartReplicationResult,
}

operation StopReplication {
    input: StopReplicationRequest,
    output: StopReplicationResult,
}

operation ResetExternalMaster {
    input: ResetExternalMasterRequest,
    output: ResetExternalMasterResult,
}
