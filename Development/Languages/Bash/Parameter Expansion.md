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
echo "${foo#*/}"
# path/file.txt
echo "${foo##*/}"
# file.txt
echo "${foo%/*}"
# some/path
echo "${foo%%/*}"
# some
```
# Resources

- [https://www.gnu.org/software/bash/manual/html_node/Shell-Parameter-Expansion.html](https://www.gnu.org/software/bash/manual/html_node/Shell-Parameter-Expansion.html)