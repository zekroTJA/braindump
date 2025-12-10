
Open the GPG wizard to generate, list and manage GPG keys on the YubiKey.
```bash
gpg --card-edit
```

With the following commands, a new key can be created on the YubiKey.
```bash
admin
generate
```

## Possible Problems

Sometimes, scdaemon needs to be restarted before the key can be recognized.

```bash
gpgconf --kill scdaemon 
sudo systemctl restart pcscd 
gpg --card-status
```

## Sources

- https://claude.ai/share/87e09f1d-f37a-46c9-95b7-82fc88e1ea84