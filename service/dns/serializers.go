// Code generated by smithy-go-codegen DO NOT EDIT.

package dns

import (
	"bytes"
	"context"
	"fmt"
	smithy "github.com/aws/smithy-go"
	"github.com/aws/smithy-go/encoding/httpbinding"
	smithyxml "github.com/aws/smithy-go/encoding/xml"
	"github.com/aws/smithy-go/middleware"
	smithyhttp "github.com/aws/smithy-go/transport/http"
	"github.com/nifcloud/nifcloud-sdk-go/service/dns/types"
)

type awsRestxml_serializeOpChangeResourceRecordSets struct {
}

func (*awsRestxml_serializeOpChangeResourceRecordSets) ID() string {
	return "OperationSerializer"
}

func (m *awsRestxml_serializeOpChangeResourceRecordSets) HandleSerialize(ctx context.Context, in middleware.SerializeInput, next middleware.SerializeHandler) (
	out middleware.SerializeOutput, metadata middleware.Metadata, err error,
) {
	request, ok := in.Request.(*smithyhttp.Request)
	if !ok {
		return out, metadata, &smithy.SerializationError{Err: fmt.Errorf("unknown transport type %T", in.Request)}
	}

	input, ok := in.Parameters.(*ChangeResourceRecordSetsInput)
	_ = input
	if !ok {
		return out, metadata, &smithy.SerializationError{Err: fmt.Errorf("unknown input parameters type %T", in.Parameters)}
	}

	opPath, opQuery := httpbinding.SplitURI("/2012-12-12N2013-12-16/hostedzone/{ZoneID}/rrset")
	request.URL.Path = smithyhttp.JoinPath(request.URL.Path, opPath)
	request.URL.RawQuery = smithyhttp.JoinRawQuery(request.URL.RawQuery, opQuery)
	request.Method = "POST"
	restEncoder, err := httpbinding.NewEncoder(request.URL.Path, request.URL.RawQuery, request.Header)
	if err != nil {
		return out, metadata, &smithy.SerializationError{Err: err}
	}

	if err := awsRestxml_serializeOpHttpBindingsChangeResourceRecordSetsInput(input, restEncoder); err != nil {
		return out, metadata, &smithy.SerializationError{Err: err}
	}

	restEncoder.SetHeader("Content-Type").String("application/xml")

	xmlEncoder := smithyxml.NewEncoder(bytes.NewBuffer(nil))
	rootAttr := []smithyxml.Attr{}
	root := smithyxml.StartElement{
		Name: smithyxml.Name{
			Local: "ChangeResourceRecordSetsRequest",
		},
		Attr: rootAttr,
	}
	root.Attr = append(root.Attr, smithyxml.NewNamespaceAttribute("", "https://route53.amazonaws.com/doc/2012-12-12/"))
	if err := awsRestxml_serializeOpDocumentChangeResourceRecordSetsInput(input, xmlEncoder.RootElement(root)); err != nil {
		return out, metadata, &smithy.SerializationError{Err: err}
	}
	if request, err = request.SetStream(bytes.NewReader(xmlEncoder.Bytes())); err != nil {
		return out, metadata, &smithy.SerializationError{Err: err}
	}

	if request.Request, err = restEncoder.Encode(request.Request); err != nil {
		return out, metadata, &smithy.SerializationError{Err: err}
	}
	in.Request = request

	return next.HandleSerialize(ctx, in)
}
func awsRestxml_serializeOpHttpBindingsChangeResourceRecordSetsInput(v *ChangeResourceRecordSetsInput, encoder *httpbinding.Encoder) error {
	if v == nil {
		return fmt.Errorf("unsupported serialization of nil %T", v)
	}

	if v.ZoneID == nil || len(*v.ZoneID) == 0 {
		return &smithy.SerializationError{Err: fmt.Errorf("input member ZoneID must not be empty")}
	}
	if v.ZoneID != nil {
		if err := encoder.SetURI("ZoneID").String(*v.ZoneID); err != nil {
			return err
		}
	}

	return nil
}

