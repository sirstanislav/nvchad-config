local home = os.getenv "HOME"
local jdtls = require "jdtls"
local root_markers = { "gradlew", "mvnw", ".git", "pom.xml", "build.gradle" }
local root_dir = require("jdtls.setup").find_root(root_markers)
local workspace_folder = home .. "/.local/share/eclipse/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")
local augroup = vim.api.nvim_create_augroup("LspFormatting", { clear = false })
local cmp_nvim_lsp = require "cmp_nvim_lsp"
local client_capabilities = vim.lsp.protocol.make_client_capabilities()
local capabilities = cmp_nvim_lsp.default_capabilities(client_capabilities)

local on_attach = function(client, bufnr)
  local _, _ = pcall(vim.lsp.codelens.refresh)

  require("jdtls").setup_dap { hotcodereplace = "auto" }
  require("jdtls.setup").add_commands()
  require("jdtls.dap").setup_dap_main_class_configs()
  require("telescope").load_extension "ui-select"

  if client.supports_method "textDocument/formatting" then
    vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format { bufnr = bufnr }
      end,
    })
  end

  function nnoremap(mode, rhs, lhs, bufopts, desc)
    bufopts.desc = desc
    vim.keymap.set(mode, rhs, lhs, bufopts)
  end
  local bufopts = { noremap = true, silent = true, buffer = bufnr }

  nnoremap("n", "<leader>jo", jdtls.organize_imports, bufopts, "Organize imports")
  nnoremap("n", "<leader>jc", jdtls.test_class, bufopts, "Test class")
  nnoremap("n", "<leader>jt", jdtls.test_nearest_method, bufopts, "Test method")
  nnoremap("n", "<leader>jc", jdtls.extract_constant, bufopts, "Extract constant")
  nnoremap("v", "<leader>jm", [[<ESC><CMD>lua require('jdtls').extract_method(true)<CR>]], bufopts, "Extract method")
  nnoremap("n", "<leader>jv", jdtls.extract_variable, bufopts, "Extract variable")
  nnoremap("n", "<leader>lm", "<cmd>lua vim.lsp.buf.format { async = true }<CR>", bufopts, "Lsp formatting")
  nnoremap("n", "<leader>lc", "<cmd>lua vim.lsp.buf.code_action()<CR>", bufopts, "Lsp code action")
end

local handlers = {
  ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
  ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
}

local config = {
  handlers = handlers,
  flags = {
    debounce_text_changes = 80,
  },
  capabilities = capabilities,
  on_attach = on_attach,
  root_dir = root_dir,
  cmd = {
    "java",
    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-Xmx4g",
    "--add-modules=ALL-SYSTEM",
    "--add-opens",
    "java.base/java.util=ALL-UNNAMED",
    "--add-opens",
    "java.base/java.lang=ALL-UNNAMED",
    "-jar",
    vim.fn.glob "/opt/homebrew/Cellar/jdtls/1.26.0/libexec/plugins/org.eclipse.equinox.launcher_*.jar",
    "-configuration",
    "/opt/homebrew/Cellar/jdtls/1.26.0/libexec/config_mac",
    "-data",
    workspace_folder,
  },
  settings = {
    java = {
      format = {
        enabled = true,
        settings = {
          url = "~/Storage/Java/Style/eclipse-java-google-style.xml",
          profile = "GoogleStyle",
        },
      },
      signatureHelp = { enabled = true },
      contentProvider = { preferred = "fernflower" }, -- Use fernflower to decompile library code
      completion = {
        favoriteStaticMembers = {
          "org.hamcrest.MatcherAssert.assertThat",
          "org.hamcrest.Matchers.*",
          "org.hamcrest.CoreMatchers.*",
          "org.junit.jupiter.api.Assertions.*",
          "java.util.Objects.requireNonNull",
          "java.util.Objects.requireNonNullElse",
          "org.mockito.Mockito.*",
        },
        filteredTypes = {
          "com.sun.*",
          "io.micrometer.shaded.*",
          "java.awt.*",
          "jdk.*",
          "sun.*",
        },
      },
      sources = {
        organizeImports = {
          starThreshold = 9999,
          staticStarThreshold = 9999,
        },
      },
      codeGeneration = {
        toString = {
          template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
        },
        hashCodeEquals = {
          useJava7Objects = true,
        },
        useBlocks = true,
      },
      configuration = {
        runtimes = {
          {
            name = "JavaSE-20",
            path = "/Users/ctacbarada/Library/Java/JavaVirtualMachines/openjdk-20.0.2/Contents/Home",
          },
          {
            name = "JavaSE-17",
            path = "/Users/ctacbarada/Library/Java/JavaVirtualMachines/corretto-17.0.8/Contents/Home",
          },
          {
            name = "JavaSE-11",
            path = "/Users/ctacbarada/Library/Java/JavaVirtualMachines/corretto-11.0.20/Contents/Home",
          },
          {
            name = "JavaSE-1.8",
            path = "/Users/ctacbarada/Library/Java/JavaVirtualMachines/corretto-1.8.0_382/Contents/Home",
          },
        },
      },
      implementationsCodeLens = {
        enabled = true,
      },
      referencesCodeLens = {
        enabled = true,
      },
      references = {
        includeDecompiledSources = true,
      },
    },
  },
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  pattern = { "*.java" },
  callback = function()
    local _, _ = pcall(vim.lsp.codelens.refresh)
  end,
})

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

local bundles = {
  vim.fn.glob "/Users/ctacbarada/Storage/Java/Debugging/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar",
}

vim.list_extend(
  bundles,
  vim.split(vim.fn.glob("/Users/ctacbarada/Storage/Java/Debugging/vscode-java-test/server/*.jar", 1), "\n")
)

config["init_options"] = {
  bundles = bundles,
}

jdtls.start_or_attach(config)
