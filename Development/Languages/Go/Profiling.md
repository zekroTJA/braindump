Performance profiling can be done in go using the [`pprof`](https://pkg.go.dev/runtime/pprof) package.

## CPU Profiling

```go
func setupProfiler(profLoc string) error {
	f, err := os.Create(profLoc)
	if err != nil {
		return err
	}
	
	if err = pprof.StartCPUProfile(f); err != nil {
		return err
	}
	
	pprof.StopCPUProfile()

	return f.Close()
}
```

# Analysis

Profile files (`.pprof`) can be analyzed using the `pprof` tool, which is shipped with the go toolchain as well.

This command opens an interactive web interface where you can analyze a profile as node or as flame graph.
```bash
go tool pprof -http=:8081 (<path-to-binary>) <path-to-profile>
```

# Sources

- https://pkg.go.dev/runtime/pprof
- https://github.com/google/pprof