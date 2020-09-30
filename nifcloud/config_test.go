package nifcloud

import (
	"reflect"
	"testing"
)

func TestAWSConfig(t *testing.T) {
	cfg := NewConfig(
		"AKID",
		"SECRET",
		"mock-region",
	)

	awsCfg := cfg.AWSConfig()

	if e, a := cfg.Region, awsCfg.Region; e != a {
		t.Errorf("expect %v, got %v", e, a)
	}

	if e, a := cfg.Credentials, awsCfg.Credentials; e != a {
		t.Errorf("expect %v, got %v", e, a)
	}

	if e, a := cfg.EndpointResolver, awsCfg.EndpointResolver; e != a {
		t.Errorf("expect %v, got %v", e, a)
	}

	if e, a := cfg.HTTPClient, awsCfg.HTTPClient; e != a {
		t.Errorf("expect %v, got %v", e, a)
	}

	if e, a := cfg.Handlers, awsCfg.Handlers; reflect.DeepEqual(e, a) {
		t.Errorf("expect %v, got %v", e, a)
	}

	if e, a := cfg.Retryer, awsCfg.Retryer; e != a {
		t.Errorf("expect %v, got %v", e, a)
	}

	if e, a := cfg.LogLevel, awsCfg.LogLevel; e != a {
		t.Errorf("expect %v, got %v", e, a)
	}

	if e, a := cfg.Logger, awsCfg.Logger; e != a {
		t.Errorf("expect %v, got %v", e, a)
	}

	if e, a := cfg.DisableRestProtocolURICleaning, awsCfg.DisableRestProtocolURICleaning; e != a {
		t.Errorf("expect %v, got %v", e, a)
	}

	if e, a := cfg.DisableEndpointHostPrefix, awsCfg.DisableEndpointHostPrefix; e != a {
		t.Errorf("expect %v, got %v", e, a)
	}
}
