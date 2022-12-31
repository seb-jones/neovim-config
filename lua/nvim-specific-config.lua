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
