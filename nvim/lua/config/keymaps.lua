-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- Map jj to escape insert mode
vim.keymap.set("i", "jj", "<Esc>", { desc = "Exit insert mode with jj" })
