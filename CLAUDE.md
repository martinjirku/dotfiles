# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal dotfiles repository containing ZSH, Neovim, and Tmux configurations. The structure is organized as follows:

- **zsh/**: ZSH shell configuration with plugins, themes, and custom functions
- **nvim/**: Neovim configuration using Lazy.nvim plugin manager
- **tmux/**: Tmux terminal multiplexer configuration

## Installation and Setup

### Initial Setup
```bash
git clone --recurse-submodules git@github.com:martinjirku/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
git submodule update --init --recursive

# Create symlinks
ln -s ~/.dotfiles/zsh ~/.config/zsh
ln -s ~/.dotfiles/nvim ~/.config/nvim
ln -s ~/.dotfiles/tmux ~/.config/tmux
ln -s ~/.config/tmux/.tmux.conf ~/.tmux.conf
```

### Package Installation
Install required packages using the automated script:
```bash
~/.dotfiles/zsh/install_brew_packages.zsh
```

This script reads from `zsh/brew.list` and installs missing packages via Homebrew.

## ZSH Configuration Architecture

### Core Files Structure
- `aliases.zsh`: Command aliases and shortcuts
- `fzf.zsh`: FZF fuzzy finder configuration with custom preview and completion
- `git.zsh`: Git prompt configuration with VCS info hooks
- `completion.zsh`: Shell completion settings
- `history.zsh`: Command history configuration
- `options.zsh`: ZSH options and settings
- `prompt.zsh`: Custom prompt configuration

### Configuration Loading Order
The `.zshrc` loads configuration in this specific order (important for understanding dependencies):
1. Completions and Oh My Zsh git plugin
2. Homebrew environment
3. Core configurations (aliases, options, history, completion, git, fzf)
4. Custom functions (ports.zsh, dj.zsh)
5. Command-time plugin
6. FZF shell integration
7. SDKMAN initialization (Java/SDK/Gradle version management)
8. PATH additions (scripts, Go binaries)

### Key Features
- **Enhanced Git Prompt**: Shows branch, ahead/behind count, staged/unstaged changes, and stash count
- **FZF Integration**: Advanced fuzzy finding with custom previews and completion
- **Oh My Zsh**: Integrated as a submodule (`plugins/ohmyzsh`) - currently only uses git plugin
- **ZSH Completions**: Additional completions via `plugins/zsh-completions` submodule
- **Command Time Plugin**: Shows command execution time in prompt
- **Custom Functions**: Located in `functions/` directory

### Important Scripts
- `scripts/rfz`: Ripgrep + FZF integration for code search with file opening
- `scripts/fzf-preview`: Preview script for FZF file previews
- `scripts/imgcat`: Image display utility

## Neovim Configuration

### Structure
- `init.lua`: Entry point, loads lazy.nvim configuration
- `lua/config/`: LazyVim configuration files
  - `lazy.lua`: Lazy.nvim bootstrap and LazyVim setup
  - `options.lua`: Neovim options configuration
  - `keymaps.lua`: Custom keymaps
  - `autocmds.lua`: Auto commands
- `lua/plugins/`: Plugin configurations
  - `colorscheme.lua`: GitHub dark theme configuration
  - `treesitter.lua`: Tree-sitter syntax highlighting with language support
  - `example.lua`: Example plugin configurations (disabled by default)

### Plugin Manager
Uses LazyVim (built on Lazy.nvim) for comprehensive plugin management with automatic installation, updates, and sensible defaults. The configuration follows LazyVim's structure and conventions.

### Keybindings Reference
A comprehensive LazyVim keybindings cheatsheet is available in `cheatsheet.md` covering:
- Navigation, window management, buffer operations
- LSP commands, code actions, diagnostics
- Git integration, search and replace, file operations
- LazyVim uses which-key.nvim to show available keymaps interactively

## Tmux Configuration

### Structure
- `tmux/.tmux.conf`: Main tmux configuration file
- Configuration location: `~/.config/tmux/.tmux.conf` (symlinked)

### Setup
```bash
# Create symlinks (if not already done in initial setup)
ln -s ~/.dotfiles/tmux ~/.config/tmux
ln -s ~/.config/tmux/.tmux.conf ~/.tmux.conf

# Note: Tmux plugins are managed as git submodules and will be cloned automatically
# when you clone the dotfiles repository with --recurse-submodules or run:
# git submodule update --init --recursive

# Start tmux to load configuration
tmux
# Or if already in tmux: tmux source-file ~/.tmux.conf
```

### Key Features
- **Prefix Key**: `Ctrl+a` (instead of default `Ctrl+b`)
- **Mouse Support**: Enabled for pane selection, resizing, and scrolling
- **True Color**: Full 24-bit color support for terminals
- **Vim-style Navigation**: `prefix + h/j/k/l` for pane navigation
- **Smart Splits**: `prefix + |` for vertical, `prefix + -` for horizontal
- **Session Persistence**: Auto-saves and restores sessions via tmux-resurrect and tmux-continuum

### Essential Keybindings
- `Ctrl+a r`: Reload tmux configuration
- `Ctrl+a |`: Split pane vertically (in current path)
- `Ctrl+a -`: Split pane horizontally (in current path)
- `Ctrl+a h/j/k/l`: Navigate between panes (vim-style)
- `Ctrl+a H/J/K/L`: Resize current pane (hold prefix)
- `Ctrl+a m`: Toggle pane zoom (maximize/minimize)
- `Ctrl+a [`: Enter copy mode (vim keybindings)
- `Alt+Left/Right`: Switch windows
- `Ctrl+a c`: Create new window (in current path)

### Copy Mode (Vim-style)
- `v`: Begin selection
- `Ctrl+v`: Rectangle selection
- `y`: Copy selection and exit
- `q`: Exit copy mode

### Plugins
- **tpm**: Tmux Plugin Manager
- **tmux-sensible**: Sensible default settings
- **tmux-resurrect**: Save and restore tmux sessions
- **tmux-continuum**: Automatic session saving and restoration
- **tmux-yank**: Enhanced clipboard integration

### Status Bar
- Left: Session name and separator
- Right: Date, time, and hostname
- Window list: Shows window index and name with visual indicator for active window

## Development Workflow

### Adding New Packages
1. Add package name to `zsh/brew.list`
2. Run `~/.dotfiles/zsh/install_brew_packages.zsh` to install

### Custom Functions
Place new ZSH functions in `zsh/functions/` directory with `.zsh` extension.

### Git Integration
The configuration includes advanced git integration:
- Custom git prompt with status indicators
- Git aliases and helper functions
- Line history tracking with `git-linehist` function

### SDKMAN Integration
SDKMAN is configured for managing Java, SDK, and Gradle versions:
- Initialized via `~/.sdkman/bin/sdkman-init.sh`
- See https://sdkman.io/install for installation and usage

### Podman Configuration
Environment variables for Podman Compose compatibility:
- `PODMAN_COMPOSE_PROVIDER`: Points to docker-compose binary
- `PODMAN_COMPOSE_WARNING_LOGS=false`: Suppresses warning logs

### GitUI
Terminal UI for git with custom theme:
- Theme configuration: `gitui/theme.ron`
- Launch with `gitui` command

## Key Aliases and Functions

### Navigation
- `..`, `...`, `....`: Navigate up directory levels
- `ll`, `la`, `lla`: Enhanced ls commands

### Development
- `editor`: Opens VS Code
- `rr`: Reload ZSH configuration
- `rfz`: Ripgrep + FZF file search
- `or`: Open git remote origin in browser
- `uuid`: Generate lowercase UUID
- `dj`: Directory Jumper with FZF - quick navigation to saved directories
  - `dj`: Interactive fuzzy search
  - `dj add [path]`: Add directory to jump list
  - `dj edit [search]`: Navigate to directory and open in $EDITOR
  - Config stored in `~/.config/dirjump/directories`
- `portkill <port>`: Kill process on specified port
- `portpid <port>`: Show PID for process on specified port

### Git
- `git-graph`: Visual git log with graph
- `git-linehist`: Git line history for specific lines
- `glh`: Alias for git-linehist

## Required Dependencies

Essential tools installed via `brew.list`:
- `eza`: Modern ls replacement
- `fzf`: Fuzzy finder
- `bat`: Cat replacement with syntax highlighting
- `fd`: Find replacement
- `ripgrep`: Grep replacement
- `neovim`: Text editor
- `tree`: Directory tree display
- `jq`, `yq`: JSON/YAML processors
- `luajit`, `luarocks`: Lua runtime and package manager (for Neovim)
- `catimg`, `chafa`: Image display in terminal
- `gum`: Shell script styling tool
- `gitui`: Terminal UI for git
- `kubernetes-cli`, `kubectx`: Kubernetes tools
- `tmux`: Terminal multiplexer

## Recent Changes

### LazyVim Migration
The Neovim configuration has been migrated from a custom Lazy.nvim setup to LazyVim:
- **LazyVim Integration**: Now uses LazyVim as the base configuration with `lazyvim.plugins` imported
- **GitHub Theme**: Switched from tokyonight to github-nvim-theme with dark variant
- **Plugin Structure**: Reorganized to follow LazyVim conventions
- **Configuration Files**: Added standard LazyVim config files (options.lua, keymaps.lua, autocmds.lua)
- **Tree-sitter**: Enhanced with additional language support including Go, TypeScript, and more
- **Performance**: Optimized with disabled unnecessary runtime plugins