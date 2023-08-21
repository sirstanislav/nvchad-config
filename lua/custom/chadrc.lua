--@type ChadrcConfig
local M = {}

local highlights = require "custom.highlights"

-- M.base_16 = {
--   base00 = "#1a1b26",
--   base01 = "#16161e",
--   base02 = "#2f3549",
--   base03 = "#444b6a",
--   base04 = "#787c99",
--   base05 = "#a9b1d6",
--   base06 = "#cbccd1",
--   base07 = "#d5d6db",
--   base08 = "#73daca",
--   base09 = "#ff9e64",
--   base0A = "#0db9d7",
--   base0B = "#9ece6a",
--   base0C = "#b4f9f8",
--   base0D = "#2ac3de",
--   base0E = "#bb9af7",
--   base0F = "#f7768e",
-- }

M.ui = {
  theme = "tokyonight",
  changed_themes = {
    tokyonight = {
      base_16 = {
        -- base0E = "#ff9e64",
      },
    },
  },
  hl_override = highlights.override,
  hl_add = highlights.add,
  nvdash = {
    load_on_startup = false,

    header = {
      "           ▄ ▄                   ",
      "       ▄   ▄▄▄     ▄ ▄▄▄ ▄ ▄     ",
      "       █ ▄ █▄█ ▄▄▄ █ █▄█ █ █     ",
      "    ▄▄ █▄█▄▄▄█ █▄█▄█▄▄█▄▄█ █     ",
      "  ▄ █▄▄█ ▄ ▄▄ ▄█ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄  ",
      "  █▄▄▄▄ ▄▄▄ █ ▄ ▄▄▄ ▄ ▄▄▄ ▄ ▄ █ ▄",
      "▄ █ █▄█ █▄█ █ █ █▄█ █ █▄█ ▄▄▄ █ █",
      "█▄█ ▄ █▄▄█▄▄█ █ ▄▄█ █ ▄ █ █▄█▄█ █",
      "    █▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█ █▄█▄▄▄█    ",
    },

    buttons = {
      { "  Find File", "Spc f f", "Telescope find_files" },
      { "󰈚  Recent Files", "Spc f o", "Telescope oldfiles" },
      { "󰈭  Find Word", "Spc f w", "Telescope live_grep" },
      { "  Bookmarks", "Spc m a", "Telescope marks" },
      { "  Themes", "Spc t h", "Telescope themes" },
      { "  Mappings", "Spc c h", "NvCheatsheet" },
    },
  },
}

M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"

return M
