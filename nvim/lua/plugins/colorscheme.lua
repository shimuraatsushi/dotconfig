return {
  'Tsuzat/NeoSolarized.nvim',
  lazy = false,
  priority = 1000,
  opts = {},
  config = function(_, opts)
    vim.cmd([[ colorscheme NeoSolarized ]])
    vim.api.nvim_set_hl(0, 'WinSeparator', { fg = '#FFFFFF', bg = 'none' })
  end,
}
