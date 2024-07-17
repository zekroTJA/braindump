Some commands and command options that I use infrequently enough so I forget they exist, how they are called or used.

# Shells

## [`bash`](<https://dashdash.io/1/bash>)

GNU Bourne-Again SHell.

### Flags

- `-s` - Pass arguments to a shell when the input is passed via StdIn pipe
- `-l` - Start a login shell
- `-c` - Execute a command inline

# Utilities

## [`curl`](<https://dashdash.io/1/curl>)

CLI utility to do request and HTTP stuff and much more.

### Use-Cases

Save the response status code to a variable.

```bash
status_code=$(curl -Lo "$target" "$url" -w "%{http_code}")
```


## [`ls`](<https://dashdash.io/1/ls>)

List directories and their contents.

### Flags

- `-t` - Order by timestamp
- `-r` - Reverse order

# Hardware

## [`lsblk`](<https://dashdash.io/8/lsblk>)

List drives and partitions.

### Flags

- `-f` / `--fs`: List file system information

# System

## [`journalctl`](<https://dashdash.io/1/journalctl>)

Query the systemd and kernel journal.

### Use Cases

Show messages from last boot session.

```go
journalctl -b -1
```

### Flags

- `-k` / `--dmesg`: Show only kernel messages
- `-b (<offset>)`: Show messages from boot session
- `-f`: Follow _(like tail -f)_

## [`dmesg`](<https://dashdash.io/1/dmesg>)

Display kernel messages. Quite useful for debugging driver or other system issues.

### Flags

- `-l` / `--level`: Log Level
- `-t` / `--ctime`: Human readable timestamps
- `-e` / `--reltime`: Relative time in human readable format
- `-k` / `--kernel`: Show kernel messages
- `-u` / `--userspace`: Show userspace messages
- `-c` / `--clear`: Clear messag