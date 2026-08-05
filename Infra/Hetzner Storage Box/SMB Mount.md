## Step 1: Install CIFS utilities

```bash
# For Debian/Ubuntu 
sudo apt update 
sudo apt install -y cifs-utils 

# For CentOS/RHEL 
sudo yum install cifs-utils
```

## Step 2: Create a mount point

```bash
sudo mkdir /mnt/storagebox
```

## Step 3: Create a credentials file

```bash
sudo touch /root/.smbcredentials
sudo chmod 600 /root/.smbcredentials
sudo vim /root/.smbcredentials
```

Add the credentials to the file
```
username=your-username
password=your-password
```

## Step 4: Add the fstab entry

```bash
sudo vim /etc/fstab
```

```fstab
//your-username.your-storagebox.de/backup /mnt/storagebox cifs credentials=/root/.smbcredentials,iocharset=utf8,rw,uid=1000,gid=1000,file_mode=0660,dir_mode=0770,_netdev 0 0
```

Replace:
- `your-username.your-storagebox.de` with your actual Storage Box hostname (found in your Hetzner Robot panel)
- `/backup` with the share name (usually "backup" for Hetzner)
- `uid=1000,gid=1000` with your user/group IDs (check with `id` command)

## Step 5: Mount the drive

```bash
sudo systemctl daemon-reload
sudo mount -a
```

## Step 6: Test the mount

```bash
df -h | grep storagebox
touch /mnt/storagebox/test
```

## Common mount options explained:

- `credentials=` - path to your credentials file
- `iocharset=utf8` - character encoding
- `_netdev` - wait for network before mounting (important for boot)
- `uid/gid` - ownership of mounted files
- `file_mode/dir_mode` - permissions for files and directories