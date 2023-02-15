package config

import (
	"os"

	"github.com/nifcloud/nifcloud-sdk-go/nifcloud"
)

const (
	nifcloudAccessKeyIDEnvVar     = "NIFCLOUD_ACCESS_KEY_ID"
	nifcloudSecretAccessKeyEnvVar = "NIFCLOUD_SECRET_ACCESS_KEY"
	nifcloudDefaultRegionEnvVar   = "NIFCLOUD_DEFAULT_REGION"
)

// LoadEnvConfig reads configuration values from the OS's environment variables
func LoadEnvConfig() (cfg nifcloud.Config) {
	return nifcloud.NewConfig(
		os.Getenv(nifcloudAccessKeyIDEnvVar),
		os.Getenv(nifcloudSecretAccessKeyEnvVar),
		os.Getenv(nifcloudDefaultRegionEnvVar),
	)
}
