Hosting a [[Docker]] Registry using [[Docker Compose]].

# Registry

Repository: https://github.com/distribution/distribution
Docs: https://distribution.github.io/distribution/
Configuration Reference: https://distribution.github.io/distribution/about/configuration/

## No Authentication

```yaml
services: 
  registry:
    image: registry:latest
    expose:
      - 5000
    restart: unless-stopped
    environment:
      REGISTRY_LOG_LEVEL: info
      REGISTRY_STORAGE_FILESYSTEM_ROOTDIRECTORY: /data
    volumes:
      - ./registry/data:/data
```

## htpasswd Authentication

```yaml
services: 
  registry:
    image: registry:latest
    expose:
      - 5000
    restart: unless-stopped
    environment:
      REGISTRY_LOG_LEVEL: info
      REGISTRY_STORAGE_FILESYSTEM_ROOTDIRECTORY: /data
      REGISTRY_AUTH: htpasswd
      REGISTRY_AUTH_HTPASSWD_REALM: Registry Realm
      REGISTRY_AUTH_HTPASSWD_PATH: /auth/registry.password
    volumes:
      - ./registry/data:/data
      - ./registry/registry.password:/auth/registry.password
```

Passwords can be generated using the following command:

```bash
sudo apt install apache2-utils
htpasswd -Bbn busy bee > ./registry/registry.password
```

## Docker Auth Authenticaion

```bash
#!/usr/bin/env bash

set -euo pipefail

CERT_DIR="$(dirname "$0")/registry/auth/certs"
mkdir -p "$CERT_DIR"

if [[ -f "$CERT_DIR/auth.key" && -f "$CERT_DIR/auth.crt" ]]; then
  echo "Certificates already exist in $CERT_DIR, skipping."
  exit 0
fi

echo "Generating RSA key and self-signed certificate for docker_auth token signing..."

openssl req -new -newkey rsa:4096 -days 3650 -nodes -x509 \
  -subj "/CN=dcr.zekro.de" \
  -keyout "$CERT_DIR/auth.key" \
  -out   "$CERT_DIR/auth.crt"

chmod 600 "$CERT_DIR/auth.key"
chmod 644 "$CERT_DIR/auth.crt"

echo "Done. Key: $CERT_DIR/auth.key  Cert: $CERT_DIR/auth.crt"
```

```bash
docker run --rm -it httpd:alpine htpasswd -nB usr
```

```bash
#!/usr/bin/bash

passwd=$(tr -dc '[:alnum:]' < /dev/urandom | head -c 64)
hash=$(htpasswd -niB usr <<< "$passwd" | cut -d ':' -f 2)

cat <<EOF
Password:  $passwd
Hash:      $hash
EOF
```