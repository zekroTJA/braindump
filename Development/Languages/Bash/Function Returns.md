Here is a simple example of a bash function returning a boolean.

```bash
function find_gofiles() {
    for dir in ${GOFILE_DIRS[*]}; do
        [ -n "$(find $dir -iname '**.go' 2> /dev/null)" ] && {
            # Store result in a variable
            GOFILES_DIR=$dir
            return 0 # ~ true
        }
    done

    return 1 # ~ false
}

find_gofiles && echo "Found in ${GOFILES_DIR}!"
```