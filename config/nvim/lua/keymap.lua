-- Keymap

local opt = {noremap = true, silent = false}
local optff = {noremap=false, silent=false}
local opttt = {noremap = true, silent = true }
local opte = {expr = true}
local on_attach = {}

-- Fuzzy finder
-- https://github.com/nvim-telescope/telescope.nvim
vim.api.nvim_set_keymap('n', '<leader>fe', '<cmd>lua require("telescope.builtin").buffers()<cr>', opt)
vim.api.nvim_set_keymap('n', '<leader>fc', '<cmd>lua require("telescope.builtin").builtin()<cr>', opt)
vim.api.nvim_set_keymap('n', '<leader>fb', '<cmd>lua require("telescope").extensions.file_browser.file_browser()<cr>', opt)
vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>lua require("telescope.builtin").current_buffer_fuzzy_find()<cr>', opt)
vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>lua require("telescope.builtin").live_grep()<cr>', opt)
vim.api.nvim_set_keymap('n', '<leader>fh', '<cmd>lua require("telescope.builtin").oldfiles()<cr>', opt)
vim.api.nvim_set_keymap('n', '<leader>fi', '<cmd>lua require("telescope.builtin").find_files()<cr>', opt)
vim.api.nvim_set_keymap('n', '<leader>fj', '<cmd>lua require("telescope.builtin").jumplist()<cr>', opt)
vim.api.nvim_set_keymap('n', '<leader>fk', '<cmd>lua require("telescope.builtin").keymaps()<cr>', opt)
vim.api.nvim_set_keymap('n', '<leader>fl', '<cmd>lua require("telescope.builtin").loclist()<cr>', opt)
vim.api.nvim_set_keymap('n', '<leader>fm', '<cmd>lua require("telescope.builtin").marks()<cr>', opt)
vim.api.nvim_set_keymap('n', '<leader>fp', '<cmd>lua require("telescope.builtin").spell_suggest()<cr>', opt)
vim.api.nvim_set_keymap('n', '<leader>fq', '<cmd>lua require("telescope.builtin").quickfix()<cr>', opt)
vim.api.nvim_set_keymap('n', '<leader>fr', '<cmd>lua require("telescope.builtin").registers()<cr>', opt)
vim.api.nvim_set_keymap('n', '<leader>ft', '<cmd>lua require("telescope.builtin").treesitter()<cr>', opt)
vim.api.nvim_set_keymap('n', '<leader>fw', '<cmd>lua require("telescope.builtin").grep_string()<cr>', opt)

-- Git
-- https://github.com/nvim-telescope/telescope.nvim
vim.api.nvim_set_keymap('n', '<leader>gb', '<cmd>lua require("telescope.builtin").git_branches()<cr>', opt)
vim.api.nvim_set_keymap('n', '<leader>gc', '<cmd>lua require("telescope.builtin").git_commits()<cr>', opt)
vim.api.nvim_set_keymap('n', '<leader>gs', '<cmd>lua require("telescope.builtin").git_status()<cr>', opt)
vim.api.nvim_set_keymap('n', '<leader>gt', '<cmd>lua require("telescope.builtin").git_stash()<cr>', opt)
-- https://github.com/sindrets/diffview.nvim
vim.api.nvim_set_keymap('n', '<Leader>gd', ':DiffviewOpen<cr>', opt)

