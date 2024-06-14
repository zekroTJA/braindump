The Daemon Configuration for Docker can be found at `/etc/docker/daemon.json`.

# Default Address Pools

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