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
	if file_is_empty() then
		snippet_name = snippet_name or "__skel"
		local insert = "i"
		local tab = KEYCODES.TAB
		vim.api.nvim_feedkeys(insert .. snippet_name .. tab, "m", true)
	end
end

return {
	insert_from_snippet = insert_from_snippet,
}
