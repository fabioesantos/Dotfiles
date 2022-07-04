""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Call plugins with vim-plug
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('/home/fabiosantos/.local/share/nvim/plugged')
Plug 'gentoo/gentoo-syntax'
Plug 'jalvesaq/Nvim-R'
Plug 'matze/vim-tex-fold'
Plug 'vim-airline/vim-airline'
Plug 'lervag/vimtex'
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'patstockwell/vim-monokai-tasty'
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin Related Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Nvim-R
let R_rconsole_width = 0                        " Always prefer a horizontal split for R console
let R_rconsole_height = 17                      " Number of lines of R console

" airline
let g:airline_powerline_fonts = 1
let g:airline_theme='monokai_tasty'

" Ncm2
au User Ncm2Plugin call ncm2#register_source({
        \ 'name' : 'vimtex',
        \ 'priority': 9, 
        \ 'subscope_enable': 1,
        \ 'complete_length': 1,
        \ 'scope': ['tex'],
        \ 'mark': 'tex',
        \ 'word_pattern': '\w+',
        \ 'complete_pattern': g:vimtex#re#ncm,
        \ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
        \ })

" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General VIM Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set a Local Leader
let mapleader = ","
let g:mapleader = ","

" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Toogle spellchecking
nnoremap <silent> <F11> :set spell!<cr>

" Disable unused providers
let g:loaded_node_provider = 0
let g:loaded_ruby_provider = 0
let g:loaded_perl_provider = 0

" Enable filetype plugins
filetype plugin on
filetype indent on

" Compile document, be it groff/LaTeX/markdown/etc.
map <F5> :w! \| !compiler "<c-r>%"<CR>

" Render documents with Rmarkdown
autocmd filetype rmd map <F5> :!echo<space>"require(rmarkdown);<space>render('<c-r>%')"<space>\|<space>R<space>--vanilla<enter>
autocmd filetype rmd inoremap ;r ```{r<space>echo=TRUE}<CR>```<CR><CR><esc>2kO

" Run xrdb whenever Xdefaults or Xresources are updated.
autocmd BufRead,BufNewFile Xresources set filetype=xdefaults
autocmd BufWritePost Xresources !xrdb %

" Open corresponding .pdf/.html or preview
map <F6> :!opout <c-r>%<CR><CR>

" Runs a script that cleans out tex build files whenever I close out of a .tex file.
autocmd VimLeave *.tex !texclear %

" Cool file explorer stuff in a pane using netrw
function! ToggleVExplorer()
    if exists("t:expl_buf_num")
        let expl_win_num = bufwinnr(t:expl_buf_num)
        if expl_win_num != -1
            let cur_win_nr = winnr()
            exec expl_win_num . 'wincmd w'
            close
            exec cur_win_nr . 'wincmd w'
            unlet t:expl_buf_num
        else
            unlet t:expl_buf_num
        endif
    else
        exec '1wincmd w'
        Vexplore .
        let t:expl_buf_num = bufnr("%")
    endif
endfunction
nnoremap <silent> <C-n> :call ToggleVExplorer()<CR>

" netrw options
let g:netrw_sort_sequence = '[\/]$,*'   " directories first
let g:netrw_browse_split  = 4           " open new buffers in previous tab
let g:netrow_altv         = 1
let g:netrw_winsize       = -28         " thinner width
let g:netrw_banner        = 0           " hide the help info
let g:netrw_liststyle     = 3           " tree mode

" Return to last edit position when opening a file
augroup resume_edit_position
    autocmd!
    autocmd BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit'
        \ | execute "normal! g`\"zvzz"
        \ | endif
augroup END

" Set a Local Leader
let mapleader = ","
let g:mapleader = ","

" Buffers & Navigation
nmap <leader>T :enew<cr>                " To open a new empty buffer
nmap <leader>l :bnext<CR>               " Move to the next buffer
nmap <leader>h :bprevious<CR>           " Move to the previous buffer
nmap <leader>bq :bp <BAR> bd #<CR>      " Close the current buffer and move to the previous one
nmap <leader>bl :ls<CR>                 " Show all open buffers and their status

" Use wildmenu for navigate between buffers
set wildchar=<Tab> wildmenu wildmode=full
set wildcharm=<C-Z>
nnoremap <Tab> :b <C-Z>

" Tabs & Navigation
map <leader>nt :tabnew<cr>      " To create a new tab.
map <leader>to :tabonly<cr>     " To close all other tabs (show only the current tab).
map <leader>tc :tabclose<cr>    " To close the current tab.
map <leader>tm :tabmove<cr>     " To move the current tab to next position.
map <leader>tn :tabn<cr>        " To swtich to next tab.
map <leader>tp :tabp<cr>        " To switch to previous tab.

" Splits & Tabbed Files
set splitbelow splitright
" Remap splits navigation to just CTRL + hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Change 2 split windows from vert to horiz or horiz to vert
map <Leader>th <C-w>t<C-w>H
map <Leader>tk <C-w>t<C-w>K

