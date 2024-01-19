package config

import "github.com/caarlos0/env/v6"

func ParseEnv(prefix string) (VoiceServer, error) {
	var cfg VoiceServer

	if err := env.Parse(&cfg, env.Options{
		Prefix: prefix,
	}); err != nil {
		return cfg, err
	}

	return cfg, nil
}
