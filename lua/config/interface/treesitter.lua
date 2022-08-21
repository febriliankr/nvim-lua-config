local M = {}

function M.config()
	local options = {
		ensure_installed = {
			"go",
			"dart",
			"html",
			"javascript",
			"typescript",
			"tsx",
			"css",
			"json",
			"svelte",
		},
		highlight = {
			enable = true,
			use_languagetree = true,
		},
		indent = {
			enable = true,
		},
		-- p00f/nvim-ts-rainbow
		rainbow = {
			enable = true,
		},
		-- windwp/nvim-autopairs
		autopairs = {
			enable = true,
		},
	}
end

return setmetatable({}, {
	__call = function()
		return M.config()
	end,
})
