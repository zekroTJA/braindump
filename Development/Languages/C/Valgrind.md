| **Website**    | https://valgrind.org/                          |
| -------------- | ---------------------------------------------- |
| **Docs**       | https://valgrind.org/docs/manual/index.html    |
| **Repository** | https://valgrind.org/downloads/repository.html |
Valgrind is a tool to check for memory leaks and dangling resources in C programs.


## Installation

### Debian / Ubuntu

```bash
sudo apt install valgrind
```
## Usage

```bash
valgrind --leak-check=full --show-leak-kinds=all myApp arg1 arg2 ...
```

### GitHub Actions

Action: https://github.com/marketplace/actions/valgrind-checker

```yaml
name: CI

on:
  push:
    branches:
      - "*"
  pull_request:
    branches:
      - main

jobs:
  valgrind:
    name: Valgrind
    runs-on: ubuntu-latest
    steps:
      - name: Check out code into the Go module directory
        uses: actions/checkout@v6
      - name: make binary
        run: make
      - name: Valgrind (Default Args)
        uses: Ximaz/valgrind-action@1.2.1
        with:
          binary_path: dist/bfc
          binary_args: inputs/hello_world.bf
      - name: Valgrind (Dynamic Reallocation)
        uses: Ximaz/valgrind-action@1.2.1
        with:
          binary_path: dist/bfc
          binary_args: inputs/hello_world.bf --buffer-size 2 --dynamic-reallocation
```
## Resources

- https://www.baeldung.com/linux/valgrind-install-uninstall
- https://valgrind.org/docs/manual/quick-start.html#quick-start.intro