-- https://github.com/voldikss/vim-floaterm

vim.g.floaterm_width=0.9
vim.g.floaterm_height=0.8

-- Keymap
local opts = {silent = true, noremap = true}

vim.api.nvim_set_keymap("n", "<leader>tt", "<cmd>FloatermNew --height=0.8 --width=0.9 --wintype=float<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>tv", "<cmd>FloatermNew --width=0.33 --wintype=vsplit<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>th", "<cmd>FloatermNew --height=0.25 --wintype=split<cr>", opts)
