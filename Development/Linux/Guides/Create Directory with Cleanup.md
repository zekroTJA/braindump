```bash
t=$(mktemp -d -p temporary.XXXXXXXXXXXX) || exit
trap 'rm -rf "$t"; exit' ERR EXIT  # HUP INT TERM

: # use "$t" to your heart's content ...
```

# Sources

- [https://stackoverflow.com/questions/10982911/creating-temporary-files-in-bash](https://stackoverflow.com/questions/10982911/creating-temporary-files-in-bash)