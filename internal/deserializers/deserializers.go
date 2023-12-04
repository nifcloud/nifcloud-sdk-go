package deserializers

import (
	"fmt"
	"strconv"
	"strings"

	smithyxml "github.com/aws/smithy-go/encoding/xml"
	"github.com/aws/smithy-go/ptr"
	"github.com/nifcloud/nifcloud-sdk-go/service/computing/types"
)

// DeserializeDocumentSessionStickinessPolicy is custom deserializer to parse empty 'ExpirationPeriod'
func DeserializeDocumentSessionStickinessPolicy(
	v **types.SessionStickinessPolicy,
	decoder smithyxml.NodeDecoder,
) error {
	if v == nil {
		return fmt.Errorf("unexpected nil of type %T", v)
	}
	var sv *types.SessionStickinessPolicy
	if *v == nil {
		sv = &types.SessionStickinessPolicy{}
	} else {
		sv = *v
	}

	for {
		t, done, err := decoder.Token()
		if err != nil {
			return err
		}
		if done {
			break
		}
		originalDecoder := decoder
		decoder = smithyxml.WrapNodeDecoder(originalDecoder.Decoder, t)
		switch {
		case strings.EqualFold("Enabled", t.Name.Local):
			val, err := decoder.Value()
			if err != nil {
				return err
			}
			if val == nil {
				break
			}
			{
				xtv, err := strconv.ParseBool(string(val))
				if err != nil {
					return fmt.Errorf("expected Boolean to be of type *bool, got %T instead", val)
				}
				sv.Enabled = ptr.Bool(xtv)
			}

		case strings.EqualFold("ExpirationPeriod", t.Name.Local):
			val, err := decoder.Value()
			if err != nil {
				return err
			}
			if val == nil {
				break
			}
			{
				xtv := string(val)
				if xtv != "" {
					i64, err := strconv.ParseInt(xtv, 10, 64)
					if err != nil {
						return err
					}
					sv.ExpirationPeriod = ptr.Int32(int32(i64))
				}
			}

		default:
			// Do nothing and ignore the unexpected tag element
			err = decoder.Decoder.Skip()
			if err != nil {
				return err
			}

		}
		decoder = originalDecoder
	}
	*v = sv
	return nil
}

// DeserializeDocumentSessionStickinessPolicyOfNiftyDescribeElasticLoadBalancers is custom deserializer
// to parse empty 'ExpirationPeriod'
func DeserializeDocumentSessionStickinessPolicyOfNiftyDescribeElasticLoadBalancers(
	v **types.SessionStickinessPolicyOfNiftyDescribeElasticLoadBalancers,
	decoder smithyxml.NodeDecoder,
) error {
	if v == nil {
		return fmt.Errorf("unexpected nil of type %T", v)
	}
	var sv *types.SessionStickinessPolicyOfNiftyDescribeElasticLoadBalancers
	if *v == nil {
		sv = &types.SessionStickinessPolicyOfNiftyDescribeElasticLoadBalancers{}
	} else {
		sv = *v
	}

	for {
		t, done, err := decoder.Token()
		if err != nil {
			return err
		}
		if done {
			break
		}
		originalDecoder := decoder
		decoder = smithyxml.WrapNodeDecoder(originalDecoder.Decoder, t)
		switch {
		case strings.EqualFold("Enabled", t.Name.Local):
			val, err := decoder.Value()
			if err != nil {
				return err
			}
			if val == nil {
				break
			}
			{
				xtv, err := strconv.ParseBool(string(val))
				if err != nil {
					return fmt.Errorf("expected Boolean to be of type *bool, got %T instead", val)
				}
				sv.Enabled = ptr.Bool(xtv)
			}

		case strings.EqualFold("ExpirationPeriod", t.Name.Local):
			val, err := decoder.Value()
			if err != nil {
				return err
			}
			if val == nil {
				break
			}
			{
				xtv := string(val)
				if xtv != "" {
					i64, err := strconv.ParseInt(xtv, 10, 64)
					if err != nil {
						return err
					}
					sv.ExpirationPeriod = ptr.Int32(int32(i64))
				}
			}

		case strings.EqualFold("Method", t.Name.Local):
			val, err := decoder.Value()
			if err != nil {
				return err
			}
			if val == nil {
				break
			}
			{
				xtv := string(val)
				i64, err := strconv.ParseInt(xtv, 10, 64)
				if err != nil {
					return err
				}
				sv.Method = ptr.Int32(int32(i64))
			}

		default:
			// Do nothing and ignore the unexpected tag element
			err = decoder.Decoder.Skip()
			if err != nil {
				return err
			}

		}
		decoder = originalDecoder
	}
	*v = sv
	return nil
}