func awsRestxml_serializeOpDocumentChangeResourceRecordSetsInput(v *ChangeResourceRecordSetsInput, value smithyxml.Value) error {
	defer value.Close()
	if v.Comment != nil {
		rootAttr := []smithyxml.Attr{}
		root := smithyxml.StartElement{
			Name: smithyxml.Name{
				Local: "Comment",
			},
			Attr: rootAttr,
		}
		el := value.MemberElement(root)
		el.String(*v.Comment)
	}
	if v.RequestChangeBatch != nil {
		rootAttr := []smithyxml.Attr{}
		root := smithyxml.StartElement{
			Name: smithyxml.Name{
				Local: "ChangeBatch",
			},
			Attr: rootAttr,
		}
		el := value.MemberElement(root)
		if err := awsRestxml_serializeDocumentRequestChangeBatch(v.RequestChangeBatch, el); err != nil {
			return err
		}
	}
	return nil
}

type awsRestxml_serializeOpCreateHostedZone struct {
}

func (*awsRestxml_serializeOpCreateHostedZone) ID() string {
	return "OperationSerializer"
}

func (m *awsRestxml_serializeOpCreateHostedZone) HandleSerialize(ctx context.Context, in middleware.SerializeInput, next middleware.SerializeHandler) (
	out middleware.SerializeOutput, metadata middleware.Metadata, err error,
) {
	request, ok := in.Request.(*smithyhttp.Request)
	if !ok {
		return out, metadata, &smithy.SerializationError{Err: fmt.Errorf("unknown transport type %T", in.Request)}
	}

	input, ok := in.Parameters.(*CreateHostedZoneInput)
	_ = input
	if !ok {
		return out, metadata, &smithy.SerializationError{Err: fmt.Errorf("unknown input parameters type %T", in.Parameters)}
	}

	opPath, opQuery := httpbinding.SplitURI("/2012-12-12N2013-12-16/hostedzone")
	request.URL.Path = smithyhttp.JoinPath(request.URL.Path, opPath)
	request.URL.RawQuery = smithyhttp.JoinRawQuery(request.URL.RawQuery, opQuery)
	request.Method = "POST"
	restEncoder, err := httpbinding.NewEncoder(request.URL.Path, request.URL.RawQuery, request.Header)
	if err != nil {
		return out, metadata, &smithy.SerializationError{Err: err}
	}

	restEncoder.SetHeader("Content-Type").String("application/xml")

	xmlEncoder := smithyxml.NewEncoder(bytes.NewBuffer(nil))
	rootAttr := []smithyxml.Attr{}
	root := smithyxml.StartElement{
		Name: smithyxml.Name{
			Local: "CreateHostedZoneRequest",
		},
		Attr: rootAttr,
	}
	root.Attr = append(root.Attr, smithyxml.NewNamespaceAttribute("", "https://route53.amazonaws.com/doc/2012-12-12/"))
	if err := awsRestxml_serializeOpDocumentCreateHostedZoneInput(input, xmlEncoder.RootElement(root)); err != nil {
		return out, metadata, &smithy.SerializationError{Err: err}
	}
	if request, err = request.SetStream(bytes.NewReader(xmlEncoder.Bytes())); err != nil {
		return out, metadata, &smithy.SerializationError{Err: err}
	}

	if request.Request, err = restEncoder.Encode(request.Request); err != nil {
		return out, metadata, &smithy.SerializationError{Err: err}
	}
	in.Request = request

	return next.HandleSerialize(ctx, in)
}
func awsRestxml_serializeOpHttpBindingsCreateHostedZoneInput(v *CreateHostedZoneInput, encoder *httpbinding.Encoder) error {
	if v == nil {
		return fmt.Errorf("unsupported serialization of nil %T", v)
	}

	return nil
}

