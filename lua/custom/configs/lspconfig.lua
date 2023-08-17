local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.max_width = opts.max_width or 120
  opts.max_height = opts.max_height or 20
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

local handlers = {
  ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
  ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
}

lspconfig.lua_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "lua" },
  handlers = handlers,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
}

local cmd = {
  "ngserver",
  "--stdio",
  "--tsProbeLocations",
  "./node_modules",
  "--ngProbeLocations",
  "./node_modules",
}

lspconfig.angularls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = cmd,
  on_new_config = function(new_config, new_root_dir)
    new_config.cmd = cmd
  end,
  filetypes = { "typescript", "html", "typescriptreact", "typescript.tsx" },
  handlers = handlers,
}

lspconfig.html.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "html" },
  settings = {
    css = {
      lint = {
        validProperties = {},
      },
    },
  },
  handlers = handlers,
}

lspconfig.cssls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "css", "scss", "less" },
  handlers = handlers,
}

require("typescript").setup {
  disable_commands = false, -- prevent the plugin from creating Vim commands
  debug = false, -- enable debug logging for commands
  go_to_source_definition = {
    fallback = true, -- fall back to standard LSP definition on failure
  },
  server = { -- pass options to lspconfig's setup method
    root_dir = function(...)
      return require("lspconfig.util").root_pattern ".git"(...)
    end,
    single_file_support = false,
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = {
      "javascript",
      "javascriptreact",
      "javascript.jsx",
      "typescript",
      "typescriptreact",
      "typescript.tsx",
    },
    handlers = handlers,
  },
}

lspconfig.vuels.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "vue" },
  handlers = handlers,
}

lspconfig.jsonls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {
    "json",
    "jsonc",
  },
  handlers = handlers,
}

lspconfig.pyright.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {
    "python",
  },
  handlers = handlers,
}
