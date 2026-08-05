> Or alias: procfile

With the `<(cmd)` syntax in [[bash]], the give command is executed and its output is written to a file in `/proc`. 

```bash
ls <(echo a)
# /proc/self/fd/15
```

```bash
diff <(sort file1) <(sort file2)
```

The following example prints log output to the terminal using less but also writes messages on stderr to an errors.log file.
```bash
someprogram > >(less) 2> >(tee errors.log)
```

This creates a tarball from the given dir to stdout, which is then sent to two servers using ssh and there it is extracted.
```bash
tar cf - dir | tee >(ssh myserver1 tar xf -) >(ssh myserver2 tar xf -) > /dev/null
```
### Sources

- https://www.youtube.com/watch?v=2A4bs40scSo