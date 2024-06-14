> This has been originally pulled from the following Gist. [https://gist.github.com/zekroTJA/ecf940846520c99f8e9d1ab2f9541938](https://gist.github.com/zekroTJA/ecf940846520c99f8e9d1ab2f9541938)

# Raspberry Pi NAS

1. Install NTFS and samba
    
    ```
    # apt install ntfs-g3 samba samba-common-bin
    ```
    
2. Attach NAS drive to RasPi and get device name
    
    ```
    $ fdisk -l
    > Device     Boot Start      End  Sectors  Size Id Type
    > /dev/sda1  *     2048 60061695 60059648 28.7G  c W95 FAT32 (LBA)
    ```
    
3. Create mount path and mount drive
    
    ```
    # mkdir /media/hdd1
    # mount -t auto /dev/sda1 /media/hdd1
    ```
    
4. Cretae copy of samba config and edit config
    
    ```
    # cp /etc/samba/smb.conf /etc/samba/smb.conf.save
    # nano /etc/samba/smb.conf
    ```
    
5. Make shared directories writable
    
    ```
    #======================= Share Definitions =======================
    
    ...
    
    # By default, the home directories are exported read-only. Change the
    # next parameter to 'no' if you want to be able to write to them.
       read only = no
    #              ^
    #              Defaultly this is "yes", change it to "no"
    ```
    
6. Add network drive at the end of the file
    
    ```
    [PINAS]
    comment = PINAS
    path = /media/hdd1/nas
    valid users = @users
    force group = users
    create mask = 0660
    directory mask = 0771
    read only = no
    ```
    
7. Restart samba
    
    ```
    # /etc/init.d/samba restart
    ```
    
8. Cretae nas user for authentication
    
    ```
    # useradd nas -m -G users
    # passwd nas
    ```
    
9. Add user to samba
    
    ```
    # smbpasswd -a nas
    ```
    
10. Add drive to auto mount on reboot
    
    ```
    # echo "/dev/sda1 /media/hdd1 auto noatime 0 0" >> /etc/fstab
    ```