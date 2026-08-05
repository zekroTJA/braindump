Simple logging setup with [tracing](https://crates.io/crates/tracing) and [tracing-subscriber](https://crates.io/crates/tracing-subscriber).

```rust
let log_level = config
	.log_level
	.as_ref()
	.map(|l| tracing::Level::from_str(l))
	.transpose()?
	.unwrap_or(tracing::Level::INFO);

tracing_subscriber::fmt()
	.with_max_level(log_level)
	.with_writer(std::io::stdout)
	.init();

tracing::debug!("read config={config:#?}");
```

## Docs

- tracing: https://docs.rs/tracing/0.1.43/tracing/
- tracing-subscriber: https://docs.rs/tracing-subscriber/0.3.22/tracing_subscriber/