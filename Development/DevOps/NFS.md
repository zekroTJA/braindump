NFS (Network File System) is a distributed file system to access files over the network which is basically built directly into the [[Linux]] kernel which makes it very performant and easy to set up.

# Setup

## Creating a share

First, install the NFS server package.
```bash
# APT
sudo apt install nfs-kernel-server
# DNF
sudo dnf install nfs-utils
```

Next, ensure that the NFS server is activated as service and is running.
```bash
sudo systemctl enable --now nfs-server
```

If not already existent, create a directory to share.
```bash
sudo mkdir -p /media/nfs
```

After that, we add it to the list of NFS shares in `/etc/exports`. In the file, each share gets its own line. That line begins with the location of the share on the server machine. Across from that, you can list the hostname of an accepted client, if is available in the server’s hosts file, or an IP or range of IPs. Directly behind the IP address, place the rules for the share in a set of parenthesis. Altogether, it should look something like this:
```
/media/nfs		192.168.1.0/24(rw,sync,no_subtree_check)
```

The following share options are available:
- `ro` – specifies that the directory may only be mounted as read only  
- `rw` – grants both read and write permissions on the directory  
- `no_root_squash` – is an extremely dangerous option that allows remote root users the same privilege as the root user of the host machine  
- `subtree_check` – specifies that, in the case of a directory is exported instead of an entire filesystem, the host should verify the location of files and directories on the host filesystem  
- `no_subtree_check` – specifies that the host should not check the location of the files being accessed within the host filesystem  
- `sync` – this just ensures that the host keeps any changes uploaded to the shared directory in sync  
- `async` – ignores synchronisation checks in favour of increased speed

Once everything is set up, the share can be made accessible via the following command.
```bash
sudo exportfs -arv
```

## Connect to a share

First, we need to install the NFS client package on the system.
```bash
# APT
sudo apt install nfs-common
# DNF
sudo dnf install nfs-utils
```

If not already existent, create a directory to mount the share in to.
```bash
sudo mkdir -p /mnt/share
```

After that, add the share to your `/etc/fstab`.
```fstab
192.168.1.110:/media/nfs	/mnt/share	nfs4	defaults,user,exec	0 0
```

When done, you can mount the share using the `mount` command.
```bash
sudo mount -a
```

# Resources

- https://linuxconfig.org/how-to-configure-nfs-on-linux