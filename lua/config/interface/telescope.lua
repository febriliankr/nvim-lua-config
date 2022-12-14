local M = {}

function M.config()
	local telescope = require("telescope")
	local previewers = require("telescope.previewers")

	local options = {
		defaults = {
			vimgrep_arguments = {
				"rg",
				"--color=never",
				"--no-heading",
				"--with-filename",
				"--line-number",
				"--column",
				"--smart-case",
			},
			results_title = "",
			prompt_prefix = "❱❱ ",
			selection_caret = "❱ ",
			initial_mode = "insert",
			selection_strategy = "reset",
			sorting_strategy = "descending",
			layout_strategy = "bottom_pane",
			layout_config = {
				height = 0.6,
				prompt_position = "bottom",
			},
			file_sorter = require("telescope.sorters").get_fuzzy_file,
			file_ignore_patterns = {},
			generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
			path_display = { "absolute" },
			winblend = 0,
			borderchars = {
				prompt = { "─", " ", " ", " ", "─", "─", " ", " " },
				results = { "─", " ", " ", " ", "─", "─", " ", " " },
				preview = { "─", " ", " ", "│", "┬", " ", " ", "│" },
			},
			color_devicons = true,
			use_less = false,
			-- file_previewer = previewers.vim_buffer_cat.new,
			-- grep_previewer = previewers.vim_buffer_vimgrep.new,
			-- qflist_previewer = previewers.vim_buffer_qflist.new,
		},
		pickers = {
			oldfiles = {
				file_ignore_patterns = { "/usr/share/nvim/runtime/*", vim.fn.stdpath("data") },
			},
			builtin = {
				previewer = false,
			},
			autocommands = {
				previewer = false,
			},
		},
		extensions = {
			["ui-select"] = {
				require("telescope.themes").get_cursor({}),
			},
		},
	}

	telescope.setup(options)
	telescope.load_extension("ui-select")

    -- load keymap
    M.keymap()
end

function M.keymap()
	local keymap = vim.keymap
	keymap.set(
		"n",
		"<Leader>0",
		require("telescope.builtin").oldfiles,
		{ desc = "Telescope: Lists previously open files" }
	)
	keymap.set(
		"n",
		"<C-o>",
		require("telescope.builtin").buffers,
		{ desc = "Telescope: Lists open buffers in current neovim instance" }
	)
	keymap.set("n", "<C-f>", require("telescope.builtin").live_grep, { desc = "Telescope: Live grep" })
	keymap.set("n", "<C-p>", require("telescope.builtin").find_files, { desc = "Telescope: Open files" })
	keymap.set("n", "<Leader>m", require("telescope.builtin").marks, { desc = "Telescope: Lists vim marks" })
	keymap.set(
		"n",
		"<Leader><Leader>",
		require("telescope.builtin").builtin,
		{ desc = "Telescope: Open builtin function" }
	)
	keymap.set(
		"n",
		"<Leader>k",
		require("telescope.builtin").keymaps,
		{ desc = "Telescope: Lists normal mode keymappings" }
	)
	keymap.set("n", "<Leader>c", require("telescope.builtin").commands, { desc = "Telescope: Lists vim autocommands" })
	keymap.set(
		"n",
		"<Leader>a",
		require("telescope.builtin").lsp_document_symbols,
		{ desc = "Telescope: Lists LSP document symbols in the current buffer" }
	)
	keymap.set("n", "<Leader>d", require("telescope.builtin").diagnostics, { desc = "Telescope: Lists diagnostics" })
end

return setmetatable({}, {
	__call = function()
		return M.config()
	end,
})