func awsRestxml_serializeOpDocumentCreateHostedZoneInput(v *CreateHostedZoneInput, value smithyxml.Value) error {
	defer value.Close()
	if v.CallerReference != nil {
		rootAttr := []smithyxml.Attr{}
		root := smithyxml.StartElement{
			Name: smithyxml.Name{
				Local: "CallerReference",
			},
			Attr: rootAttr,
		}
		el := value.MemberElement(root)
		el.String(*v.CallerReference)
	}
	if v.Name != nil {
		rootAttr := []smithyxml.Attr{}
		root := smithyxml.StartElement{
			Name: smithyxml.Name{
				Local: "Name",
			},
			Attr: rootAttr,
		}
		el := value.MemberElement(root)
		el.String(*v.Name)
	}
	if v.RequestHostedZoneConfig != nil {
		rootAttr := []smithyxml.Attr{}
		root := smithyxml.StartElement{
			Name: smithyxml.Name{
				Local: "HostedZoneConfig",
			},
			Attr: rootAttr,
		}
		el := value.MemberElement(root)
		if err := awsRestxml_serializeDocumentRequestHostedZoneConfig(v.RequestHostedZoneConfig, el); err != nil {
			return err
		}
	}
	return nil
}

type awsRestxml_serializeOpDeleteHostedZone struct {
}

func (*awsRestxml_serializeOpDeleteHostedZone) ID() string {
	return "OperationSerializer"
}

func (m *awsRestxml_serializeOpDeleteHostedZone) HandleSerialize(ctx context.Context, in middleware.SerializeInput, next middleware.SerializeHandler) (
	out middleware.SerializeOutput, metadata middleware.Metadata, err error,
) {
	request, ok := in.Request.(*smithyhttp.Request)
	if !ok {
		return out, metadata, &smithy.SerializationError{Err: fmt.Errorf("unknown transport type %T", in.Request)}
	}

	input, ok := in.Parameters.(*DeleteHostedZoneInput)
	_ = input
	if !ok {
		return out, metadata, &smithy.SerializationError{Err: fmt.Errorf("unknown input parameters type %T", in.Parameters)}
	}

	opPath, opQuery := httpbinding.SplitURI("/2012-12-12N2013-12-16/hostedzone/{ZoneID}")
	request.URL.Path = smithyhttp.JoinPath(request.URL.Path, opPath)
	request.URL.RawQuery = smithyhttp.JoinRawQuery(request.URL.RawQuery, opQuery)
	request.Method = "DELETE"
	restEncoder, err := httpbinding.NewEncoder(request.URL.Path, request.URL.RawQuery, request.Header)
	if err != nil {
		return out, metadata, &smithy.SerializationError{Err: err}
	}

	if err := awsRestxml_serializeOpHttpBindingsDeleteHostedZoneInput(input, restEncoder); err != nil {
		return out, metadata, &smithy.SerializationError{Err: err}
	}

	if request.Request, err = restEncoder.Encode(request.Request); err != nil {
		return out, metadata, &smithy.SerializationError{Err: err}
	}
	in.Request = request

	return next.HandleSerialize(ctx, in)
}
func awsRestxml_serializeOpHttpBindingsDeleteHostedZoneInput(v *DeleteHostedZoneInput, encoder *httpbinding.Encoder) error {
	if v == nil {
		return fmt.Errorf("unsupported serialization of nil %T", v)
	}

	if v.ZoneID == nil || len(*v.ZoneID) == 0 {
		return &smithy.SerializationError{Err: fmt.Errorf("input member ZoneID must not be empty")}
	}
	if v.ZoneID != nil {
		if err := encoder.SetURI("ZoneID").String(*v.ZoneID); err != nil {
			return err
		}
	}

	return nil
}

type awsRestxml_serializeOpGetChange struct {
}

func (*awsRestxml_serializeOpGetChange) ID() string {
	return "OperationSerializer"
}

