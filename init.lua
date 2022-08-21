-- set neovim mapleader
vim.g.mapleader = " "

-- -- neovim basic configuration
require("config.core.settings")

-- neovim package manager
require("config.packer")

-- -- neovim keybindings
require("config.core.keymap")
