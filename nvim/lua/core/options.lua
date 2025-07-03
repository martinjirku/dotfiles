local options = {
    -- Line numbers
    number = true,
    relativenumber = true,
    
    -- Indentation
    tabstop = 4,
    shiftwidth = 4,
    expandtab = true,
    smartindent = true,
    autoindent = true,
    
    -- Clipboard sync with system clipboard
    clipboard = "unnamedplus",
    
    -- Search settings
    ignorecase = true,
    smartcase = true,
    hlsearch = true,
    incsearch = true,
    
    -- UI settings
    termguicolors = true,
    signcolumn = "yes",
    wrap = false,
    scrolloff = 8,
    sidescrolloff = 8,
    
    -- File settings
    backup = false,
    writebackup = false,
    swapfile = false,
    undofile = true,
    
    -- Completion settings
    completeopt = { "menuone", "noselect" },
    
    -- Window settings
    splitbelow = true,
    splitright = true,
}

for k, v in pairs(options) do
    vim.opt[k] = v
end
