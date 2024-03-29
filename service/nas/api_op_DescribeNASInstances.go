// Code generated by smithy-go-codegen DO NOT EDIT.

package nas

import (
	"context"
	"errors"
	"fmt"
	awsmiddleware "github.com/aws/aws-sdk-go-v2/aws/middleware"
	"github.com/aws/aws-sdk-go-v2/aws/signer/v4"
	smithy "github.com/aws/smithy-go"
	"github.com/aws/smithy-go/middleware"
	smithytime "github.com/aws/smithy-go/time"
	smithyhttp "github.com/aws/smithy-go/transport/http"
	smithywaiter "github.com/aws/smithy-go/waiter"
	"github.com/jmespath/go-jmespath"
	"github.com/nifcloud/nifcloud-sdk-go/service/nas/types"
	"strconv"
	"time"
)

func (c *Client) DescribeNASInstances(ctx context.Context, params *DescribeNASInstancesInput, optFns ...func(*Options)) (*DescribeNASInstancesOutput, error) {
	if params == nil {
		params = &DescribeNASInstancesInput{}
	}

	result, metadata, err := c.invokeOperation(ctx, "DescribeNASInstances", params, optFns, c.addOperationDescribeNASInstancesMiddlewares)
	if err != nil {
		return nil, err
	}

	out := result.(*DescribeNASInstancesOutput)
	out.ResultMetadata = metadata
	return out, nil
}

type DescribeNASInstancesInput struct {
	NASInstanceIdentifier *string

	noSmithyDocumentSerde
}

type DescribeNASInstancesOutput struct {
	NASInstances []types.NASInstances

	ResponseMetadata *types.ResponseMetadata

	// Metadata pertaining to the operation's result.
	ResultMetadata middleware.Metadata

	noSmithyDocumentSerde
}

