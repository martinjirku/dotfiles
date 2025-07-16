return {
  "stevearc/conform.nvim",
  opts = function(_, opts)
    -- Extend formatters_by_ft
    opts.formatters_by_ft = opts.formatters_by_ft or {}
    opts.formatters_by_ft.javascript = { "prettier" }
    opts.formatters_by_ft.typescript = { "prettier" }
    opts.formatters_by_ft.javascriptreact = { "prettier" }
    opts.formatters_by_ft.typescriptreact = { "prettier" }
    opts.formatters_by_ft.json = { "prettier" }
    opts.formatters_by_ft.html = { "prettier" }
    opts.formatters_by_ft.css = { "prettier" }
    opts.formatters_by_ft.scss = { "prettier" }
    opts.formatters_by_ft.markdown = { "prettier" }
    opts.formatters_by_ft.yaml = { "prettier" }

    -- Enable format on save
    opts.format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    }
  end,
}
