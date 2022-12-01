// This code was forked from github.com/aws/aws-sdk-go-v2. DO NOT EDIT.
// URL: https://github.com/aws/aws-sdk-go-v2/tree/v1.17.1/internal/strings/strings.go

package strings

import (
	"strings"
)

// HasPrefixFold tests whether the string s begins with prefix, interpreted as UTF-8 strings,
// under Unicode case-folding.
func HasPrefixFold(s, prefix string) bool {
	return len(s) >= len(prefix) && strings.EqualFold(s[0:len(prefix)], prefix)
}