func (m *awsRestxml_serializeOpGetChange) HandleSerialize(ctx context.Context, in middleware.SerializeInput, next middleware.SerializeHandler) (
	out middleware.SerializeOutput, metadata middleware.Metadata, err error,
) {
	request, ok := in.Request.(*smithyhttp.Request)
	if !ok {
		return out, metadata, &smithy.SerializationError{Err: fmt.Errorf("unknown transport type %T", in.Request)}
	}

	input, ok := in.Parameters.(*GetChangeInput)
	_ = input
	if !ok {
		return out, metadata, &smithy.SerializationError{Err: fmt.Errorf("unknown input parameters type %T", in.Parameters)}
	}

	opPath, opQuery := httpbinding.SplitURI("/2012-12-12N2013-12-16/change/{ChangeID}")
	request.URL.Path = smithyhttp.JoinPath(request.URL.Path, opPath)
	request.URL.RawQuery = smithyhttp.JoinRawQuery(request.URL.RawQuery, opQuery)
	request.Method = "GET"
	restEncoder, err := httpbinding.NewEncoder(request.URL.Path, request.URL.RawQuery, request.Header)
	if err != nil {
		return out, metadata, &smithy.SerializationError{Err: err}
	}

	if err := awsRestxml_serializeOpHttpBindingsGetChangeInput(input, restEncoder); err != nil {
		return out, metadata, &smithy.SerializationError{Err: err}
	}

	if request.Request, err = restEncoder.Encode(request.Request); err != nil {
		return out, metadata, &smithy.SerializationError{Err: err}
	}
	in.Request = request

	return next.HandleSerialize(ctx, in)
}
func awsRestxml_serializeOpHttpBindingsGetChangeInput(v *GetChangeInput, encoder *httpbinding.Encoder) error {
	if v == nil {
		return fmt.Errorf("unsupported serialization of nil %T", v)
	}

	if v.ChangeID == nil || len(*v.ChangeID) == 0 {
		return &smithy.SerializationError{Err: fmt.Errorf("input member ChangeID must not be empty")}
	}
	if v.ChangeID != nil {
		if err := encoder.SetURI("ChangeID").String(*v.ChangeID); err != nil {
			return err
		}
	}

	return nil
}

type awsRestxml_serializeOpGetHostedZone struct {
}

func (*awsRestxml_serializeOpGetHostedZone) ID() string {
	return "OperationSerializer"
}

func (m *awsRestxml_serializeOpGetHostedZone) HandleSerialize(ctx context.Context, in middleware.SerializeInput, next middleware.SerializeHandler) (
	out middleware.SerializeOutput, metadata middleware.Metadata, err error,
) {
	request, ok := in.Request.(*smithyhttp.Request)
	if !ok {
		return out, metadata, &smithy.SerializationError{Err: fmt.Errorf("unknown transport type %T", in.Request)}
	}

	input, ok := in.Parameters.(*GetHostedZoneInput)
	_ = input
	if !ok {
		return out, metadata, &smithy.SerializationError{Err: fmt.Errorf("unknown input parameters type %T", in.Parameters)}
	}

	opPath, opQuery := httpbinding.SplitURI("/2012-12-12N2013-12-16/hostedzone/{ZoneID}")
	request.URL.Path = smithyhttp.JoinPath(request.URL.Path, opPath)
	request.URL.RawQuery = smithyhttp.JoinRawQuery(request.URL.RawQuery, opQuery)
	request.Method = "GET"
	restEncoder, err := httpbinding.NewEncoder(request.URL.Path, request.URL.RawQuery, request.Header)
	if err != nil {
		return out, metadata, &smithy.SerializationError{Err: err}
	}

	if err := awsRestxml_serializeOpHttpBindingsGetHostedZoneInput(input, restEncoder); err != nil {
		return out, metadata, &smithy.SerializationError{Err: err}
	}

	if request.Request, err = restEncoder.Encode(request.Request); err != nil {
		return out, metadata, &smithy.SerializationError{Err: err}
	}
	in.Request = request

	return next.HandleSerialize(ctx, in)
}
func awsRestxml_serializeOpHttpBindingsGetHostedZoneInput(v *GetHostedZoneInput, encoder *httpbinding.Encoder) error {
	if v == nil {
		return fmt.Errorf("unsupported serialization of nil %T", v)
	}

	if v.ZoneID == nil || len(*v.ZoneID) == 0 {
		return &smithy.SerializationError{Err: fmt.Errorf("input member ZoneID must not be empty")}
	}
	if v.ZoneID != nil {
		if err := encoder.SetURI("ZoneID").String(*v.ZoneID); err != nil {
			return err
		}
	}

	return nil
}

