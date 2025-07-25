local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("n", "<C-j>", ":BufferLineCyclePrev<CR>", opts)
keymap("n", "<C-k>", ":BufferLineCycleNext<CR>", opts)
