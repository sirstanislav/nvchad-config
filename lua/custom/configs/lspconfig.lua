local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

lspconfig.html.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "html" },
}

lspconfig.cssls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "css", "scss", "less" },
}

require("typescript").setup {
  disable_commands = false, -- prevent the plugin from creating Vim commands
  debug = false, -- enable debug logging for commands
  go_to_source_definition = {
    fallback = true, -- fall back to standard LSP definition on failure
  },
  server = { -- pass options to lspconfig's setup method
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
  },
}

lspconfig.vuels.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "vue" },
}

lspconfig.jsonls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {
    "json",
    "jsonc",
  },
}
