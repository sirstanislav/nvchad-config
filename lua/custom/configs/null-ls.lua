local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require "null-ls"
local opts = { noremap = true, silent = true }

local sources = {
  null_ls.builtins.formatting.prettierd,
  null_ls.builtins.formatting.stylua,
  null_ls.builtins.formatting.eslint_d,
  null_ls.builtins.diagnostics.shellcheck,
  -- null_ls.builtins.formatting.google_java_format,
  null_ls.builtins.diagnostics.mypy,
  null_ls.builtins.diagnostics.ruff,
  null_ls.builtins.formatting.black,
  require "typescript.extensions.null-ls.code-actions",
}

require("null-ls").setup {
  debug = true,
  sources = sources,
  on_attach = function(client, bufnr)
    --Bind keys to run code actions
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>lc", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)

    --Run telescope ui for code actions
    require("telescope").load_extension "ui-select"

    --Auto formatting on save
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format { bufnr = bufnr }
          --vim.lsp.buf.formatting_sync()
        end,
      })
    end
  end,
}
