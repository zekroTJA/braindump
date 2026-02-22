# Exec

With `-exec`, output can be passed to other commands.

- `-exec ... {} \\;` → Executes every output in an extra command instance
- `-exec ... {} +` → appends the outputs to one command instance

# Newer / Older

Find files newer or order as a given date.

> See: https://www.cyberciti.biz/faq/linux-unix-osxfind-files-by-date/

```
touch --date "2007-01-01" /tmp/start
touch --date "2008-01-01" /tmp/end
find /data/images -type f -newer /tmp/start -not -newer /tmp/end
```

Also, there are newer versions of these flags:
```
find /dir/ -type f -newerXY 'yyyy-mm-dd'
```

Where `X` and `Y` can be any of the following letters:
- `a` – The access time of the file reference
- `B` – The birth time of the file reference
- `c` – The inode status change time of reference
- `m` – The modification time of the file reference
- `t` – reference is interpreted directly as a time

Example:
```
find . -type f -newermt 2017-09-24
```

Also, the `-mtime` flag can be used to use relative dates. This in example, looks for files modified more than 30 days ago.
```
find . -mtime +30 -type f
```

Or otherwise, less then 30 days ago.
```
find . -mtime -30 -type f
```

Another way would be to combine find with the `-ls` flag with grep.
```
find /etc/ -type f -ls | grep '25 Sep'
```