type awsRestxml_serializeOpListHostedZones struct {
}

func (*awsRestxml_serializeOpListHostedZones) ID() string {
	return "OperationSerializer"
}

func (m *awsRestxml_serializeOpListHostedZones) HandleSerialize(ctx context.Context, in middleware.SerializeInput, next middleware.SerializeHandler) (
	out middleware.SerializeOutput, metadata middleware.Metadata, err error,
) {
	request, ok := in.Request.(*smithyhttp.Request)
	if !ok {
		return out, metadata, &smithy.SerializationError{Err: fmt.Errorf("unknown transport type %T", in.Request)}
	}

	input, ok := in.Parameters.(*ListHostedZonesInput)
	_ = input
	if !ok {
		return out, metadata, &smithy.SerializationError{Err: fmt.Errorf("unknown input parameters type %T", in.Parameters)}
	}

	opPath, opQuery := httpbinding.SplitURI("/2012-12-12N2013-12-16/hostedzone")
	request.URL.Path = smithyhttp.JoinPath(request.URL.Path, opPath)
	request.URL.RawQuery = smithyhttp.JoinRawQuery(request.URL.RawQuery, opQuery)
	request.Method = "GET"
	restEncoder, err := httpbinding.NewEncoder(request.URL.Path, request.URL.RawQuery, request.Header)
	if err != nil {
		return out, metadata, &smithy.SerializationError{Err: err}
	}

	if err := awsRestxml_serializeOpHttpBindingsListHostedZonesInput(input, restEncoder); err != nil {
		return out, metadata, &smithy.SerializationError{Err: err}
	}

	if request.Request, err = restEncoder.Encode(request.Request); err != nil {
		return out, metadata, &smithy.SerializationError{Err: err}
	}
	in.Request = request

	return next.HandleSerialize(ctx, in)
}
func awsRestxml_serializeOpHttpBindingsListHostedZonesInput(v *ListHostedZonesInput, encoder *httpbinding.Encoder) error {
	if v == nil {
		return fmt.Errorf("unsupported serialization of nil %T", v)
	}

	if v.Marker != nil {
		encoder.SetQuery("marker").String(*v.Marker)
	}

	if v.Maxitems != nil {
		encoder.SetQuery("maxitems").Integer(*v.Maxitems)
	}

	return nil
}

type awsRestxml_serializeOpListResourceRecordSets struct {
}

func (*awsRestxml_serializeOpListResourceRecordSets) ID() string {
	return "OperationSerializer"
}

