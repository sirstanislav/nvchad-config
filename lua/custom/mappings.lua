local mappings = {
  general = {
    n = {
      ["<leader>ft"] = {
        "<cmd> FloatermNew --height=0.9 --width=0.9 <CR>",
        "New float term window",
      },
      ["<M-p>"] = {
        ":lua require'telescope'.extensions.project.project{} <CR>",
        "Project manager",
      },
    },
  },
}

return mappings
