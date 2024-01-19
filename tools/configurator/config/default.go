package config

import "github.com/pelletier/go-toml/v2"

func Default() VoiceServer {
	tomlBs := []byte(defaultTomlConfig)

	var cfg VoiceServer

	if err := toml.Unmarshal(tomlBs, &cfg); err != nil {
		panic(err)
	}

	return cfg
}

var defaultTomlConfig = `
host = '0.0.0.0'
port = 7798
playerHost = '0.0.0.0'
playerPort = 7799
secret = 1234567890
`
