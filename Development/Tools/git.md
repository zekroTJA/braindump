# Useful Commands

## Get the latest tag

```bash
git describe --tags --abbrev=0
```

## List commits to latest tag

```bash
git log $(git rev-parse $(git describe --tags --abbrev=0))^..HEAD --oneline
```