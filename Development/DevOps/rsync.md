rsync is a tool for robust and efficient file transfers.

GitHub: https://github.com/rsyncproject/rsync
Website: https://rsync.samba.org/
Docs: https://download.samba.org/pub/rsync/rsync.1

## Use Cases

Copy from `source/` to `dest/` preserving file and folder permissions and soft links.

```bash
rsync --archive --verbose --progress source/ dest/

# or short:
rsync -avP source/ dest/
```

- `--archive, -a` - Preserves permissions (chmod), ownership, timestamps, and symlinks
- `--verbose, -v` - Shows which files are being transferred
- `--progress, -P` - Shows progress during transfer