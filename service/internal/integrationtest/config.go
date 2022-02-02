package integrationtest

import (
	"os"
	"strings"

	"github.com/aws/aws-sdk-go-v2/aws"
	"github.com/nifcloud/nifcloud-sdk-go/nifcloud"
)

// LoadConfigWithDefaultRegion loads the default configuration for the SDK, and
// falls back to a default region if one is not specified.
func LoadConfigWithDefaultRegion(defaultRegion string) nifcloud.Config {
	var lm aws.ClientLogMode

	if strings.EqualFold(os.Getenv("NIFCLOUD_DEBUG_REQUEST"), "true") {
		lm |= aws.LogRequest

	} else if strings.EqualFold(os.Getenv("NIFCLOUD_DEBUG_REQUEST_BODY"), "true") {
		lm |= aws.LogRequestWithBody
	}

	cfg := nifcloud.NewConfig(os.Getenv("NIFCLOUD_ACCESS_KEY_ID"), os.Getenv("NIFCLOUD_SECRET_ACCESS_KEY"), defaultRegion)
	cfg.ClientLogMode = lm

	return cfg
}
