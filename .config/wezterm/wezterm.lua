-- Configuration: https://wezfurlong.org/wezterm/config/files.html
-- Color schemes: https://github.com/mbadolato/iTerm2-Color-Schemes

local wezterm = require 'wezterm';

return {
  color_scheme = "OceanicMaterial",
  font = wezterm.font("Hack Nerd Font"),
  font_size = 16,
  cursor_blink_rate = 0,
  exit_behavior = "Close",
  audible_bell = "Disabled"
}
