package config

import (
	"os"
	"path/filepath"

	"gopkg.in/ini.v1"

	"github.com/nifcloud/nifcloud-sdk-go/nifcloud"
)

const (
	defaultSharedConfigProfile = "default"
	defaultSharedFileName      = ".nifcloud/credentials"

	accessKeyIDKey  = "nifcloud_access_key_id"
	secretAccessKey = "nifcloud_secret_access_key"
	regionKey       = "region"
)

type LoadSharedConfigOptions struct {
	Profile         string
	CredentialsFile string
}

type LoadSharedConfigOption func(*LoadSharedConfigOptions)

func LoadSharedConfigWithProfile(profile string) LoadSharedConfigOption {
	return func(o *LoadSharedConfigOptions) {
		o.Profile = profile
	}
}

func LoadSharedConfigWithCredentialsFile(credentialsFile string) LoadSharedConfigOption {
	return func(o *LoadSharedConfigOptions) {
		o.CredentialsFile = credentialsFile
	}
}

// LoadSharedConfig uses the configs passed in to load the SharedConfig from file
func LoadSharedConfig(opts ...LoadSharedConfigOption) (nifcloud.Config, error) {
	var opt LoadSharedConfigOptions
	for _, fn := range opts {
		fn(&opt)
	}

	if len(opt.Profile) == 0 {
		opt.Profile = defaultSharedConfigProfile
	}

	if len(opt.CredentialsFile) == 0 {
		home, err := os.UserHomeDir()
		if err != nil {
			return nifcloud.Config{}, err
		}
		opt.CredentialsFile = filepath.Join(home, defaultSharedFileName)
	}

	sections, err := ini.Load(opt.CredentialsFile)
	if err != nil {
		return nifcloud.Config{}, err
	}

	section, err := sections.GetSection(opt.Profile)
	if err != nil {
		return nifcloud.Config{}, err
	}

	accsessKey, err := section.GetKey(accessKeyIDKey)
	if err != nil {
		return nifcloud.Config{}, err
	}

	secretKey, err := section.GetKey(secretAccessKey)
	if err != nil {
		return nifcloud.Config{}, err

	}

	region, err := section.GetKey(regionKey)
	if err != nil {
		return nifcloud.Config{}, err
	}

	return nifcloud.NewConfig(accsessKey.Value(), secretKey.Value(), region.Value()), nil
}
