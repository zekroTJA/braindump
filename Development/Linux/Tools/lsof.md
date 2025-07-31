Display the CWD of a process by it's PID
```bash
sudo lsof -p <PID> | grep cwd
```