--------------------------
-- Gentoo luakit theme --
--------------------------

local theme = {}

-- Default settings
theme.font = "11px Fira Code Nerd Font"
theme.fg   = "#F1FA8C"
theme.bg   = "#020202"

-- Genaral colours
theme.success_fg = "#F1FA8C"
theme.loaded_fg  = "#F1FA8C"
theme.error_fg = "#4D4D4D"
theme.error_bg = "#020202"

-- Warning colours
theme.warning_fg = "#8e8e8e"
theme.warning_bg = "#F1FA8C"

-- Notification colours
theme.notif_fg = "#bbbbbb"
theme.notif_bg = "#000000"

-- Menu colours
theme.menu_fg                   = "#bbbbbb"
theme.menu_bg                   = "#000000"
theme.menu_selected_fg          = "#eeeeee"
theme.menu_selected_bg          = "#6600cc"
theme.menu_title_bg             = "#000000"
theme.menu_primary_title_fg     = "#bbbbbb"
theme.menu_secondary_title_fg   = "#bbbbbb"

theme.menu_disabled_fg = "#3d4550"
theme.menu_disabled_bg = theme.menu_bg
theme.menu_enabled_fg = theme.menu_fg
theme.menu_enabled_bg = theme.menu_bg
theme.menu_active_fg =  "#686868"
theme.menu_active_bg =  theme.menu_bg

-- Proxy manager
theme.proxy_active_menu_fg      = "#f7f7f7"
theme.proxy_active_menu_bg      = "#4D4D4D"
theme.proxy_inactive_menu_fg    = "#3d4550"
theme.proxy_inactive_menu_bg    = "#080808"

-- Statusbar specific
theme.sbar_fg         = "#bbbbbb"
theme.sbar_bg         = "#000000"

-- Downloadbar specific
theme.dbar_fg         = "#bbbbbb"
theme.dbar_bg         = "#000000"
theme.dbar_error_fg   = "#eeeeee"

-- Input bar specific
theme.ibar_fg           = "#bbbbbb"
theme.ibar_bg           = "#000000"

-- Tab label
theme.tab_fg            = "#bbbbbb"
theme.tab_bg            = "#000000"
theme.tab_hover_bg      = "#4D4D4D"
theme.tab_ntheme        = "#F1FA8C"
theme.selected_fg       = "#eeeeee"
theme.selected_bg       = "#6600cc"
theme.selected_ntheme   = "#F1FA8C"
theme.loading_fg        = "#F1FA8C"
theme.loading_bg        = "#020202"

theme.selected_private_tab_bg = "#3d295b"
theme.private_tab_bg    = "#22254a"

-- Trusted/untrusted ssl colours
theme.trust_fg          = "#4D4D4D"
theme.notrust_fg        = "#3d4550"

-- General colour pairings
theme.ok = { fg = "#F1FA8C", bg = "#020202" }
theme.warn = { fg = "#5d7b5c", bg = "#020202" }
theme.error = { fg = "#4D4D4D", bg = "#020202" }

return theme

-- vim: et:sw=4:ts=8:sts=4:tw=80
