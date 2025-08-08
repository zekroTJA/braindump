# Payloads

## Form Data

```bash
curl --request POST --form "foo=bar" --form "file=@pathToFile"
# Or short
curl -X POST -F "foo=bar" -F "file=@pathToFile"
```

## URL Encoded Form Data

```bash
curl \
	--request POST \
	--data-urlencode "foo=bar" \
	--data-urlencode "file=@pathToFile"
```

# Sources

- https://curl.se/docs/manpage.html#--data-urlencode
- https://reqbin.com/req/c-sma2qrvp/curl-post-form-example