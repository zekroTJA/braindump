# Address Pool Configuration

Defautl address pools used by docker networks can be configured in the daemon configuration at `/etc/docker/daemon.json`.

```json
{
  "default-address-pools" : [
    {
      "base" : "172.17.0.0/12",
      "size" : 20
    },
    {
      "base" : "192.168.0.0/16",
      "size" : 24
    }
  ]
}
```

# Resources

- [https://straz.to/2021-09-08-docker-address-pools/](https://straz.to/2021-09-08-docker-address-pools/)