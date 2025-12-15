
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

On debian, scdaemon might be needed to be installed beforehand.

```bash
sudo apt-get update && sudo apt-get -y install scdaemon
```
## Sources

- https://claude.ai/share/87e09f1d-f37a-46c9-95b7-82fc88e1ea84
- https://installati.one/install-scdaemon-debian-11/