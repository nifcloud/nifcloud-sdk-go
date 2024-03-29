// Code generated by smithy-go-codegen DO NOT EDIT.

package computing

import (
	"context"
	awsmiddleware "github.com/aws/aws-sdk-go-v2/aws/middleware"
	"github.com/aws/smithy-go/middleware"
	smithyhttp "github.com/aws/smithy-go/transport/http"
	"github.com/nifcloud/nifcloud-sdk-go/service/computing/types"
)

func (c *Client) NiftyCreateAlarm(ctx context.Context, params *NiftyCreateAlarmInput, optFns ...func(*Options)) (*NiftyCreateAlarmOutput, error) {
	if params == nil {
		params = &NiftyCreateAlarmInput{}
	}

	result, metadata, err := c.invokeOperation(ctx, "NiftyCreateAlarm", params, optFns, c.addOperationNiftyCreateAlarmMiddlewares)
	if err != nil {
		return nil, err
	}

	out := result.(*NiftyCreateAlarmOutput)
	out.ResultMetadata = metadata
	return out, nil
}

type NiftyCreateAlarmInput struct {

	// This member is required.
	EmailAddress []string

	// This member is required.
	FunctionName types.FunctionNameOfNiftyCreateAlarmRequest

	// This member is required.
	Rule []types.RequestRule

	AlarmCondition types.AlarmConditionOfNiftyCreateAlarmRequest

	Description *string

	ElasticLoadBalancerName []string

	ElasticLoadBalancerPort []int32

	ElasticLoadBalancerProtocol []string

	InstanceId []string

	LoadBalancerName []string

	LoadBalancerPort []int32

	Partition []string

	RuleName *string

	Zone *string

	noSmithyDocumentSerde
}

type NiftyCreateAlarmOutput struct {
	RequestId *string

	Return *bool

	// Metadata pertaining to the operation's result.
	ResultMetadata middleware.Metadata

	noSmithyDocumentSerde
}

func (c *Client) addOperationNiftyCreateAlarmMiddlewares(stack *middleware.Stack, options Options) (err error) {
	err = stack.Serialize.Add(&awsEc2query_serializeOpNiftyCreateAlarm{}, middleware.After)
	if err != nil {
		return err
	}
	err = stack.Deserialize.Add(&awsEc2query_deserializeOpNiftyCreateAlarm{}, middleware.After)
	if err != nil {
		return err
	}
	if err = addSetLoggerMiddleware(stack, options); err != nil {
		return err
	}
	if err = awsmiddleware.AddClientRequestIDMiddleware(stack); err != nil {
		return err
	}
	if err = smithyhttp.AddComputeContentLengthMiddleware(stack); err != nil {
		return err
	}
	if err = addResolveEndpointMiddleware(stack, options); err != nil {
		return err
	}
	if err = addRetryMiddlewares(stack, options); err != nil {
		return err
	}
	if err = addHTTPSignerV2Middleware(stack, options); err != nil {
		return err
	}
	if err = awsmiddleware.AddRawResponseToMetadata(stack); err != nil {
		return err
	}
	if err = awsmiddleware.AddRecordResponseTiming(stack); err != nil {
		return err
	}
	if err = addClientUserAgent(stack); err != nil {
		return err
	}
	if err = smithyhttp.AddErrorCloseResponseBodyMiddleware(stack); err != nil {
		return err
	}
	if err = smithyhttp.AddCloseResponseBodyMiddleware(stack); err != nil {
		return err
	}
	if err = addOpNiftyCreateAlarmValidationMiddleware(stack); err != nil {
		return err
	}
	if err = stack.Initialize.Add(newServiceMetadataMiddleware_opNiftyCreateAlarm(options.Region), middleware.Before); err != nil {
		return err
	}
	if err = addRequestIDRetrieverMiddleware(stack); err != nil {
		return err
	}
	if err = addResponseErrorMiddleware(stack); err != nil {
		return err
	}
	if err = addRequestResponseLogging(stack, options); err != nil {
		return err
	}
	return nil
}

func newServiceMetadataMiddleware_opNiftyCreateAlarm(region string) *awsmiddleware.RegisterServiceMetadata {
	return &awsmiddleware.RegisterServiceMetadata{
		Region:        region,
		ServiceID:     ServiceID,
		OperationName: "NiftyCreateAlarm",
	}
}
