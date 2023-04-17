namespace com.nifcloud.api.dns

use aws.auth#sigv4
use aws.api#service
use aws.protocols#restJson1
use aws.protocols#restXml
use aws.protocols#awsQuery
use aws.protocols#ec2Query
use smithy.waiters#waitable
use aws.protocols#ec2QueryName


structure GetHostedZoneRequest {
    @required
    @httpLabel
    @xmlName("ZoneID")
    ZoneID: String,
}

structure GetHostedZoneResult {
    @xmlName("DelegationSet")
    DelegationSet: DelegationSet,
    @xmlName("HostedZone")
    HostedZone: HostedZone,
}

structure HostedZone {
    @xmlName("CallerReference")
    CallerReference: String,
    @xmlName("Config")
    Config: Config,
    @xmlName("Id")
    Id: String,
    @xmlName("Name")
    Name: String,
    @xmlName("ResourceRecordSetCount")
    ResourceRecordSetCount: Integer,
}

structure DelegationSet {
    @xmlName("NameServers")
    NameServers: ListOfNameServers,
}

structure Config {
    @xmlName("Comment")
    Comment: String,
}

list ListOfNameServers {
    @xmlName("NameServer")
    member: String,
}

structure ListHostedZonesRequest {
    @httpQuery("marker")
    @xmlName("marker")
    Marker: String,
    @httpQuery("maxitems")
    @xmlName("maxitems")
    Maxitems: Integer,
}

structure ListHostedZonesResult {
    @xmlName("HostedZones")
    HostedZones: ListOfHostedZones,
    @xmlName("IsTruncated")
    IsTruncated: Boolean,
    @xmlName("Marker")
    Marker: String,
    @xmlName("MaxItems")
    MaxItems: Integer,
    @xmlName("NextMarker")
    NextMarker: String,
}

list ListOfHostedZones {
    @xmlName("HostedZone")
    member: HostedZones,
}

structure HostedZones {
    @xmlName("CallerReference")
    CallerReference: String,
    @xmlName("Config")
    Config: Config,
    @xmlName("Id")
    Id: String,
    @xmlName("Name")
    Name: String,
    @xmlName("ResourceRecordSetCount")
    ResourceRecordSetCount: Integer,
}

structure CreateHostedZoneRequest {
    @xmlName("CallerReference")
    CallerReference: String,
    @required
    @xmlName("Name")
    Name: String,
    @xmlName("HostedZoneConfig")
    RequestHostedZoneConfig: RequestHostedZoneConfig,
}

structure RequestHostedZoneConfig {
    @xmlName("Comment")
    Comment: String,
}

structure CreateHostedZoneResult {
    @xmlName("ChangeInfo")
    ChangeInfo: ChangeInfo,
    @xmlName("DelegationSet")
    DelegationSet: DelegationSet,
    @xmlName("HostedZone")
    HostedZone: HostedZone,
}

structure ChangeInfo {
    @xmlName("Id")
    Id: String,
    @xmlName("Status")
    Status: String,
    @xmlName("SubmittedAt")
    SubmittedAt: String,
}

structure DeleteHostedZoneRequest {
    @required
    @httpLabel
    @xmlName("ZoneID")
    ZoneID: String,
}

structure DeleteHostedZoneResult {
    @xmlName("ChangeInfo")
    ChangeInfo: ChangeInfo,
}

@enum([
  {
      name: "NS",
      value: "NS",
  },
  {
      name: "A",
      value: "A",
  },
  {
      name: "AAAA",
      value: "AAAA",
  },
  {
      name: "CNAME",
      value: "CNAME",
  },
  {
      name: "MX",
      value: "MX",
  },
  {
      name: "TXT",
      value: "TXT",
  },
  {
      name: "PTR",
      value: "PTR",
  },
])
string TypeOfListResourceRecordSetsRequest

structure ListResourceRecordSetsRequest {
    @httpQuery("identifier")
    @xmlName("identifier")
    Identifier: String,
    @httpQuery("maxitems")
    @xmlName("maxitems")
    Maxitems: Integer,
    @httpQuery("name")
    @xmlName("name")
    Name: String,
    @httpQuery("type")
    @xmlName("type")
    Type: TypeOfListResourceRecordSetsRequest,
    @required
    @httpLabel
    @xmlName("ZoneID")
    ZoneID: String,
}

