local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require("null-ls")

local b = null_ls.builtins

local opts = {
  sources = {
    b.formatting.prettierd,
    b.formatting.stylua,

    -- nix
    b.code_actions.statix,
    b.formatting.alejandra,
    b.diagnostics.deadnix,

    -- go
    b.code_actions.gomodifytags,
    b.code_actions.impl,
    b.formatting.gofumpt,
    b.formatting.goimports,
    b.diagnostics.staticcheck,
  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({
        group = augroup,
        buffer = bufnr,
      })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr })
        end,
      })
    end
  end,
}

return opts