func (m *awsRestxml_serializeOpListResourceRecordSets) HandleSerialize(ctx context.Context, in middleware.SerializeInput, next middleware.SerializeHandler) (
	out middleware.SerializeOutput, metadata middleware.Metadata, err error,
) {
	request, ok := in.Request.(*smithyhttp.Request)
	if !ok {
		return out, metadata, &smithy.SerializationError{Err: fmt.Errorf("unknown transport type %T", in.Request)}
	}

	input, ok := in.Parameters.(*ListResourceRecordSetsInput)
	_ = input
	if !ok {
		return out, metadata, &smithy.SerializationError{Err: fmt.Errorf("unknown input parameters type %T", in.Parameters)}
	}

	opPath, opQuery := httpbinding.SplitURI("/2012-12-12N2013-12-16/hostedzone/{ZoneID}/rrset")
	request.URL.Path = smithyhttp.JoinPath(request.URL.Path, opPath)
	request.URL.RawQuery = smithyhttp.JoinRawQuery(request.URL.RawQuery, opQuery)
	request.Method = "GET"
	restEncoder, err := httpbinding.NewEncoder(request.URL.Path, request.URL.RawQuery, request.Header)
	if err != nil {
		return out, metadata, &smithy.SerializationError{Err: err}
	}

	if err := awsRestxml_serializeOpHttpBindingsListResourceRecordSetsInput(input, restEncoder); err != nil {
		return out, metadata, &smithy.SerializationError{Err: err}
	}

	if request.Request, err = restEncoder.Encode(request.Request); err != nil {
		return out, metadata, &smithy.SerializationError{Err: err}
	}
	in.Request = request

	return next.HandleSerialize(ctx, in)
}
func awsRestxml_serializeOpHttpBindingsListResourceRecordSetsInput(v *ListResourceRecordSetsInput, encoder *httpbinding.Encoder) error {
	if v == nil {
		return fmt.Errorf("unsupported serialization of nil %T", v)
	}

	if v.Identifier != nil {
		encoder.SetQuery("identifier").String(*v.Identifier)
	}

	if v.Maxitems != nil {
		encoder.SetQuery("maxitems").Integer(*v.Maxitems)
	}

	if v.Name != nil {
		encoder.SetQuery("name").String(*v.Name)
	}

	if len(v.Type) > 0 {
		encoder.SetQuery("type").String(string(v.Type))
	}

	if v.ZoneID == nil || len(*v.ZoneID) == 0 {
		return &smithy.SerializationError{Err: fmt.Errorf("input member ZoneID must not be empty")}
	}
	if v.ZoneID != nil {
		if err := encoder.SetURI("ZoneID").String(*v.ZoneID); err != nil {
			return err
		}
	}

	return nil
}

func awsRestxml_serializeDocumentListOfRequestChanges(v []types.RequestChanges, value smithyxml.Value) error {
	var array *smithyxml.Array
	if !value.IsFlattened() {
		defer value.Close()
	}
	array = value.Array()
	for i := range v {
		am := array.Member()
		if err := awsRestxml_serializeDocumentRequestChanges(&v[i], am); err != nil {
			return err
		}
	}
	return nil
}

func awsRestxml_serializeDocumentListOfRequestResourceRecords(v []types.RequestResourceRecords, value smithyxml.Value) error {
	var array *smithyxml.Array
	if !value.IsFlattened() {
		defer value.Close()
	}
	array = value.Array()
	for i := range v {
		am := array.Member()
		if err := awsRestxml_serializeDocumentRequestResourceRecords(&v[i], am); err != nil {
			return err
		}
	}
	return nil
}

func awsRestxml_serializeDocumentRequestChange(v *types.RequestChange, value smithyxml.Value) error {
	defer value.Close()
	if len(v.Action) > 0 {
		rootAttr := []smithyxml.Attr{}
		root := smithyxml.StartElement{
			Name: smithyxml.Name{
				Local: "Action",
			},
			Attr: rootAttr,
		}
		el := value.MemberElement(root)
		el.String(string(v.Action))
	}
	if v.RequestResourceRecordSet != nil {
		rootAttr := []smithyxml.Attr{}
		root := smithyxml.StartElement{
			Name: smithyxml.Name{
				Local: "ResourceRecordSet",
			},
			Attr: rootAttr,
		}
		el := value.MemberElement(root)
		if err := awsRestxml_serializeDocumentRequestResourceRecordSet(v.RequestResourceRecordSet, el); err != nil {
			return err
		}
	}
	return nil
}

