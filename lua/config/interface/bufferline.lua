local mappings = require("cokeline.mappings")
local color = require("config.interface.color.tokyonight")

local C = {}

C.file_manager = {
	text = "File Browser",
	fg = color.blue,
	style = "bold",
}

C.space = {
	text = " ",
	truncation = { priority = 1 },
}

C.devicon = {
	text = function(buffer)
		return (mappings.is_picking_focus() or mappings.is_picking_close()) and buffer.pick_letter .. " "
			or buffer.devicon.icon
	end,
	fg = function(buffer)
		return buffer.is_focused and buffer.devicon.color
	end,
	truncation = { priority = 1 },
}

C.filename = {
	text = function(buffer)
		local name = buffer.unique_prefix .. buffer.filename
		if name == "[No Name]" then
			name = "empty"
		end
		return name
	end,
	fg = function(buffer)
		return (buffer.is_focused ~= true and color.gray)
			or (buffer.diagnostics.errors ~= 0 and color.error)
			or (buffer.diagnostics.warnings ~= 0 and color.warning)
			or (buffer.diagnostics.infos ~= 0 and color.info)
			or (buffer.diagnostics.hints ~= 0 and color.hint)
			or nil
	end,
	style = function(buffer)
		return ((buffer.is_focused and buffer.diagnostics.errors ~= 0) and "bold")
			or (buffer.is_focused and "bold")
			or (buffer.diagnostics.errors ~= 0 and "underline")
			or nil
	end,
	truncation = {
		priority = 2,
		direction = "left",
	},
}

C.close_or_unsaved = {
	text = function(buffer)
		return buffer.is_modified and "●" or ""
	end,
	fg = function(buffer)
		return (buffer.is_modified and color.green) or nil
	end,
	delete_buffer_on_left_click = true,
	truncation = { priority = 1 },
}

local M = {}
function M.config()
	require("cokeline").setup({
		show_if_buffers_are_at_least = 1,

		buffers = {
			filter_valid = false,
			filter_visible = false,
			focus_on_delete = false,
			new_buffers_position = "next",
		},

		mappings = {
			cycle_prev_next = true,
		},

		sidebar = {
			filetype = "neo-tree",
			components = {
				C.file_manager,
			},
		},
		default_hl = {
			fg = function(buffer)
				return buffer.is_focused ~= true and color.gray
			end,
			bg = color.bg_statusline,
		},

		components = {
			C.space,
			C.devicon,
			C.space,
			C.filename,
			C.space,
			C.close_or_unsaved,
			C.space,
		},
	})

	-- load keymap
	M.keymap()
end

function M.keymap()
	local keymap = vim.keymap
	keymap.set("n", "<A-h>", "<Plug>(cokeline-focus-prev)", { desc = "Buffer: focus to previous buffer" })
	keymap.set("n", "<A-l>", "<Plug>(cokeline-focus-next)", { desc = "Buffer: focus to next buffer" })
	keymap.set("n", "<A-H>", "<Plug>(cokeline-switch-prev)", { desc = "Buffer: switch to previous buffer" })
	keymap.set("n", "<A-L>", "<Plug>(cokeline-switch-next)", { desc = "Buffer: switch to next buffer" })
	keymap.set("n", "<Leader>q", "<CMD>bd<CR>", { desc = "Buffer: delete buffer" })
	keymap.set("n", "<Leader>qq", "<CMD>%bd<CR>", { silent = true, desc = "Buffer: delete all buffer" })
	keymap.set("n", "<Leader>qa", "<CMD>%bd!<CR>", { silent = true, desc = "Buffer: force delete all buffer" })
	keymap.set(
		"n",
		"<Leader>qo",
		"<CMD>%bd|e#<CR>",
		{ silent = true, desc = "Buffer: delete all buffer except this one" }
	)

	for i = 1, 9 do
		keymap.set(
			"n",
			("<A-%s>"):format(i),
			("<Plug>(cokeline-focus-%s)"):format(i),
			{ desc = ("Buffer: focus to buffer %s"):format(i) }
		)
	end
end

return setmetatable({}, {
	__call = function()
		return M.config()
	end,
})
