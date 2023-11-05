-- Auto Dark Mode

-- local auto_dark_mode = require "auto-dark-mode"

-- auto_dark_mode.setup({
-- 	update_interval = 1000,
-- 	set_dark_mode = function()
-- 		vim.api.nvim_set_option('background', 'dark')
-- 	end,
-- 	set_light_mode = function()
-- 		vim.api.nvim_set_option('background', 'light')
-- 	end,
-- })

-- auto_dark_mode.init()

-- Hop

hop = require "hop"

hop.setup {
    uppercase_labels = true,
    multi_windows = false,
    teasing = false,
}

vim.keymap.set(
    "",
    "<Space>",
    function() hop.hint_patterns({}, [=[\w\+[[:punct:]]*\|[[:punct:]]\+\w*]=]) end
)

-- Autopairs

require "nvim-autopairs".setup()

-- Diff View

require "diffview".setup({ use_icons = false })

vim.api.nvim_create_user_command(
    "Gd",
    "DiffviewOpen",
    { desc = "Open the Git Diff view" }
)

-- Treesitter

require "nvim-treesitter.configs".setup {
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

-- Indent Blankline

require "ibl".setup()

-- LuaSnip

-- honza/vim-snippets stores global snippets in _.snippets, so this tells LuaSnip to
-- look there for global snippets.
require "luasnip".filetype_extend("all", { "_" })

-- Lazy-load from honza/vim-snippets snippetsk
require("luasnip.loaders.from_snipmate").lazy_load()

-- Lazy-load our own lua snippets
-- require "luasnip.loaders.from_lua".lazy_load({ paths = "~/.config/nvim/snippets" })
