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
  opts = {
    sources = {
      -- other sources
      {
        name = "html-css",
        option = {
          max_count = {}, -- not ready yet
          enable_on = {
            "html",
          }, -- set the file types you want the plugin to work on
          file_extensions = { "css", "sass", "less" }, -- set the local filetypes from which you want to derive classes
          style_sheets = {
            -- example of remote styles, only css no js for now
            "https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css",
            "https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css",
          },
        },
      },
    },
    formatting = {
      format = function(entry, vim_item)
        if entry.source.name == "html-css" then
          vim_item.menu = entry.source.menu
        end
        return vim_item
      end,
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

M.telescope = {
  defaults = {
    prompt_prefix = "  ",
  },
}

return M
