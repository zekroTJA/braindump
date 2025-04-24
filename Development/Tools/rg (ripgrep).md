ripgrep is a powerful alternative to grep.

Repository: https://github.com/BurntSushi/ripgrep

# Use Cases

Search and replace
```bash
echo "foo-bar baz" | rg "foo-(\w+)" --passthru --replace 'fuz-${1}'
# fuz-bar baz
```

Print only matching
```bash
echo hello world | rg --only-matching 'world' # or -o
# world
```