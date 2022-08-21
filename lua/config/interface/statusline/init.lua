local color =require("config.interface.color.tokyonight")
local lsp = require("config.interface.statusline.components.lsp")
local buffer = require("config.interface.statusline.components.buffer")
local git = require("config.interface.statusline.components.git")

local blank = {
	provider = "",
	hl = {
		bg = "bg",
		fg = "fg",
	},
}

local vimode = {
	provider = function()
		return string.format("  %s ", require("feline.providers.vi_mode").get_vim_mode())
	end,
	hl = {
		bg = "blue",
		fg = "black",
		style = "bold",
	},
}

local M = {}
function M.config()
	local feline = require("feline")
	local active = {
		-- left
		{
			vimode,
			git.branch,
			git.diff_add,
			git.diff_changed,
			git.diff_remove,
			buffer.name,
			blank,
		},
		-- right
		{
			lsp.diagnostic.errors,
			lsp.diagnostic.warn,
			lsp.diagnostic.info,
			lsp.diagnostic.hint,
			lsp.name,
			buffer.type,
			buffer.format,
			buffer.encode,
			buffer.cursor_position,
		},
	}

	feline.setup({
		components = {
			active = active,
			inactive = active,
		},
		force_inactive = {
			filetypes = {
				"NvimTree",
			},
			buftypes = { "terminal" },
			bufnames = {},
		},
	})

	feline.use_theme({
		bg = color.bg_statusline,
		fg = color.fg,
		fg_dark = color.fg_dark,
		blue0 = color.blue0,
		blue = color.blue,
		black = color.black,
		error = color.error,
		warning = color.warning,
		info = color.info,
		hint = color.hint,
	})
end

return setmetatable({}, {
	__call = function()
		return M.config()
	end,
})