-- LSP
-- https://github.com/nvim-telescope/telescope.nvim
vim.api.nvim_set_keymap('n', '<leader>lc', '<cmd>lua require("telescope.builtin").lsp_code_actions()<cr>', opt)
vim.api.nvim_set_keymap('n', '<leader>ld', '<cmd>lua require("telescope.builtin").lsp_document_diagnostics()<cr>', opt)
vim.api.nvim_set_keymap('n', '<leader>lg', '<cmd>lua require("telescope.builtin").lsp_definitions()<cr>', opt)
vim.api.nvim_set_keymap('n', '<leader>li', '<cmd>lua require("telescope.builtin").lsp_implementations()<cr>', opt)
vim.api.nvim_set_keymap('n', '<leader>lr', '<cmd>lua require("telescope.builtin").lsp_references()<cr>', opt)
vim.api.nvim_set_keymap('n', '<leader>ls', '<cmd>lua require("telescope.builtin").lsp_document_symbols()<cr>', opt)
vim.api.nvim_set_keymap('n', '<leader>lt', '<cmd>lua require("telescope.builtin").lsp_type_definitions()<cr>', opt)
-- https://github.com/RRethy/vim-illuminate
vim.api.nvim_set_keymap('n', '<a-n>', '<cmd>lua require"illuminate".next_reference{wrap=true}<cr>', {noremap=true})
vim.api.nvim_set_keymap('n', '<a-p>', '<cmd>lua require"illuminate".next_reference{reverse=true,wrap=true}<cr>', {noremap=true})
-- https://github.com/folke/trouble.nvim
vim.api.nvim_set_keymap("n", "<leader>xx", "<cmd>TroubleToggle<cr>", opttt)
vim.api.nvim_set_keymap("n", "<leader>xw", "<cmd>Trouble lsp_workspace_diagnostics<cr>", opttt)
vim.api.nvim_set_keymap("n", "<leader>xd", "<cmd>Trouble lsp_document_diagnostics<cr>", opttt)
vim.api.nvim_set_keymap("n", "<leader>xl", "<cmd>Trouble loclist<cr>", opttt)
vim.api.nvim_set_keymap("n", "<leader>xq", "<cmd>Trouble quickfix<cr>", opttt)
vim.api.nvim_set_keymap("n", "<leader>xr", "<cmd>Trouble lsp_references<cr>", opttt)

-- Buffers
-- https://github.com/akinsho/nvim-bufferline.lua
vim.api.nvim_set_keymap('n', '<A-k>', ':BufferLineCycleNext<cr>', optff)
vim.api.nvim_set_keymap('n', '<A-j>', ':BufferLineCyclePrev<cr>', optff)
vim.api.nvim_set_keymap('n', '<C-A-k>', ':BufferLineMoveNext<cr>', optff)
vim.api.nvim_set_keymap('n', '<C-A-j>', ':BufferLineMovePrev<cr>', optff)
vim.api.nvim_set_keymap('n', '<A-s>', ':BufferLinePick<cr>', optff)
vim.api.nvim_set_keymap('n', '<A-x>', ':BufferLinePickClose<cr>', optff)
-- https://github.com/famiu/bufdelete.nvim
vim.api.nvim_set_keymap('n', '<A-w>', ':Bdelete!<cr>', optff)

-- Terminal
-- https://github.com/voldikss/vim-floaterm
vim.api.nvim_set_keymap("n", "<leader>tt", "<cmd>FloatermNew<cr>", opttt)
vim.api.nvim_set_keymap("n", "<leader>tv", "<cmd>FloatermNew --width=0.35 --wintype=vsplit<cr>", opttt)
vim.api.nvim_set_keymap("n", "<leader>th", "<cmd>FloatermNew --height=0.3 --wintype=split<cr>", opttt)
vim.api.nvim_set_keymap("t", "<C-k>", "<C-\\><C-n><C-w><C-w>", opttt)
vim.api.nvim_set_keymap("n", "<C-k>", "<cmd>FloatermShow<cr>", opttt)
vim.api.nvim_set_keymap("t", "<C-j>", "<C-\\><C-n><C-w><C-w>", opttt)
vim.api.nvim_set_keymap("n", "<C-j>", "<cmd>FloatermShow<cr>", opttt)
vim.api.nvim_set_keymap("t", "<C-h>", "<C-\\><C-n><C-w>h", opttt)
vim.api.nvim_set_keymap("t", "<C-l>", "<C-\\><C-n><C-w>l", opttt)
vim.api.nvim_set_keymap("n", "<C-t>", "<cmd>FloatermToggle<cr>", opttt)
vim.api.nvim_set_keymap("t", "<C-t>", "<C-\\><C-n><cmd>FloatermToggle<cr>", opttt)
vim.api.nvim_set_keymap("t", "<C-n>", "<cmd>FloatermNext<cr>", opttt)
vim.api.nvim_set_keymap("t", "<C-p>", "<cmd>FloatermPrev<cr>", opttt)

