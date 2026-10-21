`systemd-run` is a function of [[systemd]] to run commands as transient services.

**Example:**
```bash
systemd-run --user --same-dir --unit=mybackup tar -czf /home/me/backup.tar.gz data
```

Then, the status of the service can be tracked same as with typical systemd services.
```bash
systemctl --user status mybackup
journalctl --user -u mybackup -f
```

After finishing, the unit is automatically removed.
## Caveats

When a command fails, the unit stays and needs to be reset to be removed.
```bash
systemctl --user reset-failed mybackup
```

Alternatively, with the `--collect` (or `-G`) flag, the unit is unloaded even if the command fails.
```bash
systemd-run --user --collect --same-dir --unit=mybackup tar -czf /home/me/backup.tar.gz data
```