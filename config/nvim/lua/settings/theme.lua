if vim.fn.has("termguicolors") == 1 then
  vim.opt.termguicolors = true
  vim.cmd[[au VimEnter * highlight Comment gui=none]]
end

vim.g.one_allow_italics = 1
vim.opt.background = 'dark'
vim.cmd 'color one'
