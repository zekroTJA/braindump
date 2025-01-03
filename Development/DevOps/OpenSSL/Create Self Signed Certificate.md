# The Legacy Way

```
openssl req -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -sha256 -days 365 -nodes
```

# With SAN Fields

```toml
[CA_default]
copy_extensions = copy

[req]
default_bits = 4096
prompt = no
default_md = sha256
distinguished_name = req_distinguished_name
x509_extensions = v3_ca

[req_distinguished_name]
C = DE
ST = Germany
L = Brunswick
O = Company
OU = Department
emailAddress = hey@example.com
CN = example.com

[v3_ca]
basicConstraints = CA:FALSE
keyUsage = digitalSignature, keyEncipherment
subjectAltName = @alternate_names

[alternate_names]
DNS.1 = localhost
DNS.2 = *.local
```

```bash
openssl req \
	-x509 -newkey rsa:4096 -sha256 -utf8 -days 365 -nodes \
	-config openssl.conf \
	-keyout key.pem \
	-out cert.pem
```

# Sources

- [https://stackoverflow.com/questions/10175812/how-to-generate-a-self-signed-ssl-certificate-using-openssl#10176685](https://stackoverflow.com/questions/10175812/how-to-generate-a-self-signed-ssl-certificate-using-openssl#10176685)