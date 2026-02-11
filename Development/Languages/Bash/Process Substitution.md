> Or alias: procfile

With the `<(cmd)` syntax in [[bash]], the give command is executed and its output is written to a file in `/proc`. 

```bash
ls <(echo a)
# /proc/self/fd/15
```

```bash
diff <(sort file1) <(sort file2)
```

### Sources

- https://www.youtube.com/watch?v=2A4bs40scSo