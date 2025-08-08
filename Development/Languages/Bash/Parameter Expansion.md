# Common Examples

Variable Defaults
```bash
echo "${foo:-default}"
# default
```

Substring
```bash
foo="hello world"
echo "${foo:2:6}"
# llo wo
echo "${foo:6}"
# world
echo "${foo:6:-2}"
# wor
```

Replace
```bash
foo="hello world"
echo "${foo/hello/bye}"
# bye world
```

Remove / Cut Pattern
```bash
foo="some/path/file.txt"

# cut shortest match from the beginning of the string
echo "${foo#*/}"
# -> path/file.txt

# cut longest match from the beginning of the string
echo "${foo##*/}"
# -> file.txt

# cut shortest match from the end of the string
echo "${foo%/*}"
# -> some/path

# cut longest match from the end of the string
echo "${foo%%/*}"
# -> some
```

Lowercase
```bash
foo="Hello World!"
echo "${foo,,}"
# hello world!
```

# Resources

- [https://www.gnu.org/software/bash/manual/html_node/Shell-Parameter-Expansion.html](https://www.gnu.org/software/bash/manual/html_node/Shell-Parameter-Expansion.html)