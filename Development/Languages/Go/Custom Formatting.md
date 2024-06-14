It is possible to specify custom formatting rules — which are referred when using i.E. `fmt.Sprintf` — on types by implementing the following method.

```go
func (t DetailedError) Format(s fmt.State, verb rune) {
	// ...
}
```

# Example

```go
func (t DetailedError) Format(s fmt.State, verb rune) {
	width, _ := s.Width()

	switch verb {
	case 'v':
		if s.Flag('+') {
			t.writeDetailed(s, width)
		} else if s.Flag('#') {
			t.writeStacked(s, width)
		} else {
			t.writeTitle(s, true)
		}
	case 's', 'q':
		if t.message != "" {
			fmt.Fprint(s, t.message)
		} else if t.Inner != nil {
			fmt.Fprintf(s, "%s", t.Inner)
		} else {
			fmt.Fprint(s, t.code)
		}
	}
}
```

# Resources

- `Format` interface: [https://pkg.go.dev/fmt#Formatter](https://pkg.go.dev/fmt#Formatter)
- `fmt` Package Reference: [https://pkg.go.dev/fmt](https://pkg.go.dev/fmt)