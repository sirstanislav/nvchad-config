vim.opt.colorcolumn = "120"

vim.api.nvim_set_keymap(
  "n",
  "<C-p>",
  ":lua require'telescope'.extensions.project.project{}<CR>",
  { noremap = true, silent = true }
)

vim.opt.listchars = { space = "·" }
vim.opt.list = true
