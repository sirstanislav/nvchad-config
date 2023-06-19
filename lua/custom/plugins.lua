local plugins = {
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
        -- defaults
        "vim",
        "lua",

        -- web dev
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "json",
        -- "vue", "svelte",

        -- low level
        "c",
        "zig",
      },
    },
  },
}

return plugins
