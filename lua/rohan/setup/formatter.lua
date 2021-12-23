-- https://github.com/mhartington/formatter.nvim
local function elm_format()
    return {exe = "~/.asdf/shims/elm-format", args = {'--stdin'}, stdin = true}
end

local function prettier()
    local exe = vim.fn.filereadable("node_modules/.bin/prettier") == 1 and
                    "node_modules/.bin/prettier" or "~/.asdf/shims/prettier"
    return {
        exe = exe,
        args = {
            "--stdin-filepath", vim.api.nvim_buf_get_name(0), '--single-quote'
        },
        stdin = true
    }
end

local function lua_format()
    return {exe = "~/.asdf/shims/lua-format", stdin = true}
end

local function black() return {exe = "~/.asdf/shims/black", stdin = false} end

local function rustfmt() return {exe = "~/.asdf/shims/rustfmt", stdin = false} end

--
require('formatter').setup({
    logging = true,
    filetype = {
        elm = {elm_format},

        javascript = {prettier},
        typescript = {prettier},
        json = {prettier},
        html = {prettier},

        lua = {lua_format},

        -- python = {black},

        rust = {rustfmt}
    }
})

-- TODO: Is there a better way than this??
vim.api.nvim_exec([[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *  undojoin | FormatWrite
augroup END
]], true)
