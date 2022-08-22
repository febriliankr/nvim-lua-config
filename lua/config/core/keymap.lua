local keymap = vim.keymap

-- disable keys
keymap.set("n", "<Left>", "<Nop>")
keymap.set("n", "<Right>", "<Nop>")
keymap.set("n", "<Up>", "<Nop>")
keymap.set("n", "<Down>", "<Nop>")
keymap.set("n", "<C-z>", "<Nop>")

-- resize window
keymap.set("n", "<C-Left>", "<CMD>vertical resize +5<CR>")
keymap.set("n", "<C-Up>", "<CMD>resize -5<CR>")
keymap.set("n", "<C-Right>", "<CMD>vertical resize -5<CR>")
keymap.set("n", "<C-Down>", "<CMD>resize +5<CR>")

-- disable the built-in CTRL+o | I'm replacing it with telescope keybindings
keymap.set("n", "<C-o>", "<Nop>")


-- comment
keymap.set("n", "++", "<plug>NERDCommenterToggle")
keymap.set("v", "++", "<plug>NERDCommenterToggle")