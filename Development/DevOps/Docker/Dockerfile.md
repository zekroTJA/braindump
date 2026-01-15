This [[Dockerfile]] from [https://github.com/mattn/feed2bsky](https://github.com/mattn/feed2bsky) is a good example for building a Go application and deploying it to a `scratch` docker image.

```Dockerfile
# syntax=docker/dockerfile:1.4

FROM golang:1.20-alpine AS build-dev
WORKDIR /go/src/app
COPY --link go.mod go.sum ./
RUN apk --update add --no-cache upx gcc musl-dev || \\
    go version && \\
    go mod download
COPY --link . .
RUN CGO_ENABLED=1 go install -buildvcs=false -trimpath -ldflags '-w -s -extldflags "-static"'
RUN [ -e /usr/bin/upx ] && upx /go/bin/feed2bsky || echo
FROM scratch
COPY --link --from=build-dev /go/bin/feed2bsky /go/bin/feed2bsky
COPY --from=build-dev /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
CMD ["/go/bin/feed2bsky"]
```

## SSH

It is possible to pass in the SSH agent from the host system on build. This is useful, for example, if repositories or dependencies need to be pulled from a git server which requires SSH authentication.

```Dockerfile
RUN apk add --no-cache git openssh-client
RUN mkdir -p -m 0600 ~/.ssh
RUN cat <<EOF > ~/.ssh/config
Host git.example.com
    User git
    UserKnownHostsFile /dev/null
    StrictHostKeyChecking no
EOF
RUN --mount=type=ssh git clone git@git.example.com:my/repo.git .
```

This only works when the build command is executed with the `--ssh` option.
```bash
docker build --ssh default .
```

> Source: https://docs.docker.com/reference/dockerfile/#run---mounttypessh
## Secrets

Secrets can be passed in to the `RUN` command as following:
```Dockerfile
RUN --mount=type=secret,id=aws,target=/root/.aws/credentials \
  aws s3 cp s3://... ...
```

It is required to define the secrets passed in in the build command using the `--secrets` option.
```bash
docker build --secret id=aws,src=$HOME/.aws/credentials .
```

> Source: https://docs.docker.com/reference/dockerfile/#run---mounttypesecret
## Mount on build

With `RUN --mount`, you can mount files on built which are required to run a command but should not be copied to the image.

> It is only possible to mount files from the build context, not from arbitrary paths on the system.

```dockerfile
RUN --mount=type=bind,source=requirements.txt,target=/tmp/requirements.txt \
    pip install --requirement /tmp/requirements.txt
```

> Source: https://docs.docker.com/build/building/best-practices/#add-or-copy

## Sources

- https://docs.docker.com/build/building/best-practices/#add-or-copy