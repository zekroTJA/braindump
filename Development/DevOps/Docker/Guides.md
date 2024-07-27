# Connect to host from container

> `docker-compose.yml`
```yaml
services:
  traefik:
    # ...
    extra_hosts:
      - "host.docker.internal:host-gateway"
```

**Important**
The desired service needs to bind on the docker bridge network!

## Soucres

- https://www.howtogeek.com/devops/how-to-connect-to-localhost-within-a-docker-container/