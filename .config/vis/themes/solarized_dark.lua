-- Solarized color codes Copyright (c) 2011 Ethan Schoonover - Modified by Fabio Santos 2023
local lexers = vis.lexers

local colors = {
	base05  = 'ffx002b36',
	base03  = '#002b36',
	base02  = '#073642',
	base04  = 'ffx073642',
	base01  = '#586e75',
	base00  = '#657b83',
	base0   = '#839496',
	base1   = '#93a1a1',
	base2   = '#eee8d5',
	base3   = '#fdf6e3',
	yellow  = '#b58900',
	orange  = '#cb4b16',
	red     = '#dc322f',
	magenta = '#d33682',
	violet  = '#6c71c4',
	blue    = '#268bd2',
	cyan    = '#2aa198',
	green   = '#859900',
}

lexers.colors = colors

local fg = ',fore:'..colors.base0..','
local bg = ',back:'..colors.base05..','

lexers.STYLE_DEFAULT = bg..fg
lexers.STYLE_NOTHING = bg
lexers.STYLE_CLASS = 'fore:yellow'
lexers.STYLE_COMMENT = 'fore:'..colors.base01..',italics'
lexers.STYLE_CONSTANT = 'fore:'..colors.cyan
lexers.STYLE_DEFINITION = 'fore:'..colors.blue
lexers.STYLE_ERROR = 'fore:'..colors.red..',italics'
lexers.STYLE_FUNCTION = 'fore:'..colors.blue
lexers.STYLE_KEYWORD = 'fore:'..colors.green
lexers.STYLE_LABEL = 'fore:'..colors.green
lexers.STYLE_NUMBER = 'fore:'..colors.cyan
lexers.STYLE_OPERATOR = 'fore:'..colors.green
lexers.STYLE_REGEX = 'fore:green'
lexers.STYLE_STRING = 'fore:'..colors.cyan
lexers.STYLE_PREPROCESSOR = 'fore:'..colors.orange
lexers.STYLE_TAG = 'fore:'..colors.red
lexers.STYLE_TYPE = 'fore:'..colors.yellow
lexers.STYLE_VARIABLE = 'fore:'..colors.blue
lexers.STYLE_WHITESPACE = 'fore:'..colors.base01
lexers.STYLE_EMBEDDED = 'back:'..colors.base03
lexers.STYLE_IDENTIFIER = fg

lexers.STYLE_LINENUMBER = 'fore:'..colors.base00..',back:'..colors.base04
lexers.STYLE_LINENUMBER_CURSOR = 'back:'..colors.base02..',fore:'..colors.base00
lexers.STYLE_CURSOR = 'fore:'..colors.base03..',back:'..colors.base0
lexers.STYLE_CURSOR_PRIMARY = lexers.STYLE_CURSOR..',back:cyan'
lexers.STYLE_CURSOR_LINE = 'back:'..colors.base02
lexers.STYLE_COLOR_COLUMN = 'back:'..colors.base02
lexers.STYLE_SELECTION = 'back:white'
lexers.STYLE_STATUS = 'back:'..colors.base00..',fore:'..colors.base02
lexers.STYLE_STATUS_FOCUSED = 'back:'..colors.base1..',fore:'..colors.base02
lexers.STYLE_SEPARATOR = lexers.STYLE_DEFAULT
lexers.STYLE_INFO = 'fore:default,back:default,bold'
lexers.STYLE_EOF = 'fore:'..colors.base01
