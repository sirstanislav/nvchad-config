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
