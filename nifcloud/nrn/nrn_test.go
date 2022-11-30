package nrn

import (
	"errors"
	"testing"
)

func TestParseNRN(t *testing.T) {
	cases := []struct {
		input string
		nrn   NRN
		err   error
	}{
		{
			input: "invalid",
			err:   ErrInvalidPrefix,
		},
		{
			input: "nrn:nope",
			err:   ErrInvalidSections,
		},
		{
			input: "nrn:nifcloud:hatoba:jp-east-1:BCT*****:cluster:8a97827f-747a-488e-a8d0-6c7b56a9e50c",
			nrn: NRN{
				Partition:  "nifcloud",
				Service:    "hatoba",
				Region:     "jp-east-1",
				NifcloudID: "BCT*****",
				Resource:   "cluster:8a97827f-747a-488e-a8d0-6c7b56a9e50c",
			},
		},
		{
			input: "nrn:nifcloud:hatoba::BCT*****:cluster:8a97827f-747a-488e-a8d0-6c7b56a9e50c",
			nrn: NRN{
				Partition:  "nifcloud",
				Service:    "hatoba",
				Region:     "",
				NifcloudID: "BCT*****",
				Resource:   "cluster:8a97827f-747a-488e-a8d0-6c7b56a9e50c",
			},
		},
	}
	for _, tc := range cases {
		t.Run(tc.input, func(t *testing.T) {
			spec, err := Parse(tc.input)
			if tc.nrn != spec {
				t.Errorf("Expected %q to parse as %v, but got %v", tc.input, tc.nrn, spec)
			}
			if err == nil && tc.err != nil {
				t.Errorf("Expected err to be %v, but got nil", tc.err)
			} else if err != nil && tc.err == nil {
				t.Errorf("Expected err to be nil, but got %v", err)
			} else if err != nil && tc.err != nil && !errors.Is(err, tc.err) {
				t.Errorf("Expected err to be %v, but got %v", tc.err, err)
			}
		})
	}
}

func TestIsNRN(t *testing.T) {

	cases := map[string]struct {
		In     string
		Expect bool
		// Params
	}{
		"valid NRN slash resource": {
			In:     "nrn:nifcloud:service:jp-east-1:123456789012:restype/resvalue",
			Expect: true,
		},
		"valid NRN colon resource": {
			In:     "nrn:nifcloud:service:jp-east-1:123456789012:restype:resvalue",
			Expect: true,
		},
		"valid NRN resource": {
			In:     "nrn:nifcloud:service:jp-east-1:123456789012:*",
			Expect: true,
		},
		"empty sections": {
			In:     "nrn:::::",
			Expect: true,
		},
		"invalid NRN": {
			In: "some random string",
		},
		"invalid nrn missing resource": {
			In: "nrn:nifcloud:service:jp-east-1:123456789012",
		},
	}

	for name, c := range cases {
		t.Run(name, func(t *testing.T) {
			actual := IsNRN(c.In)
			if e, a := c.Expect, actual; e != a {
				t.Errorf("expect %s valid %v, got %v", c.In, e, a)
			}
		})
	}
}
