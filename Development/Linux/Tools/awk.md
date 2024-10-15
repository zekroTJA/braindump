# Examples

## Print with padding

```bash
echo "foo bar" | awk '{ printf "|%-5s|%5s|\n", $1, $2 }'

# Outputs:
# |foo  |  bar|
```

# Resources

- Cheat Sheet: https://quickref.me/awk.html#awk-loops