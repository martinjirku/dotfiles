return {
  -- tokyonight (primary)
  {
    "folke/tokyonight.nvim",
    lazy = false, -- Load immediately
    priority = 1000,
    config = function ()
      -- Ensure termguicolors is enabled
      vim.opt.termguicolors = true
      
      require("tokyonight").setup({
        style = "night", -- The theme comes in four styles: storm, moon, night, day
        light_style = "day", -- The theme is used when the background is set to light
        transparent = false, -- Enable this to disable setting the background color
        terminal_colors = true, -- Configure the colors used when opening a :terminal
        styles = {
          comments = { italic = false }, -- Disable italic for better compatibility
          keywords = { italic = false },
          functions = {},
          variables = {},
          sidebars = "dark", -- style for sidebars, see below
          floats = "dark", -- style for floating windows
        },
        sidebars = { "qf", "help", "NvimTree" }, -- Set a darker background on sidebar-like windows
        day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style
        hide_inactive_statusline = false, -- Enabling this option will hide inactive statuslines
        dim_inactive = false, -- dims inactive windows
        lualine_bold = false, -- When true, section headers in the lualine theme will be bold
        
        -- Override specific highlight groups for better contrast
        on_highlights = function(hl, c)
          -- Much better contrast for line numbers
          hl.LineNr = { fg = c.cyan, bg = c.bg, bold = false } -- Bright cyan line numbers
          hl.CursorLineNr = { fg = c.orange, bg = c.bg_highlight, bold = true } -- Orange current line with background
          hl.SignColumn = { bg = c.bg } -- Consistent sign column background
          hl.FoldColumn = { fg = c.cyan, bg = c.bg } -- Consistent fold column
          
          -- Better window separators
          hl.WinSeparator = { fg = c.border_highlight, bg = c.bg } -- Clear window borders
          hl.VertSplit = { fg = c.border_highlight, bg = c.bg }
          
          -- Status line improvements
          hl.StatusLine = { fg = c.fg, bg = c.bg_statusline, bold = true }
          hl.StatusLineNC = { fg = c.fg_gutter, bg = c.bg_dark }
          
          -- Better visual selection
          hl.Visual = { bg = c.bg_visual, bold = true }
          hl.Search = { bg = c.yellow, fg = c.bg, bold = true }
          hl.IncSearch = { bg = c.orange, fg = c.bg, bold = true }
          
          -- Cleaner normal text
          hl.Normal = { fg = c.fg, bg = c.bg }
          hl.NormalFloat = { fg = c.fg, bg = c.bg_float }
          
          -- Better contrast for comments
          hl.Comment = { fg = c.blue0, italic = false } -- More visible comments
          
          -- Popup menu improvements
          hl.Pmenu = { fg = c.fg, bg = c.bg_popup }
          hl.PmenuSel = { fg = c.bg, bg = c.blue }
          hl.PmenuBorder = { fg = c.border_highlight, bg = c.bg_popup }
        end,
      })
      
      -- Clear any existing colorscheme
      vim.cmd([[hi clear]])
      if vim.fn.exists("syntax_on") then
        vim.cmd([[syntax reset]])
      end
      
      -- Set the colorscheme
      vim.cmd([[colorscheme tokyonight-night]])
    end,
  },

  -- GitHub theme (official)
  {
    "projekt0n/github-nvim-theme",
    lazy = true,
    priority = 1000,
    config = function()
      require('github-theme').setup({
        options = {
          compile_path = vim.fn.stdpath('cache') .. '/github-theme',
          compile_file_suffix = '_compiled',
          hide_end_of_buffer = true,
          hide_nc_statusline = true,
          transparent = false,
          terminal_colors = true,
          dim_inactive = false,
          module_default = true,
          styles = {
            comments = 'italic',
            functions = 'NONE',
            keywords = 'bold',
            variables = 'NONE',
            conditionals = 'NONE',
            constants = 'NONE',
            numbers = 'NONE',
            operators = 'NONE',
            strings = 'NONE',
            types = 'NONE',
          },
          inverse = {
            match_paren = false,
            visual = false,
            search = false,
          },
        },
        palettes = {},
        specs = {},
        groups = {},
      })
      -- Don't load it automatically, let user choose
    end,
  },

  -- Alternative: Catppuccin (backup colorscheme)
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = true,
    opts = {
      flavour = "mocha", -- latte, frappe, macchiato, mocha
      background = { -- :h background
        light = "latte",
        dark = "mocha",
      },
      transparent_background = false,
      show_end_of_buffer = false,
      term_colors = true,
      no_italic = true, -- Force no italic
      no_bold = false,
      integrations = {
        nvimtree = true,
        telescope = true,
        which_key = true,
      },
    },
  },
}