With `inotifywait`, you can watch for changes in a directory.

```bash
inotifywait -m /path/to/folder
inotifywait -m -e create,delete /path/to/folder
```

## Sources

- https://linuxvox.com/blog/monitor-folder-for-changes-linux/