-- Keymap
local opt = {noremap = true, silent = false}
local optff = {noremap=false, silent=false}
local opttt = {noremap = true, silent = true }
local opte = {expr = true}

-- Fuzzy finder
--- https://github.com/nvim-telescope/telescope.nvim
vim.api.nvim_set_keymap('n', '<leader>fb', '<cmd>lua require("telescope.builtin").buffers()<cr>', opt)
vim.api.nvim_set_keymap('n', '<leader>fc', '<cmd>lua require("telescope.builtin").builtin()<cr>', opt)
vim.api.nvim_set_keymap('n', '<leader>fe', '<cmd>lua require("telescope.builtin").file_browser()<cr>', opt)
vim.api.nvim_set_keymap('n', '<leader>fi', '<cmd>lua require("telescope.builtin").find_files()<cr>', opt)
vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>lua require("telescope.builtin").live_grep()<cr>', opt)
vim.api.nvim_set_keymap('n', '<leader>fh', '<cmd>lua require("telescope.builtin").oldfiles()<cr>', opt)
vim.api.nvim_set_keymap('n', '<leader>fj', '<cmd>lua require("telescope.builtin").jumplist()<cr>', opt)
vim.api.nvim_set_keymap('n', '<leader>fl', '<cmd>lua require("telescope.builtin").loclist()<cr>', opt)
vim.api.nvim_set_keymap('n', '<leader>fm', '<cmd>lua require("telescope.builtin").marks()<cr>', opt)
vim.api.nvim_set_keymap('n', '<leader>fk', '<cmd>lua require("telescope.builtin").keymaps()<cr>', opt)
vim.api.nvim_set_keymap('n', '<leader>fp', '<cmd>lua require("telescope.builtin").spell_suggest()<cr>', opt)
vim.api.nvim_set_keymap('n', '<leader>fq', '<cmd>lua require("telescope.builtin").quickfix()<cr>', opt)
vim.api.nvim_set_keymap('n', '<leader>fr', '<cmd>lua require("telescope.builtin").registers()<cr>', opt)
vim.api.nvim_set_keymap('n', '<leader>fs', '<cmd>lua require("telescope.builtin").current_buffer_fuzzy_find()<cr>', opt)
vim.api.nvim_set_keymap('n', '<leader>ft', '<cmd>lua require("telescope.builtin").treesitter()<cr>', opt)
vim.api.nvim_set_keymap('n', '<leader>fw', '<cmd>lua require("telescope.builtin").grep_string()<cr>', opt)

-- Git
--- https://github.com/nvim-telescope/telescope.nvim
vim.api.nvim_set_keymap('n', '<leader>gb', '<cmd>lua require("telescope.builtin").git_branches()<cr>', opt)
vim.api.nvim_set_keymap('n', '<leader>gc', '<cmd>lua require("telescope.builtin").git_commits()<cr>', opt)
vim.api.nvim_set_keymap('n', '<leader>gs', '<cmd>lua require("telescope.builtin").git_status()<cr>', opt)
vim.api.nvim_set_keymap('n', '<leader>gt', '<cmd>lua require("telescope.builtin").git_stash()<cr>', opt)
--- https://github.com/sindrets/diffview.nvim
vim.api.nvim_set_keymap('n', '<Leader>gd', ':DiffviewOpen<cr>', opt)
--- https://github.com/f-person/git-blame.nvim
vim.api.nvim_set_keymap('n', '<leader>gb', ':GitBlameToggle<cr>', opt)

