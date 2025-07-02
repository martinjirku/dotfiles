local options = {
    number = true,
    relativenumber = true,
    tabstop = 4,
    shiftwidth = 4,
    expandtab = true,
    smartindent = true,
    -- Add more options as needed
}

for k, v in pairs(options) do
    vim.opt[k] = v
end
