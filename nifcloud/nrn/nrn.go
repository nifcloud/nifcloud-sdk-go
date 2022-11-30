// Package nrn provides a parser for interacting with NIFCLOUD Resource Names.
package nrn

import (
	"errors"
	"strings"
)

const (
	nrnDelimiter = ":"
	nrnSections  = 6
	nrnPrefix    = "nrn:"

	// zero-indexed
	sectionPartition  = 1
	sectionService    = 2
	sectionRegion     = 3
	sectionNifcloudID = 4
	sectionResource   = 5
)

var (
	// ErrInvalidPrefix is error of nrn invalid prefix
	ErrInvalidPrefix = errors.New("nrn: invalid prefix")
	// ErrInvalidSections is error of nrn not enough sections
	ErrInvalidSections = errors.New("nrn: not enough sections")
)

// NRN captures the individual fields of an NIFCLOUD Resource Name.
// See https://pfs.nifcloud.com/spec/common/nrn.htm for more information.
type NRN struct {
	// The partition that the resource is in. Only specify "nifcloud".
	Partition string

	// The service namespace that identifies the NIFCLOUD product (for example, private_bridge, or hatoba).
	// For a list of namespaces, see https://pfs.nifcloud.com/spec/common/nrn.htm#service
	Service string

	// The region the resource resides in. Note that the NRNs for some resources do not require a region, so this
	// component might be omitted.
	Region string

	// The Account Id of NIFCLOUD.
	NifcloudID string

	// The content of this part of the NRN varies by service.
	Resource string
}

// Parse parses an NRN into its constituent parts.
//
// Some example NRNs:
// nrn:nifcloud:hatoba:jp-east-1:BCT*****:cluster:8a97827f-747a-488e-a8d0-6c7b56a9e50c
func Parse(nrn string) (NRN, error) {
	if !strings.HasPrefix(nrn, nrnPrefix) {
		return NRN{}, ErrInvalidPrefix
	}
	sections := strings.SplitN(nrn, nrnDelimiter, nrnSections)
	if len(sections) != nrnSections {
		return NRN{}, ErrInvalidSections
	}
	return NRN{
		Partition:  sections[sectionPartition],
		Service:    sections[sectionService],
		Region:     sections[sectionRegion],
		NifcloudID: sections[sectionNifcloudID],
		Resource:   sections[sectionResource],
	}, nil
}

// IsNRN returns whether the given string is an nrn
// by looking for whether the string starts with nrn:
func IsNRN(nrn string) bool {
	return strings.HasPrefix(nrn, nrnPrefix) && strings.Count(nrn, ":") >= nrnSections-1
}

// String returns the canonical representation of the NRN
func (nrn NRN) String() string {
	return nrnPrefix +
		nrn.Partition + nrnDelimiter +
		nrn.Service + nrnDelimiter +
		nrn.Region + nrnDelimiter +
		nrn.NifcloudID + nrnDelimiter +
		nrn.Resource
}
