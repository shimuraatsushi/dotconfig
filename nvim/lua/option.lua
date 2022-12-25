local options = {
  encoding = "utf-8",
  fileencoding = "utf-8",
  title = true,
  swapfile = false,
  tabstop = 2,
  expandtab = true,
  number = true,
  splitbelow = true,
  splitright = true,
  shiftwidth = 2,
  wildoptions = "pum",
  backup = false,
}
vim.opt.shortmess:append("c")
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.clipboard:append { 'unnamedplus' }
for k, v in pairs(options) do
  vim.opt[k] = v
end
