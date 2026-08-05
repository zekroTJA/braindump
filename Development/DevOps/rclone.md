Rclone is basically "rsync for cloud storage" supporting a vast list of [cloud storage providers and protocols](https://rclone.org/overview/).

GitHub: https://github.com/rclone/rclone
Website: https://rclone.org/
Docs: https://rclone.org/
## Use Cases

Copy from `source/` to `dest/` preserving file and folder permissions and soft links.

```bash
rclone copy source:path dest:path --progress --links --metadata
```

- `--progress` - Shows real-time transfer progress
- `--links` or `-l` - Copies symlinks as symlinks (instead of following them)
- `--metadata` - Preserves file permissions, ownership, and other metadata including chmod permissions

> Also `--metadata-set "mode,uid,gid"` can be used to specify which specific metadata should be copied.