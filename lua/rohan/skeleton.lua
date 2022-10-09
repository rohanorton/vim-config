local function first_line_is_empty()
	return vim.fn.empty(vim.fn.getline(1))
end

local function has_only_one_line()
	return vim.fn.line("$") == 1
end

local function file_is_empty()
	return first_line_is_empty() and has_only_one_line()
end

local function insert_from_snippet(snippet_name)
	SAFE_REQUIRE({ "luasnip" }, function(ls)
		if file_is_empty() then
			-- Use default snippet name if none provided.
			snippet_name = snippet_name or "__skel"

			-- Insert snippet text.
			-- NOTE: Whitespace required at end of snippet, otherwise it doesn't expand
			vim.api.nvim_set_current_line(snippet_name .. " ")

			-- Go to end of snippet.
			vim.api.nvim_win_set_cursor(0, { 1, string.len(snippet_name) })

			-- Expand
			ls.expand()
		end
	end)
end

return {
	insert_from_snippet = insert_from_snippet,
}
