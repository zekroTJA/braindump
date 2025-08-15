Python logger setup.

```python
def setup_logger(level):
	logging.basicConfig(
                level=(level * 10),
                format='%(asctime)s [%(levelname)s] %(message)s',
                datefmt='%Y-%m-%d %H:%M:%S')
```

# Resources

- https://docs.python.org/3/library/logging.html