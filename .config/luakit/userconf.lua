-- Load libraries
local modes = require "modes"
local settings = require "settings"
local newtab_chrome = require "newtab_chrome"

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

-- Set the luakit newtab page
newtab_chrome.new_tab_file = "/home/fabiosantos/.local/share/surf/html/homepage.html"

-- Use DucuDuckGo as default search engine
settings.window.default_search_engine = "duckduckgo"
