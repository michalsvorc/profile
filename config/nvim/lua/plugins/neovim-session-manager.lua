-- https://github.com/Shatur/neovim-session-manager

require('telescope').load_extension('sessions')

require('session_manager').setup({
  autoload_last_session = false,
  autosave_last_session = false,
})
