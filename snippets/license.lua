local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node

local fmt = require("luasnip.extras.fmt").fmt

local snippets = {}
local autosnippets = {}

local get_current_year = function()
  local now = vim.fn.localtime()
  local current_year = vim.fn.strftime("%Y", now)
  return current_year
end

local mit = s(
  "mit",
  fmt(
    [[MIT License

Copyright (c) {} {}

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
]],
    { i(1, get_current_year()), i(2, "Rohan Orton") }
  )
)

table.insert(snippets, mit)

return snippets, autosnippets
