-- Load libraries
local modes = require "modes"
local settings = require "settings"
local newtab_chrome = require "newtab_chrome"
local webview = require "webview"

-- Set the luakit newtab page
newtab_chrome.new_tab_file = "/home/fabiosantos/.local/share/luakit/homepage.html"

-- Use DucuDuckGo as default search engine
settings.window.default_search_engine = "duckduckgo"

-- Play Embedded Video in External Player.
modes.add_binds("normal", {
      { "v", "Play video in page", function (w)
       local view = w.view
        local uri = view.hovered_uri or view.uri
         if uri then
          luakit.spawn(string.format("mpv --geometry=640x360 %s", uri ))
       end
   end },
})

-- Copy text with ctrl+c
modes.add_binds("normal", {{
    "<Control-c>",
    "Copy selected text.",
    function ()
        luakit.selection.clipboard = luakit.selection.primary
    end
}})

-- Open magnet links with my transadd script
webview.add_signal("init", function (view)
    view:add_signal("navigation-request", function (v, uri)
       if string.match(string.lower(uri), "^magnet:") then
           luakit.spawn(string.format("%s %q", "transadd", uri))
           return false
       end
    end)
end)
