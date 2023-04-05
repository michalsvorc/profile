-- Configuration: https://wezfurlong.org/wezterm/config/files.html
-- Colors & Appearance: https://wezfurlong.org/wezterm/config/appearance.html
-- Color Schemes: https://wezfurlong.org/wezterm/colorschemes/index.html

-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- Apply your config choices
config.color_scheme = "tokyonight-storm"
config.font = wezterm.font("Hack Nerd Font")
config.font_size = 14
config.cursor_blink_rate = 0
config.exit_behavior = "Close"
config.audible_bell = "Disabled"
config.hide_tab_bar_if_only_one_tab = true
config.check_for_updates = false

-- Return the configuration to wezterm
return config