-- LSP
--- https://github.com/nvim-telescope/telescope.nvim
vim.api.nvim_set_keymap('n', '<leader>lc', '<cmd>lua require("telescope.builtin").lsp_code_actions()<cr>', opt)
vim.api.nvim_set_keymap('n', '<leader>ld', '<cmd>lua require("telescope.builtin").lsp_document_diagnostics()<cr>', opt)
vim.api.nvim_set_keymap('n', '<leader>lg', '<cmd>lua require("telescope.builtin").lsp_definitions()<cr>', opt)
vim.api.nvim_set_keymap('n', '<leader>li', '<cmd>lua require("telescope.builtin").lsp_implementations()<cr>', opt)
vim.api.nvim_set_keymap('n', '<leader>lr', '<cmd>lua require("telescope.builtin").lsp_references()<cr>', opt)
vim.api.nvim_set_keymap('n', '<leader>ls', '<cmd>lua require("telescope.builtin").lsp_document_symbols()<cr>', opt)
vim.api.nvim_set_keymap('n', '<leader>lt', '<cmd>lua require("telescope.builtin").lsp_type_definitions()<cr>', opt)
--- https://github.com/RRethy/vim-illuminate
vim.api.nvim_set_keymap('n', '<a-n>', '<cmd>lua require"illuminate".next_reference{wrap=true}<cr>', {noremap=true})
vim.api.nvim_set_keymap('n', '<a-p>', '<cmd>lua require"illuminate".next_reference{reverse=true,wrap=true}<cr>', {noremap=true})
--- https://github.com/folke/trouble.nvim
vim.api.nvim_set_keymap("n", "<leader>xx", "<cmd>TroubleToggle<cr>", opttt)
vim.api.nvim_set_keymap("n", "<leader>xw", "<cmd>Trouble lsp_workspace_diagnostics<cr>", opttt)
vim.api.nvim_set_keymap("n", "<leader>xd", "<cmd>Trouble lsp_document_diagnostics<cr>", opttt)
vim.api.nvim_set_keymap("n", "<leader>xl", "<cmd>Trouble loclist<cr>", opttt)
vim.api.nvim_set_keymap("n", "<leader>xq", "<cmd>Trouble quickfix<cr>", opttt)
vim.api.nvim_set_keymap("n", "<leader>xr", "<cmd>Trouble lsp_references<cr>", opttt)

-- Session
--- https://github.com/rmagatti/session-lens
vim.api.nvim_set_keymap('n', '<F4>', '<cmd>lua require("session-lens").search_session()<cr>', opt)

-- Buffers
--- https://github.com/akinsho/nvim-bufferline.lua
vim.api.nvim_set_keymap('n', '<A-k>', ':BufferLineCycleNext<cr>', optff)
vim.api.nvim_set_keymap('n', '<A-j>', ':BufferLineCyclePrev<cr>', optff)
vim.api.nvim_set_keymap('n', '<C-A-k>', ':BufferLineMoveNext<cr>', optff)
vim.api.nvim_set_keymap('n', '<C-A-j>', ':BufferLineMovePrev<cr>', optff)
vim.api.nvim_set_keymap('n', '<A-s>', ':BufferLinePick<cr>', optff)
vim.api.nvim_set_keymap('n', '<A-x>', ':BufferLinePickClose<cr>', optff)
--- https://github.com/famiu/bufdelete.nvim
vim.api.nvim_set_keymap('n', '<A-w>', ':Bdelete!<cr>', optff)

-- Autocomplete
--- https://github.com/hrsh7th/nvim-compe
vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", opte)
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", opte)
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", opte)
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", opte)
vim.api.nvim_set_keymap('i', '<cr>', 'compe#confirm("<cr>")', opte)
vim.api.nvim_set_keymap('i', '<c-space>', 'compe#complete()', opte)

-- Terminal
--- https://github.com/voldikss/vim-floaterm
vim.api.nvim_set_keymap("n", "<leader>tt", "<cmd>FloatermNew --height=0.8 --width=0.9 --wintype=float<cr>", opttt)
vim.api.nvim_set_keymap("n", "<leader>tv", "<cmd>FloatermNew --width=0.33 --wintype=vsplit<cr>", opttt)
vim.api.nvim_set_keymap("n", "<leader>th", "<cmd>FloatermNew --height=0.25 --wintype=split<cr>", opttt)

-- File explorers
--- https://github.com/kyazdani42/nvim-tree.lua
vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeRefresh<cr>:NvimTreeToggle<cr>', optff)
--- https://github.com/ptzz/lf.vim
vim.api.nvim_set_keymap('n', '<F3>', ':Lf<cr>', optff)

-- Zen
--- https://github.com/folke/zen-mode.nvim
vim.api.nvim_set_keymap('n', '<leader>z', ':ZenMode<cr>', optff)
