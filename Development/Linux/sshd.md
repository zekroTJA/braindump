# Allow only Jump Host access

With these configuration parameters, access to an SSH bastion is only available as jump host and not to access the shell on the server directly.

```
ForceCommand /bin/false 
AllowTcpForwarding yes 
PermitTunnel no 
X11Forwarding no 
PermitTTY no
```