Simple argument parsing in [[bash]].

```bash
print_help() {
    cat <<EOF
usage: ${0##*/} [OPTIONS] [FILE]

Count the files with a given extension in a search path and
optionally print the last line of FILE.

Options:
  -e, --extension EXT   File extension to count (without the leading dot)
  -s, --searchpath DIR  Directory to search for files with EXT
      --default         Set the DEFAULT flag
  -h, --help            Print this help and exit

Arguments:
  FILE                  If given, print the last line of this file
EOF
}

POSITIONAL_ARGS=()

while [[ $# -gt 0 ]]; do
    case $1 in
    -e | --extension)
        if [[ -z $2 ]] || [[ $2 = -* ]]; then
            echo "error: missing value for flag $1" >&2
            exit 1
        fi
        EXTENSION="$2"
        shift 2
        ;;
    -s | --searchpath)
        if [[ -z $2 ]] || [[ $2 = -* ]]; then
            echo "error: missing value for flag $1" >&2
            exit 1
        fi
        SEARCHPATH="$2"
        shift 2
        ;;
    --default)
        DEFAULT=YES
        shift
        ;;
    -h | --help)
        print_help
        exit 0
        ;;
    -*)
        echo "Unknown option $1"
        exit 1
        ;;
    *)
        POSITIONAL_ARGS+=("$1") # save positional arg
        shift                   # past argument
        ;;
    esac
done

set -- "${POSITIONAL_ARGS[@]}" # restore positional parameters

echo "FILE EXTENSION  = ${EXTENSION}"
echo "SEARCH PATH     = ${SEARCHPATH}"
echo "DEFAULT         = ${DEFAULT}"
echo "Number files in SEARCH PATH with EXTENSION:" $(ls -1 "${SEARCHPATH}"/*."${EXTENSION}" | wc -l)

if [[ -n $1 ]]; then
    echo "Last line of file specified as non-opt/last argument:"
    tail -1 "$1"
fi
```

Source: https://stackoverflow.com/questions/192249/how-do-i-parse-command-line-arguments-in-bash