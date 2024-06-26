namespace com.nifcloud.api.devopsrunner

use aws.auth#sigv4
use aws.api#service
use aws.protocols#restJson1
use aws.protocols#restXml
use aws.protocols#awsQuery
use aws.protocols#ec2Query
use smithy.waiters#waitable
use aws.protocols#ec2QueryName


structure ListRunnersRequest {}

list ListOfRunners {
    member: Runners,
}

structure Runners {
    @jsonName("availabilityZone")
    AvailabilityZone: String,
    @jsonName("concurrent")
    Concurrent: Integer,
    @jsonName("createTime")
    CreateTime: String,
    @jsonName("description")
    Description: String,
    @jsonName("instanceType")
    InstanceType: String,
    @jsonName("networkConfig")
    NetworkConfig: NetworkConfig,
    @jsonName("publicIpAddress")
    PublicIpAddress: String,
    @jsonName("region")
    Region: String,
    @jsonName("runnerName")
    RunnerName: String,
    @jsonName("runnerVersion")
    RunnerVersion: String,
    @jsonName("status")
    Status: Status,
    @jsonName("systemId")
    SystemId: String,
}

structure NetworkConfig {
    @jsonName("networkId")
    NetworkId: String,
    @jsonName("privateAddress")
    PrivateAddress: String,
}

structure Status {
    @jsonName("code")
    Code: Integer,
    @jsonName("name")
    Name: String,
}

