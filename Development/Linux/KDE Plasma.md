# SSH Passkey Fix

Add this to `.profile`:
```bash
if [[ $DESKTOP_SESSION == "plasma" ]]; then
    export SSH_ASKPASS_REQUIRE=force
fi
```

- Source: https://www.stavros.io/posts/saving-ssh-passphrases-on-kde/