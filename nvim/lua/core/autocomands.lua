local autocmd = vim.api.nvim_create_autocmd

-- Example autocmds
autocmd('BufEnter', {
    pattern = '*.lua',
    callback = function()
        print('Editing a Lua file')
    end,
})

-- Add more autocmds as needed