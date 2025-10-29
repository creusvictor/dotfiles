# dotfiles

Personal configuration files for my development environment.

## Overview

This repository contains configuration files for:
- **Zsh** - Shell configuration with Oh My Zsh
- **Neovim** - Text editor configuration based on NvChad
- **Tmux** - Terminal multiplexer setup
- **Kitty** - GPU-accelerated terminal emulator

## Contents

```
.
├── zsh/          # Zsh shell configuration
├── nvim/         # Neovim editor configuration
├── tmux/         # Tmux terminal multiplexer configuration
└── kitty/        # Kitty terminal emulator configuration
```

## Features

### Zsh Configuration
- **Theme**: oh-my-posh with custom theme
- **Plugins**: Extensive plugin support including:
  - Cloud tools: ansible, argocd, azure, gcloud, terraform
  - Container tools: docker, docker-compose, kubectl, helm
  - Development: git, python, vagrant
  - Utilities: eza, httpie, kitty, redis-cli, ssh, tmux
- **Aliases**: bat for cat, lazygit, weather info, and more
- **Custom Functions**: Vault and registry login helpers

### Neovim Configuration
- **Base**: NvChad v2.5 framework
- **Plugin Manager**: lazy.nvim
- **Features**:
  - Relative line numbers
  - Code folding support (UFO.lua)
  - Leader key: Space

### Tmux Configuration
- **Prefix**: Changed from `Ctrl-b` to `Ctrl-a`
- **Theme**: tmux-nova with custom Nord-inspired colors
- **Plugins**:
  - tmux-sensible - Sensible defaults
  - tmux-resurrect - Session persistence
  - tmux-continuum - Automatic session saving
  - tmux-yank - Enhanced copy functionality
  - tmux-neolazygit - LazyGit integration (prefix + G)
- **Features**:
  - Mouse support enabled
  - System clipboard integration via xclip
  - Kubernetes context display in status bar
  - Alt+Arrow navigation between panes

### Kitty Configuration
- **Theme**: Atom theme
- GPU-accelerated rendering
- Extensive font management support

## Prerequisites

Before using these dotfiles, ensure you have the following installed:

- **Zsh**: `sudo apt install zsh` (or equivalent for your OS)
- **Oh My Zsh**: [Installation instructions](https://ohmyz.sh/#install)
- **oh-my-posh**: [Installation instructions](https://ohmyposh.dev/docs/installation/linux)
- **Neovim** (>= 0.9.0): [Installation instructions](https://github.com/neovim/neovim/releases)
- **Tmux**: `sudo apt install tmux` (or equivalent)
- **TPM** (Tmux Plugin Manager): [Installation instructions](https://github.com/tmux-plugins/tpm)
- **Kitty**: [Installation instructions](https://sw.kovidgoyal.net/kitty/binary/)
- **Additional tools**:
  - bat: `sudo apt install bat`
  - eza: Modern ls replacement
  - lazygit: Terminal UI for git
  - xclip: `sudo apt install xclip`

## Installation

1. **Clone this repository**:
   ```bash
   git clone https://github.com/yourusername/dotfiles.git ~/dotfiles
   cd ~/dotfiles
   ```

2. **Backup existing configurations**:
   ```bash
   mv ~/.zshrc ~/.zshrc.backup
   mv ~/.config/nvim ~/.config/nvim.backup
   mv ~/.tmux.conf ~/.tmux.conf.backup
   mv ~/.config/kitty ~/.config/kitty.backup
   ```

3. **Create symbolic links**:
   ```bash
   # Zsh
   ln -s ~/dotfiles/zsh/.zshrc ~/.zshrc

   # Neovim
   ln -s ~/dotfiles/nvim ~/.config/nvim

   # Tmux
   ln -s ~/dotfiles/tmux/.tmux.conf ~/.tmux.conf

   # Kitty
   ln -s ~/dotfiles/kitty ~/.config/kitty
   ```

4. **Install Tmux plugins**:
   ```bash
   # Open tmux and press prefix + I (Ctrl-a + Shift-i)
   tmux
   # Then press: Ctrl-a + I
   ```

5. **Install Neovim plugins**:
   ```bash
   # Open Neovim - plugins will install automatically
   nvim
   ```

6. **Configure environment variables**:
   Edit `~/.zshrc` and set your API keys and credentials:
   ```bash
   export GEMINI_API_KEY="your_key_here"
   export OPENAI_API_KEY="your_key_here"
   export GOOGLE_CLIENT_ID="your_id_here"
   export GOOGLE_SECRET_ID="your_secret_here"
   ```

7. **Reload shell configuration**:
   ```bash
   source ~/.zshrc
   ```

## Customization

### Zsh
- Edit `~/.zshrc` to modify plugins, aliases, or functions
- Custom oh-my-posh theme located at: `~/creusvictor_oh_my_posh/creusvictor.omp.json`

### Neovim
- Custom plugins: Add to `~/dotfiles/nvim/lua/plugins/`
- Key mappings: Edit `~/dotfiles/nvim/lua/mappings.lua`
- Options: Edit `~/dotfiles/nvim/lua/options.lua`

### Tmux
- Edit `~/.tmux.conf` for custom keybindings and settings
- Reload config: `Ctrl-a + r`

### Kitty
- Edit `~/.config/kitty/kitty.conf`
- Theme: Modify `current-theme.conf` or use `kitten themes`

## Key Bindings

### Tmux
- **Prefix**: `Ctrl-a`
- **Reload config**: `Ctrl-a + r`
- **Split horizontal**: `Ctrl-a + "`
- **Split vertical**: `Ctrl-a + %`
- **Navigate panes**: `Alt + Arrow keys`
- **Copy to clipboard**: `Ctrl-a + Ctrl-c`
- **Paste from clipboard**: `Ctrl-a + Ctrl-v`
- **Open LazyGit**: `Ctrl-a + G`

### Neovim
- **Leader key**: `Space`
- See NvChad documentation for complete keybindings

## Useful Commands

```bash
# Weather information
weather

# Pretty cat with syntax highlighting
cat file.txt

# Interactive Git UI
lgit

# SSH with custom wrapper
ssh user@host
```

## License

MIT License - Feel free to use and modify these configurations for your own setup.

## Contributing

Feel free to submit issues or pull requests if you have suggestions for improvements!