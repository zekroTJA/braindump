## Setup

```bash
sudo apt update
sudo apt install strongswan strongswan-pki libcharon-extra-plugins -y
```

Add the following to `/etc/sysctl.conf`
```conf
net.ipv4.ip_forward = 1
```

After that
```bash
sudo sysctl -p
```

