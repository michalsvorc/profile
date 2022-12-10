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

return switcher
