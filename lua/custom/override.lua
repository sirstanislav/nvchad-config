local M = {}

M.gitsigns = {
  preview_config = {
    -- Options passed to nvim_open_win
    border = "rounded",
    style = "minimal",
    relative = "cursor",
    row = 0,
    col = 1,
  },
}

M.nvim_cmp = {
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "nvim_lua" },
    { name = "path" },
    {
      name = "html-css",
      option = {
        max_count = {},
        enable_on = {
          "html",
          "javascript",
          "javascriptreact",
          "javascript.jsx",
          "typescript",
          "typescriptreact",
          "typescript.tsx",
        },
        -- file_extensions = { "css", "sass", "less" },
        style_sheets = {
          "https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css",
          "https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css",
        },
      },
    },
  },
}

M.nvim_tree = {
  filters = {
    --exclude DS_Store files
    custom = { ".DS_Store" },
  },

  view = {
    adaptive_size = true,
  },

  actions = {
    open_file = {
      resize_window = false,
    },
  },

  renderer = {
    highlight_opened_files = "all",
    highlight_modified = "icon",

    indent_markers = {
      enable = true,
      icons = {
        corner = "·",
        item = "·",
        bottom = "·",
        edge = "·",
        none = "·",
      },
    },
  },
}

M.treesitter = {
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
  autotag = {
    enable = true,
  },
  auto_intsall = true,
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
}

M.telescope = {
  defaults = {
    prompt_prefix = "  ",
  },
}

return M
