// Code generated by smithy-go-codegen DO NOT EDIT.


package types

type MetricNameOfGetMetricStatisticsRequest string

// Enum values for MetricNameOfGetMetricStatisticsRequest
const (
	MetricNameOfGetMetricStatisticsRequestFreeStorageSpace MetricNameOfGetMetricStatisticsRequest = "FreeStorageSpace"
	MetricNameOfGetMetricStatisticsRequestUsedStorageSpace MetricNameOfGetMetricStatisticsRequest = "UsedStorageSpace"
	MetricNameOfGetMetricStatisticsRequestReadIops MetricNameOfGetMetricStatisticsRequest = "ReadIOPS"
	MetricNameOfGetMetricStatisticsRequestWriteIops MetricNameOfGetMetricStatisticsRequest = "WriteIOPS"
	MetricNameOfGetMetricStatisticsRequestReadThroughput MetricNameOfGetMetricStatisticsRequest = "ReadThroughput"
	MetricNameOfGetMetricStatisticsRequestWriteThroughput MetricNameOfGetMetricStatisticsRequest = "WriteThroughput"
	MetricNameOfGetMetricStatisticsRequestActiveConnections MetricNameOfGetMetricStatisticsRequest = "ActiveConnections"
	MetricNameOfGetMetricStatisticsRequestGlobalReadTraffic MetricNameOfGetMetricStatisticsRequest = "GlobalReadTraffic"
	MetricNameOfGetMetricStatisticsRequestPrivateReadTraffic MetricNameOfGetMetricStatisticsRequest = "PrivateReadTraffic"
	MetricNameOfGetMetricStatisticsRequestGlobalWriteTraffic MetricNameOfGetMetricStatisticsRequest = "GlobalWriteTraffic"
	MetricNameOfGetMetricStatisticsRequestPrivateWriteTraffic MetricNameOfGetMetricStatisticsRequest = "PrivateWriteTraffic"
)

// Values returns all known values for MetricNameOfGetMetricStatisticsRequest. Note
// that this can be expanded in the future, and so it is only as up to date as the
// client. The ordering of this slice is not guaranteed to be stable across
// updates.
func (MetricNameOfGetMetricStatisticsRequest) Values() []MetricNameOfGetMetricStatisticsRequest {
	return []MetricNameOfGetMetricStatisticsRequest{
		"FreeStorageSpace",
		"UsedStorageSpace",
		"ReadIOPS",
		"WriteIOPS",
		"ReadThroughput",
		"WriteThroughput",
		"ActiveConnections",
		"GlobalReadTraffic",
		"PrivateReadTraffic",
		"GlobalWriteTraffic",
		"PrivateWriteTraffic",
	}
}

type ProtocolOfCreateNASInstanceRequest string

// Enum values for ProtocolOfCreateNASInstanceRequest
const (
	ProtocolOfCreateNASInstanceRequestNfs ProtocolOfCreateNASInstanceRequest = "nfs"
	ProtocolOfCreateNASInstanceRequestCifs ProtocolOfCreateNASInstanceRequest = "cifs"
)

// Values returns all known values for ProtocolOfCreateNASInstanceRequest. Note
// that this can be expanded in the future, and so it is only as up to date as the
// client. The ordering of this slice is not guaranteed to be stable across
// updates.
func (ProtocolOfCreateNASInstanceRequest) Values() []ProtocolOfCreateNASInstanceRequest {
	return []ProtocolOfCreateNASInstanceRequest{
		"nfs",
		"cifs",
	}
}

type SessionClearTypeOfClearNASSessionRequest string

// Enum values for SessionClearTypeOfClearNASSessionRequest
const (
	SessionClearTypeOfClearNASSessionRequestNormal SessionClearTypeOfClearNASSessionRequest = "0"
	SessionClearTypeOfClearNASSessionRequestForce SessionClearTypeOfClearNASSessionRequest = "1"
)

// Values returns all known values for SessionClearTypeOfClearNASSessionRequest.
// Note that this can be expanded in the future, and so it is only as up to date as
// the client. The ordering of this slice is not guaranteed to be stable across
// updates.
func (SessionClearTypeOfClearNASSessionRequest) Values() []SessionClearTypeOfClearNASSessionRequest {
	return []SessionClearTypeOfClearNASSessionRequest{
		"0",
		"1",
	}
}