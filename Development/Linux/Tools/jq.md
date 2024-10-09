`jq` is a utility to inspect and filter JSON data.

# Use Cases

Transform a map to a list of keys and entries.

```bash
echo '{"foo": 1, "bar": 2}' | jq '. | to_entries'

# Outputs:
# [
#   {
#     "key": "foo",
#     "value": 1
#   },
#   {
#     "key": "bar",
#     "value": 2
#   }
# ]
```

---

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


# Resources

- Cheat Sheet: https://gist.github.com/olih/f7437fb6962fb3ee9fe95bda8d2c8fa4