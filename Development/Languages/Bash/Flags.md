```bash
# most notable ones
set -e # exit script when command fails
set -x # show executed commands
set -o # set option (like pipefail)

# other ones
set -a # export each variable and function (like with the prefix export)
set -f # disable filename expansion (globbing)
```

# Sources

- https://www.gnu.org/software/bash/manual/html_node/The-Set-Builtin.html#index-set