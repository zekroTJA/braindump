
## Encrypt File

```bash
gpg --encrypt --recipient recipient@email.com filename.txt
```

## Decrypt File

```bash
gpg --decrypt filename.txt.gpg
```
## Generate Key Pair

```bash
gpg --full-generate-key

# or simpler with sensible defaults:
gpg --generate-key
```

### List Keys

```bash
gpg --list-keys
```

## Export Public Key

```bash
gpg --armor --export your@email.com > public-key.asc
```

## Export Private Key

```bash
gpg --armor --export-secret-keys your@email.com > private-key.asc
```