" Line Numbers & Indentation
set backspace=indent,eol,start  " To make backscape work in all conditions.
set showbreak=﬌                 " Character to show before the lines that have been soft-wrapped
set ma                          " To set mark a at current cursor location.
set number relativenumber       " To switch the line numbers on.
set autoindent                  " To copy indentation from current line when starting a new line.
set si                          " To switch on smart indentation.

" General tab settings
set smarttab                    " To use smart tabs.
set tabstop=4                   " number of visual spaces per TAB
set softtabstop=4               " number of spaces in tab when editing
set shiftwidth=4                " number of spaces to use for autoindent
set expandtab                   " expand tab to spaces so that tabs are spaces

" Search
set ignorecase                  " To ignore case when searching.
set smartcase                   " When searching try to be smart about cases.
set incsearch                   " To make search act like search in modern browsers.
set magic                       " For regular expressions turn magic on.

" Brackets
set showmatch                   " To show matching brackets when text indicator 
                                " is over them.
set mat=2                       " How many tenths of a second to blink 
                                " when matching brackets.

" Errors
set noerrorbells                " No annoying sound on errors.

" Color & Fonts
syntax enable                   " Enable syntax highlighting.
language en_US.utf-8            " Use English as default
set encoding=utf8               " Set utf8 as standard encoding and 
set spelllang=en,pt             " Set standard languages.
set t_Co=256                    " Enable 256 colors palette"

" Files & Backup
set nobackup                    " Turn off backup.
set nowb                        " Don't backup before overwriting a file.
set noswapfile                  " Don't create a swap file.
set ffs=unix,dos,mac            " Use Unix as the standard file type.

" Misc
set mouse=a                     " Enable mouse support    
set clipboard+=unnamedplus      " Vim clipboard buffer shared with the system clipboard
set hidden                      " Allows buffers to be hidden

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Theming
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
highlight LineNr           ctermfg=8    ctermbg=none    cterm=none
highlight CursorLineNr     ctermfg=7    ctermbg=8       cterm=none
highlight VertSplit        ctermfg=0    ctermbg=8       cterm=none
highlight Statement        ctermfg=2    ctermbg=none    cterm=none
highlight Directory        ctermfg=4    ctermbg=none    cterm=none
highlight StatusLine       ctermfg=7    ctermbg=0       cterm=none
highlight StatusLineNC     ctermfg=7    ctermbg=none    cterm=none
highlight Comment          ctermfg=103  ctermbg=none    cterm=italic
highlight Constant         ctermfg=12   ctermbg=none    cterm=none
highlight Special          ctermfg=4    ctermbg=none    cterm=none
highlight Identifier       ctermfg=6    ctermbg=none    cterm=bold
highlight PreProc          ctermfg=5    ctermbg=none    cterm=none
highlight String           ctermfg=12   ctermbg=none    cterm=none
highlight Number           ctermfg=1    ctermbg=none    cterm=none
highlight Function         ctermfg=1    ctermbg=none    cterm=bold
highlight WildMenu         ctermfg=0       ctermbg=4       cterm=none
highlight Folded           ctermfg=103     ctermbg=234     cterm=none
highlight FoldColumn       ctermfg=103     ctermbg=234     cterm=none
highlight DiffAdd          ctermfg=none    ctermbg=23      cterm=none
highlight DiffChange       ctermfg=none    ctermbg=56      cterm=none
highlight DiffDelete       ctermfg=168     ctermbg=96      cterm=none
highlight DiffText         ctermfg=0       ctermbg=80      cterm=none
highlight SignColumn       ctermfg=244     ctermbg=235     cterm=none
highlight Conceal          ctermfg=251     ctermbg=none    cterm=none
highlight SpellBad         ctermfg=168     ctermbg=none    cterm=underline
highlight SpellCap         ctermfg=80      ctermbg=none    cterm=underline
highlight SpellRare        ctermfg=121     ctermbg=none    cterm=underline
highlight SpellLocal       ctermfg=186     ctermbg=none    cterm=underline
highlight Pmenu            ctermfg=251     ctermbg=234     cterm=none
highlight PmenuSel         ctermfg=0       ctermbg=111     cterm=none
highlight PmenuSbar        ctermfg=206     ctermbg=235     cterm=none
highlight PmenuThumb       ctermfg=235     ctermbg=206     cterm=none
highlight TabLine          ctermfg=244     ctermbg=234     cterm=none
highlight TablineSel       ctermfg=0       ctermbg=247     cterm=none
highlight TablineFill      ctermfg=244     ctermbg=234     cterm=none
highlight CursorColumn     ctermfg=none    ctermbg=236     cterm=none
highlight CursorLine       ctermfg=none    ctermbg=236     cterm=none
highlight ColorColumn      ctermfg=none    ctermbg=236     cterm=none
highlight Cursor           ctermfg=0       ctermbg=5       cterm=none
highlight htmlEndTag       ctermfg=114     ctermbg=none    cterm=none
highlight xmlEndTag        ctermfg=114     ctermbg=none    cterm=none
