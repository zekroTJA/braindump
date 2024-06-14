You can use different conditions and checks inside brackets. Example:

```bash
# Checks if "some-file" exists and creates it, if not.
[ -f "some-file" ] || touch "some-file"
```

# Flags

- `-eq` - Check for equality of two numbers
- `-gt` - Check if one number is larger than another
- `-lt` - Check if one number is smaller than another
- `-f` - Checks for existence of a file
- `-d` - Check for existence of a directory
- `-n` - Returns true if the given parameter is not empty
- `-z` - Returns true if the given parameter is empty