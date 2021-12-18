-- https://github.com/mhartington/formatter.nvim
require('formatter').setup({
    logging = true,
    filetype = {
        elm = {
            -- elm-format
            function()
                return {
                    exe = "~/.asdf/shims/elm-format",
                    args = {'--stdin'},
                    stdin = true
                }
            end
        },
        javascript = {
            -- prettier
            function()
                return {
                    -- Using local installation of prettier... Perhaps we could
                    -- be smart about this and fallback to a global prettier??
                    exe = "node_modules/.bin/prettier",
                    args = {
                        "--stdin-filepath", vim.api.nvim_buf_get_name(0),
                        '--single-quote'
                    },
                    stdin = true
                }
            end
        },

        lua = {
            -- lua-format
            function()
                return {exe = "~/.asdf/shims/lua-format", stdin = true}
            end
        },

        python = {
            -- black
            function()
                return {exe = "~/.asdf/shims/black", stdin = false}
            end
        }
    }
})

-- TODO: Is there a better way than this??
vim.api.nvim_exec([[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.js,*.rs,*.lua FormatWrite
augroup END
]], true)
