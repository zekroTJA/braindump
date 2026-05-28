Commonly, [[Docker]] Images are labeled with Image Labels according to the [OCI Image Spec](https://specs.opencontainers.org/image-spec/annotations/)(or [on GitHub](https://github.com/opencontainers/image-spec/blob/main/annotations.md)).

### Example

```Dockerfile
LABEL org.opencontainers.image.title="My Service" \
      org.opencontainers.image.description="A short description of what the service does" \
      org.opencontainers.image.version="1.0.0" \
      org.opencontainers.image.created="2026-05-28T00:00:00Z" \
      org.opencontainers.image.authors="Your Name <you@example.com>" \
      org.opencontainers.image.url="https://example.com" \
      org.opencontainers.image.documentation="https://docs.example.com" \
      org.opencontainers.image.source="https://github.com/yourorg/yourrepo" \
      org.opencontainers.image.revision="abc1234" \
      org.opencontainers.image.vendor="Your Company" \
      org.opencontainers.image.licenses="MIT" \
      org.opencontainers.image.ref.name="myservice:1.0.0" \
      org.opencontainers.image.base.name="debian:bookworm-slim"
```