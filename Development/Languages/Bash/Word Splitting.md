Word splitting in loops:

```bash
#!/bin/bash

test() {
    a=("$@")

    for v in "${a[@]}"; do
        echo "v: $v"
    done
}

test "hello" "world" "whats up"
```

Source: [https://g.co/gemini/share/81abbb16da17](https://g.co/gemini/share/81abbb16da17)