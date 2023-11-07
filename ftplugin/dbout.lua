-- Turn off folding
vim.opt.foldenable = false

SAFE_REQUIRE({
  "which-key",
}, function(wk)
  local function marker_list(value)
    local self = {}
    local max_it = 10000 -- max iterations, just in case!
    local line = vim.api.nvim_get_current_line()
    local found = 1
    local indexes = {}
    local it = 0
    repeat
      it = it + 1
      table.insert(indexes, found - 1)
      found = string.find(line, value, found + 1, true)
    until found == nil or it > max_it
    table.insert(indexes, string.len(line))

    function self.get_next(cursor)
      local col = cursor[2]
      for _, val in ipairs(indexes) do
        if val > col then
          return val
        end
      end
    end

    function self.get_prev(cursor)
      local col = cursor[2]
      for i, val in ipairs(indexes) do
        if val >= col then
          return i > 1 and indexes[i - 1] or 0
        end
      end
    end

    return self
  end

  local marker = "|"

  wk.register({
    ["vv"] = {
      function()
        local cursor = vim.api.nvim_win_get_cursor(0)
        local ls = marker_list(marker)
        local start = ls.get_prev(cursor)
        local stop = ls.get_next(cursor)
        print(start .. " - " .. stop)
        vim.api.nvim_win_set_cursor(0, { cursor[1], start + 2 })
        vim.cmd("normal! v")
        vim.api.nvim_win_set_cursor(0, { cursor[1], stop - 2 })
      end,
      "Select table cell",
    },
    ["<c-l>"] = {
      function()
        local cursor = vim.api.nvim_win_get_cursor(0)
        local ls = marker_list(marker)
        local next = ls.get_next(cursor)
        vim.api.nvim_win_set_cursor(0, { cursor[1], next })
      end,
      "Jump forward to next table pipe",
    },
    ["<c-h>"] = {
      function()
        local cursor = vim.api.nvim_win_get_cursor(0)
        local ls = marker_list(marker)
        local prev = ls.get_prev(cursor)
        vim.api.nvim_win_set_cursor(0, { cursor[1], prev })
      end,
      "Jump back to next table pipe",
    },
  }, {
    mode = "n",
    buffer = 0,
    noremap = true,
    silent = true,
  })
end)
