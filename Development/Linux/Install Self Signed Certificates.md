How to install [[Self Signed Certificates]] as Trusted Certificates.
### Ubuntu

```bash
# if not already installed
sudo apt-get install -y ca-certificates

sudo cp local-ca.crt /usr/local/share/ca-certificates
sudo update-ca-certificates
```

You can verify that the cert has been loaded as following:
```bash
CHECK=$(sudo cat local-ca.crt | tail -n 2 | head -n 1)
echo "$CHECK"
# L4zOd3b41xJtYldofPve
sudo cat /etc/ssl/certs/ca-certificates.crt | grep "$CHECK"
# L4zOd3b41xJtYldofPve
```

> Source: https://documentation.ubuntu.com/server/how-to/security/install-a-root-ca-certificate-in-the-trust-store/