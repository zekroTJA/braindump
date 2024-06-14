To walk a directory in Python, simply use the `os.walk` function.

# Documentation

[https://docs.python.org/3/library/os.html#os.walk](https://docs.python.org/3/library/os.html#os.walk)

# Example

```python
import os

for root, dirs, files in os.walk("."):
    for name in files:
        os.remove(os.path.join(root, name))
    for name in dirs:
        os.rmdir(os.path.join(root, name))
```