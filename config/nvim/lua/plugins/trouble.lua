-- https://github.com/folke/trouble.nvim

require("trouble").setup {
  use_lsp_diagnostic_signs = true
}

-- Keymap
local opts = {silent = true, noremap = true}

vim.api.nvim_set_keymap("n", "<leader>xx", "<cmd>TroubleToggle<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>xw", "<cmd>Trouble lsp_workspace_diagnostics<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>xd", "<cmd>Trouble lsp_document_diagnostics<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>xl", "<cmd>Trouble loclist<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>xq", "<cmd>Trouble quickfix<cr>", opts)
vim.api.nvim_set_keymap("n", "gR", "<cmd>Trouble lsp_references<cr>", opts)
