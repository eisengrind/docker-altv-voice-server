package config

import (
	"errors"
	"github.com/eisengrind/docker-altv-voice-server/tools/configurator/helpers"
	"github.com/pelletier/go-toml/v2"
	"gopkg.in/yaml.v2"
	"os"
	"path"
)

var validFileExtensions = []string{".yaml", ".yml", ".toml", ".cfg"}

func Write(filepath string, cfg VoiceServer) (err error) {
	ext := path.Ext(filepath)

	if !helpers.Contains(validFileExtensions, ext) {
		return errors.New("invalid file extension provided")
	}

	var bs []byte

	switch ext {
	case ".cfg":
		fallthrough
	case ".yml":
		fallthrough
	case ".yaml":
		bs, err = yaml.Marshal(cfg)
		if err != nil {
			return err
		}
	case ".toml":
		bs, err = toml.Marshal(cfg)
		if err != nil {
			return err
		}
	}

	return os.WriteFile(filepath, bs, 0770)
}
