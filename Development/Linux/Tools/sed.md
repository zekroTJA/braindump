`sed` is a utility tool to modify the contents of files or strings.

# Flags

- `-i` - Replace in file
    
    ```bash
    # Replaces all occurences of 'foo' with 'bar' in file 'test.txt'
    sed -i 's/foo/bar/g' test.txt
    ```
    
- `-z` - Separate by null characters - for some reason this needs to be used when splitting with line breaks (`\\n`) in regex (multiline)
    

# Use Cases

## Replace CRLF to LF line endings

```bash
sed -i 's/^M$//' file.txt
```

### Remove ANSI Color Codes

```bash
sed -r "s/\x1B\[(([0-9]{1,2})?(;)?([0-9]{1,2})?)?[m,K,H,f,J]//g" file.txto
```

# Resources

- [https://dashdash.io/1/sed](https://dashdash.io/1/sed)