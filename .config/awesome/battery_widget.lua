local battery_widget_plugin = require("plugins.battery-widget")

local battery_widget = battery_widget_plugin {
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

return battery_widget
