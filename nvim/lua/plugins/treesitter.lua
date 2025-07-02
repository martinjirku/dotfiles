return {
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        lazy = false,
        auto_install = ture,
        config = function ()
            local configs = require("nvim-treesitter.configs")
            configs.setup({
                ensure_installed = {
                    "lua", "javascript", "typescript",
                    "go", "gomod", "gosum", "gotmpl",
                    "graphql", "java", "javadoc", "yaml",
                    "typescript", 'markdown', "markdown_inline",
                    "html", "css", "bash", 
                },
                sync_install = false,
                highlight = { enable = true },
                indent = { enable = true },
            })
        end
    }
}
