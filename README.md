# Instalasi (MacOS & Linux)
1. Install packer.nvim  
`git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim`
2. Clone repository nvimrc  
`git clone url-reponya ~/.config/nvim`
3. Run command `:PackerSync`
4. Ketika ketemu masalah hubungi saya


# Keybindings

## Main
`lua/config/core/keymap.lua`
| Key          | deskripsi                                                |
| ------------ | -------------------------------------------------------- |
| CTRL + Left  | memperbesar ukuan window buffer ketika berdada di vsplit |
| CTRL + Right | memperkecil ukuan window buffer ketika berdada di vsplit |
| CTRL + Up    | memperkecil ukuan window buffer ketika berdada di split  |
| CTRL + Down  | memperbesar ukuan window buffer ketika berdada di split  |
| space        | map leader                                               |

## Buffer 
`lua/config/interface/bufferline.lua`
| Key        | deskripsi                 |
| ---------- | ------------------------- |
| A-h        | focus to previous buffer  |
| <A-l>      | focus to next buffer      |
| <A-H>      | switch to previous buffer |
| <A-L>      | switch to next buffer     |
| <Leader>q  | delete buffer             |
| <Leader>qq | delete all buffer         |
| <Leader>qa | force delete all buffer   |

## LSP
`lua/config/lsp/custom.lua`
| Key         | deskripsi                                                                             |
| ----------- | ------------------------------------------------------------------------------------- |
| Shift + k   | menampilkan dokumentasi dari suatu fungsi/method atau sejenisnya                      |
| gi          | Lists all the implementations for the symbol under the cursor in the quickfix window. |
| ga          | Lists any LSP actions for the word under the cursor which can be triggered            |
| gd          | Goto the definition of the word under the cursor                                      |
| ]e          | Goto next diagnostic                                                                  |
| [e          | Goto previous diagnostic                                                              |
| gr          | Renames all references to the symbol under the cursor.                                |
| gR          | Lists all the references to the symbol under the cursor in the quickfix window.       |
| leader + xx | Show diagnostic in trouble.nvim                                                       |
| leader + xd | Show diagnostic from current buffer in trouble.nvim                                   |
| leader + xw | Show diagnostic from current workspace in trouble.nvim                                |
| leader + xq | Show quickfix in trouble.nvim                                                         |
| leader + xl | Show items from the window's location list in trouble.nvim                            |
| leader + f  | format code                                                                           |

## Completion
`lua/config/completion/cmp.lua`
| Key          | deskripsi                                                  |
| ------------ | ---------------------------------------------------------- |
| Tab          | mirip dengan arrow down di vscode (ga tahu istilahnya apa) |
| Shift + Tab  | mirip dengan arrow up di vscode (ga tahu istilahnya apa)   |
| CTRL + space | menampilkan popup completion                               |
| CTRL + e     | menutup window popup completion                            |
| enter        | mirip dengan vscode                                        |

## snippet (luasnip)
`lua/config/completion/snippet/init.lua`
| Key         | deskripsi                                 |
| ----------- | ----------------------------------------- |
| ALT + space | menampilkan popup select choice           |
| ALT + ]     | next item dari choice nodenya luasnip     |
| ALT + [     | previous item dari choice nodenya luasnip |


## Go.nvim
`lua/config/languages/go.lua`
| Key | deskripsi                      |
| --- | ------------------------------ |
| gtj | menambahkan tag json ke struct |
| gtd | menambahkan tag db ke struct   |
| gtc | membersihkan tag di struct     |
| gi  | go to implementation           |


## Telescope
| Key             | deskripsi                                     |
| --------------- | --------------------------------------------- |
| leader + 0      | history file yang pernah dibuka               |
| ctrl + o        | daftar buffer                                 |
| ctrl + p        | list all file                                 |
| leader + m      | daftar vim mark                               |
| leader + leader | membuka builtin functionnya telescope         |
| leader + k      | menampilkan seluruh keymap yang ada           |
| leader + c      | menampilkan seluruh autocommand yang ada      |
| leader + a      | menampilkan dokumen symbol yang ada di buffer |
| leader + d      | menampilkan diagnostic yang ada di buffer     |


# Menambahkan LSP kedalam nvim-lspclient
untuk menambahkan konfigurasi lsp client silahkan ubah di config
`lua/config/lsp/langserver.lua`
untuk saat ini baru beberapa lsp saja yang dipasang

## Daftar Lsp Yang sudah terkonfigurasi
 - Typescript language server
 - Gopls
 - Vscode json language server
 - Vscode css language server
 - Emmet language server
 - Docker language server
 - Vim language server
 - Tsumaneko lua
 - Yaml language server


# Install LSP 
untuk install lsp cukup mudah tinggal ketik `:Mason` kemudian pilih lsp yang mau diinstall
> Note: terkadang lsp yang diiinstal menggunakan mason agak bermasalah khususnya lsp yang dibangun menggunakan nodejs (berdasarkan pengalaman pribadi)


# Info
Ketika ketemu masalah dengan configurasi ini silahkan hubungi saya 
