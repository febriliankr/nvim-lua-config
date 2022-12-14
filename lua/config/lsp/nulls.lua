local nulls = require("null-ls")

nulls.setup({
    sources = {
        -- formatter
        -- lua
        nulls.builtins.formatting.stylua,
        -- css, html, js, json and other stuff (lol)
        nulls.builtins.formatting.prettierd.with({
            generator_opts = {
                command = "prettierd",
                args = { "$FILENAME" },
                to_stdin = true,
            },
        }),
        -- golang
        nulls.builtins.formatting.goimports,
    },
})

local function format()
    vim.lsp.buf.format({ async = true })
end
-- keymap
vim.keymap.set("n", "<leader>f", format, { desc = "LSP: Formats the current buffer" })
vim.keymap.set("n", "<leader>f", format, { desc = "LSP: Formats the current buffer" })
vim.keymap.set("v", "<leader>f", vim.lsp.buf.range_formatting, { desc = "LSP: Formats a given range" })
