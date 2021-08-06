-- Link: https://github.com/kyazdani42/nvim-tree.lua

vim.g.nvim_tree_side = 'right' --left by default
vim.g.nvim_tree_width = 40 --30 by default, can be width_in_columns or 'width_in_percent%'
vim.g.nvim_tree_ignore = {'.git', 'node_modules', '.cache'} --empty by default
vim.g.nvim_tree_gitignore = 1 --0 by default
vim.g.nvim_tree_auto_close = 1 --0 by default, closes the tree when it's the last window
vim.g.nvim_tree_auto_ignore_ft = {'startify'} --empty by default, don't auto open tree on specific filetypes.
vim.g.nvim_tree_follow = 1 --0 by default, this option allows the cursor to be updated when entering a buffer
vim.g.nvim_tree_indent_markers = 1 --0 by default, this option shows indent markers when folders are open
vim.g.nvim_tree_git_hl = 1 --0 by default, will enable file highlight for git attributes (can be used without the icons).
vim.g.nvim_tree_highlight_opened_files = 1 --0 by default, will enable folder and file icon highlight for opened files/directories.
vim.g.nvim_tree_tab_open = 1 --0 by default, will open the tree when entering a new tab and the tree was previously open
vim.g.nvim_tree_lsp_diagnostics = 1 --0 by default, will show lsp diagnostics in the signcolumn. See :help nvim_tree_lsp_diagnostics

vim.g.nvim_tree_icons = {
 default = '',
 symlink = '',
 git = {
   unstaged = "✗",
   staged = "✓",
   unmerged = "",
   renamed = "➜",
   untracked = "★",
   deleted = "",
   ignored = "◌"
 },
 folder = {
   arrow_open = "",
   arrow_closed = "",
   default = "",
   open = "",
   empty = "",
   empty_open = "",
   symlink = "",
   symlink_open = "",
 },
 lsp = {
   hint = "",
   info = "",
   warning = "",
   error = "",
 }
}

-- Keymap
vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>', {noremap=false, silent=false})