structure ListRunnersResult {
    @jsonName("runners")
    Runners: ListOfRunners,
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
      name: "WEST_11",
      value: "west-11",
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
string AvailabilityZoneOfCreateRunnerRequest

@enum([
  {
      name: "C_SMALL",
      value: "c-small",
  },
  {
      name: "C_SMALL2",
      value: "c-small2",
  },
  {
      name: "C_SMALL4",
      value: "c-small4",
  },
  {
      name: "C_MEDIUM",
      value: "c-medium",
  },
  {
      name: "C_MEDIUM4",
      value: "c-medium4",
  },
  {
      name: "C_MEDIUM8",
      value: "c-medium8",
  },
  {
      name: "C_LARGE",
      value: "c-large",
  },
  {
      name: "C_LARGE8",
      value: "c-large8",
  },
  {
      name: "E_SMALL",
      value: "e-small",
  },
  {
      name: "E_SMALL2",
      value: "e-small2",
  },
  {
      name: "E_SMALL4",
      value: "e-small4",
  },
  {
      name: "E_SMALL8",
      value: "e-small8",
  },
  {
      name: "E_SMALL16",
      value: "e-small16",
  },
  {
      name: "E_MEDIUM",
      value: "e-medium",
  },
  {
      name: "E_MEDIUM4",
      value: "e-medium4",
  },
  {
      name: "E_MEDIUM8",
      value: "e-medium8",
  },
  {
      name: "E_MEDIUM16",
      value: "e-medium16",
  },
  {
      name: "E_MEDIUM24",
      value: "e-medium24",
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
      name: "E_DOUBLE_LARGE16",
      value: "e-double-large16",
  },
  {
      name: "E_DOUBLE_LARGE24",
      value: "e-double-large24",
  },
  {
      name: "H2_SMALL",
      value: "h2-small",
  },
  {
      name: "H2_SMALL2",
      value: "h2-small2",
  },
  {
      name: "H2_SMALL4",
      value: "h2-small4",
  },
  {
      name: "H2_SMALL8",
      value: "h2-small8",
  },
  {
      name: "H2_SMALL16",
      value: "h2-small16",
  },
  {
      name: "H2_MEDIUM",
      value: "h2-medium",
  },
  {
      name: "H2_MEDIUM4",
      value: "h2-medium4",
  },
  {
      name: "H2_MEDIUM8",
      value: "h2-medium8",
  },
  {
      name: "H2_MEDIUM16",
      value: "h2-medium16",
  },
  {
      name: "H2_MEDIUM24",
      value: "h2-medium24",
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
      name: "H2_DOUBLE_LARGE16",
      value: "h2-double-large16",
  },
  {
      name: "H2_DOUBLE_LARGE24",
      value: "h2-double-large24",
  },
])
string InstanceTypeOfCreateRunnerRequest

structure RequestNetworkConfig {
    @jsonName("networkId")
    NetworkId: String,
    @jsonName("privateAddress")
    PrivateAddress: String,
}

structure CreateRunnerRequest {
    @jsonName("availabilityZone")
    AvailabilityZone: AvailabilityZoneOfCreateRunnerRequest,
    @jsonName("concurrent")
    Concurrent: Integer,
    @jsonName("description")
    Description: String,
    @required
    @jsonName("instanceType")
    InstanceType: InstanceTypeOfCreateRunnerRequest,
    @jsonName("networkConfig")
    NetworkConfig: RequestNetworkConfig,
    @required
    @jsonName("runnerName")
    RunnerName: String,
}

structure Runner {
    @jsonName("availabilityZone")
    AvailabilityZone: String,
    @jsonName("concurrent")
    Concurrent: Integer,
    @jsonName("createTime")
    CreateTime: String,
    @jsonName("description")
    Description: String,
    @jsonName("instanceType")
    InstanceType: String,
    @jsonName("networkConfig")
    NetworkConfig: NetworkConfig,
    @jsonName("publicIpAddress")
    PublicIpAddress: String,
    @jsonName("region")
    Region: String,
    @jsonName("runnerName")
    RunnerName: String,
    @jsonName("runnerVersion")
    RunnerVersion: String,
    @jsonName("status")
    Status: Status,
    @jsonName("systemId")
    SystemId: String,
}

structure CreateRunnerResult {
    @jsonName("runner")
    Runner: Runner,
}

structure GetRunnerRequest {
    @required
    @httpLabel
    @jsonName("RunnerName")
    RunnerName: String,
}

structure GetRunnerResult {
    @jsonName("runner")
    Runner: Runner,
}

structure UpdateRunnerRequest {
    @jsonName("changedRunnerName")
    ChangedRunnerName: String,
    @jsonName("concurrent")
    Concurrent: Integer,
    @jsonName("description")
    Description: String,
    @required
    @httpLabel
    @jsonName("RunnerName")
    RunnerName: String,
}

structure UpdateRunnerResult {
    @jsonName("runner")
    Runner: Runner,
}

structure DeleteRunnerRequest {
    @required
    @httpLabel
    @jsonName("RunnerName")
    RunnerName: String,
}

structure DeleteRunnerResult {
    @jsonName("runner")
    Runner: Runner,
}

@enum([
  {
      name: "C_SMALL",
      value: "c-small",
  },
  {
      name: "C_SMALL2",
      value: "c-small2",
  },
  {
      name: "C_SMALL4",
      value: "c-small4",
  },
  {
      name: "C_MEDIUM",
      value: "c-medium",
  },
  {
      name: "C_MEDIUM4",
      value: "c-medium4",
  },
  {
      name: "C_MEDIUM8",
      value: "c-medium8",
  },
  {
      name: "C_LARGE",
      value: "c-large",
  },
  {
      name: "C_LARGE8",
      value: "c-large8",
  },
  {
      name: "E_SMALL",
      value: "e-small",
  },
  {
      name: "E_SMALL2",
      value: "e-small2",
  },
  {
      name: "E_SMALL4",
      value: "e-small4",
  },
  {
      name: "E_SMALL8",
      value: "e-small8",
  },
  {
      name: "E_SMALL16",
      value: "e-small16",
  },
  {
      name: "E_MEDIUM",
      value: "e-medium",
  },
  {
      name: "E_MEDIUM4",
      value: "e-medium4",
  },
  {
      name: "E_MEDIUM8",
      value: "e-medium8",
  },
  {
      name: "E_MEDIUM16",
      value: "e-medium16",
  },
  {
      name: "E_MEDIUM24",
      value: "e-medium24",
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
      name: "E_DOUBLE_LARGE16",
      value: "e-double-large16",
  },
  {
      name: "E_DOUBLE_LARGE24",
      value: "e-double-large24",
  },
  {
      name: "H2_SMALL",
      value: "h2-small",
  },
  {
      name: "H2_SMALL2",
      value: "h2-small2",
  },
  {
      name: "H2_SMALL4",
      value: "h2-small4",
  },
  {
      name: "H2_SMALL8",
      value: "h2-small8",
  },
  {
      name: "H2_SMALL16",
      value: "h2-small16",
  },
  {
      name: "H2_MEDIUM",
      value: "h2-medium",
  },
  {
      name: "H2_MEDIUM4",
      value: "h2-medium4",
  },
  {
      name: "H2_MEDIUM8",
      value: "h2-medium8",
  },
  {
      name: "H2_MEDIUM16",
      value: "h2-medium16",
  },
  {
      name: "H2_MEDIUM24",
      value: "h2-medium24",
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
      name: "H2_DOUBLE_LARGE16",
      value: "h2-double-large16",
  },
  {
      name: "H2_DOUBLE_LARGE24",
      value: "h2-double-large24",
  },
])
string InstanceTypeOfModifyRunnerInstanceTypeRequest

structure ModifyRunnerInstanceTypeRequest {
    @required
    @jsonName("instanceType")
    InstanceType: InstanceTypeOfModifyRunnerInstanceTypeRequest,
    @required
    @httpLabel
    @jsonName("RunnerName")
    RunnerName: String,
}

structure ModifyRunnerInstanceTypeResult {
    @jsonName("runner")
    Runner: Runner,
}

structure ListRunnerRegistrationsRequest {
    @required
    @httpLabel
    @jsonName("RunnerName")
    RunnerName: String,
}

list ListOfRegistrations {
    member: Registrations,
}

structure Registrations {
    @jsonName("gitlabUrl")
    GitlabUrl: String,
    @jsonName("parameterGroupName")
    ParameterGroupName: String,
    @jsonName("registrationId")
    RegistrationId: String,
    @jsonName("status")
    Status: Status,
    @jsonName("token")
    Token: String,
}

structure ListRunnerRegistrationsResult {
    @jsonName("registrations")
    Registrations: ListOfRegistrations,
}

structure RequestExtraHosts {
    @jsonName("hostName")
    HostName: String,
    @jsonName("ipAddress")
    IpAddress: String,
}

list ListOfRequestExtraHosts {
    member: RequestExtraHosts,
}

structure RegisterRunnerRequest {
    @required
    @jsonName("authenticationToken")
    AuthenticationToken: String,
    @jsonName("defaultDockerImage")
    DefaultDockerImage: String,
    @jsonName("extraHosts")
    ExtraHosts: ListOfRequestExtraHosts,
    @required
    @jsonName("gitlabUrl")
    GitlabUrl: String,
    @jsonName("parameterGroupName")
    ParameterGroupName: String,
    @jsonName("privileged")
    Privileged: Boolean,
    @required
    @httpLabel
    @jsonName("RunnerName")
    RunnerName: String,
}

structure RegisterRunnerResult {
    @jsonName("runner")
    Runner: Runner,
}

structure UpdateRunnerRegistrationRequest {
    @required
    @jsonName("parameterGroupName")
    ParameterGroupName: String,
    @required
    @httpLabel
    @jsonName("RegistrationId")
    RegistrationId: String,
    @required
    @httpLabel
    @jsonName("RunnerName")
    RunnerName: String,
}

structure UpdateRunnerRegistrationResult {
    @jsonName("runner")
    Runner: Runner,
}

structure UnregisterRunnerRequest {
    @required
    @httpLabel
    @jsonName("RegistrationId")
    RegistrationId: String,
    @required
    @httpLabel
    @jsonName("RunnerName")
    RunnerName: String,
}

structure UnregisterRunnerResult {
    @jsonName("runner")
    Runner: Runner,
}

structure ListRunnerParameterGroupsRequest {}

list ListOfParameterGroups {
    member: ParameterGroups,
}

structure ParameterGroups {
    @jsonName("createTime")
    CreateTime: String,
    @jsonName("description")
    Description: String,
    @jsonName("dockerParameters")
    DockerParameters: DockerParameters,
    @jsonName("parameterGroupName")
    ParameterGroupName: String,
    @jsonName("region")
    Region: String,
    @jsonName("runnerNames")
    RunnerNames: ListOfRunnerNames,
}

structure DockerParameters {
    @jsonName("disableCache")
    DisableCache: Boolean,
    @jsonName("disableEntrypointOverwrite")
    DisableEntrypointOverwrite: Boolean,
    @jsonName("extraHosts")
    ExtraHosts: ListOfExtraHosts,
    @jsonName("image")
    Image: String,
    @jsonName("oomKillDisable")
    OomKillDisable: Boolean,
    @jsonName("privileged")
    Privileged: Boolean,
    @jsonName("shmSize")
    ShmSize: Integer,
    @jsonName("tlsVerify")
    TlsVerify: Boolean,
    @jsonName("volumes")
    Volumes: ListOfVolumes,
}

list ListOfExtraHosts {
    member: ExtraHosts,
}

structure ExtraHosts {
    @jsonName("hostName")
    HostName: String,
    @jsonName("ipAddress")
    IpAddress: String,
}

list ListOfVolumes {
    member: String,
}

list ListOfRunnerNames {
    member: String,
}

structure ListRunnerParameterGroupsResult {
    @jsonName("parameterGroups")
    ParameterGroups: ListOfParameterGroups,
}

structure CreateRunnerParameterGroupRequest {
    @jsonName("description")
    Description: String,
    @required
    @jsonName("parameterGroupName")
    ParameterGroupName: String,
}

structure ParameterGroup {
    @jsonName("createTime")
    CreateTime: String,
    @jsonName("description")
    Description: String,
    @jsonName("dockerParameters")
    DockerParameters: DockerParameters,
    @jsonName("parameterGroupName")
    ParameterGroupName: String,
    @jsonName("region")
    Region: String,
    @jsonName("runnerNames")
    RunnerNames: ListOfRunnerNames,
}

structure CreateRunnerParameterGroupResult {
    @jsonName("parameterGroup")
    ParameterGroup: ParameterGroup,
}

structure GetRunnerParameterGroupRequest {
    @required
    @httpLabel
    @jsonName("ParameterGroupName")
    ParameterGroupName: String,
}

structure GetRunnerParameterGroupResult {
    @jsonName("parameterGroup")
    ParameterGroup: ParameterGroup,
}

structure UpdateRunnerParameterGroupRequest {
    @jsonName("changedParameterGroupName")
    ChangedParameterGroupName: String,
    @jsonName("description")
    Description: String,
    @required
    @httpLabel
    @jsonName("ParameterGroupName")
    ParameterGroupName: String,
}

structure UpdateRunnerParameterGroupResult {
    @jsonName("parameterGroup")
    ParameterGroup: ParameterGroup,
}

structure DeleteRunnerParameterGroupRequest {
    @required
    @httpLabel
    @jsonName("ParameterGroupName")
    ParameterGroupName: String,
}

structure RequestDockerParameters {
    @jsonName("disableCache")
    DisableCache: Boolean,
    @jsonName("disableEntrypointOverwrite")
    DisableEntrypointOverwrite: Boolean,
    @jsonName("image")
    Image: String,
    @jsonName("extraHosts")
    ListOfRequestExtraHosts: ListOfRequestExtraHosts,
    @jsonName("volumes")
    ListOfRequestVolumes: ListOfRequestVolumes,
    @jsonName("oomKillDisable")
    OomKillDisable: Boolean,
    @jsonName("privileged")
    Privileged: Boolean,
    @jsonName("shmSize")
    ShmSize: Integer,
    @jsonName("tlsVerify")
    TlsVerify: Boolean,
}

list ListOfRequestVolumes {
    member: String,
}

structure UpdateRunnerParameterRequest {
    @jsonName("dockerParameters")
    DockerParameters: RequestDockerParameters,
    @required
    @httpLabel
    @jsonName("ParameterGroupName")
    ParameterGroupName: String,
}

structure UpdateRunnerParameterResult {
    @jsonName("parameterGroup")
    ParameterGroup: ParameterGroup,
}

@restJson1
@sigv4(name: "devops")
@service(
    sdkId: "devopsrunner",
    arnNamespace: "devops-runner",
    endpointPrefix: "runner.devops"
)
service DevOpswithGitLabRunner {
    version: "v1",
    operations: [
        ListRunners,
        CreateRunner,
        GetRunner,
        UpdateRunner,
        DeleteRunner,
        ModifyRunnerInstanceType,
        ListRunnerRegistrations,
        RegisterRunner,
        UpdateRunnerRegistration,
        UnregisterRunner,
        ListRunnerParameterGroups,
        CreateRunnerParameterGroup,
        GetRunnerParameterGroup,
        UpdateRunnerParameterGroup,
        DeleteRunnerParameterGroup,
        UpdateRunnerParameter,
    ],
}


@http(method: "GET", uri: "/v1/runners" )
@readonly
operation ListRunners {
    input: ListRunnersRequest,
    output: ListRunnersResult,
}

@http(method: "POST", uri: "/v1/runners" )
operation CreateRunner {
    input: CreateRunnerRequest,
    output: CreateRunnerResult,
}

@http(method: "GET", uri: "/v1/runners/{RunnerName}" )
@readonly
operation GetRunner {
    input: GetRunnerRequest,
    output: GetRunnerResult,
}

@http(method: "PUT", uri: "/v1/runners/{RunnerName}" )
@idempotent
operation UpdateRunner {
    input: UpdateRunnerRequest,
    output: UpdateRunnerResult,
}

@http(method: "DELETE", uri: "/v1/runners/{RunnerName}" )
@idempotent
operation DeleteRunner {
    input: DeleteRunnerRequest,
    output: DeleteRunnerResult,
}

@http(method: "POST", uri: "/v1/runners/{RunnerName}/:modifyInstanceType" )
operation ModifyRunnerInstanceType {
    input: ModifyRunnerInstanceTypeRequest,
    output: ModifyRunnerInstanceTypeResult,
}

@http(method: "GET", uri: "/v1/runners/{RunnerName}/registrations" )
@readonly
operation ListRunnerRegistrations {
    input: ListRunnerRegistrationsRequest,
    output: ListRunnerRegistrationsResult,
}

@http(method: "POST", uri: "/v1/runners/{RunnerName}/registrations" )
operation RegisterRunner {
    input: RegisterRunnerRequest,
    output: RegisterRunnerResult,
}

@http(method: "PUT", uri: "/v1/runners/{RunnerName}/registrations/{RegistrationId}" )
@idempotent
operation UpdateRunnerRegistration {
    input: UpdateRunnerRegistrationRequest,
    output: UpdateRunnerRegistrationResult,
}

@http(method: "DELETE", uri: "/v1/runners/{RunnerName}/registrations/{RegistrationId}" )
@idempotent
operation UnregisterRunner {
    input: UnregisterRunnerRequest,
    output: UnregisterRunnerResult,
}

@http(method: "GET", uri: "/v1/parameterGroups" )
@readonly
operation ListRunnerParameterGroups {
    input: ListRunnerParameterGroupsRequest,
    output: ListRunnerParameterGroupsResult,
}

@http(method: "POST", uri: "/v1/parameterGroups" )
operation CreateRunnerParameterGroup {
    input: CreateRunnerParameterGroupRequest,
    output: CreateRunnerParameterGroupResult,
}

@http(method: "GET", uri: "/v1/parameterGroups/{ParameterGroupName}" )
@readonly
operation GetRunnerParameterGroup {
    input: GetRunnerParameterGroupRequest,
    output: GetRunnerParameterGroupResult,
}

@http(method: "PUT", uri: "/v1/parameterGroups/{ParameterGroupName}" )
@idempotent
operation UpdateRunnerParameterGroup {
    input: UpdateRunnerParameterGroupRequest,
    output: UpdateRunnerParameterGroupResult,
}

@http(method: "DELETE", uri: "/v1/parameterGroups/{ParameterGroupName}" )
@idempotent
operation DeleteRunnerParameterGroup {
    input: DeleteRunnerParameterGroupRequest,
}

@http(method: "POST", uri: "/v1/parameterGroups/{ParameterGroupName}/:updateParameter" )
operation UpdateRunnerParameter {
    input: UpdateRunnerParameterRequest,
    output: UpdateRunnerParameterResult,
}
