local M = {}

-- function CheckBackspace()
-- 	local col = vim.fn.col(".") - 1
-- 	if col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
-- 		return true
-- 	else
-- 		return false
-- 	end
-- end

local function ShowDocumentation()
	if vim.fn.index({ "vim", "help" }, vim.bo.filetype) >= 0 then
		vim.cmd("h " .. vim.fn.expand("<cword>"))
	else
		vim.cmd('call CocAction("doHover")')
	end
end

function M.config()
	-- load keymap
	M.keymap()
end
function M.keymap()
	local keymap = vim.keymap

	vim.cmd([[ 
        function! CheckBackspace() abort
          let col = col('.') - 1
          return !col || getline('.')[col - 1]  =~# '\s'
        endfunction
		inoremap <silent><expr> <Tab> coc#pum#visible() ? coc#pum#next(1) :  CheckBackspace() ? "\<Tab>" : coc#refresh()
		inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"
		inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
	]])

	-- refresh completion menu
	keymap.set(
		"i",
		"<C-space>",
		vim.fn["coc#refresh"](),
		{ silent = true, remap = true, desc = "CoC: Refresh Completion" }
	)

	-- prev diagnostic
	keymap.set("n", "[g", "<Plug>(coc-diagnostic-prev)", { silent = true, remap = true, desc = "CoC: Next Diagnostic" })

	-- next diagnostic
	keymap.set("n", "]g", "<Plug>(coc-diagnostic-next)", { silent = true, remap = true, desc = "CoC: Next Diagnostic" })

	-- GoTo code navigation.
	keymap.set(
		"n",
		"gd",
		"<Plug>(coc-definition)",
		{ silent = true, remap = true, desc = "CoC: Goto Code Navigation." }
	)

	-- goto type definition
	keymap.set(
		"n",
		"gy",
		"<Plug>(coc-type-definition)",
		{ silent = true, remap = true, desc = "CoC: Goto Type Definition" }
	)

	-- goto implementation
	keymap.set(
		"n",
		"gi",
		"<Plug>(coc-implementation)",
		{ silent = true, remap = true, desc = "CoC: Goto Implementation" }
	)

	-- goto references
	keymap.set("n", "gr", "<Plug>(coc-references)", { silent = true, remap = false, desc = "CoC: Goto References" })

	-- nnoremap <silent> K :call ShowDocumentation()<CR>
	keymap.set("n", "K", ShowDocumentation, { silent = true, remap = false, desc = "CoC: Show Documentation" })

	-- Symbol renaming.
	keymap.set("n", "<leader>rn", "<Plug>(coc-rename)", { silent = true, remap = true, desc = "CoC: Symbol renaming." })

	-- Formatting selected code.
	keymap.set(
		"x",
		"<leader>f",
		"<Plug>(coc-format-selected)",
		{ silent = true, remap = true, desc = "CoC: Formatting selected code." }
	)
	keymap.set(
		"n",
		"<leader>f",
		"<Plug>(coc-format-selected)",
		{ silent = true, remap = true, desc = "CoC: Formatting selected code." }
	)

	-- Remap keys for applying codeAction to the current buffer.
	keymap.set(
		"n",
		"<leader>ac",
		"<Plug>(coc-codeaction)",
		{ silent = true, remap = true, desc = "CoC: Remap keys for applying codeAction to the current buffer." }
	)

	-- Apply AutoFix to problem on the current line.
	keymap.set(
		"n",
		"<leader>qf",
		"<Plug>(coc-fix-current)",
		{ silent = true, remap = true, desc = "CoC: Apply AutoFix to problem on the current line." }
	)

	-- Run the Code Lens action on the current line.
	keymap.set(
		"n",
		"<leader>cl",
		"<Plug>(coc-codelens-action)",
		{ silent = true, remap = true, desc = "CoC: Run the Code Lens action on the current line." }
	)

	-- Mappings for CoCList
	-- Show all diagnostics.
	keymap.set(
		"n",
		"<leader>a",
		"<CMD>CocList diagnostics<CR>",
		{ silent = true, remap = false, desc = "CoC: Show all diagnostics." }
	)

	-- Manage extensions.
	keymap.set(
		"n",
		"<leader>e",
		"<CMD>CocList extensions<CR>",
		{ silent = true, remap = false, desc = "CoC: Manage extensions" }
	)

	-- Show commands.
	keymap.set(
		"n",
		"<leader>c",
		"<CMD>CocList commands<CR>",
		{ silent = true, remap = false, desc = "CoC: Show Commands" }
	)

	-- Find symbol of current document.
	keymap.set(
		"n",
		"<leader>o",
		"<CMD>CocList outline<CR>",
		{ silent = true, remap = false, desc = "CoC: Find symbol of current document." }
	)

	-- Search workspace symbols.
	keymap.set(
		"n",
		"<leader>s",
		"<CMD>CocList -I symbols<CR>",
		{ silent = true, remap = false, desc = "CoC: Search workspace symbols." }
	)

	-- Do default action for next item.
	keymap.set(
		"n",
		"<leader>j",
		"<CMD>CocNext<CR>",
		{ silent = true, remap = false, desc = "CoC: Do default action for next item." }
	)

	-- Do default action for previous item.
	keymap.set(
		"n",
		"<leader>k",
		"<CMD>CocPrev<CR>",
		{ silent = true, remap = false, desc = "CoC: Do default action for previous item." }
	)

	-- Resume latest coc list.
	keymap.set(
		"n",
		"<leader>p",
		"<CMD>CocListResume<CR>",
		{ silent = true, remap = false, desc = "CoC: Resume latest coc list." }
	)
end

return setmetatable({}, {
	__call = function()
		return M.config()
	end,
})
