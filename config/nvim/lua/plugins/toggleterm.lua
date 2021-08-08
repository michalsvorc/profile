-- https://github.com/akinsho/nvim-toggleterm.lua
-- Please ensure you have set hidden in your neovim config.

require("toggleterm").setup{

size = function(term)
    if term.direction == "horizontal" then
      return 15
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.35
    end
  end,
}

-- Keymap
local opts = {noremap = true, silent = false}

vim.api.nvim_set_keymap('n', '<leader>tt', ':ToggleTerm direction=horizontal<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>tv', ':ToggleTerm direction=vertical<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>tf', ':ToggleTerm direction=float<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>tw', ':ToggleTerm direction=window<CR>', opts)

-- Keymap inside terminal buffer.
function _G.set_terminal_keymaps()
  local opts = {noremap = true}
  vim.api.nvim_buf_set_keymap(0, 't', '<ESC><ESC>', [[<C-\><C-n>]], opts)
end

vim.cmd('autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()')
