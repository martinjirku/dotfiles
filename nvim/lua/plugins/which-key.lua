return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 800 -- Increase timeout to give more time to see hints
  end,
  config = function()
    local wk = require("which-key")
    wk.setup({
      preset = "modern",
      plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        spelling = {
          enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
          suggestions = 20, -- how many suggestions should be shown in the list?
        },
        presets = {
          operators = true, -- adds help for operators like d, y, ...
          motions = true, -- adds help for motions
          text_objects = true, -- help for text objects triggered after entering an operator
          windows = true, -- default bindings on <c-w>
          nav = true, -- misc bindings to work with windows
          z = true, -- bindings for folds, spelling and others prefixed with z
          g = true, -- bindings for prefixed with g
        },
      },
      win = {
        border = "rounded", -- none, single, double, shadow
        position = "bottom", -- bottom, top
        margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
        padding = { 1, 2, 1, 2 }, -- extra window padding [top, right, bottom, left]
        winblend = 0,
        wo = {
          winblend = 0,
        },
      },
      layout = {
        height = { min = 4, max = 25 }, -- min and max height of the columns
        width = { min = 20, max = 50 }, -- min and max width of the columns
        spacing = 3, -- spacing between columns
        align = "left", -- align columns left, center or right
      },
      keys = {
        scroll_down = "<c-d>", -- binding to scroll down inside the popup
        scroll_up = "<c-u>", -- binding to scroll up inside the popup
      },
      show_help = true, -- show a help message in the command line for using WhichKey
      show_keys = true, -- show the currently pressed key and its label as a message in the command line
      triggers = {
        { "<auto>", mode = "nxsot" },
      },
    })

    -- Document existing key chains using new v3 syntax
    wk.add({
      -- Leader key groups
      { "<leader>f", group = "󰈞 File/Find" },
      { "<leader>g", group = "󰊢 Git" },
      { "<leader>l", group = "󰅪 LSP" },
      { "<leader>s", group = "󰍉 Search" },
      { "<leader>t", group = "󰓩 Tab/Terminal" },
      { "<leader>b", group = "󰈚 Buffer" },
      { "<leader>c", group = "󰨖 Code/Quickfix" },
      { "<leader>e", group = "󰙅 Explorer" },
      
      -- Control key groups
      { "<C-w>", group = "󰖲 Window" },
      
      -- File operations
      { "<leader>w", desc = "󰆓 Save file" },
      { "<leader>q", desc = "󰗼 Quit" },
      { "<leader>Q", desc = "󰗼 Force quit" },
      { "<leader>x", desc = "󰆓 Save and quit" },
      
      -- File/Find group
      { "<leader>ff", desc = "󰈞 Find files" },
      { "<leader>fg", desc = "󰊄 Find text" },
      { "<leader>fb", desc = "󰈚 Find buffers" },
      { "<leader>fr", desc = "󰋚 Recent files" },
      { "<leader>fh", desc = "󰋚 Find help" },
      { "<leader>fc", desc = "󰊄 Find string under cursor" },
      
      -- Explorer group
      { "<leader>e", desc = "󰙅 Toggle explorer" },
      { "<leader>ef", desc = "󰙅 Focus explorer" },
      { "<leader>er", desc = "󰑓 Refresh explorer" },
      
      -- Buffer group
      { "<leader>bd", desc = "󰈚 Delete buffer" },
      { "<leader>bn", desc = "󰈚 Next buffer" },
      { "<leader>bp", desc = "󰈚 Previous buffer" },
      { "<leader>ba", desc = "󰈚 Delete all except current" },
      
      -- Window management
      { "<leader>sv", desc = "󰖲 Split vertically" },
      { "<leader>sh", desc = "󰖲 Split horizontally" },
      { "<leader>se", desc = "󰖲 Make splits equal" },
      { "<leader>sx", desc = "󰖲 Close split" },
      
      -- Window navigation
      { "<C-h>", desc = "󰁍 Go left" },
      { "<C-j>", desc = "󰁅 Go down" },
      { "<C-k>", desc = "󰁝 Go up" },
      { "<C-l>", desc = "󰁔 Go right" },
      
      -- Tab management
      { "<leader>to", desc = "󰓩 Open new tab" },
      { "<leader>tx", desc = "󰓩 Close tab" },
      { "<leader>tn", desc = "󰓩 Next tab" },
      { "<leader>tp", desc = "󰓩 Previous tab" },
      { "<leader>tt", desc = "󰓩 Open terminal" },
      
      -- Git operations
      { "<leader>gs", desc = "󰊢 Git status" },
      { "<leader>gc", desc = "󰊢 Git commit" },
      { "<leader>gp", desc = "󰊢 Git push" },
      { "<leader>gl", desc = "󰊢 Git log" },
      { "<leader>gd", desc = "󰊢 Git diff" },
      { "<leader>gb", desc = "󰊢 Git blame" },
      
      -- Search operations
      { "<leader>sr", desc = "󰍉 Search references" },
      { "<leader>ss", desc = "󰍉 Clear search highlight" },
      { "<leader>nh", desc = "󰍉 Clear highlights" },
      
      -- Utility
      { "<leader>+", desc = "󰐕 Increment number" },
      { "<leader>-", desc = "󰍴 Decrement number" },
    })
  end,
}
