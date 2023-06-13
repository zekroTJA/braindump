# Commands

Some commands that I use infrequently enough so I forget they exist, how they are called or used.

# Hardware

## `[lsblk](https://dashdash.io/8/lsblk)`

List drives and partitions.

### Flags

- `-f` / `--fs`: List file system information

# System

## `[journalctl](https://dashdash.io/1/journalctl)`

Query the systemd and kernel journal.

### Use Cases

Show messages from last boot session.

```go
journalctl -b -1
```

### Flags

- `-k` / `--dmesg`: Show only kernel messages
- `-b (<offset>)`: Show messages from boot session
- `-f`: Follow *(like tail -f)*

## `[dmesg](https://dashdash.io/1/dmesg)`

Display kernel messages. Quite useful for debugging driver or other system issues.

### Flags

- `-l` / `--level`: Log Level
- `-t` / `--ctime`: Human readable timestamps
- `-e` / `--reltime`: Relative time in human readable format
- `-k` / `--kernel`: Show kernel messages
- `-u` / `--userspace`: Show userspace messages
- `-c` / `--clear`: Clear messages