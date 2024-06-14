You can use the keyword `with` to safely acquire and release resources (similar to `using` in C#, for example).

A very common example for that is opening a file.

```python
with open("hello.txt") as f:
	f.readlines()
```

You can implement this behavior by implementing the `__enter__` and `__exit__` methods on your class.

# Example

```python
class MyClass:
    def __init__(self):
        print("__init__")

    def __enter__(self): 
        print("__enter__")

    def __exit__(self, type, value, traceback):
        print("__exit__")
    
    def __del__(self):
        print("__del__")
    
with MyClass(): 
    print("body")
```

Result:

```python
__init__
__enter__
body
__exit__
__del__
```

# Sources

- [https://stackoverflow.com/questions/1984325/explaining-pythons-enter-and-exit](https://stackoverflow.com/questions/1984325/explaining-pythons-enter-and-exit)
- [https://docs.python.org/3/library/contextlib.html#contextlib.ContextDecorator](https://docs.python.org/3/library/contextlib.html#contextlib.ContextDecorator)