func awsRestxml_serializeDocumentRequestChangeBatch(v *types.RequestChangeBatch, value smithyxml.Value) error {
	defer value.Close()
	if v.ListOfRequestChanges != nil {
		rootAttr := []smithyxml.Attr{}
		root := smithyxml.StartElement{
			Name: smithyxml.Name{
				Local: "Changes",
			},
			Attr: rootAttr,
		}
		el := value.FlattenedElement(root)
		if err := awsRestxml_serializeDocumentListOfRequestChanges(v.ListOfRequestChanges, el); err != nil {
			return err
		}
	}
	return nil
}

func awsRestxml_serializeDocumentRequestChanges(v *types.RequestChanges, value smithyxml.Value) error {
	defer value.Close()
	if v.RequestChange != nil {
		rootAttr := []smithyxml.Attr{}
		root := smithyxml.StartElement{
			Name: smithyxml.Name{
				Local: "Change",
			},
			Attr: rootAttr,
		}
		el := value.MemberElement(root)
		if err := awsRestxml_serializeDocumentRequestChange(v.RequestChange, el); err != nil {
			return err
		}
	}
	return nil
}

func awsRestxml_serializeDocumentRequestHostedZoneConfig(v *types.RequestHostedZoneConfig, value smithyxml.Value) error {
	defer value.Close()
	if v.Comment != nil {
		rootAttr := []smithyxml.Attr{}
		root := smithyxml.StartElement{
			Name: smithyxml.Name{
				Local: "Comment",
			},
			Attr: rootAttr,
		}
		el := value.MemberElement(root)
		el.String(*v.Comment)
	}
	return nil
}

func awsRestxml_serializeDocumentRequestResourceRecord(v *types.RequestResourceRecord, value smithyxml.Value) error {
	defer value.Close()
	if v.Value != nil {
		rootAttr := []smithyxml.Attr{}
		root := smithyxml.StartElement{
			Name: smithyxml.Name{
				Local: "Value",
			},
			Attr: rootAttr,
		}
		el := value.MemberElement(root)
		el.String(*v.Value)
	}
	return nil
}

func awsRestxml_serializeDocumentRequestResourceRecords(v *types.RequestResourceRecords, value smithyxml.Value) error {
	defer value.Close()
	if v.RequestResourceRecord != nil {
		rootAttr := []smithyxml.Attr{}
		root := smithyxml.StartElement{
			Name: smithyxml.Name{
				Local: "ResourceRecord",
			},
			Attr: rootAttr,
		}
		el := value.MemberElement(root)
		if err := awsRestxml_serializeDocumentRequestResourceRecord(v.RequestResourceRecord, el); err != nil {
			return err
		}
	}
	return nil
}

