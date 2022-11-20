local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("n", "x", '"_x', opts)
keymap("n", "<Esc><Esc>", ":<C-u>set nohlsearch<Return>", opts)

keymap("n", "<C-j>", ":bprev<CR>", opts)
keymap("n", "<C-k>", ":bnext<CR>", opts)