structure ListResourceRecordSetsResult {
    @xmlName("IsTruncated")
    IsTruncated: Boolean,
    @xmlName("MaxItems")
    MaxItems: Integer,
    @xmlName("NextRecordIdentifier")
    NextRecordIdentifier: String,
    @xmlName("NextRecordName")
    NextRecordName: String,
    @xmlName("NextRecordType")
    NextRecordType: String,
    @xmlName("ResourceRecordSets")
    ResourceRecordSets: ListOfResourceRecordSets,
}

list ListOfResourceRecordSets {
    @xmlName("ResourceRecordSet")
    member: ResourceRecordSets,
}

structure ResourceRecordSets {
    @xmlName("Failover")
    Failover: String,
    @xmlName("Name")
    Name: String,
    @xmlName("Region")
    Region: String,
    @xmlName("ResourceRecords")
    ResourceRecords: ListOfResourceRecords,
    @xmlName("SetIdentifier")
    SetIdentifier: String,
    @xmlName("TTL")
    TTL: Integer,
    @xmlName("Type")
    Type: String,
    @xmlName("Weight")
    Weight: Integer,
    @xmlName("XniftyComment")
    XniftyComment: String,
    @xmlName("XniftyHealthCheckConfig")
    XniftyHealthCheckConfig: XniftyHealthCheckConfig,
}

structure XniftyHealthCheckConfig {
    @xmlName("FullyQualifiedDomainName")
    FullyQualifiedDomainName: String,
    @xmlName("IPAddress")
    IPAddress: String,
    @xmlName("Port")
    Port: Integer,
    @xmlName("Protocol")
    Protocol: String,
    @xmlName("ResourcePath")
    ResourcePath: String,
}

list ListOfResourceRecords {
    @xmlName("ResourceRecord")
    member: ResourceRecords,
}

structure ResourceRecords {
    @xmlName("Value")
    Value: String,
}

@enum([
  {
      name: "CREATE",
      value: "CREATE",
  },
  {
      name: "DELETE",
      value: "DELETE",
  },
])
string ActionOfChangeResourceRecordSetsRequestForChangeResourceRecordSets

structure RequestChange {
    @required
    @xmlName("Action")
    Action: ActionOfChangeResourceRecordSetsRequestForChangeResourceRecordSets,
    @xmlName("ResourceRecordSet")
    RequestResourceRecordSet: RequestResourceRecordSet,
}

structure RequestChanges {
    @required
    @xmlName("Change")
    RequestChange: RequestChange,
}

list ListOfRequestChanges {
    member: RequestChanges,
}

structure RequestChangeBatch {
    @required
    @xmlFlattened
    @xmlName("Changes")
    ListOfRequestChanges: ListOfRequestChanges,
}

structure ChangeResourceRecordSetsRequest {
    @xmlName("Comment")
    Comment: String,
    @required
    @xmlName("ChangeBatch")
    RequestChangeBatch: RequestChangeBatch,
    @required
    @httpLabel
    @xmlName("ZoneID")
    ZoneID: String,
}

structure RequestResourceRecordSet {
    @xmlName("Failover")
    Failover: FailoverOfChangeResourceRecordSetsRequestForChangeResourceRecordSets,
    @xmlFlattened
    @xmlName("ResourceRecords")
    ListOfRequestResourceRecords: ListOfRequestResourceRecords,
    @xmlName("Name")
    Name: String,
    @xmlName("Region")
    Region: String,
    @xmlName("XniftyHealthCheckConfig")
    RequestXniftyHealthCheckConfig: RequestXniftyHealthCheckConfig,
    @xmlName("SetIdentifier")
    SetIdentifier: String,
    @xmlName("TTL")
    TTL: Integer,
    @xmlName("Type")
    Type: TypeOfChangeResourceRecordSetsRequestForChangeResourceRecordSets,
    @xmlName("Weight")
    Weight: Integer,
    @xmlName("XniftyComment")
    XniftyComment: String,
}

