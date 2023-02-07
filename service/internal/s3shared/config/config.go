// This code was forked from github.com/aws/aws-sdk-go-v2. DO NOT EDIT.
// URL: https://github.com/aws/aws-sdk-go-v2/tree/v1.17.4/service/internal/s3shared/config/config.go

package config

import "context"

// UseARNRegionProvider is an interface for retrieving external configuration value for UseARNRegion
type UseARNRegionProvider interface {
	GetS3UseARNRegion(ctx context.Context) (value bool, found bool, err error)
}

// ResolveUseARNRegion extracts the first instance of a UseARNRegion from the config slice.
// Additionally returns a boolean to indicate if the value was found in provided configs, and error if one is encountered.
func ResolveUseARNRegion(ctx context.Context, configs []interface{}) (value bool, found bool, err error) {
	for _, cfg := range configs {
		if p, ok := cfg.(UseARNRegionProvider); ok {
			value, found, err = p.GetS3UseARNRegion(ctx)
			if err != nil || found {
				break
			}
		}
	}
	return
}
