Set environment variables from a .env file in a [[Bash]] script.

```bash
if [[ -f .env ]]; then
    set -a && source .env && set +a
fi
```

## Sources
- https://gist.github.com/mihow/9c7f559807069a03e302605691f85572