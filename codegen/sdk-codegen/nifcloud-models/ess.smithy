namespace com.nifcloud.api.ess

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
      name: "EMAIL_ADDRESS",
      value: "EmailAddress",
  },
  {
      name: "DOMAIN",
      value: "Domain",
  },
])
string IdentityTypeOfListIdentitiesRequest

structure ListIdentitiesRequest {
    @xmlName("IdentityType")
    IdentityType: IdentityTypeOfListIdentitiesRequest,
    @xmlName("MaxItems")
    MaxItems: Integer,
    @xmlName("NextToken")
    NextToken: String,
}

structure ListIdentitiesResult {
    @xmlName("Identities")
    Identities: ListOfIdentities,
    @xmlName("NextToken")
    NextToken: String,
    @xmlName("ResponseMetadata")
    ResponseMetadata: ResponseMetadata,
}

list ListOfIdentities {
    @xmlName("member")
    member: String,
}

structure ResponseMetadata {
    @xmlName("RequestId")
    RequestId: String,
}

structure VerifyDomainIdentityRequest {
    @required
    @xmlName("Domain")
    Domain: String,
}

structure VerifyDomainIdentityResult {
    @xmlName("ResponseMetadata")
    ResponseMetadata: ResponseMetadata,
    @xmlName("VerificationToken")
    VerificationToken: String,
}

structure VerifyEmailIdentityRequest {
    @required
    @xmlName("EmailAddress")
    EmailAddress: String,
}

structure VerifyEmailIdentityResult {
    @xmlName("ResponseMetadata")
    ResponseMetadata: ResponseMetadata,
    @xmlName("VerifyEmailIdentityResult")
    VerifyEmailIdentityResult: String,
}

list ListOfRequestIdentities {
    @xmlName("member")
    member: String,
}

structure GetIdentityVerificationAttributesRequest {
    @required
    @xmlName("Identities")
    Identities: ListOfRequestIdentities,
}

structure GetIdentityVerificationAttributesResult {
    @xmlName("ResponseMetadata")
    ResponseMetadata: ResponseMetadata,
    @xmlName("VerificationAttributes")
    VerificationAttributes: ListOfVerificationAttributes,
}

list ListOfVerificationAttributes {
    @xmlName("entry")
    member: VerificationAttributes,
}

structure VerificationAttributes {
    @xmlName("key")
    Key: String,
    @xmlName("value")
    Value: Value,
}

structure Value {
    @xmlName("VerificationStatus")
    VerificationStatus: String,
    @xmlName("VerificationToken")
    VerificationToken: String,
}

structure DeleteIdentityRequest {
    @required
    @xmlName("Identity")
    Identity: String,
}

structure DeleteIdentityResult {
    @xmlName("DeleteIdentityResult")
    DeleteIdentityResult: String,
    @xmlName("ResponseMetadata")
    ResponseMetadata: ResponseMetadata,
}

list ListOfRequestToAddresses {
    @xmlName("member")
    member: String,
}

structure RequestDestination {
    @xmlName("BccAddresses")
    ListOfRequestBccAddresses: ListOfRequestBccAddresses,
    @xmlName("CcAddresses")
    ListOfRequestCcAddresses: ListOfRequestCcAddresses,
    @xmlName("ToAddresses")
    ListOfRequestToAddresses: ListOfRequestToAddresses,
}

list ListOfRequestCcAddresses {
    @xmlName("member")
    member: String,
}

list ListOfRequestBccAddresses {
    @xmlName("member")
    member: String,
}

structure RequestSubject {
    @xmlName("Charset")
    Charset: String,
    @xmlName("Data")
    Data: String,
}

structure RequestMessage {
    @xmlName("Body")
    RequestBody: RequestBody,
    @xmlName("Subject")
    RequestSubject: RequestSubject,
}

structure RequestText {
    @xmlName("Charset")
    Charset: String,
    @xmlName("Data")
    Data: String,
}

