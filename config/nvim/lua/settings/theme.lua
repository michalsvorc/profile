-- Colorspace setup
if vim.fn.has("termguicolors") == 1 then
  vim.opt.termguicolors = true
end

--- Colorscheme configuration
vim.g.edge_style = 'aura'
vim.g.edge_enable_italic = 0
vim.g.edge_disable_italic_comment = 1
vim.g.edge_diagnostic_text_highlight = 1
vim.g.edge_diagnostic_line_highlight = 1
vim.g.edge_diagnostic_virtual_text = 'colored'
vim.g.edge_current_word = 'grey background'

-- Load the colorscheme
vim.cmd[[colorscheme edge]]
