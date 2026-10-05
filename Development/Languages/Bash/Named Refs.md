Named refs in [[bash]] can be define inside a function using `local -n` and then be used outside the function.

> Note: This is only available in bash >=4.3 
## Example
```bash
split_once() {
    local str="$1"
    local delim="$2"
    local -n out_left="$3"
    local -n out_right="$4"

    # Check if delimiter exists to handle edge cases predictably
    if [[ "$str" != *"$delim"* ]]; then
        out_left="$str"
        out_right=""
        return 1
    fi

    # Native parameter expansion: fast and fork-free
    out_left="${str%%"$delim"*}"
    out_right="${str#*"$delim"}"
    return 0
}

split_once "foo:bar" ":" first second

echo "first: $first"
echo "first: $second"
```