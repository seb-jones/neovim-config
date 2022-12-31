-- Hop plugin

hop = require "hop"

hop.setup {
    uppercase_labels = true,
    multi_windows = false,
    teasing = false,
}

vim.keymap.set(
    "",
    "<space>",
    function() hop.hint_patterns({}, [=[\w\+[[:punct:]]*\|[[:punct:]]\+\w*]=]) end
)

-- Autopairs plugin

require "nvim-autopairs".setup()

-- Diff View Command

require "diffview".setup({ use_icons = false })

vim.api.nvim_create_user_command(
    "Gd",
    "DiffviewOpen",
    { desc = "Open the Git Diff view" }
)

-- Treesitter
require'nvim-treesitter.configs'.setup {

    -- A list of parser names, or "all"
    ensure_installed = {
        "bash",
        "css",
        "diff",
        "dockerfile",
        "gitcommit",
        "gitignore",
        "glsl",
        "graphql",
        "html",
        "javascript",
        "jq",
        "json",
        "lua",
        "php",
        "sql",
        "twig",
        "vim",
        "vue",
        "yaml",
    },

    auto_install = false,

    highlight = { enable = true },

    indent = { enable = true },
}