func (c *Client) addOperationDescribeNASInstancesMiddlewares(stack *middleware.Stack, options Options) (err error) {
	err = stack.Serialize.Add(&awsAwsquery_serializeOpDescribeNASInstances{}, middleware.After)
	if err != nil {
		return err
	}
	err = stack.Deserialize.Add(&awsAwsquery_deserializeOpDescribeNASInstances{}, middleware.After)
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
	if err = v4.AddComputePayloadSHA256Middleware(stack); err != nil {
		return err
	}
	if err = addRetryMiddlewares(stack, options); err != nil {
		return err
	}
	if err = addHTTPSignerV4Middleware(stack, options); err != nil {
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
	if err = stack.Initialize.Add(newServiceMetadataMiddleware_opDescribeNASInstances(options.Region), middleware.Before); err != nil {
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

// DescribeNASInstancesAPIClient is a client that implements the
// DescribeNASInstances operation.
type DescribeNASInstancesAPIClient interface {
	DescribeNASInstances(context.Context, *DescribeNASInstancesInput, ...func(*Options)) (*DescribeNASInstancesOutput, error)
}

var _ DescribeNASInstancesAPIClient = (*Client)(nil)

// NASInstanceExistsWaiterOptions are waiter options for NASInstanceExistsWaiter
type NASInstanceExistsWaiterOptions struct {

	// Set of options to modify how an operation is invoked. These apply to all
	// operations invoked for this client. Use functional options on operation call to
	// modify this list for per operation behavior.
	APIOptions []func(*middleware.Stack) error

	// MinDelay is the minimum amount of time to delay between retries. If unset,
	// NASInstanceExistsWaiter will use default minimum delay of 40 seconds. Note that
	// MinDelay must resolve to a value lesser than or equal to the MaxDelay.
	MinDelay time.Duration

	// MaxDelay is the maximum amount of time to delay between retries. If unset or
	// set to zero, NASInstanceExistsWaiter will use default max delay of 120 seconds.
	// Note that MaxDelay must resolve to value greater than or equal to the MinDelay.
	MaxDelay time.Duration

	// LogWaitAttempts is used to enable logging for waiter retry attempts
	LogWaitAttempts bool

	// Retryable is function that can be used to override the service defined
	// waiter-behavior based on operation output, or returned error. This function is
	// used by the waiter to decide if a state is retryable or a terminal state. By
	// default service-modeled logic will populate this option. This option can thus be
	// used to define a custom waiter state with fall-back to service-modeled waiter
	// state mutators.The function returns an error in case of a failure state. In case
	// of retry state, this function returns a bool value of true and nil error, while
	// in case of success it returns a bool value of false and nil error.
	Retryable func(context.Context, *DescribeNASInstancesInput, *DescribeNASInstancesOutput, error) (bool, error)
}

// NASInstanceExistsWaiter defines the waiters for NASInstanceExists
type NASInstanceExistsWaiter struct {
	client DescribeNASInstancesAPIClient

	options NASInstanceExistsWaiterOptions
}

// NewNASInstanceExistsWaiter constructs a NASInstanceExistsWaiter.
func NewNASInstanceExistsWaiter(client DescribeNASInstancesAPIClient, optFns ...func(*NASInstanceExistsWaiterOptions)) *NASInstanceExistsWaiter {
	options := NASInstanceExistsWaiterOptions{}
	options.MinDelay = 40 * time.Second
	options.MaxDelay = 120 * time.Second
	options.Retryable = nASInstanceExistsStateRetryable

	for _, fn := range optFns {
		fn(&options)
	}
	return &NASInstanceExistsWaiter{
		client:  client,
		options: options,
	}
}

// Wait calls the waiter function for NASInstanceExists waiter. The maxWaitDur is
// the maximum wait duration the waiter will wait. The maxWaitDur is required and
// must be greater than zero.
func (w *NASInstanceExistsWaiter) Wait(ctx context.Context, params *DescribeNASInstancesInput, maxWaitDur time.Duration, optFns ...func(*NASInstanceExistsWaiterOptions)) error {
	_, err := w.WaitForOutput(ctx, params, maxWaitDur, optFns...)
	return err
}

// WaitForOutput calls the waiter function for NASInstanceExists waiter and
// returns the output of the successful operation. The maxWaitDur is the maximum
// wait duration the waiter will wait. The maxWaitDur is required and must be
// greater than zero.
func (w *NASInstanceExistsWaiter) WaitForOutput(ctx context.Context, params *DescribeNASInstancesInput, maxWaitDur time.Duration, optFns ...func(*NASInstanceExistsWaiterOptions)) (*DescribeNASInstancesOutput, error) {
	if maxWaitDur <= 0 {
		return nil, fmt.Errorf("maximum wait time for waiter must be greater than zero")
	}

	options := w.options
	for _, fn := range optFns {
		fn(&options)
	}

	if options.MaxDelay <= 0 {
		options.MaxDelay = 120 * time.Second
	}

	if options.MinDelay > options.MaxDelay {
		return nil, fmt.Errorf("minimum waiter delay %v must be lesser than or equal to maximum waiter delay of %v.", options.MinDelay, options.MaxDelay)
	}

	ctx, cancelFn := context.WithTimeout(ctx, maxWaitDur)
	defer cancelFn()

	logger := smithywaiter.Logger{}
	remainingTime := maxWaitDur

	var attempt int64
	for {

		attempt++
		apiOptions := options.APIOptions
		start := time.Now()

		if options.LogWaitAttempts {
			logger.Attempt = attempt
			apiOptions = append([]func(*middleware.Stack) error{}, options.APIOptions...)
			apiOptions = append(apiOptions, logger.AddLogger)
		}

		out, err := w.client.DescribeNASInstances(ctx, params, func(o *Options) {
			o.APIOptions = append(o.APIOptions, apiOptions...)
		})

		retryable, err := options.Retryable(ctx, params, out, err)
		if err != nil {
			return nil, err
		}
		if !retryable {
			return out, nil
		}

		remainingTime -= time.Since(start)
		if remainingTime < options.MinDelay || remainingTime <= 0 {
			break
		}

		// compute exponential backoff between waiter retries
		delay, err := smithywaiter.ComputeDelay(
			attempt, options.MinDelay, options.MaxDelay, remainingTime,
		)
		if err != nil {
			return nil, fmt.Errorf("error computing waiter delay, %w", err)
		}

		remainingTime -= delay
		// sleep for the delay amount before invoking a request
		if err := smithytime.SleepWithContext(ctx, delay); err != nil {
			return nil, fmt.Errorf("request cancelled while waiting, %w", err)
		}
	}
	return nil, fmt.Errorf("exceeded max wait time for NASInstanceExists waiter")
}

func nASInstanceExistsStateRetryable(ctx context.Context, input *DescribeNASInstancesInput, output *DescribeNASInstancesOutput, err error) (bool, error) {

	if err == nil {
		pathValue, err := jmespath.Search("length(NASInstances[]) > `0`", output)
		if err != nil {
			return false, fmt.Errorf("error evaluating waiter state: %w", err)
		}

		expectedValue := "true"
		bv, err := strconv.ParseBool(expectedValue)
		if err != nil {
			return false, fmt.Errorf("error parsing boolean from string %w", err)
		}
		value, ok := pathValue.(bool)
		if !ok {
			return false, fmt.Errorf("waiter comparator expected bool value got %T", pathValue)
		}

		if value == bv {
			return false, nil
		}
	}

	if err != nil {
		var apiErr smithy.APIError
		ok := errors.As(err, &apiErr)
		if !ok {
			return false, fmt.Errorf("expected err to be of type smithy.APIError, got %w", err)
		}

		if "Client.InvalidParameter.NotFound.NASInstanceIdentifier" == apiErr.ErrorCode() {
			return true, nil
		}
	}

	return true, nil
}

// NASInstanceAvailableWaiterOptions are waiter options for
// NASInstanceAvailableWaiter
type NASInstanceAvailableWaiterOptions struct {

	// Set of options to modify how an operation is invoked. These apply to all
	// operations invoked for this client. Use functional options on operation call to
	// modify this list for per operation behavior.
	APIOptions []func(*middleware.Stack) error

	// MinDelay is the minimum amount of time to delay between retries. If unset,
	// NASInstanceAvailableWaiter will use default minimum delay of 40 seconds. Note
	// that MinDelay must resolve to a value lesser than or equal to the MaxDelay.
	MinDelay time.Duration

	// MaxDelay is the maximum amount of time to delay between retries. If unset or
	// set to zero, NASInstanceAvailableWaiter will use default max delay of 120
	// seconds. Note that MaxDelay must resolve to value greater than or equal to the
	// MinDelay.
	MaxDelay time.Duration

	// LogWaitAttempts is used to enable logging for waiter retry attempts
	LogWaitAttempts bool

	// Retryable is function that can be used to override the service defined
	// waiter-behavior based on operation output, or returned error. This function is
	// used by the waiter to decide if a state is retryable or a terminal state. By
	// default service-modeled logic will populate this option. This option can thus be
	// used to define a custom waiter state with fall-back to service-modeled waiter
	// state mutators.The function returns an error in case of a failure state. In case
	// of retry state, this function returns a bool value of true and nil error, while
	// in case of success it returns a bool value of false and nil error.
	Retryable func(context.Context, *DescribeNASInstancesInput, *DescribeNASInstancesOutput, error) (bool, error)
}

// NASInstanceAvailableWaiter defines the waiters for NASInstanceAvailable
type NASInstanceAvailableWaiter struct {
	client DescribeNASInstancesAPIClient

	options NASInstanceAvailableWaiterOptions
}

// NewNASInstanceAvailableWaiter constructs a NASInstanceAvailableWaiter.
func NewNASInstanceAvailableWaiter(client DescribeNASInstancesAPIClient, optFns ...func(*NASInstanceAvailableWaiterOptions)) *NASInstanceAvailableWaiter {
	options := NASInstanceAvailableWaiterOptions{}
	options.MinDelay = 40 * time.Second
	options.MaxDelay = 120 * time.Second
	options.Retryable = nASInstanceAvailableStateRetryable

	for _, fn := range optFns {
		fn(&options)
	}
	return &NASInstanceAvailableWaiter{
		client:  client,
		options: options,
	}
}

// Wait calls the waiter function for NASInstanceAvailable waiter. The maxWaitDur
// is the maximum wait duration the waiter will wait. The maxWaitDur is required
// and must be greater than zero.
func (w *NASInstanceAvailableWaiter) Wait(ctx context.Context, params *DescribeNASInstancesInput, maxWaitDur time.Duration, optFns ...func(*NASInstanceAvailableWaiterOptions)) error {
	_, err := w.WaitForOutput(ctx, params, maxWaitDur, optFns...)
	return err
}

// WaitForOutput calls the waiter function for NASInstanceAvailable waiter and
// returns the output of the successful operation. The maxWaitDur is the maximum
// wait duration the waiter will wait. The maxWaitDur is required and must be
// greater than zero.
func (w *NASInstanceAvailableWaiter) WaitForOutput(ctx context.Context, params *DescribeNASInstancesInput, maxWaitDur time.Duration, optFns ...func(*NASInstanceAvailableWaiterOptions)) (*DescribeNASInstancesOutput, error) {
	if maxWaitDur <= 0 {
		return nil, fmt.Errorf("maximum wait time for waiter must be greater than zero")
	}

	options := w.options
	for _, fn := range optFns {
		fn(&options)
	}

	if options.MaxDelay <= 0 {
		options.MaxDelay = 120 * time.Second
	}

	if options.MinDelay > options.MaxDelay {
		return nil, fmt.Errorf("minimum waiter delay %v must be lesser than or equal to maximum waiter delay of %v.", options.MinDelay, options.MaxDelay)
	}

	ctx, cancelFn := context.WithTimeout(ctx, maxWaitDur)
	defer cancelFn()

	logger := smithywaiter.Logger{}
	remainingTime := maxWaitDur

	var attempt int64
	for {

		attempt++
		apiOptions := options.APIOptions
		start := time.Now()

		if options.LogWaitAttempts {
			logger.Attempt = attempt
			apiOptions = append([]func(*middleware.Stack) error{}, options.APIOptions...)
			apiOptions = append(apiOptions, logger.AddLogger)
		}

		out, err := w.client.DescribeNASInstances(ctx, params, func(o *Options) {
			o.APIOptions = append(o.APIOptions, apiOptions...)
		})

		retryable, err := options.Retryable(ctx, params, out, err)
		if err != nil {
			return nil, err
		}
		if !retryable {
			return out, nil
		}

		remainingTime -= time.Since(start)
		if remainingTime < options.MinDelay || remainingTime <= 0 {
			break
		}

		// compute exponential backoff between waiter retries
		delay, err := smithywaiter.ComputeDelay(
			attempt, options.MinDelay, options.MaxDelay, remainingTime,
		)
		if err != nil {
			return nil, fmt.Errorf("error computing waiter delay, %w", err)
		}

		remainingTime -= delay
		// sleep for the delay amount before invoking a request
		if err := smithytime.SleepWithContext(ctx, delay); err != nil {
			return nil, fmt.Errorf("request cancelled while waiting, %w", err)
		}
	}
	return nil, fmt.Errorf("exceeded max wait time for NASInstanceAvailable waiter")
}

func nASInstanceAvailableStateRetryable(ctx context.Context, input *DescribeNASInstancesInput, output *DescribeNASInstancesOutput, err error) (bool, error) {

	if err == nil {
		pathValue, err := jmespath.Search("NASInstances[].NASInstanceStatus", output)
		if err != nil {
			return false, fmt.Errorf("error evaluating waiter state: %w", err)
		}

		expectedValue := "available"
		var match = true
		listOfValues, ok := pathValue.([]interface{})
		if !ok {
			return false, fmt.Errorf("waiter comparator expected list got %T", pathValue)
		}

		if len(listOfValues) == 0 {
			match = false
		}
		for _, v := range listOfValues {
			value, ok := v.(*string)
			if !ok {
				return false, fmt.Errorf("waiter comparator expected *string value, got %T", pathValue)
			}

			if string(*value) != expectedValue {
				match = false
			}
		}

		if match {
			return false, nil
		}
	}

	if err == nil {
		pathValue, err := jmespath.Search("NASInstances[].NASInstanceStatus", output)
		if err != nil {
			return false, fmt.Errorf("error evaluating waiter state: %w", err)
		}

		expectedValue := "failed"
		var match = true
		listOfValues, ok := pathValue.([]interface{})
		if !ok {
			return false, fmt.Errorf("waiter comparator expected list got %T", pathValue)
		}

		if len(listOfValues) == 0 {
			match = false
		}
		for _, v := range listOfValues {
			value, ok := v.(*string)
			if !ok {
				return false, fmt.Errorf("waiter comparator expected *string value, got %T", pathValue)
			}

			if string(*value) != expectedValue {
				match = false
			}
		}

		if match {
			return false, fmt.Errorf("waiter state transitioned to Failure")
		}
	}

	return true, nil
}

// NASInstanceFailedWaiterOptions are waiter options for NASInstanceFailedWaiter
type NASInstanceFailedWaiterOptions struct {

	// Set of options to modify how an operation is invoked. These apply to all
	// operations invoked for this client. Use functional options on operation call to
	// modify this list for per operation behavior.
	APIOptions []func(*middleware.Stack) error

	// MinDelay is the minimum amount of time to delay between retries. If unset,
	// NASInstanceFailedWaiter will use default minimum delay of 40 seconds. Note that
	// MinDelay must resolve to a value lesser than or equal to the MaxDelay.
	MinDelay time.Duration

	// MaxDelay is the maximum amount of time to delay between retries. If unset or
	// set to zero, NASInstanceFailedWaiter will use default max delay of 120 seconds.
	// Note that MaxDelay must resolve to value greater than or equal to the MinDelay.
	MaxDelay time.Duration

	// LogWaitAttempts is used to enable logging for waiter retry attempts
	LogWaitAttempts bool

	// Retryable is function that can be used to override the service defined
	// waiter-behavior based on operation output, or returned error. This function is
	// used by the waiter to decide if a state is retryable or a terminal state. By
	// default service-modeled logic will populate this option. This option can thus be
	// used to define a custom waiter state with fall-back to service-modeled waiter
	// state mutators.The function returns an error in case of a failure state. In case
	// of retry state, this function returns a bool value of true and nil error, while
	// in case of success it returns a bool value of false and nil error.
	Retryable func(context.Context, *DescribeNASInstancesInput, *DescribeNASInstancesOutput, error) (bool, error)
}

// NASInstanceFailedWaiter defines the waiters for NASInstanceFailed
type NASInstanceFailedWaiter struct {
	client DescribeNASInstancesAPIClient

	options NASInstanceFailedWaiterOptions
}

// NewNASInstanceFailedWaiter constructs a NASInstanceFailedWaiter.
func NewNASInstanceFailedWaiter(client DescribeNASInstancesAPIClient, optFns ...func(*NASInstanceFailedWaiterOptions)) *NASInstanceFailedWaiter {
	options := NASInstanceFailedWaiterOptions{}
	options.MinDelay = 40 * time.Second
	options.MaxDelay = 120 * time.Second
	options.Retryable = nASInstanceFailedStateRetryable

	for _, fn := range optFns {
		fn(&options)
	}
	return &NASInstanceFailedWaiter{
		client:  client,
		options: options,
	}
}

// Wait calls the waiter function for NASInstanceFailed waiter. The maxWaitDur is
// the maximum wait duration the waiter will wait. The maxWaitDur is required and
// must be greater than zero.
func (w *NASInstanceFailedWaiter) Wait(ctx context.Context, params *DescribeNASInstancesInput, maxWaitDur time.Duration, optFns ...func(*NASInstanceFailedWaiterOptions)) error {
	_, err := w.WaitForOutput(ctx, params, maxWaitDur, optFns...)
	return err
}

// WaitForOutput calls the waiter function for NASInstanceFailed waiter and
// returns the output of the successful operation. The maxWaitDur is the maximum
// wait duration the waiter will wait. The maxWaitDur is required and must be
// greater than zero.
func (w *NASInstanceFailedWaiter) WaitForOutput(ctx context.Context, params *DescribeNASInstancesInput, maxWaitDur time.Duration, optFns ...func(*NASInstanceFailedWaiterOptions)) (*DescribeNASInstancesOutput, error) {
	if maxWaitDur <= 0 {
		return nil, fmt.Errorf("maximum wait time for waiter must be greater than zero")
	}

	options := w.options
	for _, fn := range optFns {
		fn(&options)
	}

	if options.MaxDelay <= 0 {
		options.MaxDelay = 120 * time.Second
	}

	if options.MinDelay > options.MaxDelay {
		return nil, fmt.Errorf("minimum waiter delay %v must be lesser than or equal to maximum waiter delay of %v.", options.MinDelay, options.MaxDelay)
	}

	ctx, cancelFn := context.WithTimeout(ctx, maxWaitDur)
	defer cancelFn()

	logger := smithywaiter.Logger{}
	remainingTime := maxWaitDur

	var attempt int64
	for {

		attempt++
		apiOptions := options.APIOptions
		start := time.Now()

		if options.LogWaitAttempts {
			logger.Attempt = attempt
			apiOptions = append([]func(*middleware.Stack) error{}, options.APIOptions...)
			apiOptions = append(apiOptions, logger.AddLogger)
		}

		out, err := w.client.DescribeNASInstances(ctx, params, func(o *Options) {
			o.APIOptions = append(o.APIOptions, apiOptions...)
		})

		retryable, err := options.Retryable(ctx, params, out, err)
		if err != nil {
			return nil, err
		}
		if !retryable {
			return out, nil
		}

		remainingTime -= time.Since(start)
		if remainingTime < options.MinDelay || remainingTime <= 0 {
			break
		}

		// compute exponential backoff between waiter retries
		delay, err := smithywaiter.ComputeDelay(
			attempt, options.MinDelay, options.MaxDelay, remainingTime,
		)
		if err != nil {
			return nil, fmt.Errorf("error computing waiter delay, %w", err)
		}

		remainingTime -= delay
		// sleep for the delay amount before invoking a request
		if err := smithytime.SleepWithContext(ctx, delay); err != nil {
			return nil, fmt.Errorf("request cancelled while waiting, %w", err)
		}
	}
	return nil, fmt.Errorf("exceeded max wait time for NASInstanceFailed waiter")
}

func nASInstanceFailedStateRetryable(ctx context.Context, input *DescribeNASInstancesInput, output *DescribeNASInstancesOutput, err error) (bool, error) {

	if err == nil {
		pathValue, err := jmespath.Search("NASInstances[].NASInstanceStatus", output)
		if err != nil {
			return false, fmt.Errorf("error evaluating waiter state: %w", err)
		}

		expectedValue := "failed"
		var match = true
		listOfValues, ok := pathValue.([]interface{})
		if !ok {
			return false, fmt.Errorf("waiter comparator expected list got %T", pathValue)
		}

		if len(listOfValues) == 0 {
			match = false
		}
		for _, v := range listOfValues {
			value, ok := v.(*string)
			if !ok {
				return false, fmt.Errorf("waiter comparator expected *string value, got %T", pathValue)
			}

			if string(*value) != expectedValue {
				match = false
			}
		}

		if match {
			return false, nil
		}
	}

	return true, nil
}

// NASInstanceStorageFullWaiterOptions are waiter options for
// NASInstanceStorageFullWaiter
type NASInstanceStorageFullWaiterOptions struct {

	// Set of options to modify how an operation is invoked. These apply to all
	// operations invoked for this client. Use functional options on operation call to
	// modify this list for per operation behavior.
	APIOptions []func(*middleware.Stack) error

	// MinDelay is the minimum amount of time to delay between retries. If unset,
	// NASInstanceStorageFullWaiter will use default minimum delay of 40 seconds. Note
	// that MinDelay must resolve to a value lesser than or equal to the MaxDelay.
	MinDelay time.Duration

	// MaxDelay is the maximum amount of time to delay between retries. If unset or
	// set to zero, NASInstanceStorageFullWaiter will use default max delay of 120
	// seconds. Note that MaxDelay must resolve to value greater than or equal to the
	// MinDelay.
	MaxDelay time.Duration

	// LogWaitAttempts is used to enable logging for waiter retry attempts
	LogWaitAttempts bool

	// Retryable is function that can be used to override the service defined
	// waiter-behavior based on operation output, or returned error. This function is
	// used by the waiter to decide if a state is retryable or a terminal state. By
	// default service-modeled logic will populate this option. This option can thus be
	// used to define a custom waiter state with fall-back to service-modeled waiter
	// state mutators.The function returns an error in case of a failure state. In case
	// of retry state, this function returns a bool value of true and nil error, while
	// in case of success it returns a bool value of false and nil error.
	Retryable func(context.Context, *DescribeNASInstancesInput, *DescribeNASInstancesOutput, error) (bool, error)
}

// NASInstanceStorageFullWaiter defines the waiters for NASInstanceStorageFull
type NASInstanceStorageFullWaiter struct {
	client DescribeNASInstancesAPIClient

	options NASInstanceStorageFullWaiterOptions
}

// NewNASInstanceStorageFullWaiter constructs a NASInstanceStorageFullWaiter.
func NewNASInstanceStorageFullWaiter(client DescribeNASInstancesAPIClient, optFns ...func(*NASInstanceStorageFullWaiterOptions)) *NASInstanceStorageFullWaiter {
	options := NASInstanceStorageFullWaiterOptions{}
	options.MinDelay = 40 * time.Second
	options.MaxDelay = 120 * time.Second
	options.Retryable = nASInstanceStorageFullStateRetryable

	for _, fn := range optFns {
		fn(&options)
	}
	return &NASInstanceStorageFullWaiter{
		client:  client,
		options: options,
	}
}

// Wait calls the waiter function for NASInstanceStorageFull waiter. The
// maxWaitDur is the maximum wait duration the waiter will wait. The maxWaitDur is
// required and must be greater than zero.
func (w *NASInstanceStorageFullWaiter) Wait(ctx context.Context, params *DescribeNASInstancesInput, maxWaitDur time.Duration, optFns ...func(*NASInstanceStorageFullWaiterOptions)) error {
	_, err := w.WaitForOutput(ctx, params, maxWaitDur, optFns...)
	return err
}

// WaitForOutput calls the waiter function for NASInstanceStorageFull waiter and
// returns the output of the successful operation. The maxWaitDur is the maximum
// wait duration the waiter will wait. The maxWaitDur is required and must be
// greater than zero.
func (w *NASInstanceStorageFullWaiter) WaitForOutput(ctx context.Context, params *DescribeNASInstancesInput, maxWaitDur time.Duration, optFns ...func(*NASInstanceStorageFullWaiterOptions)) (*DescribeNASInstancesOutput, error) {
	if maxWaitDur <= 0 {
		return nil, fmt.Errorf("maximum wait time for waiter must be greater than zero")
	}

	options := w.options
	for _, fn := range optFns {
		fn(&options)
	}

	if options.MaxDelay <= 0 {
		options.MaxDelay = 120 * time.Second
	}

	if options.MinDelay > options.MaxDelay {
		return nil, fmt.Errorf("minimum waiter delay %v must be lesser than or equal to maximum waiter delay of %v.", options.MinDelay, options.MaxDelay)
	}

	ctx, cancelFn := context.WithTimeout(ctx, maxWaitDur)
	defer cancelFn()

	logger := smithywaiter.Logger{}
	remainingTime := maxWaitDur

	var attempt int64
	for {

		attempt++
		apiOptions := options.APIOptions
		start := time.Now()

		if options.LogWaitAttempts {
			logger.Attempt = attempt
			apiOptions = append([]func(*middleware.Stack) error{}, options.APIOptions...)
			apiOptions = append(apiOptions, logger.AddLogger)
		}

		out, err := w.client.DescribeNASInstances(ctx, params, func(o *Options) {
			o.APIOptions = append(o.APIOptions, apiOptions...)
		})

		retryable, err := options.Retryable(ctx, params, out, err)
		if err != nil {
			return nil, err
		}
		if !retryable {
			return out, nil
		}

		remainingTime -= time.Since(start)
		if remainingTime < options.MinDelay || remainingTime <= 0 {
			break
		}

		// compute exponential backoff between waiter retries
		delay, err := smithywaiter.ComputeDelay(
			attempt, options.MinDelay, options.MaxDelay, remainingTime,
		)
		if err != nil {
			return nil, fmt.Errorf("error computing waiter delay, %w", err)
		}

		remainingTime -= delay
		// sleep for the delay amount before invoking a request
		if err := smithytime.SleepWithContext(ctx, delay); err != nil {
			return nil, fmt.Errorf("request cancelled while waiting, %w", err)
		}
	}
	return nil, fmt.Errorf("exceeded max wait time for NASInstanceStorageFull waiter")
}

func nASInstanceStorageFullStateRetryable(ctx context.Context, input *DescribeNASInstancesInput, output *DescribeNASInstancesOutput, err error) (bool, error) {

	if err == nil {
		pathValue, err := jmespath.Search("NASInstances[].NASInstanceStatus", output)
		if err != nil {
			return false, fmt.Errorf("error evaluating waiter state: %w", err)
		}

		expectedValue := "storage-full"
		var match = true
		listOfValues, ok := pathValue.([]interface{})
		if !ok {
			return false, fmt.Errorf("waiter comparator expected list got %T", pathValue)
		}

		if len(listOfValues) == 0 {
			match = false
		}
		for _, v := range listOfValues {
			value, ok := v.(*string)
			if !ok {
				return false, fmt.Errorf("waiter comparator expected *string value, got %T", pathValue)
			}

			if string(*value) != expectedValue {
				match = false
			}
		}

		if match {
			return false, nil
		}
	}

	return true, nil
}

// NASInstanceDeletedWaiterOptions are waiter options for NASInstanceDeletedWaiter
type NASInstanceDeletedWaiterOptions struct {

	// Set of options to modify how an operation is invoked. These apply to all
	// operations invoked for this client. Use functional options on operation call to
	// modify this list for per operation behavior.
	APIOptions []func(*middleware.Stack) error

	// MinDelay is the minimum amount of time to delay between retries. If unset,
	// NASInstanceDeletedWaiter will use default minimum delay of 40 seconds. Note that
	// MinDelay must resolve to a value lesser than or equal to the MaxDelay.
	MinDelay time.Duration

	// MaxDelay is the maximum amount of time to delay between retries. If unset or
	// set to zero, NASInstanceDeletedWaiter will use default max delay of 120 seconds.
	// Note that MaxDelay must resolve to value greater than or equal to the MinDelay.
	MaxDelay time.Duration

	// LogWaitAttempts is used to enable logging for waiter retry attempts
	LogWaitAttempts bool

	// Retryable is function that can be used to override the service defined
	// waiter-behavior based on operation output, or returned error. This function is
	// used by the waiter to decide if a state is retryable or a terminal state. By
	// default service-modeled logic will populate this option. This option can thus be
	// used to define a custom waiter state with fall-back to service-modeled waiter
	// state mutators.The function returns an error in case of a failure state. In case
	// of retry state, this function returns a bool value of true and nil error, while
	// in case of success it returns a bool value of false and nil error.
	Retryable func(context.Context, *DescribeNASInstancesInput, *DescribeNASInstancesOutput, error) (bool, error)
}

// NASInstanceDeletedWaiter defines the waiters for NASInstanceDeleted
type NASInstanceDeletedWaiter struct {
	client DescribeNASInstancesAPIClient

	options NASInstanceDeletedWaiterOptions
}

// NewNASInstanceDeletedWaiter constructs a NASInstanceDeletedWaiter.
func NewNASInstanceDeletedWaiter(client DescribeNASInstancesAPIClient, optFns ...func(*NASInstanceDeletedWaiterOptions)) *NASInstanceDeletedWaiter {
	options := NASInstanceDeletedWaiterOptions{}
	options.MinDelay = 40 * time.Second
	options.MaxDelay = 120 * time.Second
	options.Retryable = nASInstanceDeletedStateRetryable

	for _, fn := range optFns {
		fn(&options)
	}
	return &NASInstanceDeletedWaiter{
		client:  client,
		options: options,
	}
}

// Wait calls the waiter function for NASInstanceDeleted waiter. The maxWaitDur is
// the maximum wait duration the waiter will wait. The maxWaitDur is required and
// must be greater than zero.
func (w *NASInstanceDeletedWaiter) Wait(ctx context.Context, params *DescribeNASInstancesInput, maxWaitDur time.Duration, optFns ...func(*NASInstanceDeletedWaiterOptions)) error {
	_, err := w.WaitForOutput(ctx, params, maxWaitDur, optFns...)
	return err
}

// WaitForOutput calls the waiter function for NASInstanceDeleted waiter and
// returns the output of the successful operation. The maxWaitDur is the maximum
// wait duration the waiter will wait. The maxWaitDur is required and must be
// greater than zero.
func (w *NASInstanceDeletedWaiter) WaitForOutput(ctx context.Context, params *DescribeNASInstancesInput, maxWaitDur time.Duration, optFns ...func(*NASInstanceDeletedWaiterOptions)) (*DescribeNASInstancesOutput, error) {
	if maxWaitDur <= 0 {
		return nil, fmt.Errorf("maximum wait time for waiter must be greater than zero")
	}

	options := w.options
	for _, fn := range optFns {
		fn(&options)
	}

	if options.MaxDelay <= 0 {
		options.MaxDelay = 120 * time.Second
	}

	if options.MinDelay > options.MaxDelay {
		return nil, fmt.Errorf("minimum waiter delay %v must be lesser than or equal to maximum waiter delay of %v.", options.MinDelay, options.MaxDelay)
	}

	ctx, cancelFn := context.WithTimeout(ctx, maxWaitDur)
	defer cancelFn()

	logger := smithywaiter.Logger{}
	remainingTime := maxWaitDur

	var attempt int64
	for {

		attempt++
		apiOptions := options.APIOptions
		start := time.Now()

		if options.LogWaitAttempts {
			logger.Attempt = attempt
			apiOptions = append([]func(*middleware.Stack) error{}, options.APIOptions...)
			apiOptions = append(apiOptions, logger.AddLogger)
		}

		out, err := w.client.DescribeNASInstances(ctx, params, func(o *Options) {
			o.APIOptions = append(o.APIOptions, apiOptions...)
		})

		retryable, err := options.Retryable(ctx, params, out, err)
		if err != nil {
			return nil, err
		}
		if !retryable {
			return out, nil
		}

		remainingTime -= time.Since(start)
		if remainingTime < options.MinDelay || remainingTime <= 0 {
			break
		}

		// compute exponential backoff between waiter retries
		delay, err := smithywaiter.ComputeDelay(
			attempt, options.MinDelay, options.MaxDelay, remainingTime,
		)
		if err != nil {
			return nil, fmt.Errorf("error computing waiter delay, %w", err)
		}

		remainingTime -= delay
		// sleep for the delay amount before invoking a request
		if err := smithytime.SleepWithContext(ctx, delay); err != nil {
			return nil, fmt.Errorf("request cancelled while waiting, %w", err)
		}
	}
	return nil, fmt.Errorf("exceeded max wait time for NASInstanceDeleted waiter")
}

func nASInstanceDeletedStateRetryable(ctx context.Context, input *DescribeNASInstancesInput, output *DescribeNASInstancesOutput, err error) (bool, error) {

	if err != nil {
		var apiErr smithy.APIError
		ok := errors.As(err, &apiErr)
		if !ok {
			return false, fmt.Errorf("expected err to be of type smithy.APIError, got %w", err)
		}

		if "Client.InvalidParameter.NotFound.NASInstanceIdentifier" == apiErr.ErrorCode() {
			return false, nil
		}
	}

	if err == nil {
		pathValue, err := jmespath.Search("length(NASInstances[]) > `0`", output)
		if err != nil {
			return false, fmt.Errorf("error evaluating waiter state: %w", err)
		}

		expectedValue := "true"
		bv, err := strconv.ParseBool(expectedValue)
		if err != nil {
			return false, fmt.Errorf("error parsing boolean from string %w", err)
		}
		value, ok := pathValue.(bool)
		if !ok {
			return false, fmt.Errorf("waiter comparator expected bool value got %T", pathValue)
		}

		if value == bv {
			return true, nil
		}
	}

	return true, nil
}

func newServiceMetadataMiddleware_opDescribeNASInstances(region string) *awsmiddleware.RegisterServiceMetadata {
	return &awsmiddleware.RegisterServiceMetadata{
		Region:        region,
		ServiceID:     ServiceID,
		SigningName:   "nas",
		OperationName: "DescribeNASInstances",
	}
}
