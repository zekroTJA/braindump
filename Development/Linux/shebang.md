A `shebang` (also known as `hash-bang`) is a comment line, mostly directly in the first line of a script, indicating the shell which program should be used to execute the script when directly called in the shell.

An example for bash scripts would be as following.

```bash
 #!/bin/bash

echo "Hello world!"
```

When the script gets executed using the following command, the underlying shell will recognize the shebang and execute the script with `/bin/bash`.

```bash
chmod +x ./script.sh
./script.sh
```

# Common shebangs

- Bash: `#!/bin/bash`
- Sh: `#!/bin/sh`
- Python: `#!/usr/bin/env python3` _([source](https://stackoverflow.com/questions/6908143/should-i-put-shebang-in-python-scripts-and-what-form-should-it-take))_