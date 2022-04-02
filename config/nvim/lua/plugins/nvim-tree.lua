-- https://github.com/kyazdani42/nvim-tree.lua

local icons = require('icons')

vim.g.nvim_tree_indent_markers = 1 -- 0 by default, this option shows indent markers when folders are open
vim.g.nvim_tree_git_hl = 1 -- 0 by default, will enable file highlight for git attributes (can be used without the icons).
vim.g.nvim_tree_highlight_opened_files = 1 -- 0 by default, will enable folder and file icon highlight for opened files/directories.
vim.g.nvim_tree_symlink_arrow = icons.file.symlink -- used as a separator between symlinks' source and target.

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
}

require('nvim-tree').setup {
  hijack_netrw = false,
  diagnostics = {
    enable = false, -- show lsp diagnostics in the signcolumn
    icons = {
      hint = icons.diagnostics.hint,
      info = icons.diagnostics.info,
      warning = icons.diagnostics.warning,
      error = icons.diagnostics.error,
    }
  },
  view = {
    width = 45,
    height = 30,
    side = 'right',
  }
}