@enum([
  {
      name: "NS",
      value: "NS",
  },
  {
      name: "A",
      value: "A",
  },
  {
      name: "AAAA",
      value: "AAAA",
  },
  {
      name: "CNAME",
      value: "CNAME",
  },
  {
      name: "MX",
      value: "MX",
  },
  {
      name: "TXT",
      value: "TXT",
  },
  {
      name: "PTR",
      value: "PTR",
  },
])
string TypeOfChangeResourceRecordSetsRequestForChangeResourceRecordSets

@enum([
  {
      name: "PRIMARY",
      value: "PRIMARY",
  },
  {
      name: "SECONDARY",
      value: "SECONDARY",
  },
])
string FailoverOfChangeResourceRecordSetsRequestForChangeResourceRecordSets

structure RequestXniftyHealthCheckConfig {
    @xmlName("FullyQualifiedDomainName")
    FullyQualifiedDomainName: String,
    @xmlName("IPAddress")
    IPAddress: String,
    @xmlName("Port")
    Port: Integer,
    @xmlName("Protocol")
    Protocol: ProtocolOfChangeResourceRecordSetsRequestForChangeResourceRecordSets,
    @xmlName("ResourcePath")
    ResourcePath: String,
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
      name: "TCP",
      value: "TCP",
  },
])
string ProtocolOfChangeResourceRecordSetsRequestForChangeResourceRecordSets

structure RequestResourceRecord {
    @xmlName("Value")
    Value: String,
}

structure RequestResourceRecords {
    @xmlName("ResourceRecord")
    RequestResourceRecord: RequestResourceRecord,
}

list ListOfRequestResourceRecords {
    member: RequestResourceRecords,
}

structure ChangeResourceRecordSetsResult {
    @xmlName("ChangeInfo")
    ChangeInfo: ChangeInfo,
}

structure GetChangeRequest {
    @required
    @httpLabel
    @xmlName("ChangeID")
    ChangeID: String,
}

structure GetChangeResult {
    @xmlName("ChangeInfo")
    ChangeInfo: ChangeInfo,
}

@restXml
@xmlNamespace(uri: "https://route53.amazonaws.com/doc/2012-12-12/")
@service(
    sdkId: "dns",
    arnNamespace: "dns",
    endpointPrefix: "dns"
)
service DNS {
    version: "2012-12-12N2013-12-16",
    operations: [
        GetHostedZone,
        ListHostedZones,
        CreateHostedZone,
        DeleteHostedZone,
        ListResourceRecordSets,
        ChangeResourceRecordSets,
        GetChange,
    ],
}


@http(method: "GET", uri: "/2012-12-12N2013-12-16/hostedzone/{ZoneID}" )
@readonly
operation GetHostedZone {
    input: GetHostedZoneRequest,
    output: GetHostedZoneResult,
}

@http(method: "GET", uri: "/2012-12-12N2013-12-16/hostedzone" )
@readonly
operation ListHostedZones {
    input: ListHostedZonesRequest,
    output: ListHostedZonesResult,
}

@http(method: "POST", uri: "/2012-12-12N2013-12-16/hostedzone" )
operation CreateHostedZone {
    input: CreateHostedZoneRequest,
    output: CreateHostedZoneResult,
}

@http(method: "DELETE", uri: "/2012-12-12N2013-12-16/hostedzone/{ZoneID}" )
@idempotent
operation DeleteHostedZone {
    input: DeleteHostedZoneRequest,
    output: DeleteHostedZoneResult,
}

@http(method: "GET", uri: "/2012-12-12N2013-12-16/hostedzone/{ZoneID}/rrset" )
@readonly
operation ListResourceRecordSets {
    input: ListResourceRecordSetsRequest,
    output: ListResourceRecordSetsResult,
}

@http(method: "POST", uri: "/2012-12-12N2013-12-16/hostedzone/{ZoneID}/rrset" )
operation ChangeResourceRecordSets {
    input: ChangeResourceRecordSetsRequest,
    output: ChangeResourceRecordSetsResult,
}

@http(method: "GET", uri: "/2012-12-12N2013-12-16/change/{ChangeID}" )
@readonly
operation GetChange {
    input: GetChangeRequest,
    output: GetChangeResult,
}
