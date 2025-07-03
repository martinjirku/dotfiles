# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal dotfiles repository containing ZSH and Neovim configurations. The structure is organized as follows:

- **zsh/**: ZSH shell configuration with plugins, themes, and custom functions
- **nvim/**: Neovim configuration using Lazy.nvim plugin manager

## Installation and Setup

### Initial Setup
```bash
git clone --recurse-submodules git@github.com:martinjirku/zsh.git ~/.dotfiles
cd ~/.dotfiles
git submodule update --init --recursive

# Create symlinks
ln -s ~/.dotfiles/zsh ~/.config/zsh
ln -s ~/.dotfiles/nvim ~/.config/nvim
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

### Key Features
- **Enhanced Git Prompt**: Shows branch, ahead/behind count, staged/unstaged changes, and stash count
- **FZF Integration**: Advanced fuzzy finding with custom previews and completion
- **Oh My Zsh**: Integrated as a submodule with extensive plugin support
- **Custom Functions**: Located in `functions/` directory

### Important Scripts
- `scripts/rfz`: Ripgrep + FZF integration for code search with file opening
- `scripts/fzf-preview`: Preview script for FZF file previews
- `scripts/imgcat`: Image display utility

## Neovim Configuration

### Structure
- `init.lua`: Entry point, loads lazy.nvim configuration
- `lua/config/lazy.lua`: Lazy.nvim bootstrap and setup
- `lua/plugins/`: Plugin configurations
  - `colorscheme.lua`: Color scheme setup
  - `telescope.lua`: Telescope fuzzy finder
  - `treesitter.lua`: Tree-sitter syntax highlighting

### Plugin Manager
Uses Lazy.nvim for plugin management with automatic installation and updates.

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