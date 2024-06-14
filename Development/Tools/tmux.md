# Commands

- `tmux new -s <name>` - Create a tmux session with a name
- `tmux ls` - list running tmux sessions
- `tmux a` - Attach to the latest created session
- `tmux a -t <sesison>` - Attach to specific session
- `tmux kill-session -t <session>` - Kill a specific session

# Keybinds

All tmux keybind start with the initializer `CTRL+B`.

- `D` - Detach session
- `%` - Split vertically
- `Q` - Display Pane Numbers
    - Pressing a number directly after jumps to the specific pane
- Arrow Keys - Jump to the adjacent pane
- `CTRL` + Arrow Keys - Change size of a pane
- `C` - Create a new window
- `N` - Jump between windows
- `,` - Rename current window
- `$` - Rename current session

# Resources

- [https://devhints.io/tmux](https://devhints.io/tmux)
- [https://www.youtube.com/watch?v=nTqu6w2wc68](https://www.youtube.com/watch?v=nTqu6w2wc68)
- [https://github.com/tmux/tmux/wiki/Getting-Started](https://github.com/tmux/tmux/wiki/Getting-Started)