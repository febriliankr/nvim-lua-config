
null-ls: require("null-ls.health").check()
========================================================================
  - ERROR: stylua: the command "stylua" is not executable.
  - ERROR: prettierd: the command "prettierd" is not executable.
  - ERROR: goimports: the command "goimports" is not executable.

nvim: health#nvim#check
========================================================================
## Configuration
  - OK: no issues found

## Performance
  - OK: Build type: Release
    LuaJIT

## Remote Plugins
  - OK: Up to date

## terminal
  - INFO: key_backspace (kbs) terminfo entry: key_backspace=^H
  - INFO: key_dc (kdch1) terminfo entry: key_dc=\E[3~
  - INFO: $TERM_PROGRAM='tmux'
  - INFO: $COLORTERM='truecolor'

## tmux
  - OK: escape-time: 10
  - INFO: Checking stuff
  - WARNING: `focus-events` is not enabled. |'autoread'| may not work.
    - ADVICE:
      - (tmux 1.9+ only) Set `focus-events` in ~/.tmux.conf:
          set-option -g focus-events on
  - INFO: $TERM: screen-256color
  - WARNING: Neither Tc nor RGB capability set. True colors are disabled. |'termguicolors'| won't work properly.
    - ADVICE:
      - Put this in your ~/.tmux.conf and replace XXX by your $TERM outside of tmux:
          set-option -sa terminal-overrides ',XXX:RGB'
      - For older tmux versions use this instead:
          set-option -ga terminal-overrides ',XXX:Tc'

nvim-treesitter: require("nvim-treesitter.health").check()
========================================================================
## Installation
  - OK: `tree-sitter` found 0.20.6 (parser generator, only needed for :TSInstallFromGrammar)
  - OK: `node` found v16.16.0 (only needed for :TSInstallFromGrammar)
  - OK: `git` executable found.
  - OK: `cc` executable found. Selected from { vim.NIL, "cc", "gcc", "clang", "cl", "zig" }
    Version: Apple clang version 13.1.6 (clang-1316.0.21.2.5)
  - OK: Neovim was compiled with tree-sitter runtime ABI version 14 (required >=13). Parsers must be compatible with runtime ABI.

## Parser/Features H L F I J
  - go             ✓ ✓ ✓ ✓ ✓

  Legend: H[ighlight], L[ocals], F[olds], I[ndents], In[j]ections
         +) multiple parsers found, only one will be used
         x) errors found in the query, try to run :TSUpdate {lang}

provider: health#provider#check
========================================================================
## Clipboard (optional)
  - OK: Clipboard tool found: pbcopy

## Python 3 provider (optional)
  - INFO: pyenv: Path: /opt/homebrew/Cellar/pyenv/2.3.3/libexec/pyenv
  - INFO: pyenv: $PYENV_ROOT is not set. Infer from `pyenv root`.
  - INFO: pyenv: Root: /Users/febrilian/.pyenv
  - INFO: Using: g:python3_host_prog = "/usr/bin/python3"
  - INFO: Executable: /usr/bin/python3
  - ERROR: Command error (job=6, exit code 1): `'/usr/bin/python3' -c 'import sys; sys.path = list(filter(lambda x: x != "", sys.path)); import neovim; print(neovim.__file__)'` (in '/Users/febrilian/Documents/dev/risetku-v3')
    stderr: Traceback (most recent call last):  File "<string>", line 1, in <module>ModuleNotFoundError: No module named 'neovim'
  - INFO: Python version: 3.8.9
  - INFO: pynvim version: unable to load neovim Python module
  - ERROR: pynvim is not installed.
    Error: unable to load neovim Python module
    - ADVICE:
      - Run in shell: /usr/bin/python3 -m pip install pynvim

## Python virtualenv
  - OK: no $VIRTUAL_ENV

## Ruby provider (optional)
  - INFO: Ruby: ruby 2.6.8p205 (2021-07-07 revision 67951) [universal.arm64e-darwin21]
  - WARNING: `neovim-ruby-host` not found.
    - ADVICE:
      - Run `gem install neovim` to ensure the neovim RubyGem is installed.
      - Run `gem environment` to ensure the gem bin directory is in $PATH.
      - If you are using rvm/rbenv/chruby, try "rehashing".
      - See :help |g:ruby_host_prog| for non-standard gem installations.
      - You may disable this provider (and warning) by adding `let g:loaded_ruby_provider = 0` to your init.vim

## Node.js provider (optional)
  - INFO: Node.js: v16.16.0
  - WARNING: Missing "neovim" npm (or yarn) package.
    - ADVICE:
      - Run in shell: npm install -g neovim
      - Run in shell (if you use yarn): yarn global add neovim
      - You may disable this provider (and warning) by adding `let g:loaded_node_provider = 0` to your init.vim

## Perl provider (optional)
  - WARNING: "Neovim::Ext" cpan module is not installed
    - ADVICE:
      - See :help |provider-perl| for more information.
      - You may disable this provider (and warning) by adding `let g:loaded_perl_provider = 0` to your init.vim

telescope: require("telescope.health").check()
========================================================================
## Checking for required plugins
  - OK: plenary installed.
  - OK: nvim-treesitter installed.

## Checking external dependencies
  - OK: rg: found ripgrep 13.0.0
  - WARNING: fd: not found. Install [sharkdp/fd](https://github.com/sharkdp/fd) for extended capabilities

## ===== Installed extensions =====

## Telescope Extension: `ui-select`
  - INFO: No healthcheck provided

vim.lsp: require("vim.lsp.health").check()
========================================================================
  - INFO: LSP log level : WARN
  - INFO: Log path: /Users/febrilian/.cache/nvim/lsp.log
  - INFO: Log size: 644 KB

vim.treesitter: require("vim.treesitter.health").check()
========================================================================
  - INFO: Runtime ABI version : 14
  - OK: Loaded parser for go: ABI version 13

