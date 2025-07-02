return {
  -- tokyonight
  {
    "folke/tokyonight.nvim",
    lazy = true,
    priority = 1000,
    config = function ()
        vim.cmd([[colorscheme tokyonight]])
    end,
    opts = { style = "moon" },
  }
}