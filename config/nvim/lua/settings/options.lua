-- http://vimdoc.sourceforge.net/htmldoc/options.html

-- Global
vim.opt.spelllang = 'en'
vim.opt.mouse = 'a'
vim.opt.shortmess:append {c = true, S = true}
vim.opt.confirm = true
vim.opt.updatetime = 300

-- Special characters
vim.opt.listchars = {
  tab = ">-",
  trail = "·",
  precedes = "←",
  extends = "→",
  nbsp = "×"
}
vim.opt.showbreak = '↳'
vim.opt.list = true

-- Backup files
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

-- Buffer
vim.opt.hidden = true

-- Indentation
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Search
vim.opt.showmatch = true
vim.opt.ignorecase = true
vim.opt.hlsearch = true
vim.opt.smartcase = true

-- Window
vim.opt.lazyredraw = true
vim.opt.fillchars = {vert = ' '}
vim.opt.showtabline = 2
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = 'yes'
vim.opt.cursorline = true
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Completion required by compe
vim.opt.completeopt = 'menuone,noselect'

-- Vimidff
-- - Prevent opening files as RO in vimdiff.
vim.g.noro = true
