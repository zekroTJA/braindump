The `set` builtin can be used to split a string into its parts when used as following.

```bash
a="hello world"

set -- $a

echo "$1 ; $2"

# Outputs: hello ; world
```

`--` prevents following fields starting with a `-` to be interpreted as flag for `set`.

When setting the IFS (Internal Field Separator) to something else, the fields can also be splitted by arbitrary characters.

```bash
a="hello-world"

OIFS=$IFS
IFS='-'
set -- $a
IFS=$OIFS

echo "$1 ; $2"

# Outputs: hello ; world
```