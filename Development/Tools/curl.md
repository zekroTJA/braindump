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

## Sensible Parameters for Scrips

```bash
curl https://echo.zekro.de \
  --silent \
  --show-error \
  --fail
  
# or sort
curl https://echo.zekro.de -sSf
```

- `-s`, `--silent`
  Silent or quiet mode. Don't show progress meter or error messages.  Makes Curl mute.
- `-S`, `--show-error`
  When used with -s it makes curl show an error message if it fails.
- `-f`, `--fail`
  (HTTP)  Fail  silently  (no  output at all) on server errors. This is mostly done to better enable scripts etc to better deal with failed attempts. In normal cases  when  a  HTTP  server  fails  to deliver  a  document,  it  returns an HTML document stating so (which often also describes why and more). This flag will prevent curl from outputting that and return error 22. This method is not fail-safe and there are occasions where non-successful response codes will slip through, especially when authentication is involved (response codes 401 and 407).
# Sources

- https://curl.se/docs/manpage.html#--data-urlencode
- https://reqbin.com/req/c-sma2qrvp/curl-post-form-example