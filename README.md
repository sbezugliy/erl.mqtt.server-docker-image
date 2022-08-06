# erl.mqtt.server Dockerfile
Docker container build file for fast and reliable erl.mqtt.server

- erl.mqtt.server source code: https://github.com/alekras/erl.mqtt.server
- Dockerfile sources: https://github.com/sbezugliy/erl.mqtt.server-docker-image 
- DockerHub registry: <https://hub.docker.com/repository/docker/sbezugliy/erl.mqtt.server>

Image built for usage inside of container stacks, ran and tested with CRI-O for Kubernetes/Docker Swarm. 
So, don't forget to use run script from app root dir as `CMD` or use your own entrypoint scripts.

### Build image:
```
$ podman build -f erl.mqtt.server.Dockerfile . -t erl.mqtt.server-alpine:1.1.0
```

### Set release tag
```
$ podman tag erl.mqtt.server-alpine:1.1.0 docker.io/sbezugliy/erl.mqtt.server-alpine:latest
```

### Push to registry
```
$ docker push <Registry FQDN>/<username or namespace>/erl.mqtt.server-alpine:latest
```
