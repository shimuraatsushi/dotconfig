require("config.options")
require("config.keymaps")
require("config.lazy")

if vim.fn.has('mac') == 0 then
  vim.opt.clipboard = "unnamed"
  vim.g.clipboard = {
    name = 'myClipboard',
    copy = {
      ['+'] = 'win32yank.exe -i',
      ['*'] = 'win32yank.exe -i',
    },
    paste = {
      ['+'] = 'win32yank.exe -o',
      ['*'] = 'win32yank.exe -o',
    },
    cache_enabled = 1,
  }
else
  vim.opt.clipboard:append{'unnamedplus'}
end
