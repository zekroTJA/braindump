# Setup

## Storage Box

1. Order a Storage Box via Hetzner Robot
2. Reset password
3. Enable SSH and remote access to the storage box

## Server (Synology NAS)

1. Generate SSH key via `ssh-keygen -t ed25519`
2. Upload the SSH key to the storage box via 
   `cat ~/.ssh/id_ed25519.pub | ssh -p23 <username>@<username>.your-storagebox.de install-ssh-key`
3. Install [borg and borgmatic](https://docs.borgbase.com/setup/borg/synology) on the NAS
4. Set up a config like in the example below
5. Initialize the repository
   *This needs to be done using borg directly because of the required version parameter.*
   `borg init --encryption=repokey --remote-path=borg-1.4 ssh://<username>@<password>.your-storagebox.de:23/./<path>.borg
6. Create a schedule task with the following command
   `borgmatic --config $HOME/borgmatic.yml --log-file $HOME/backup.log create prune compact`

# Example Config

```yaml
repositories:
  - path: ssh://<username>@<password>.your-storagebox.de:23/./<path>.borg

source_directories:
  - ...

exclude_patterns:
  - ...

keep_daily: 7
keep_weekly: 4
keep_monthly: 6

encryption_passphrase: "<password>"

ntfy:
  topic: ikuno_backups
  server: https://ntfy.zekro.de
  access_token: "<ntfy_token>"

  finish:
    title: backups successful
    message: backups were executed successfully.
    tags: white_check_mark

  fail:
    title: backups failed!
    message: backups failed
    priority: urgent
    tags: x

  states:
    - finish
    - fail
```

# Mount Backups

First, list available archives.
```bash
borgmatic -c borgmatic.yml list
# with --match-archives '*' you can also list archives 
# not matching the identifier of the current machine.
```

Before mounting, you need to create the mount point and change the permissions on it.
```bash
sudo mkdir /mnt/backup
sudo chown $(whoami) /mnt/backup
```

After that, you can select a specific archive to mount by name or you can simply mount the `latest` archive.
```bash
borgmatic -c borgmatic.yml mount --archive latest --mount-point /mnt/backup
```

## MacOS

To mount borg backups on MacOS, [macFuse](https://github.com/macfuse/macfuse) needs to be installed and borg must be installed with macFuse support enabled.

```bash
brew install --cask macfuse
brew install borgbackup/tap/borgbackup-fuse
```

# Sources

- https://docs.hetzner.com/storage/storage-box/backup-space-ssh-keys/
- https://community.hetzner.com/tutorials/install-and-configure-borgbackup
- https://docs.hetzner.com/storage/storage-box/access/access-ssh-rsync-borg#ssh--rsync--borgbackup
- https://github.com/borgmatic-collective/borgmatic
- https://torsion.org/borgmatic/docs/how-to/set-up-backups/
- https://torsion.org/borgmatic/docs/reference/configuration/
- https://docs.borgbase.com/setup/borg/synology
- https://github.com/borgbackup/homebrew-tap