structure RequestBody {
    @xmlName("Html")
    RequestHtml: RequestHtml,
    @xmlName("Text")
    RequestText: RequestText,
}

structure RequestHtml {
    @xmlName("Charset")
    Charset: String,
    @xmlName("Data")
    Data: String,
}

list ListOfRequestReplyToAddresses {
    @xmlName("member")
    member: String,
}

structure SendEmailRequest {
    @xmlName("Destination")
    Destination: RequestDestination,
    @xmlName("Message")
    Message: RequestMessage,
    @xmlName("ReplyToAddresses")
    ReplyToAddresses: ListOfRequestReplyToAddresses,
    @xmlName("ReturnPath")
    ReturnPath: String,
    @required
    @xmlName("Source")
    Source: String,
}

structure SendEmailResult {
    @xmlName("MessageId")
    MessageId: String,
    @xmlName("ResponseMetadata")
    ResponseMetadata: ResponseMetadata,
}

list ListOfRequestDestinations {
    @xmlName("member")
    member: String,
}

structure RequestRawMessage {
    @required
    @xmlName("Data")
    Data: String,
}

structure SendRawEmailRequest {
    @xmlName("Destinations")
    Destinations: ListOfRequestDestinations,
    @required
    @xmlName("RawMessage")
    RawMessage: RequestRawMessage,
    @xmlName("Source")
    Source: String,
}

structure SendRawEmailResult {
    @xmlName("MessageId")
    MessageId: String,
    @xmlName("ResponseMetadata")
    ResponseMetadata: ResponseMetadata,
}

structure GetSendQuotaRequest {}

structure GetSendQuotaResult {
    @xmlName("Max24HourSend")
    Max24HourSend: Double,
    @xmlName("MaxSendRate")
    MaxSendRate: Double,
    @xmlName("ResponseMetadata")
    ResponseMetadata: ResponseMetadata,
    @xmlName("SentLast24Hours")
    SentLast24Hours: Double,
}

structure GetSendStatisticsRequest {}

structure GetSendStatisticsResult {
    @xmlName("ResponseMetadata")
    ResponseMetadata: ResponseMetadata,
    @xmlName("SendDataPoints")
    SendDataPoints: ListOfSendDataPoints,
}

list ListOfSendDataPoints {
    @xmlName("member")
    member: SendDataPoints,
}

structure SendDataPoints {
    @xmlName("Bounces")
    Bounces: Integer,
    @xmlName("Complaints")
    Complaints: Integer,
    @xmlName("DeliveryAttempts")
    DeliveryAttempts: Integer,
    @xmlName("Rejects")
    Rejects: Integer,
    @xmlName("Timestamp")
    Timestamp: Timestamp,
}

structure GetIdentityDkimAttributesRequest {
    @required
    @xmlName("Identities")
    Identities: ListOfRequestIdentities,
}

structure GetIdentityDkimAttributesResult {
    @xmlName("DkimAttributes")
    DkimAttributes: ListOfDkimAttributes,
    @xmlName("ResponseMetadata")
    ResponseMetadata: ResponseMetadata,
}

list ListOfDkimAttributes {
    @xmlName("entry")
    member: DkimAttributes,
}

structure DkimAttributes {
    @xmlName("key")
    Key: String,
    @xmlName("value")
    Value: ValueOfGetIdentityDkimAttributes,
}

structure ValueOfGetIdentityDkimAttributes {
    @xmlName("DkimEnabled")
    DkimEnabled: Boolean,
    @xmlName("DkimTokens")
    DkimTokens: ListOfDkimTokens,
    @xmlName("DkimVerificationStatus")
    DkimVerificationStatus: String,
}

list ListOfDkimTokens {
    @xmlName("member")
    member: String,
}

structure VerifyDomainDkimRequest {
    @required
    @xmlName("Domain")
    Domain: String,
}

