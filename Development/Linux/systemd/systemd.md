# Unit Definition

### Example

> https://github.com/zekroTJA/sysinfo-exporter/blob/main/config/systemd/sysinfo-exporter.service
```Toml
[Unit]
Description=Sysinfo Exporter
After=network.target auditd.service

[Service]
Type=simple
ExecStart=/usr/local/bin/sysinfo-exporter --config /etc/sysinfo-exporter/config.toml
KillMode=process
Restart=always
WorkingDirectory=/var/sysinfo-exporter

[Install]
WantedBy=default.target
Alias=sysinfo-exporter.service
```

> `/etc/systemd/system/sshd.service`

```toml
[Unit]
Description=OpenBSD Secure Shell server
Documentation=man:sshd(8) man:sshd_config(5)
After=network.target auditd.service
ConditionPathExists=!/etc/ssh/sshd_not_to_be_run

[Service]
EnvironmentFile=-/etc/default/ssh
ExecStartPre=/usr/sbin/sshd -t
ExecStart=/usr/sbin/sshd -D $SSHD_OPTS
ExecReload=/usr/sbin/sshd -t
ExecReload=/bin/kill -HUP $MAINPID
KillMode=process
Restart=on-failure
RestartPreventExitStatus=255
Type=notify
RuntimeDirectory=sshd
RuntimeDirectoryMode=0755

[Install]
WantedBy=multi-user.target
Alias=sshd.service
```

## Useful Stuff

- `WorkingDirectory=` - Specify the working directory

## Overrides

```
systemctl edit <service-name>
```

Opens an editor where additional overwrites of options in a service file can be specified. Those are then saved to a override config in `/etc/systemd/system/<service-name>.service.d/override.conf`.
# User Services

- https://www.baeldung.com/linux/systemd-create-user-services

## Resources

- [https://www.freedesktop.org/software/systemd/man/systemd.unit.html](https://www.freedesktop.org/software/systemd/man/systemd.unit.html)
- [https://www.freedesktop.org/software/systemd/man/systemd.service.html](https://www.freedesktop.org/software/systemd/man/systemd.service.html)
- [https://www.freedesktop.org/software/systemd/man/systemd.exec.html](https://www.freedesktop.org/software/systemd/man/systemd.exec.html)
- [https://www.digitalocean.com/community/tutorials/understanding-systemd-units-and-unit-files](https://www.digitalocean.com/community/tutorials/understanding-systemd-units-and-unit-files)
- [https://www.howtogeek.com/687970/how-to-run-a-linux-program-at-startup-with-systemd/](https://www.howtogeek.com/687970/how-to-run-a-linux-program-at-startup-with-systemd/)

---

see [[ssh]]