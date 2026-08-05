A “cloud native” HTTP/S and TCP proxy server perfectly suited for being used with Docker.

### Links

- Project: [https://github.com/traefik/traefik](https://github.com/traefik/traefik)
- Docs: [https://doc.traefik.io/traefik/](https://doc.traefik.io/traefik/)

## Setup Template

```yml
# networks:
#   proxy:
#     external: true

volumes:
  letsencrypt:

services:
  traefik:
    image: traefik:v3.3
    restart: always
    command:
      - "--global.sendAnonymousUsage=false"
      - "--api=false"
      - "--api.dashboard=false"
      - "--api.insecure=false"
      - "--log.level=INFO"
      - "--log.format=common"
      - "--accesslog=true"
      - "--accesslog.format=common"
      - "--providers.docker=true"
      - "--providers.docker.exposedbydefault=false"
      # - "--providers.docker.network=proxy"
      - "--providers.docker.watch=true"
      - "--entrypoints.web.address=:80"
      - "--entrypoints.web.http.redirections.entrypoint.to=websecure"
      - "--entrypoints.web.http.redirections.entrypoint.scheme=https"
      - "--entrypoints.web.http.redirections.entrypoint.permanent=true"
      - "--entrypoints.websecure.address=:443"
      - "--entrypoints.websecure.http.tls=true"
      - "--entrypoints.websecure.http.tls.certresolver=letsencrypt"
      - "--certificatesresolvers.letsencrypt.acme.email=you@yourdomain.com"
      - "--certificatesresolvers.letsencrypt.acme.storage=/letsencrypt/acme.json"
      - "--certificatesresolvers.letsencrypt.acme.httpchallenge=true"
      - "--certificatesresolvers.letsencrypt.acme.httpchallenge.entrypoint=web"
    ports:
      - "80:80"
      - "443:443"
    # networks:
    #   - proxy
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock:ro
      - letsencrypt:/letsencrypt
    security_opt:
      - no-new-privileges:true

  whoami:
    image: traefik/whoami:latest
    container_name: whoami
    restart: unless-stopped
    # networks:
    #   - proxy
    labels:
      traefik.enable: "true"
      traefik.http.routers.whoami.rule: "Host(`whoami.yourdomain.com`)"
      traefik.http.routers.whoami.entrypoints: "websecure"
      traefik.http.routers.whoami.tls: "true"
      traefik.http.routers.whoami.tls.certresolver: "letsencrypt"
      # traefik.http.services.whoami.loadbalancer.server.port: "80"

```