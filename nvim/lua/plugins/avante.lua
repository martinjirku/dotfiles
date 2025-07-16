-- print("Status:", response.status)
-- print("Body:", response.body)
return {
  "yetone/avante.nvim",
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  -- ⚠️ must add this setting! ! !
  build = function()
    -- conditionally use the correct build system for the current OS
    if vim.fn.has("win32") == 1 then
      return "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
    else
      return "make"
    end
  end,
  event = "VeryLazy",
  version = false, -- Never set this value to "*"! Never!
  ---@module 'avante'
  ---@type function|avante.Config
  opts = function()
    local provider = "claude"
    if vim.env.OPENAI_API_KEY and vim.env.OPENAI_API_KEY ~= "" then
      provider = "openai"
    end

    -- Common configuration shared between providers
    local common_config = {
      behaviour = {
        auto_suggestions = true, -- Enable inline suggestions
        auto_set_keymaps = true, -- Automatically set keymaps
        auto_set_highlight_group = true, -- Enable highlighting
      },
      suggestion = {
        debounce = 400, -- Delay before showing suggestions (ms) - reduced for faster response
        throttle = 400, -- Throttle suggestion requests (ms) - reduced for faster response
      },
      mappings = {
        suggestion = {
          accept = "<M-l>", -- Alt+L to accept suggestion
          next = "<M-]>", -- Alt+] for next suggestion
          prev = "<M-[>", -- Alt+[ for previous suggestion
          dismiss = "<C-]>", -- Ctrl+] to dismiss suggestion
        },
      },
    }

    if provider == "claude" then
      return vim.tbl_deep_extend("force", common_config, {
        provider = "claude",
        auto_suggestions_provider = "claude", -- Enable auto suggestions with Claude
        providers = {
          claude = {
            endpoint = "https://api.anthropic.com",
            model = "claude-3-5-sonnet-20241022", -- Updated to recommended model
            timeout = 30000, -- Timeout in milliseconds
            extra_request_body = {
              temperature = 0.75,
              max_tokens = 4096, -- Reduced for faster response in suggestions
            },
          },
        },
      })
    end

    if provider == "openai" then
      return vim.tbl_deep_extend("force", common_config, {
        provider = "openwebui",
        auto_suggestions_provider = "openwebui", -- Enable auto suggestions with OpenAI
        providers = {
          openwebui = {
            __inherited_from = "openai",
            endpoint = "https://open-webui.prod.cit.bvnt.co/api",
            model = "claude-sonnet-4",
            api_key_name = "OPENAI_API_KEY",
            -- api_key = vim.env.OPENAI_API_KEY,
            extra_request_body = {
              temperature = 0.75,
              max_tokens = 4096,
            },
          },
        },
      })
    end
  end,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
    "echasnovski/mini.pick", -- for file_selector provider mini.pick
    "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
    "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
    "ibhagwan/fzf-lua", -- for file_selector provider fzf
    "stevearc/dressing.nvim", -- for input provider dressing
    "folke/snacks.nvim", -- for input provider snacks
    "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
    "zbirenbaum/copilot.lua", -- for providers='copilot'
    {
      -- support for image pasting
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- required for Windows users
          use_absolute_path = true,
        },
      },
    },
    {
      -- Make sure to set this up properly if you have lazy=true
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
}
