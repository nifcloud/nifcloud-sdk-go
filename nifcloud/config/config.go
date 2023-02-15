package config

import (
	"github.com/nifcloud/nifcloud-sdk-go/nifcloud"
)

// LoadDefaultConfig the default configuration sources is environment variables
func LoadDefaultConfig() (cfg nifcloud.Config) {
	return LoadEnvConfig()
}
