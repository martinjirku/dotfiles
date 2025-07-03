local keymap = vim.keymap

-- File operations
keymap.set('n', '<leader>w', '<cmd>w<cr>', { desc = 'Save file' })
keymap.set('n', '<leader>q', '<cmd>q<cr>', { desc = 'Quit' })
keymap.set('n', '<leader>Q', '<cmd>q!<cr>', { desc = 'Force quit' })
keymap.set('n', '<leader>x', '<cmd>x<cr>', { desc = 'Save and quit' })

-- Buffer management
keymap.set('n', '<leader>bd', '<cmd>bdelete<cr>', { desc = 'Delete buffer' })
keymap.set('n', '<leader>bn', '<cmd>bnext<cr>', { desc = 'Next buffer' })
keymap.set('n', '<leader>bp', '<cmd>bprevious<cr>', { desc = 'Previous buffer' })
keymap.set('n', '<leader>ba', '<cmd>%bd|e#<cr>', { desc = 'Delete all buffers except current' })

-- Window management
keymap.set('n', '<leader>sv', '<cmd>vsplit<cr>', { desc = 'Split vertically' })
keymap.set('n', '<leader>sh', '<cmd>split<cr>', { desc = 'Split horizontally' })
keymap.set('n', '<leader>se', '<C-w>=', { desc = 'Make splits equal size' })
keymap.set('n', '<leader>sx', '<cmd>close<cr>', { desc = 'Close current split' })

-- Easy window navigation
keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Go to left window' })
keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Go to lower window' })
keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Go to upper window' })
keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Go to right window' })

-- Tab management
keymap.set('n', '<leader>to', '<cmd>tabnew<cr>', { desc = 'Open new tab' })
keymap.set('n', '<leader>tx', '<cmd>tabclose<cr>', { desc = 'Close current tab' })
keymap.set('n', '<leader>tn', '<cmd>tabn<cr>', { desc = 'Go to next tab' })
keymap.set('n', '<leader>tp', '<cmd>tabp<cr>', { desc = 'Go to previous tab' })
keymap.set('n', '<leader>tf', '<cmd>tabnew %<cr>', { desc = 'Open current buffer in new tab' })

-- Telescope (File finder)
keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { desc = 'Find files' })
keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', { desc = 'Find text' })
keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<cr>', { desc = 'Find buffers' })
keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', { desc = 'Find help' })
keymap.set('n', '<leader>fr', '<cmd>Telescope oldfiles<cr>', { desc = 'Find recent files' })
keymap.set('n', '<leader>fc', '<cmd>Telescope grep_string<cr>', { desc = 'Find string under cursor' })

-- Git operations
keymap.set('n', '<leader>gs', '<cmd>Git<cr>', { desc = 'Git status' })
keymap.set('n', '<leader>gc', '<cmd>Git commit<cr>', { desc = 'Git commit' })
keymap.set('n', '<leader>gp', '<cmd>Git push<cr>', { desc = 'Git push' })
keymap.set('n', '<leader>gl', '<cmd>Git log<cr>', { desc = 'Git log' })
keymap.set('n', '<leader>gd', '<cmd>Gvdiffsplit<cr>', { desc = 'Git diff' })
keymap.set('n', '<leader>gb', '<cmd>Git blame<cr>', { desc = 'Git blame' })

-- LSP (Language Server Protocol)
keymap.set('n', '<leader>lf', '<cmd>lua vim.lsp.buf.format()<cr>', { desc = 'Format code' })
keymap.set('n', '<leader>lr', '<cmd>lua vim.lsp.buf.rename()<cr>', { desc = 'Rename symbol' })
keymap.set('n', '<leader>la', '<cmd>lua vim.lsp.buf.code_action()<cr>', { desc = 'Code actions' })
keymap.set('n', '<leader>ld', '<cmd>lua vim.diagnostic.open_float()<cr>', { desc = 'Show diagnostics' })
keymap.set('n', '<leader>lD', '<cmd>Telescope diagnostics<cr>', { desc = 'Show all diagnostics' })

-- Search and replace
keymap.set('n', '<leader>sr', '<cmd>lua vim.lsp.buf.references()<cr>', { desc = 'Search references' })
keymap.set('n', '<leader>ss', '<cmd>nohl<cr>', { desc = 'Clear search highlight' })

-- File explorer (nvim-tree)
keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<cr>', { desc = 'Toggle file explorer' })
keymap.set('n', '<leader>pv', '<cmd>NvimTreeFindFile<cr>', { desc = 'Find file in explorer' })
keymap.set('n', '<leader>er', '<cmd>NvimTreeRefresh<cr>', { desc = 'Refresh file explorer' })
keymap.set('n', '<leader>ef', '<cmd>NvimTreeFocus<cr>', { desc = 'Focus file explorer' })

-- Utility
keymap.set('n', '<leader>nh', '<cmd>nohl<cr>', { desc = 'Clear search highlights' })
keymap.set('n', '<leader>+', '<C-a>', { desc = 'Increment number' })
keymap.set('n', '<leader>-', '<C-x>', { desc = 'Decrement number' })

-- Terminal
keymap.set('n', '<leader>tt', '<cmd>terminal<cr>', { desc = 'Open terminal' })
keymap.set('t', '<leader>tn', '<C-\\><C-n>', { desc = 'Terminal normal mode' })

-- Copy/paste with system clipboard
keymap.set('v', '<leader>y', '"+y', { desc = 'Copy to system clipboard' })
keymap.set('n', '<leader>Y', '"+Y', { desc = 'Copy line to system clipboard' })
keymap.set('n', '<leader>p', '"+p', { desc = 'Paste from system clipboard' })
keymap.set('n', '<leader>P', '"+P', { desc = 'Paste before from system clipboard' })

-- Text manipulation
keymap.set('v', '<leader>d', '"_d', { desc = 'Delete without yanking' })
keymap.set('n', '<leader>D', '"_D', { desc = 'Delete line without yanking' })

-- Quick fixes
keymap.set('n', '<leader>co', '<cmd>copen<cr>', { desc = 'Open quickfix' })
keymap.set('n', '<leader>cc', '<cmd>cclose<cr>', { desc = 'Close quickfix' })
keymap.set('n', '<leader>cn', '<cmd>cnext<cr>', { desc = 'Next quickfix item' })
keymap.set('n', '<leader>cp', '<cmd>cprev<cr>', { desc = 'Previous quickfix item' })
