package config

type VoiceServer struct {
	Host       *string `env:"HOST" toml:"host" yaml:"host" json:"host"`
	Port       *uint16 `env:"PORT" toml:"port" yaml:"port" json:"port"`
	PlayerHost *string `env:"PLAYER_HOST" toml:"playerHost" yaml:"playerHost" json:"playerHost"`
	PlayerPort *uint16 `env:"PLAYER_PORT" toml:"playerPort" yaml:"playerPort" json:"playerPort"`
}