func awsRestxml_serializeDocumentRequestResourceRecordSet(v *types.RequestResourceRecordSet, value smithyxml.Value) error {
	defer value.Close()
	if len(v.Failover) > 0 {
		rootAttr := []smithyxml.Attr{}
		root := smithyxml.StartElement{
			Name: smithyxml.Name{
				Local: "Failover",
			},
			Attr: rootAttr,
		}
		el := value.MemberElement(root)
		el.String(string(v.Failover))
	}
	if v.ListOfRequestResourceRecords != nil {
		rootAttr := []smithyxml.Attr{}
		root := smithyxml.StartElement{
			Name: smithyxml.Name{
				Local: "ResourceRecords",
			},
			Attr: rootAttr,
		}
		el := value.FlattenedElement(root)
		if err := awsRestxml_serializeDocumentListOfRequestResourceRecords(v.ListOfRequestResourceRecords, el); err != nil {
			return err
		}
	}
	if v.Name != nil {
		rootAttr := []smithyxml.Attr{}
		root := smithyxml.StartElement{
			Name: smithyxml.Name{
				Local: "Name",
			},
			Attr: rootAttr,
		}
		el := value.MemberElement(root)
		el.String(*v.Name)
	}
	if v.Region != nil {
		rootAttr := []smithyxml.Attr{}
		root := smithyxml.StartElement{
			Name: smithyxml.Name{
				Local: "Region",
			},
			Attr: rootAttr,
		}
		el := value.MemberElement(root)
		el.String(*v.Region)
	}
	if v.RequestXniftyHealthCheckConfig != nil {
		rootAttr := []smithyxml.Attr{}
		root := smithyxml.StartElement{
			Name: smithyxml.Name{
				Local: "XniftyHealthCheckConfig",
			},
			Attr: rootAttr,
		}
		el := value.MemberElement(root)
		if err := awsRestxml_serializeDocumentRequestXniftyHealthCheckConfig(v.RequestXniftyHealthCheckConfig, el); err != nil {
			return err
		}
	}
	if v.SetIdentifier != nil {
		rootAttr := []smithyxml.Attr{}
		root := smithyxml.StartElement{
			Name: smithyxml.Name{
				Local: "SetIdentifier",
			},
			Attr: rootAttr,
		}
		el := value.MemberElement(root)
		el.String(*v.SetIdentifier)
	}
	if v.TTL != nil {
		rootAttr := []smithyxml.Attr{}
		root := smithyxml.StartElement{
			Name: smithyxml.Name{
				Local: "TTL",
			},
			Attr: rootAttr,
		}
		el := value.MemberElement(root)
		el.Integer(*v.TTL)
	}
	if len(v.Type) > 0 {
		rootAttr := []smithyxml.Attr{}
		root := smithyxml.StartElement{
			Name: smithyxml.Name{
				Local: "Type",
			},
			Attr: rootAttr,
		}
		el := value.MemberElement(root)
		el.String(string(v.Type))
	}
	if v.Weight != nil {
		rootAttr := []smithyxml.Attr{}
		root := smithyxml.StartElement{
			Name: smithyxml.Name{
				Local: "Weight",
			},
			Attr: rootAttr,
		}
		el := value.MemberElement(root)
		el.Integer(*v.Weight)
	}
	if v.XniftyComment != nil {
		rootAttr := []smithyxml.Attr{}
		root := smithyxml.StartElement{
			Name: smithyxml.Name{
				Local: "XniftyComment",
			},
			Attr: rootAttr,
		}
		el := value.MemberElement(root)
		el.String(*v.XniftyComment)
	}
	return nil
}

func awsRestxml_serializeDocumentRequestXniftyHealthCheckConfig(v *types.RequestXniftyHealthCheckConfig, value smithyxml.Value) error {
	defer value.Close()
	if v.FullyQualifiedDomainName != nil {
		rootAttr := []smithyxml.Attr{}
		root := smithyxml.StartElement{
			Name: smithyxml.Name{
				Local: "FullyQualifiedDomainName",
			},
			Attr: rootAttr,
		}
		el := value.MemberElement(root)
		el.String(*v.FullyQualifiedDomainName)
	}
	if v.IPAddress != nil {
		rootAttr := []smithyxml.Attr{}
		root := smithyxml.StartElement{
			Name: smithyxml.Name{
				Local: "IPAddress",
			},
			Attr: rootAttr,
		}
		el := value.MemberElement(root)
		el.String(*v.IPAddress)
	}
	if v.Port != nil {
		rootAttr := []smithyxml.Attr{}
		root := smithyxml.StartElement{
			Name: smithyxml.Name{
				Local: "Port",
			},
			Attr: rootAttr,
		}
		el := value.MemberElement(root)
		el.Integer(*v.Port)
	}
	if len(v.Protocol) > 0 {
		rootAttr := []smithyxml.Attr{}
		root := smithyxml.StartElement{
			Name: smithyxml.Name{
				Local: "Protocol",
			},
			Attr: rootAttr,
		}
		el := value.MemberElement(root)
		el.String(string(v.Protocol))
	}
	if v.ResourcePath != nil {
		rootAttr := []smithyxml.Attr{}
		root := smithyxml.StartElement{
			Name: smithyxml.Name{
				Local: "ResourcePath",
			},
			Attr: rootAttr,
		}
		el := value.MemberElement(root)
		el.String(*v.ResourcePath)
	}
	return nil
}
