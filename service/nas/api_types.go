// Code generated by private/model/cli/gen-api/main.go. DO NOT EDIT.

package nas

import (
	"time"

	"github.com/aws/aws-sdk-go-v2/aws"
	"github.com/nifcloud/nifcloud-sdk-go/internal/nifcloudutil"
)

var _ aws.Config
var _ = nifcloudutil.Prettify

type Datapoints struct {
	_ struct{} `type:"structure"`

	SampleCount *int64 `locationName:"SampleCount" type:"integer"`

	Sum *int64 `locationName:"Sum" type:"integer"`

	TargetName *string `locationName:"TargetName" type:"string"`

	Timestamp *time.Time `locationName:"Timestamp" type:"timestamp"`
}

// String returns the string representation
func (s Datapoints) String() string {
	return nifcloudutil.Prettify(s)
}

type DomainControllers struct {
	_ struct{} `type:"structure"`

	Hostname *string `locationName:"Hostname" type:"string"`

	IPAddress *string `locationName:"IPAddress" type:"string"`
}

// String returns the string representation
func (s DomainControllers) String() string {
	return nifcloudutil.Prettify(s)
}

type Endpoint struct {
	_ struct{} `type:"structure"`

	Address *string `locationName:"Address" type:"string"`

	PrivateAddress *string `locationName:"PrivateAddress" type:"string"`
}

// String returns the string representation
func (s Endpoint) String() string {
	return nifcloudutil.Prettify(s)
}

type IPRanges struct {
	_ struct{} `type:"structure"`

	CIDRIP *string `locationName:"CIDRIP" type:"string"`

	Status *string `locationName:"Status" type:"string"`
}

// String returns the string representation
func (s IPRanges) String() string {
	return nifcloudutil.Prettify(s)
}

type NASInstance struct {
	_ struct{} `type:"structure"`

	AllocatedStorage *int64 `locationName:"AllocatedStorage" type:"integer"`

	AuthenticationType *int64 `locationName:"AuthenticationType" type:"integer"`

	AvailabilityZone *string `locationName:"AvailabilityZone" type:"string"`

	DirectoryServiceDomainName *string `locationName:"DirectoryServiceDomainName" type:"string"`

	DomainControllers []DomainControllers `locationName:"DomainControllers" locationNameList:"DomainController" type:"list"`

	Endpoint *Endpoint `locationName:"Endpoint" type:"structure"`

	MasterUsername *string `locationName:"MasterUsername" type:"string"`

	NASInstanceDescription *string `locationName:"NASInstanceDescription" type:"string"`

	NASInstanceErrorInfo *NASInstanceErrorInfo `locationName:"NASInstanceErrorInfo" type:"structure"`

	NASInstanceIdentifier *string `locationName:"NASInstanceIdentifier" type:"string"`

	NASInstanceStatus *string `locationName:"NASInstanceStatus" type:"string"`

	NASInstanceType *int64 `locationName:"NASInstanceType" type:"integer"`

	NASSecurityGroups []NASSecurityGroups `locationName:"NASSecurityGroups" locationNameList:"NASSecurityGroup" type:"list"`

	NetworkId *string `locationName:"NetworkId" type:"string"`

	NoRootSquash *bool `locationName:"NoRootSquash" type:"boolean"`

	Protocol *string `locationName:"Protocol" type:"string"`

	StorageType *int64 `locationName:"StorageType" type:"integer"`

	UpgradeRequired *bool `locationName:"UpgradeRequired" type:"boolean"`
}

// String returns the string representation
func (s NASInstance) String() string {
	return nifcloudutil.Prettify(s)
}

type NASInstanceErrorInfo struct {
	_ struct{} `type:"structure"`

	NASInstanceErrorCode *string `locationName:"NASInstanceErrorCode" type:"string"`

	NASInstanceErrorMessage *string `locationName:"NASInstanceErrorMessage" type:"string"`
}

// String returns the string representation
func (s NASInstanceErrorInfo) String() string {
	return nifcloudutil.Prettify(s)
}

