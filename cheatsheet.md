# LazyVim Keybindings Cheatsheet

> **Note:** Default `<leader>` is `<space>` (spacebar). LazyVim uses which-key.nvim to show available keymaps when you press any key combination. [LazyVim +2](https://lazyvim.github.io/keymaps

## Navigation

### Basic Cursor Movement
| Keybinding | Title | Description |
|------------|-------|-------------|
| h/j/k/l | Move Cursor | Move left/down/up/right |
|0 | Beginning of line | Go to beginning of line
| $ | End of line | |
| gg | First Line | |
| G | Last Line | |
| % | Matching bracket | |

### Advanced navigation
| Keybinding | Title | Description |
|------------|-------|-------------|
| `<C-u>/<C-d>` | Half page up/down | Move up/down half page |
| `<C-f>/<C-b>` | Full page up/down | |
| `<C-o>/<C-i>` | Jump back/forward | |
| `<C-e>/<C-y>` | Scroll line up/down | |
| `zz` | Center Cursor | |

### Window Navigation
| Keybinding | Title | Description |
|------------|-------|-------------|
| `<C-h/j/k/l>` | Navigate windows | Go to left/lower/upper/right window |
| `<C-Up/Down` | Resize height | |
| `<C-Left/Right>` | Resize width | |
| `<leader>wd` | Delete window | |
| `<leader>-` | Split horizontal | |
| `<leader>\|` | Split vertical | |

### Buffer Management
| Keybinding | Title | Description |
|------------|-------|-------------|
| `<S-h>/<S-I>` | Prev/Next buffer | |
| `[b/]b` | Previouse/next buffer | |
| `<leader>bb` | Switch buffer | |
| `<leader>bd` | Delete buffer | |
| `<leader>bo` | Delete other buffers | |
| `<leader>bD` | Delete buffer and window | |

### IntelliSense Navigation
| Keybinding | Title | Description |
|------------|-------|-------------|
| `<C-n>` | Next item | |
| `<C-p>` | Previous item | |
| `<C-d>` | Scroll docs up | |
| `<C-f>` | Scroll docs down | |
| `K` | Show documentation | normal mode |
| `<C-k>` | Show signature | insert mode |

### Tab Management
| Keybinding | Title | Description |
|------------|-------|-------------|
| `<leader><tab><tab>` | New Tab | |
| `<leader><tab>]` | Next Tab | |
| `<leader><tab>[` | Prev Tab | |
| `<leader><tab>d` | Close Tab | |
| `<leader><tab>o` | Close Other Tabs | |
| `<leader><tab>f` | First Tab | |
| `<leader><tab>\|` | Last tab | |

### Diagnostics & Error Navigation
| Keybinding | Title | Description |
|------------|-------|-------------|
| `]d/[d` | Next/previous diagnostic | Navigate diagnostics |
| `]e/[e` | Next/previous error | Navigate errors |
| `]w/[w` | Next/previous warning | Navigate warnings |
| `<leader>cd` | Line diagnostics | Show line diagnostics |

### Git Hunk Navigation
| Keybinding | Title | Description |
|------------|-------|-------------|
| `]h/[h` | Next/previous hunk | Navigate git hunks |
| `]H/[H` | Last/first hunk | Jump to last/first git hunk |

## Go to Definition & References

### LSP Navigation
| Keybinding | Title | Description |
|------------|-------|-------------|
| `gd` | Go to definition | Go to definition |
| `gr` | References | Show references |
| `gI` | Go to implementation | Go to implementation |
| `gy` | Go to type definition | Go to type definition |
| `gD` | Go to declaration | Go to declaration |
| `K` | Hover | Show hover information |
| `gK` | Signature help | Show signature help |
| `<c-k>` | Signature help (insert) | Show signature help in insert mode |

### Function & Class Navigation
| Keybinding | Title | Description |
|------------|-------|-------------|
| `]f/[f` | Next/previous function | Navigate to function start |
| `]F/[F` | Next/previous function end | Navigate to function end |
| `]c/[c` | Next/previous class | Navigate to class start |
| `]C/[C` | Next/previous class end | Navigate to class end |

### Symbol Search
| Keybinding | Title | Description |
|------------|-------|-------------|
| `<leader>ss` | Document symbols | Go to symbol in document |
| `<leader>cs` | Document symbols | Show document symbols |
| `<leader>cS` | LSP references | Show LSP references/definitions |

### Reference Navigation
| Keybinding | Title | Description |
|------------|-------|-------------|
| `]]` | Next reference | Go to next reference |
| `[[` | Previous reference | Go to previous reference |
| `<a-n>` | Next reference | Alternative next reference |
| `<a-p>` | Previous reference | Alternative previous reference |

## Selection & Text Objects

### Basic Text Objects
| Keybinding | Title | Description |
|------------|-------|-------------|
| `viw` | Inner word | Select inner word |
| `vi"` | Inner quotes | Select inner quotes |
| `vi{` | Inner braces | Select inner curly braces |
| `vip` | Inner paragraph | Select inner paragraph |
| `va[` | Around brackets | Select around square brackets |
| `vat` | Around tag | Select around HTML tag |
| `vit` | Inner tag | Select inner HTML tag |

### Advanced Text Objects
| Keybinding | Title | Description |
|------------|-------|-------------|
| `vio` | Inner code block | Select inner code block |
| `vao` | Around code block | Select around code block |
| `vif` | Inner function | Select inner function |
| `vaf` | Around function | Select around function |
| `vic` | Inner class | Select inner class |
| `vac` | Around class | Select around class |
| `vid` | Inner digits | Select digits |
| `viu` | Inner function call | Select function call |

### Treesitter Selection
| Keybinding | Title | Description |
|------------|-------|-------------|
| `<C-space>` | Increment selection | Increment selection |
| `<bs>` | Decrement selection | Decrement selection |

### Surround Operations
| Keybinding | Title | Description |
|------------|-------|-------------|
| `gsa` | Add surrounding | Add surrounding |
| `gsd` | Delete surrounding | Delete surrounding |
| `gsf` | Find right surrounding | Find right surrounding |
| `gsF` | Find left surrounding | Find left surrounding |
| `gsh` | Highlight surrounding | Highlight surrounding |
| `gsr` | Replace surrounding | Replace surrounding |

## Actions & Editing

### Basic Actions
| Keybinding | Title | Description |
|------------|-------|-------------|
| `u` | Undo | Undo last action |
| `<C-r>` | Redo | Redo last undone action |
| `<C-s>` | Save file | Save current file |
| `<esc>` | Escape | Escape and clear search highlight |
| `<leader>ur` | Redraw | Redraw/clear highlight/diff update |

### Line Operations
| Keybinding | Title | Description |
|------------|-------|-------------|
| `<A-j>` | Move line down | Move line down |
| `<A-k>` | Move line up | Move line up |
| `J` | Join lines | Join current and next line |
| `gcc` | toggle comment |  |
| `gco` | Add comment below | Add comment below |
| `gcO` | Add comment above | Add comment above |

### Search Operations
| Keybinding | Title | Description |
|------------|-------|-------------|
| `n` | Next search | Next search result |
| `N` | Previous search | Previous search result |
| `*` | Search word | Search word under cursor |

### Code Actions
| Keybinding | Title | Description |
|------------|-------|-------------|
| `<leader>ca` | Code action | Show code actions |
| `<leader>cc` | Run codelens | Run codelens |
| `<leader>cC` | Refresh codelens | Refresh and display codelens |
| `<leader>cr` | Rename | Rename symbol |
| `<leader>cR` | Rename file | Rename file |
| `<leader>cA` | Source action | Source action |
| `<leader>cf` | Format | Format code |
| `<leader>cF` | Format injected | Format injected languages |

### Quickfix Operations
| Keybinding | Title | Description |
|------------|-------|-------------|
| `<leader>xl` | Location list | Show location list |
| `<leader>xq` | Quickfix list | Show quickfix list |
| `[q/]q` | Previous/next quickfix | Navigate quickfix items |

## File Operations

### File Management
| Keybinding | Title | Description |
|------------|-------|-------------|
| `<leader>fn` | New file | Create new file |
| `<leader><space>` | Find files | Find files in root directory |
| `<leader>ff` | Find files | Find files in root directory |
| `<leader>fF` | Find files (cwd) | Find files in current directory |
| `<leader>fg` | Git files | Find git files |
| `<leader>fb` | Buffers | Show buffers |
| `<leader>fc` | Config files | Find config files |
| `<leader>fr` | Recent files | Show recent files |
| `<leader>fR` | Recent files (cwd) | Show recent files in cwd |

### File Explorer
| Keybinding | Title | Description |
|------------|-------|-------------|
| `<leader>e` | Explorer | Open file explorer (root dir) |
| `<leader>E` | Explorer (cwd) | Open file explorer (cwd) |
| `<leader>fe` | Explorer | Open file explorer (root dir) |
| `<leader>fE` | Explorer (cwd) | Open file explorer (cwd) |

## Search Operations

### Text Search
| Keybinding | Title | Description |
|------------|-------|-------------|
| `<leader>/` | Grep | Search in files (root dir) |
| `<leader>sg` | Grep | Search in files (root dir) |
| `<leader>sG` | Grep (cwd) | Search in files (cwd) |
| `<leader>sr` | Search replace | Search and replace |
| `<leader>sw` | Search word | Search word under cursor |
| `<leader>sW` | Search word (cwd) | Search word in cwd |

### System Search
| Keybinding | Title | Description |
|------------|-------|-------------|
| `<leader>sk` | Search keymaps | Search keymaps |
| `<leader>sh` | Help pages | Search help pages |
| `<leader>sm` | Marks | Search marks |
| `<leader>sj` | Jumps | Search jumps |
| `<leader>sc` | Command history | Search command history |
| `<leader>s"` | Registers | Search registers |

### Enhanced Search (Flash)
| Keybinding | Title | Description |
|------------|-------|-------------|
| `s` | Flash | Flash search |
| `S` | Flash treesitter | Flash treesitter search |
| `r` | Remote flash | Remote flash |
| `R` | Treesitter search | Treesitter search |
| `<c-s>` | Toggle flash | Toggle flash search |

## Git Operations

### Git Commands
| Keybinding | Title | Description |
|------------|-------|-------------|
| `<leader>gg` | LazyGit | Open LazyGit |
| `<leader>gb` | Git blame | Show git blame for line |
| `<leader>gB` | Git browse | Open git browse |
| `<leader>gY` | Git browse (copy) | Copy git browse URL |
| `<leader>gs` | Git status | Show git status |
| `<leader>gS` | Git stash | Show git stash |
| `<leader>gd` | Git diff | Show git diff hunks |

### Git Hunk Operations
| Keybinding | Title | Description |
|------------|-------|-------------|
| `<leader>ghs` | Stage hunk | Stage git hunk |
| `<leader>ghr` | Reset hunk | Reset git hunk |
| `<leader>ghp` | Preview hunk | Preview git hunk |
| `<leader>ghu` | Undo stage hunk | Undo stage git hunk |

## Terminal & UI

### Terminal
| Keybinding | Title | Description |
|------------|-------|-------------|
| `<leader>ft` | Terminal | Open terminal (root dir) |
| `<leader>fT` | Terminal (cwd) | Open terminal (cwd) |
| `<C-/>` | Terminal | Open terminal (root dir) |
| `<C-_>` | Hide terminal | Hide terminal |

### UI Toggles
| Keybinding | Title | Description |
|------------|-------|-------------|
| `<leader>ul` | Toggle line numbers | Toggle line numbers |
| `<leader>uL` | Toggle relative numbers | Toggle relative line numbers |
| `<leader>uw` | Toggle wrap | Toggle word wrap |
| `<leader>us` | Toggle spelling | Toggle spell checking |
| `<leader>uc` | Toggle conceal | Toggle conceal level |
| `<leader>uf` | Toggle auto format | Toggle auto format (global) |
| `<leader>uF` | Toggle auto format | Toggle auto format (buffer) |
| `<leader>ud` | Toggle diagnostics | Toggle diagnostics |
| `<leader>uh` | Toggle inlay hints | Toggle inlay hints |
| `<leader>uC` | Colorschemes | Show colorschemes |
| `<leader>uZ` | Toggle zoom | Toggle zoom mode |
| `<leader>uz` | Toggle zen mode | Toggle zen mode |

## Development Tools

### Debugging (DAP)
| Keybinding | Title | Description |
|------------|-------|-------------|
| `<leader>da` | Run with args | Run with arguments |
| `<leader>db` | Toggle breakpoint | Toggle breakpoint |
| `<leader>dB` | Breakpoint condition | Set breakpoint condition |
| `<leader>dc` | Continue | Run/continue |
| `<leader>dC` | Run to cursor | Run to cursor |
| `<leader>di` | Step into | Step into |
| `<leader>do` | Step out | Step out |
| `<leader>dO` | Step over | Step over |
| `<leader>dr` | Toggle REPL | Toggle REPL |
| `<leader>dt` | Terminate | Terminate session |
| `<leader>du` | Dap UI | Show DAP UI |

### Testing (Neotest)
| Keybinding | Title | Description |
|------------|-------|-------------|
| `<leader>tl` | Run last test | Run last test |
| `<leader>to` | Show output | Show test output |
| `<leader>tr` | Run nearest test | Run nearest test |
| `<leader>ts` | Toggle summary | Toggle test summary |
| `<leader>tS` | Stop tests | Stop tests |
| `<leader>tt` | Run file tests | Run file tests |
| `<leader>tT` | Run all tests | Run all test files |
| `<leader>tw` | Toggle watch | Toggle test watch |
| `<leader>td` | Debug nearest | Debug nearest test |

### Diagnostics (Trouble)
| Keybinding | Title | Description |
|------------|-------|-------------|
| `<leader>xx` | Diagnostics | Show diagnostics (Trouble) |
| `<leader>xX` | Buffer diagnostics | Show buffer diagnostics |
| `<leader>xL` | Location list | Show location list |
| `<leader>xQ` | Quickfix list | Show quickfix list |
| `<leader>cs` | Symbols | Show symbols (Trouble) |
| `<leader>cS` | LSP references | Show LSP references |

### Todo Comments
| Keybinding | Title | Description |
|------------|-------|-------------|
| `<leader>st` | Todo | Search todo comments |
| `<leader>sT` | Todo/Fix/Fixme | Search todo/fix/fixme |
| `<leader>xt` | Todo (Trouble) | Show todos in Trouble |
| `<leader>xT` | Todo/Fix/Fixme | Show todos/fixes in Trouble |
| `[t/]t` | Previous/next todo | Navigate todo comments |

## Utility & System

### Session Management
| Keybinding | Title | Description |
|------------|-------|-------------|
| `<leader>qs` | Restore session | Restore session |
| `<leader>qS` | Select session | Select session |
| `<leader>ql` | Restore last session | Restore last session |
| `<leader>qd` | Don't save session | Don't save current session |
| `<leader>qq` | Quit all | Quit all |

### System & Utilities
| Keybinding | Title | Description |
|------------|-------|-------------|
| `<leader>l` | Lazy | Open Lazy plugin manager |
| `<leader>L` | LazyVim changelog | Show LazyVim changelog |
| `<leader>cm` | Mason | Open Mason |
| `<leader>K` | Keywordprg | Run keywordprg |
| `<leader>ui` | Inspect position | Inspect position |
| `<leader>uI` | Inspect tree | Inspect tree |
| `<leader>un` | Dismiss notifications | Dismiss all notifications |
| `<leader>n` | Notification history | Show notification history |

---

**Note:** This cheatsheet covers default LazyVim keybindings. Additional keybindings may be available depending on enabled LazyVim extras. Use `<leader>sk` to search all available keymaps in your current setup. [github](https://lazyvim.github.io/keymaps
