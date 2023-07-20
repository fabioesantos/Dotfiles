-- load standard vis module, providing parts of the Lua API
require('vis')

--plugins
require('plugins/vis-title')
require('plugins/vis-tmux-repl/tmux-repl')
require('plugins/vis-statusline')
require('plugins/vis-spellcheck')
require('plugins/vis-lspc')

-- Mappings
vis:map(vis.modes.NORMAL, "<F5>", ":!compiler $vis_filename<Enter>", "Compile documents")
vis:map(vis.modes.NORMAL, "<F6>", ":!opout $vis_filename<Enter>", "Open compiled documents")
vis:map(vis.modes.NORMAL, "<C-n>", ":e! .<Enter>", "Search files")
vis:map(vis.modes.NORMAL, "<F11>", ":set spelllang pt_BR<Enter>", "Set spellcheck lang to english")
vis:map(vis.modes.NORMAL, "<C-r>", ":repl-new R<Enter>", "Open R interpreter")
vis:map(vis.modes.NORMAL, "<C-g>", ":repl-send<Enter>", "Run line in R")
vis:map(vis.modes.VISUAL, "<C-g>", ":repl-send<Enter>", "Run line in R")
vis:map(vis.modes.NORMAL, "<C-p>", ":!pkill -KILL R<Enter>", "Quit R")
vis:map(vis.modes.VISUAL, ' y', '"+y', "Copy to system clipboard")
vis:map(vis.modes.VISUAL, ' p', '"+p', "Paste from system clipboard")
vis:map(vis.modes.NORMAL, ' p', '"+p', "Paste from system clipboard")

-- Your global configuration options
vis.events.subscribe(vis.events.INIT, function()
    vis:command('set theme custom')
end)

-- Your per window configuration options
vis.events.subscribe(vis.events.WIN_OPEN, function(win)
    vis:command('set shell /bin/ksh')
    vis:command('set number')
    vis:command('set cursorline')
    vis:command('set expandtab on')
    vis:command('set number')
    vis:command('set show-spaces off')
    vis:command('set relativenumber')
    vis:command('set show-tabs on')
    vis:command('set tabwidth 4')
end)