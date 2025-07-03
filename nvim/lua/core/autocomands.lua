local autocmd = vim.api.nvim_create_autocmd

-- Ensure line numbers are shown in all buffers
autocmd({'BufEnter', 'BufWinEnter', 'WinEnter'}, {
    pattern = '*',
    callback = function()
        -- Skip special buffer types
        local buftype = vim.bo.buftype
        local filetype = vim.bo.filetype
        
        -- Don't set line numbers for special buffers
        if buftype == '' and filetype ~= 'NvimTree' and filetype ~= 'help' then
            vim.opt_local.number = true
            vim.opt_local.relativenumber = true
        end
    end,
})

-- Auto-resize splits when window is resized
autocmd('VimResized', {
    pattern = '*',
    callback = function()
        vim.cmd('tabdo wincmd =')
    end,
})

-- Highlight yanked text briefly
autocmd('TextYankPost', {
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({ higroup = 'Visual', timeout = 200 })
    end,
})