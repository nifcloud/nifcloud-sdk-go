namespace com.nifcloud.api.serviceactivity

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
      name: "USER",
      value: "user",
  },
  {
      name: "ALL",
      value: "all",
  },
])
string ModeOfDescribeServiceStatusesRequest

structure DescribeServiceStatusesRequest {
    @httpQuery("mode")
    @jsonName("mode")
    Mode: ModeOfDescribeServiceStatusesRequest,
}

structure Data {
    @jsonName("serviceMenu")
    ServiceMenu: ListOfServiceMenu,
}

list ListOfServiceMenu {
    member: ServiceMenu,
}

structure ServiceMenu {
    @jsonName("maintenanceStatus")
    MaintenanceStatus: String,
    @jsonName("name")
    Name: String,
    @jsonName("normalStatus")
    NormalStatus: String,
    @jsonName("services")
    Services: ListOfServices,
    @jsonName("troubleStatus")
    TroubleStatus: String,
}

list ListOfServices {
    member: Services,
}

structure Services {
    @jsonName("name")
    Name: String,
    @jsonName("statuses")
    Statuses: ListOfStatuses,
}

list ListOfStatuses {
    member: Statuses,
}

structure Statuses {
    @jsonName("location")
    Location: String,
    @jsonName("maintenanceStatus")
    MaintenanceStatus: String,
    @jsonName("normalStatus")
    NormalStatus: String,
    @jsonName("troubleStatus")
    TroubleStatus: String,
}

structure DescribeServiceStatusesResult {
    @jsonName("data")
    Data: Data,
    @jsonName("datetime")
    Datetime: String,
    @jsonName("requestID")
    RequestID: String,
}

@enum([
  {
      name: "USER",
      value: "user",
  },
  {
      name: "ALL",
      value: "all",
  },
])
string ModeOfDescribeEventCalendarRequest

structure DescribeEventCalendarRequest {
    @httpQuery("mode")
    @jsonName("mode")
    Mode: ModeOfDescribeEventCalendarRequest,
    @required
    @httpLabel
    @jsonName("YearMonth")
    YearMonth: String,
}

structure DataOfDescribeEventCalendar {
    @jsonName("calendar")
    Calendar: ListOfCalendar,
    @jsonName("mode")
    Mode: String,
    @jsonName("targetDate")
    TargetDate: String,
}

list ListOfCalendar {
    member: Calendar,
}

structure Calendar {
    @jsonName("cancelMaintenance")
    CancelMaintenance: String,
    @jsonName("completedMaintenance")
    CompletedMaintenance: String,
    @jsonName("day")
    Day: String,
    @jsonName("dayOfWeek")
    DayOfWeek: String,
    @jsonName("information")
    Information: String,
    @jsonName("maintenance")
    Maintenance: String,
    @jsonName("noTroubleImpact")
    NoTroubleImpact: String,
    @jsonName("recoveredTrouble")
    RecoveredTrouble: String,
    @jsonName("trouble")
    Trouble: String,
}

structure DescribeEventCalendarResult {
    @jsonName("data")
    Data: DataOfDescribeEventCalendar,
    @jsonName("datetime")
    Datetime: String,
    @jsonName("requestID")
    RequestID: String,
}

@enum([
  {
      name: "USER",
      value: "user",
  },
  {
      name: "ALL",
      value: "all",
  },
])
string ModeOfDescribeEventAttributesRequest

structure DescribeEventAttributesRequest {
    @httpQuery("location")
    @jsonName("location")
    Location: String,
    @httpQuery("mode")
    @jsonName("mode")
    Mode: ModeOfDescribeEventAttributesRequest,
    @required
    @httpLabel
    @jsonName("YearMonth")
    YearMonth: String,
}

structure DataOfDescribeEventAttributes {
    @jsonName("event")
    Event: ListOfEvent,
    @jsonName("mode")
    Mode: String,
    @jsonName("targetDate")
    TargetDate: String,
}

list ListOfEvent {
    member: Event,
}

structure Event {
    @jsonName("affectedServices")
    AffectedServices: ListOfAffectedServices,
    @jsonName("endAt")
    EndAt: String,
    @jsonName("eventHistories")
    EventHistories: ListOfEventHistories,
    @jsonName("eventID")
    EventID: String,
    @jsonName("eventStatus")
    EventStatus: String,
    @jsonName("startAt")
    StartAt: String,
}

list ListOfEventHistories {
    member: EventHistories,
}

structure EventHistories {
    @jsonName("date")
    Date: String,
    @jsonName("message")
    Message: String,
}

list ListOfAffectedServices {
    member: AffectedServices,
}

structure AffectedServices {
    @jsonName("endAt")
    EndAt: String,
    @jsonName("influence")
    Influence: String,
    @jsonName("location")
    Location: String,
    @jsonName("menu")
    Menu: String,
    @jsonName("number")
    Number: Integer,
    @jsonName("resources")
    Resources: ListOfResources,
    @jsonName("service")
    Service: String,
    @jsonName("startAt")
    StartAt: String,
    @jsonName("status")
    Status: String,
}

list ListOfResources {
    member: Resources,
}

structure Resources {
    @jsonName("diskName")
    DiskName: String,
    @jsonName("resourceName")
    ResourceName: String,
    @jsonName("resourceType")
    ResourceType: String,
}

structure DescribeEventAttributesResult {
    @jsonName("data")
    Data: DataOfDescribeEventAttributes,
    @jsonName("datetime")
    Datetime: String,
    @jsonName("requestID")
    RequestID: String,
}

@restJson1
@sigv4(name: "service-activity")
@service(
    sdkId: "serviceactivity",
    arnNamespace: "service-activity",
    endpointPrefix: "service-activity"
)
service ServiceActivity {
    version: "2020-11-25",
    operations: [
        DescribeServiceStatuses,
        DescribeEventCalendar,
        DescribeEventAttributes,
    ],
}


@http(method: "GET", uri: "/services/statuses" )
@readonly
operation DescribeServiceStatuses {
    input: DescribeServiceStatusesRequest,
    output: DescribeServiceStatusesResult,
}

@http(method: "GET", uri: "/events/calendars/{YearMonth}" )
@readonly
operation DescribeEventCalendar {
    input: DescribeEventCalendarRequest,
    output: DescribeEventCalendarResult,
}

@http(method: "GET", uri: "/events/attributes/{YearMonth}" )
@readonly
operation DescribeEventAttributes {
    input: DescribeEventAttributesRequest,
    output: DescribeEventAttributesResult,
}
