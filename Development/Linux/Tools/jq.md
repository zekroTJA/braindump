`jq` is a utility to inspect and filter JSON data.

# Use Cases

Filter an object map by key.

```bash
echo '{"foo": "bar", "baz": "fuz"}' \\
	| jq 'to_entries[] | select ( .key == "foo" )'

# Outputs:
# {
#   "key": "foo",
#   "value": "bar"
# }
```

---

Combine two JSON Lists

```bash
echo '["foo", "bar"]' > a.json
echo '["baz"]' > b.json

jq '. + input' a.json b.json

# Outputs:
# [
#   "foo",
#   "bar",
#   "baz"
# ]

```