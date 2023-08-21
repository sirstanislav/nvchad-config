local M = {}

M.override = {
  NvimTreeNormal = { bg = "#1a1b26" },
  NvimTreeNormalNC = { bg = "#1a1b26" },
  NvimTreeOpenedFolderName = { fg = "cyan" },

  NvimTreeWinSeparator = {
    fg = "cyan",
    bg = "#1a1b26",
  },

  NvimTreeCursorLine = {
    fg = "#ff9e64",
    bg = "#1a1b26",
  },

  NvimTreeOpenedFile = {
    fg = "#f0a0c0",
  },

  TblineFill = {
    bg = "#1a1b26",
  },

  TermCursor = {
    fg = "#1a1b26",
    bg = "#1a1b26",
  },

  TermCursorNC = {
    fg = "#1a1b26",
    bg = "#1a1b26",
  },

  TbLineBufOn = {
    fg = "white",
  },

  TbLineBufOff = {
    bg = "#1a1b26",
  },

  TbLineBufOnClose = {
    fg = "#1a1b26",
  },

  TbLineBufOffClose = {
    fg = "#1a1b26",
    bg = "#1a1b26",
  },

  NormalFloat = {
    bg = "#1a1b26",
  },

  FloatBorder = {
    fg = "#ff9e64",
  },

  WinSeparator = {
    fg = "cyan",
  },
}

M.add = {
  NvimTreeOpenedFile = {
    fg = "#e58fe5",
  },
}

return M
