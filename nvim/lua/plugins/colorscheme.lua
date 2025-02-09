return {
  -- {
  --   --  "polirritmico/monokai-nightasty.nvim",
  --   "sainnhe/gruvbox-material",
  --   lazy = true,
  --   priority = 1000,
  -- },
  "loctvl842/monokai-pro.nvim",
  config = function()
    require("monokai-pro").setup()
  end,
}
