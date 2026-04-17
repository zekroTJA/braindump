# Create secure SSH keypairs

```
ssh-keygen -t ed25519 -o -a 100
```

# SSH Tunneling

|                                                                                               |                        |
| --------------------------------------------------------------------------------------------- | ---------------------- |
| [`ssh -L 8080:localhost:80 user@host`](https://linuxize.com/post/how-to-setup-ssh-tunneling/) | Local port forwarding  |
| `ssh -R 8080:localhost:80 user@host`                                                          | Remote port forwarding |
| `ssh -D 1080 user@host`                                                                       | SOCKS proxy (dynamic)  |
| `ssh -N -L 8080:localhost:80 user@host`                                                       | Tunnel only (no shell) |
| `ssh -f -N -L 8080:localhost:80 user@host`                                                    | Background tunnel      |

# Subsystems

- https://www.oreilly.com/library/view/ssh-the-secure/0596008953/ch05s08.html

# Sources

- https://blog.stribik.technology/2015/01/04/secure-secure-shell.html
- SSH Cheatsheet: https://linuxize.com/cheatsheet/ssh/