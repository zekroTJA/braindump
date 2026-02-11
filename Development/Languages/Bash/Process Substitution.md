> Or alias: procfile

With the `<(cmd)` syntax in [[bash]], the give command is executed and its output is written to a file in `/proc`. 

```bash
ls <(echo a)
# /proc/self/fd/15
```

```bash
diff <(sort file1) <(sort file2)
```

The following example prints log output to the terminal using less but also writes messages on StdErr to an errors.log file.
```bash
someprogram > >(less) 2> >(tee errors.log)
```
### Sources

- https://www.youtube.com/watch?v=2A4bs40scSo