structure VerifyDomainDkimResult {
    @xmlName("DkimTokens")
    DkimTokens: ListOfDkimTokens,
    @xmlName("ResponseMetadata")
    ResponseMetadata: ResponseMetadata,
}

@enum([
  {
      name: "TRUE",
      value: "true",
  },
  {
      name: "FALSE",
      value: "false",
  },
])
string DkimEnabledOfSetIdentityDkimEnabledRequest

structure SetIdentityDkimEnabledRequest {
    @required
    @xmlName("DkimEnabled")
    DkimEnabled: DkimEnabledOfSetIdentityDkimEnabledRequest,
    @required
    @xmlName("Identity")
    Identity: String,
}

structure SetIdentityDkimEnabledResult {
    @xmlName("ResponseMetadata")
    ResponseMetadata: ResponseMetadata,
    @xmlName("SetIdentityDkimEnabledResult")
    SetIdentityDkimEnabledResult: String,
}

structure GetDeliveryLogRequest {
    @required
    @xmlName("EndDate")
    EndDate: Timestamp,
    @xmlName("MaxItems")
    MaxItems: Integer,
    @xmlName("NextToken")
    NextToken: String,
    @required
    @xmlName("StartDate")
    StartDate: Timestamp,
    @xmlName("Status")
    Status: Integer,
}

structure GetDeliveryLogResult {
    @xmlName("Log")
    Log: String,
    @xmlName("LogCount")
    LogCount: String,
    @xmlName("NextToken")
    NextToken: String,
    @xmlName("ResponseMetadata")
    ResponseMetadata: ResponseMetadata,
}

@awsQuery
@sigv4(name: "email")
@xmlNamespace(uri: "https://ess.api.nifcloud.com/")
@service(
    sdkId: "ess",
    arnNamespace: "ess",
    endpointPrefix: "ess"
)
service ESS {
    version: "2010-12-01N2014-05-28",
    operations: [
        ListIdentities,
        VerifyDomainIdentity,
        VerifyEmailIdentity,
        GetIdentityVerificationAttributes,
        DeleteIdentity,
        SendEmail,
        SendRawEmail,
        GetSendQuota,
        GetSendStatistics,
        GetIdentityDkimAttributes,
        VerifyDomainDkim,
        SetIdentityDkimEnabled,
        GetDeliveryLog,
    ],
}


operation ListIdentities {
    input: ListIdentitiesRequest,
    output: ListIdentitiesResult,
}

operation VerifyDomainIdentity {
    input: VerifyDomainIdentityRequest,
    output: VerifyDomainIdentityResult,
}

operation VerifyEmailIdentity {
    input: VerifyEmailIdentityRequest,
    output: VerifyEmailIdentityResult,
}

operation GetIdentityVerificationAttributes {
    input: GetIdentityVerificationAttributesRequest,
    output: GetIdentityVerificationAttributesResult,
}

operation DeleteIdentity {
    input: DeleteIdentityRequest,
}

operation SendEmail {
    input: SendEmailRequest,
    output: SendEmailResult,
}

operation SendRawEmail {
    input: SendRawEmailRequest,
    output: SendRawEmailResult,
}

operation GetSendQuota {
    input: GetSendQuotaRequest,
    output: GetSendQuotaResult,
}

operation GetSendStatistics {
    input: GetSendStatisticsRequest,
    output: GetSendStatisticsResult,
}

operation GetIdentityDkimAttributes {
    input: GetIdentityDkimAttributesRequest,
    output: GetIdentityDkimAttributesResult,
}

operation VerifyDomainDkim {
    input: VerifyDomainDkimRequest,
    output: VerifyDomainDkimResult,
}

operation SetIdentityDkimEnabled {
    input: SetIdentityDkimEnabledRequest,
}

operation GetDeliveryLog {
    input: GetDeliveryLogRequest,
    output: GetDeliveryLogResult,
}
