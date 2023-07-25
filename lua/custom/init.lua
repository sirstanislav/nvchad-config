-- vim.opt.colorcolumn = "120"

vim.opt.listchars = { space = "·" }
vim.opt.list = true
vim.opt.fillchars = {
  horiz = "·",
  horizup = "·",
  horizdown = "·",
  vert = "·",
  vertleft = "·",
  vertright = "·",
  verthoriz = "·",
  eob = " ",
}
--vim.wo.wrap = false

vim.api.nvim_create_autocmd("BufWritePost", {
  callback = function()
    vim.cmd "mksession!"
  end,
})
