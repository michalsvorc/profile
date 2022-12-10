local status_ok, plugin = pcall(require, "plugins.battery-widget")
if not status_ok then
  error("Battery widget not found")
end

local battery_widget = plugin {
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
