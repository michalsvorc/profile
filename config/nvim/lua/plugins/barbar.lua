-- https://github.com/romgrk/barbar.nvim

-- Keymap
local opts = {noremap=false, silent=false}

--- Move to previous/next.
vim.api.nvim_set_keymap('n', '<A-k>', ':BufferNext<CR>', opts)
vim.api.nvim_set_keymap('n', '<A-j>', ':BufferPrevious<CR>', opts)

--- Re-order to previous/next.
vim.api.nvim_set_keymap('n', '<A-l>', ':BufferMoveNext<CR>', opts)
vim.api.nvim_set_keymap('n', '<A-h>', ':BufferMovePrevious<CR>', opts)

--- Close buffer.
vim.api.nvim_set_keymap('n', '<A-w>', ':BufferClose<CR>', opts)

--- Goto buffer in position.
vim.api.nvim_set_keymap('n', '<A-1>', ':BufferGoto 1<CR>', opts)
vim.api.nvim_set_keymap('n', '<A-2>', ':BufferGoto 2<CR>', opts)
vim.api.nvim_set_keymap('n', '<A-3>', ':BufferGoto 3<CR>', opts)
vim.api.nvim_set_keymap('n', '<A-4>', ':BufferGoto 4<CR>', opts)
vim.api.nvim_set_keymap('n', '<A-5>', ':BufferGoto 5<CR>', opts)
vim.api.nvim_set_keymap('n', '<A-6>', ':BufferGoto 6<CR>', opts)
vim.api.nvim_set_keymap('n', '<A-7>', ':BufferGoto 7<CR>', opts)
vim.api.nvim_set_keymap('n', '<A-8>', ':BufferGoto 8<CR>', opts)
vim.api.nvim_set_keymap('n', '<A-9>', ':BufferLast<CR>', opts)

-- Set barbar's options.
vim.g.bufferline = {
  -- Enable/disable animations.
  animation = false,

  -- Enable/disable auto-hiding the tab bar when there is a single buffer.
  auto_hide = false,

  -- Enable/disable current/total tabpages indicator (top right corner).
  tabpages = true,

  -- Enable/disable close button.
  closable = false,

  -- Enables/disable clickable tabs.
  clickable = false,

  -- Enable/disable icons.
  -- If set to 'numbers', will show buffer index in the tabline.
  -- If set to 'both', will show buffer index and icons in the tabline.
  icons = 'both',
}
