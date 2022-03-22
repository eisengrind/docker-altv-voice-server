<p align="center"><img src=".github/assets/logo-256px.png"></p>
<p align="center">
  <a href="https://github.com/eisengrind/docker-altv-voice-server/actions"><img src="https://github.com/eisengrind/docker-altv-voice-server/workflows/DefaultCI/badge.svg"></a>
</p>
</p>

<h1 align="center">Unofficial alt:V voice server Docker image</h1>
<p align="center"><i>Searching for the alt:V server image? <a href="https://github.com/eisengrind/docker-altv-server">Click here</a></i></p>

A Docker image providing the alt:V voice server.

## Usage

```sh
docker run --rm -it eisengrind/altv-voice-server:release
```

To the a full list of the latest tags and release of this Docker image, see the image on [Docker Hub](https://hub.docker.com/r/eisengrind/altv-voice-server).

### Environment variables

Here is a list of all available environment variables this image uses. The image maps environment variables to the voice server config file.

Variable | Default value | Description
--- | --- | ---
`ALTV_VOICE_SERVER_HOST` | `0.0.0.0` | The voice server host address on which the voice is reachable for the alt:V server.
`ALTV_VOICE_SERVER_PORT` | `7798` | The voice server port on which the voice server is reachable for the alt:V server.
`ALTV_VOICE_SERVER_PLAYER_HOST` | `0.0.0.0` | A (static) ip on which the voice server is reachable for clients connected to the alt:V server.
`ALTV_VOICE_SERVER_PLAYER_PORT` | `7799` | The voice server port on which the voice server is reachable for clients connected to the alt:V server.
`ALTV_VOICE_SERVER_SECRET` | `1234` | A secret that the alt:V server uses to authenticate against the voice server.

To use the environment variable when starting this Docker image:

```sh
docker run --rm -it -e ALTV_VOICE_SERVER_SECRET=123456789 eisengrind/altv-voice-server:release
```

sets the voice server secret to `123456789`. See the [Docker documentation on environment variables](https://docs.docker.com/engine/reference/commandline/run/#set-environment-variables--e---env---env-file).

### Note on Docker caching

We provide two different kinds of tags for the alt:V Docker images: specific and non-specific image tags.

In general, this means that specific tags represent a unique alt:V build version whereas a non-specific tag such as `release...` or `dev...` represents the latest build number of the regarding branch.

Thus, once an image with a non-specific tag is pulled, this image will not automatically get updated by Docker unless you remove and pull the image again from Docker Hub.

This is why we provide specific tags. Those kind of tags do explicitly not lead to a caching problem, because specific tags are not meant to be, once they are published, changed.

**tl;dr Keep in mind that you should always specify a specific tag in a Dockerfile.**

### Note on Docker image security

Since this images inherits from the `debian:buster-slim` image, we schedule nightly builds every 24 hours to reduce security invulnerabilities.

We highly recommend to update the altv-server image as frequent as possible.

Keep in mind that, because of the frequent updates, we overwrite the image tags `release`, `dev`, `rc` aswell as their build versions.

To use a specific image, we recommend using their Sha-256 digest hash as an image selector.

## License

See the [LICENSE](https://github.com/eisengrind/docker-altv-voice-server/blob/master/LICENSE)-file for further information.
