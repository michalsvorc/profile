
-- {{{ awesome-switcher
local switcher = require("plugins.awesome-switcher")

switcher.settings.preview_box = true                                  -- display preview-box
switcher.settings.preview_box_bg = "#252525"                          -- background color
switcher.settings.preview_box_border = "#1b1b1b"                      -- border-color
switcher.settings.preview_box_fps = 60                                -- refresh framerate
switcher.settings.preview_box_delay = 75                              -- delay in ms
switcher.settings.preview_box_title_font = {"sans","italic","normal"} -- the font for cairo
switcher.settings.preview_box_title_font_size_factor = 1              -- the font sizing factor
switcher.settings.preview_box_title_color = {189,184,174,1}           -- the font color
switcher.settings.client_opacity = false                              -- opacity for unselected clients
switcher.settings.cycle_raise_client = false                          -- raise clients on cycle
-- }}}

-- {{{ battery widget
local battery_widget_main = require("plugins.battery-widget")
local battery_widget = battery_widget_main {
  ac = "AC",
  adapter = "BAT0",
  ac_prefix = "A:",
  battery_prefix = "B:",
  percent_colors = {
    { 10, "red"   },
    { 50, "orange"},
    {999, "grey" },
  },
  listen = true,
  timeout = 10,
  widget_text = "${AC_BAT}${color_on}${percent}%${color_off}",
  widget_font = "Deja Vu Sans Mono 9",
  tooltip_text = "Battery ${state}${time_est}",
  alert_threshold = 10,
  alert_timeout = 0,
  alert_title = "Low battery!",
  alert_text = "${AC_BAT}${time_est}"
}
-- }}}

return { switcher = switcher, battery_widget = battery_widget}
