-- Link: https://github.com/kyazdani42/nvim-tree.lua

local icons = require('icons')

vim.g.nvim_tree_side = 'right' --left by default
vim.g.nvim_tree_width = 40 --30 by default, can be width_in_columns or 'width_in_percent%'
vim.g.nvim_tree_ignore = {'.git', 'node_modules', '.cache'} --empty by default
vim.g.nvim_tree_gitignore = 1 --0 by default
vim.g.nvim_tree_auto_close = 0 --0 by default, closes the tree when it's the last window
vim.g.nvim_tree_auto_ignore_ft = {'startify'} --empty by default, don't auto open tree on specific filetypes.
vim.g.nvim_tree_follow = 1 --0 by default, this option allows the cursor to be updated when entering a buffer
vim.g.nvim_tree_indent_markers = 1 --0 by default, this option shows indent markers when folders are open
vim.g.nvim_tree_git_hl = 1 --0 by default, will enable file highlight for git attributes (can be used without the icons).
vim.g.nvim_tree_highlight_opened_files = 1 --0 by default, will enable folder and file icon highlight for opened files/directories.
vim.g.nvim_tree_tab_open = 1 --0 by default, will open the tree when entering a new tab and the tree was previously open
vim.g.nvim_tree_lsp_diagnostics = 1 --0 by default, will show lsp diagnostics in the signcolumn. See :help nvim_tree_lsp_diagnostics
vim.g.nvim_tree_disable_netrw = 0 --1 by default, disables netrw
vim.g.nvim_tree_hijack_netrw = 0 --1 by default, prevents netrw from automatically opening when opening directories (but lets you keep its other utilities)

vim.g.nvim_tree_icons = {
 default = icons.file.default,
 symlink = icons.file.symlink,
 git = {
   unstaged = icons.vcs.unstaged,
   staged = icons.vcs.staged,
   unmerged = icons.vcs.unmerged,
   renamed = icons.vcs.renamed,
   untracked = icons.vcs.untracked,
   deleted = icons.vcs.deleted,
   ignored = icons.vcs.ignored
 },
 folder = {
   arrow_open = icons.arrow_open,
   arrow_closed = icons.arrow_closed,
   default = icons.folder.default,
   open = icons.folder.open,
   empty = icons.folder.empty,
   empty_open = icons.folder.empty_open,
   symlink = icons.folder.symlink,
   symlink_open = icons.folder.symlink_open,
 },
 lsp = {
   hint = icons.diagnostics.hint,
   info = icons.diagnostics.info,
   warning = icons.diagnostics.warning,
   error = icons.diagnostics.error,
 }
}

-- Keymap
vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>', {noremap=false, silent=false})

