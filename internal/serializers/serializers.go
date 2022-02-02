package serializers

import (
	"fmt"
	"strings"
	"time"

	"github.com/aws/aws-sdk-go-v2/aws/protocol/query"
	smithytime "github.com/aws/smithy-go/time"
	"github.com/nifcloud/nifcloud-sdk-go/service/computing/types"
)

// SerializeDocumentRequestUserData convert UserData.Content to UserData
func SerializeDocumentRequestUserData(v *types.RequestUserData, value query.Value) error {
	object := value.Object()
	_ = object

	if v.Content != nil {
		value.String(*v.Content)
	}

	if v.Encoding != nil {
		objectKey := object.Key("Encoding")
		objectKey.String(*v.Encoding)
	}

	return nil
}

// SerializeDocumentListOfRequestLoadBalancerNames convert LoadBalancerNames.n.item to LoadBalancerNames.item.n
func SerializeDocumentListOfRequestLoadBalancerNames(v *types.ListOfRequestLoadBalancerNames, value query.Value) error {
	if len(v.Member) == 0 {
		return nil
	}

	object := value.Object()
	_ = object

	for i := range v.Member {
		instancePortKey := fmt.Sprintf("InstancePort.%d", i+1)
		loadBalancerNameKey := fmt.Sprintf("member.%d", i+1)
		loadBalancerPortKey := fmt.Sprintf("LoadBalancerPort.%d", i+1)

		if v.Member[i].InstancePort != nil {
			objectKey := object.Key(instancePortKey)
			objectKey.Integer(*v.Member[i].InstancePort)
		}

		if v.Member[i].LoadBalancerName != nil {
			objectKey := object.Key(loadBalancerNameKey)
			objectKey.String(*v.Member[i].LoadBalancerName)
		}

		if v.Member[i].LoadBalancerPort != nil {
			objectKey := object.Key(loadBalancerPortKey)
			objectKey.Integer(*v.Member[i].LoadBalancerPort)
		}

	}
	return nil
}

// FormatGetDeliveryLogDateTime formats value as a date-time, (%Y-%m-%dT%H:%M)
func FormatGetDeliveryLogDateTime(input string, value time.Time) string {
	const convertTimestampLayout = "2006-01-02T15:04"

	if strings.Contains(input, "GetDeliveryLog") {
		return value.Format(convertTimestampLayout)
	}

	return smithytime.FormatDateTime(value)
}

// FormatGetMetricStatisticsDateTime formats value as a date-time, (%Y-%m-%d %H:%M)
func FormatGetMetricStatisticsDateTime(input string, value time.Time) string {
	const convertTimestampLayout = "2006-01-02 15:04"

	if strings.Contains(input, "GetMetricStatistics") {
		return value.Format(convertTimestampLayout)
	}

	return smithytime.FormatDateTime(value)
}
