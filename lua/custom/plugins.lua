local plugins = {

  {
    "rcarriga/nvim-dap-ui",
    config = function(_, opts)
      local dap = require "dap"
      local dapui = require "dapui"
      dapui.setup(opts)
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open {}
      end
      -- dap.listeners.before.event_terminated["dapui_config"] = function()
      --   dapui.close {}
      -- end
      -- dap.listeners.before.event_exited["dapui_config"] = function()
      --   dapui.close {}
      -- end
      require("core.utils").load_mappings "dapui"
    end,

    dependencies = {
      "mfussenegger/nvim-dap",
    },
  },

  {
    "mfussenegger/nvim-dap",
    config = function()
      require("core.utils").load_mappings "dap"
    end,
  },

  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function()
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
    end,
  },

  {
    "mfussenegger/nvim-jdtls",
    ft = "java",
    dependencies = {
      -- "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function()
      require "custom.configs.java.jdtls"
    end,
  },

  {
    "jose-elias-alvarez/typescript.nvim",
  },

  --junp between tmux and vim panes
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  --heighleight blocks of code
  {
    "HampusHauffman/block.nvim",
    config = function()
      require("block").setup()
    end,
    lazy = false,
  },

  -- SnipsCreate of code
  {
    "Sanix-Darker/snips.nvim",
    config = true,
    cmd = { "SnipsCreate" }, -- optional, make the plugin loads at cmd executed
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "jose-elias-alvarez/null-ls.nvim",
      config = function()
        require "custom.configs.null-ls"
      end,
    },

    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    opts = {
      ensure_installed = {
        "eslint_d",
        "typescript-language-server",
        "angular-language-server",
        "lua-language-server",
        "html-lsp",
        "prettierd",
        "stylua",
        "json-lsp",
        "css-lsp",
        "google-java-format",

        "debugpy",
        "pyright",
        "ruff",
        "mypy",
        "black",

        -- "jdtls",
        -- "java-test",
        -- "java-debug-adapter",
      },
    },
  },

  {
    "junegunn/gv.vim",
    lazy = false,
  },

  {
    "tpope/vim-fugitive",
    lazy = false,
  },

  {
    "rbong/vim-flog",
    lazy = false,
  },
  -- Launch http server to preview Markdown
  {
    "iamcco/markdown-preview.nvim",
    lazy = false,
    config = function()
      vim.fn["mkdp#util#install"]()
    end,
  },

  {
    "nvim-telescope/telescope-project.nvim",
    config = function()
      require("telescope").load_extension "project"

      require("telescope").setup {
        extensions = {
          project = {
            base_dirs = {
              "~/Storage/GitHub/",
            },
            hidden_files = true, -- default: false
            theme = "dropdown",
            order_by = "asc",
            search_by = "title",
            sync_with_nvim_tree = true, -- default false
          },
        },
      }
    end,
  },

  --code highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",

        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "json",
        "vue",
        "svelte",

        "python",
        "java",
      },
    },
  },
}

return plugins
