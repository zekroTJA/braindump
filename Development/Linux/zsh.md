# Prevent command from being printed in history

Simply set the option `HIST_IGNORE_SPACE` to ignore all commands executed in the history when they are prefixed with one or more spaces.

```bash
setopt HIST_IGNORE_SPACE
```

More info: `man zshoptions`

Source: [https://superuser.com/questions/352788/how-to-prevent-a-command-in-the-zshell-from-being-saved-into-history](https://superuser.com/questions/352788/how-to-prevent-a-command-in-the-zshell-from-being-saved-into-history)