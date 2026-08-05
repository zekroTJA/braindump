# Multiline Syntax

`>` Replaces newlines with spaces

```yaml
example: >
	hello world
	foo bar
	
	whats up
```

Result:
```
hello world foo bar\n
whats up\n
```

`|` Keeps newlines

```yaml
example: >
	hello world
	foo bar
	
	whats up
```

Result:
```
hello world\n
foo bar\n
\n
whats up\n
```

`>-` Replaces newlines with spaces and strip newline at the end

```yaml
example: >
	hello world
	foo bar
	
	whats up
```

Result:
```
hello world foo bar\n
whats up
```

`|-` Keeps newlines and strip newline at the end

```yaml
example: >
	hello world
	foo bar
	
	whats up
```

Result:
```
hello world\n
foo bar\n
\n
whats up
```

# Resources

- https://yaml-multiline.info/