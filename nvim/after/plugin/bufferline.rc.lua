local status, bufferline = pcall(require, "bufferline")
if (not status) then return end

bufferline.setup({
  options = {
    tab_size = 18,
    diagnostics = "nvim_lsp",
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      local icon = level:match("error") and " " or " "
      return " " .. icon .. count
    end
  },
})


vim.keymap.set('n', 'C-k', '<Cmd>BufferLineCycleNext<CR>', {})
vim.keymap.set('n', 'C-j', '<Cmd>BufferLineCyclePrev<CR>', {})
