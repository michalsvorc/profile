#===============================================================================
# Interactive Git client.
#
# Dependencies: neovim, vim-fugitive neovim plugin
#===============================================================================

git-client() {
  nvim -c 'lua require("lazy").load({plugins = {"vim-fugitive"}}); vim.cmd("tab Git | silent! exec \"bd #\"")'
}