type NASInstances struct {
	_ struct{} `type:"structure"`

	AllocatedStorage *int64 `locationName:"AllocatedStorage" type:"integer"`

	AuthenticationType *int64 `locationName:"AuthenticationType" type:"integer"`

	AvailabilityZone *string `locationName:"AvailabilityZone" type:"string"`

	DirectoryServiceDomainName *string `locationName:"DirectoryServiceDomainName" type:"string"`

	DomainControllers []DomainControllers `locationName:"DomainControllers" locationNameList:"DomainController" type:"list"`

	Endpoint *Endpoint `locationName:"Endpoint" type:"structure"`

	MasterUsername *string `locationName:"MasterUsername" type:"string"`

	NASInstanceDescription *string `locationName:"NASInstanceDescription" type:"string"`

	NASInstanceErrorInfo *NASInstanceErrorInfo `locationName:"NASInstanceErrorInfo" type:"structure"`

	NASInstanceIdentifier *string `locationName:"NASInstanceIdentifier" type:"string"`

	NASInstanceStatus *string `locationName:"NASInstanceStatus" type:"string"`

	NASInstanceType *int64 `locationName:"NASInstanceType" type:"integer"`

	NASSecurityGroups []NASSecurityGroups `locationName:"NASSecurityGroups" locationNameList:"NASSecurityGroup" type:"list"`

	NetworkId *string `locationName:"NetworkId" type:"string"`

	NoRootSquash *bool `locationName:"NoRootSquash" type:"boolean"`

	Protocol *string `locationName:"Protocol" type:"string"`

	StorageType *int64 `locationName:"StorageType" type:"integer"`

	UpgradeRequired *bool `locationName:"UpgradeRequired" type:"boolean"`
}

// String returns the string representation
func (s NASInstances) String() string {
	return nifcloudutil.Prettify(s)
}

type NASSecurityGroup struct {
	_ struct{} `type:"structure"`

	AvailabilityZone *string `locationName:"AvailabilityZone" type:"string"`

	IPRanges []IPRanges `locationName:"IPRanges" locationNameList:"IPRange" type:"list"`

	NASSecurityGroupDescription *string `locationName:"NASSecurityGroupDescription" type:"string"`

	NASSecurityGroupName *string `locationName:"NASSecurityGroupName" type:"string"`

	OwnerId *string `locationName:"OwnerId" type:"string"`

	SecurityGroups []SecurityGroups `locationName:"SecurityGroups" locationNameList:"SecurityGroup" type:"list"`
}

// String returns the string representation
func (s NASSecurityGroup) String() string {
	return nifcloudutil.Prettify(s)
}

type NASSecurityGroups struct {
	_ struct{} `type:"structure"`

	NASSecurityGroupName *string `locationName:"NASSecurityGroupName" type:"string"`

	Status *string `locationName:"Status" type:"string"`
}

// String returns the string representation
func (s NASSecurityGroups) String() string {
	return nifcloudutil.Prettify(s)
}

type NASSecurityGroupsOfDescribeNASSecurityGroups struct {
	_ struct{} `type:"structure"`

	AvailabilityZone *string `locationName:"AvailabilityZone" type:"string"`

	IPRanges []IPRanges `locationName:"IPRanges" locationNameList:"IPRange" type:"list"`

	NASSecurityGroupDescription *string `locationName:"NASSecurityGroupDescription" type:"string"`

	NASSecurityGroupName *string `locationName:"NASSecurityGroupName" type:"string"`

	OwnerId *string `locationName:"OwnerId" type:"string"`

	SecurityGroups []SecurityGroups `locationName:"SecurityGroups" locationNameList:"SecurityGroup" type:"list"`
}

// String returns the string representation
func (s NASSecurityGroupsOfDescribeNASSecurityGroups) String() string {
	return nifcloudutil.Prettify(s)
}

type RequestDimensions struct {
	_ struct{} `type:"structure"`

	// Name is a required field
	Name *string `locationName:"Name" type:"string" required:"true"`

	// Value is a required field
	Value *string `locationName:"Value" type:"string" required:"true"`
}

// String returns the string representation
func (s RequestDimensions) String() string {
	return nifcloudutil.Prettify(s)
}

// Validate inspects the fields of the type to determine if they are valid.
func (s *RequestDimensions) Validate() error {
	invalidParams := aws.ErrInvalidParams{Context: "RequestDimensions"}

	if s.Name == nil {
		invalidParams.Add(aws.NewErrParamRequired("Name"))
	}

	if s.Value == nil {
		invalidParams.Add(aws.NewErrParamRequired("Value"))
	}

	if invalidParams.Len() > 0 {
		return invalidParams
	}
	return nil
}

type RequestDomainControllers struct {
	_ struct{} `type:"structure"`

	Hostname *string `locationName:"Hostname" type:"string"`

	IPAddress *string `locationName:"IPAddress" type:"string"`
}

// String returns the string representation
func (s RequestDomainControllers) String() string {
	return nifcloudutil.Prettify(s)
}

type ResponseMetadata struct {
	_ struct{} `type:"structure"`

	RequestId *string `locationName:"RequestId" type:"string"`
}

// String returns the string representation
func (s ResponseMetadata) String() string {
	return nifcloudutil.Prettify(s)
}

type SecurityGroups struct {
	_ struct{} `type:"structure"`

	SecurityGroupName *string `locationName:"SecurityGroupName" type:"string"`

	SecurityGroupOwnerId *string `locationName:"SecurityGroupOwnerId" type:"string"`

	Status *string `locationName:"Status" type:"string"`
}

// String returns the string representation
func (s SecurityGroups) String() string {
	return nifcloudutil.Prettify(s)
}
