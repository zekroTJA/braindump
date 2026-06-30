`expect` is a tool for automating interactive applications by following a script that anticipates and responds to prompts.

# Core Commands

- `spawn`: Starts a new process (e.g., `spawn ssh user@host`).
- `expect`: Waits for a specific pattern in the output of the spawned process.
- `send`: Sends input to the spawned process. Use `\r` to simulate the Enter key.
- `interact`: Returns control of the process to the user.
- `set timeout`: Sets the duration (in seconds) that `expect` will wait for a pattern before failing.
- `exp_continue`: Continues the current `expect` match after executing an action.

# Examples

## Automated SSH Login

```expect
#!/usr/bin/expect

set timeout 10
spawn ssh user@hostname

expect "password:"
send "my_secure_password\r"

# Wait for shell prompt
expect "$ "
send "ls -l\r"

# Exit session
expect "$ "
send "exit\r"
expect eof
```

## Handling Multiple Expected Patterns

Use a block to handle different scenarios like password prompts or host key confirmations.

```expect
expect {
    "password:" {
        send "my_password\r"
    }
    "(yes/no)?" {
        send "yes\r"
        exp_continue
    }
    timeout {
        send_user "Connection timed out\n"
        exit
    }
}
```

## Using Environment Variables for Passwords

To avoid hardcoding credentials, retrieve them from environment variables.

```expect
set password $env(USER_PASS)
spawn sudo apt update
expect "password for user:"
send "$password\r"
expect eof
```

# Tips

- **Regex Matching**: Use `expect -re "pattern"` for regular expression matching.
- **Capture Output**: Use `$expect_out(buffer)` to access the output matched by the last `expect` command.
- **Logging**: Use `log_user 1` (default) or `log_user 0` to enable/disable output logging.
- **Print to Screen**: Use `send_user "Message\n"` to print directly to the user's terminal.

# Resources

- Source: [LinuxVox - Mastering the Linux expect Command](https://linuxvox.com/blog/linux-expect-command/)
