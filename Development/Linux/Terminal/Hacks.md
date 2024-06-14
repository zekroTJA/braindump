# CD to last passed location

You can use the following command to CD to the last location you have passed as argument to a command executed before.

```bash
ls ~/some/long/location/path
cd !$
```

# Don’t store command in history

You might want to execute a program where you need to pass plain text credentials in via command line parameters. But you obviously don’t want to store that in your history. In `bash`, you can prefix the command with an arbitrary amount of spaces and the command will not be stored to the history file.

```bash
$ echo "This will be shown in the history!"
$  echo "This will not show up in the history!"
```

When you are using `zsh`, you need to enable this via the following option _([source](https://superuser.com/questions/352788/how-to-prevent-a-command-in-the-zshell-from-being-saved-into-history))_.

```bash
setopt HIST_IGNORE_SPACE
```