How to install Homebrew on [[Linux]].

# Installation

First, Install Homebrew
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

After that, add this to your `.bashrc` or `.zshrc`.
```bash
if [[ -d /home/linuxbrew/.linuxbrew ]]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi
```
# Sources

- https://brew.sh/
- https://docs.brew.sh/Homebrew-on-Linux
- https://youtu.be/QsYEvnV-P34