-- File explorers
-- https://github.com/kyazdani42/nvim-tree.lua
vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeRefresh<cr>:NvimTreeToggle<cr>', optff)
-- https://github.com/ptzz/lf.vim
vim.api.nvim_set_keymap('n', '<F3>', ':Lf<cr>', optff)

-- https://github.com/ggandor/lightspeed.nvim
vim.api.nvim_set_keymap("n", "<C-s>", "<Plug>Lightspeed_s", {})
vim.api.nvim_set_keymap("v", "<C-s>", "<Plug>Lightspeed_s", {})

-- Rest
-- https://github.com/NTBBloodbath/rest.nvim#keybindings
vim.api.nvim_set_keymap("n", "<leader>re", "<Plug>RestNvim", {})
vim.api.nvim_set_keymap("n", "<leader>rr", "<Plug>RestNvimLast", {})
vim.api.nvim_set_keymap("n", "<leader>rt", "<Plug>RestNvimPreview", {})

-- Zen
-- https://github.com/folke/zen-mode.nvim
vim.api.nvim_set_keymap('n', '<leader>z', ':ZenMode<cr>', optff)

-- LSP
-- https://github.com/neovim/nvim-lspconfig#suggested-configuration
on_attach.lsp = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>.
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opt = { noremap=true, silent=true }

  -- https://github.com/neovim/nvim-lspconfig#keybindings-and-completion
  -- See `:help vim.lsp.*` for documentation on any of the below functions.
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opt)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opt)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opt)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opt)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opt)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opt)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opt)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opt)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opt)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opt)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opt)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opt)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opt)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opt)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opt)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opt)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opt)

  -- https://github.com/RRethy/vim-illuminate
  buf_set_keymap('n', '<a-n>', '<cmd>lua require"illuminate".next_reference{wrap=true}<cr>', opt)
  buf_set_keymap('n', '<a-p>', '<cmd>lua require"illuminate".next_reference{reverse=true,wrap=true}<cr>', opt)
end

-- https://github.com/lewis6991/gitsigns.nvim
on_attach.gitsigns = function(map)
   -- Navigation
    map('n', ']c', "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", {expr=true})
    map('n', '[c', "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", {expr=true})

    -- Actions
    map('n', '<leader>hs', '<cmd>Gitsigns stage_hunk<CR>')
    map('v', '<leader>hs', '<cmd>Gitsigns stage_hunk<CR>')
    map('n', '<leader>hr', '<cmd>Gitsigns reset_hunk<CR>')
    map('v', '<leader>hr', '<cmd>Gitsigns reset_hunk<CR>')
    map('n', '<leader>hS', '<cmd>Gitsigns stage_buffer<CR>')
    map('n', '<leader>hu', '<cmd>Gitsigns undo_stage_hunk<CR>')
    map('n', '<leader>hR', '<cmd>Gitsigns reset_buffer<CR>')
    map('n', '<leader>hp', '<cmd>Gitsigns preview_hunk<CR>')
    map('n', '<leader>hb', '<cmd>lua require"gitsigns".blame_line{full=true}<CR>')
    map('n', '<leader>tb', '<cmd>Gitsigns toggle_current_line_blame<CR>')
    map('n', '<leader>hd', '<cmd>Gitsigns diffthis<CR>')
    map('n', '<leader>hD', '<cmd>lua require"gitsigns".diffthis("~")<CR>')
    map('n', '<leader>td', '<cmd>Gitsigns toggle_deleted<CR>')

    -- Text object
    map('o', 'ih', ':<C-U>Gitsigns select_hunk<CR>')
    map('x', 'ih', ':<C-U>Gitsigns select_hunk<CR>')
end

return {
  on_attach = on_attach
}
