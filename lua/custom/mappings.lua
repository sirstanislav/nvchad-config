local mappings = {
  general = {
    n = {
      [";"] = { ":", "enter command mode", opts = { nowait = true } },
      ["<M-p>"] = {
        ":lua require'telescope'.extensions.project.project{} <CR>",
        "Project manager",
      },
      -- ["<leader>tr"] = {
      --   function()
      --     require("base46").toggle_transparency()
      --   end,
      --   "󰂵 Toggle transparency",
      -- },
    },
  },

  tabufline = {
    n = {
      -- close buffer + hide terminal buffer
      ["<M-w>"] = {
        function()
          require("nvchad_ui.tabufline").close_buffer()
        end,
        "Close buffer",
      },
      ["<S-M-w>"] = { "<cmd> %bd | e# <CR>", "Close others buffers" },
    },
  },
}

return mappings
