Steps to do to extend an EBS volume on an [[AWS]] EC2 Instance.
## Linux

First, extend the EBS volume in the AWS Console, TUI or IaC. After that, connect to the EC2 instance.
### Resize Partitions (if needed)

Check whether the volume has a partition. Use the `lsblk` command.

In the following example output, the root volume (`nvme0n1`) has two partitions (`nvme0n1p1` and `nvme0n1p128`), while the additional volume (`nvme1n1`) has no partitions.

```
$ sudo lsblk
NAME          MAJ:MIN RM SIZE RO TYPE MOUNTPOINT
nvme1n1       259:0    0  30G  0 disk /data
nvme0n1       259:1    0  16G  0 disk
└─nvme0n1p1   259:2    0   8G  0 part /
└─nvme0n1p128 259:3    0   1M  0 part
```

Check whether the partition needs to be extended. In the `lsblk` command output from the previous step, compare the partition size and the volume size. if the partition size is lower than the volume size, use the `growpart` command to adjust the partition size.

> The first parameter is the device name and the second parameter is the partition number.

```
sudo growpart /dev/nvme0n1 1
```

Now, verify that the partition size matches the volume size using `lsblk` again.

### Extend the file system

Get the name, size, type, and mount point for the file system that you need to extend. For that, use the `lsblk -f` command.

When the file system is **ext4**, use the following command to resize the file system to the partition size.

```
sudo resize2fs /dev/nvme0n1p1
```

## Sources
- https://docs.aws.amazon.com/ebs/latest/userguide/recognize-expanded-volume-linux.html