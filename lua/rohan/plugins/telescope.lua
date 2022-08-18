local actions = require "telescope.actions"
local trouble = require('trouble.providers.telescope')

require("telescope").setup {
    defaults = {
        mappings = {
            i = {
                ["<esc>"] = actions.close,
                ["<c-t>"] = trouble.open_with_trouble
            },
            n = {["<c-t>"] = trouble.open_with_trouble}
        }
    }
}
