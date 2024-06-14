Pipe to StdErr
```bash
find doesnotexist 2> /dev/null
```

Pipe both StdErr and StdOut
```bash
find doesnotexist > /dev/null 2>&1
```