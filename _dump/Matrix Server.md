## 1. Generate Synapse Config

```bash
docker run -it --rm \ -v ./synapse/data:/data \ -e SYNAPSE_SERVER_NAME=zekro.de \ -e SYNAPSE_REPORT_STATS=no \ matrixdotorg/synapse:latest generate
```

> Note: `SYNAPSE_SERVER_NAME` is your **Matrix server name** (the part after the `:`in `@user:zekro.de`), not the hostname. The actual service runs under `matrix.zekro.de`.

## 2. Setup Docker Compose Stack

```yaml
services:
  postgres:
    image: postgres:16-alpine
    restart: unless-stopped
    environment:
      POSTGRES_USER: synapse
      POSTGRES_PASSWORD: secret
      POSTGRES_DB: synapse
      POSTGRES_INITDB_ARGS: "--encoding=UTF-8 --lc-collate=C --lc-ctype=C"
    volumes:
      - ./postgres:/var/lib/postgresql/data
    networks:
      - internal

  synapse:
    image: matrixdotorg/synapse:latest
    restart: unless-stopped
    depends_on:
      - postgres
    volumes:
      - ./synapse/data:/data
    environment:
      - SYNAPSE_CONFIG_PATH=/data/homeserver.yaml
    networks:
      - core_public
      - internal
    labels:
      com.centurylinklabs.watchtower.enable: true
      traefik.enable: true
      traefik.http.routers.synapse.entrypoints: https
      traefik.http.routers.synapse.tls.certresolver: le
      traefik.http.routers.synapse.tls: true
      traefik.http.routers.synapse.rule: Host(`matrix.zekro.de`)
      traefik.http.services.synapse.loadbalancer.server.port: 8008

networks:
  internal:
    driver: bridge
  core_public:
    external: true
```

## 3. Edit `homeserver.yaml` file

Edit the `synapse/data/homeserver.yaml` file.

First, add the public base url:
```yaml
public_baseurl: "https://matrix.zekro.de
```

Then, add the database connection:
```yaml
database:
  name: psycopg2
  args:
    user: synapse
    password: secret
    database: synapse
    host: postgres
    cp_min: 5
    cp_max: 10
```

## 4. Well Known Files

Serve the following well known files from the base domain.

> `https://zekro.de/.well-known/matrix/server`
```json
{ "m.server": "matrix.zekro.de:443" }
```

> `https://zekro.de/.well-known/matrix/client`
```json
{ "m.homeserver": { "base_url": "https://matrix.zekro.de" } }
```

## 5. Startup

Start up the stack.

```bash
docker compose up -d
```

After the server is running, create an admin user.

```bash
docker exec -it synapse register_new_matrix_user \ 
	-c /data/homeserver.yaml \ 
	-u yourusername \ 
	-p yourpassword \ 
	--admin \ http://localhost:8008
```

## 6. Verify

Go to **[https://federationtester.matrix.org](https://federationtester.matrix.org)** and check if the server is set up properly by entering the server address.

## 7. Configure user registration

Add this to the `synapse/data/homeserver.yaml` file.

```yaml
enable_registration: true 
registration_requires_token: true
```

## 8. Generate Token

Tokens can be created using the [admin api](https://matrix-org.github.io/synapse/latest/usage/administration/admin_api/registration_tokens.html). You need to authenticate against the admin API using a bearer token from an admin user. This can be obtained via a client (for example in Cinny: Developer Tools > Acces Token)