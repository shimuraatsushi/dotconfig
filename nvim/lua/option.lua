local options = {
  encoding = "utf-8",
  fileencoding = "utf-8",
  title = true,
  hlsearch = true,
  incsearch = true,
  swapfile = false,
  tabstop = 2,
	expandtab = true,
  number = true,
  splitbelow = true,
  splitright = true, 
  showtabline = 2,
  shiftwidth = 2,
  wildoptions = "pum",
  backup = false,
}
vim.opt.shortmess:append("c")
for k, v in pairs(options) do
  vim.opt[k] = v
end


