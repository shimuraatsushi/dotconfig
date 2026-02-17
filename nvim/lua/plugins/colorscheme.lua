return {
  'ellisonleao/gruvbox.nvim',
  lazy = false,
  priority = 1000,
  config = true,
  opts = {},
  config = function(_, opts)
    vim.cmd([[ colorscheme gruvbox ]])
  end,
}

-- return {
--   "loctvl842/monokai-pro.nvim",
--   lazy = false,
--   priority = 1000,
--   config = true,
--   opts = {},
--   config = function(_, opts)
--     vim.cmd([[ colorscheme monokai-pro]])
--   end,
-- }

-- return {
--   "olimorris/onedarkpro.nvim",
--   priority = 1000,
--   config = function(_, opts)
--     vim.cmd([[ colorscheme onedark ]])
--   end,
-- }
