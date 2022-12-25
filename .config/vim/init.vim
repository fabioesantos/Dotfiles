"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Make vim respects XDG especification
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set runtimepath^=$XDG_CONFIG_HOME/vim
set runtimepath+=$XDG_DATA_HOME/vim
set runtimepath+=$XDG_CONFIG_HOME/vim/after
set packpath^=$XDG_DATA_HOME/vim,$XDG_CONFIG_HOME/vim
set packpath+=$XDG_CONFIG_HOME/vim/after,$XDG_DATA_HOME/vim/after
let g:netrw_home = $XDG_DATA_HOME."/vim"
call mkdir($XDG_DATA_HOME."/vim/spell", 'p')
set viewdir=$XDG_DATA_HOME/vim/view | call mkdir(&viewdir, 'p')
set backupdir=$XDG_CACHE_HOME/vim/backup | call mkdir(&backupdir, 'p')
set directory=$XDG_CACHE_HOME/vim/swap   | call mkdir(&directory, 'p')
set undodir=$XDG_CACHE_HOME/vim/undo     | call mkdir(&undodir,   'p')
set viminfofile=$XDG_CACHE_HOME/vim/viminfo

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Call plugins with vim-plug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('/home/fabiosantos/.local/share/vim/plugged')
Plug 'jalvesaq/Nvim-R'
Plug 'vimwiki/vimwiki'
Plug 'VebbNix/lf-vim'
Plug 'preservim/nerdtree'
Plug 'matze/vim-tex-fold'
Plug 'vim-airline/vim-airline'
Plug 'ryanoasis/vim-devicons'
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin Related Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Nvim-R
let R_rconsole_width = 0              " Always prefer a horizontal split for R console
let R_rconsole_height = 18            " Number of lines of R console

" airline
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_min_count =2
let g:airline_theme='cyberpunk'
let g:airline#extensions#disable_rtp_load = 1
let g:airline#extensions#whitespace#enabled = 0

" VimWiki
let g:vimwiki_list = [{'path': '~/.local/share/vim/vimwiki'}]

" NerdTree
nnoremap <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let g:NERDTreeWinSize=20

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General VIM Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Change cursor shape in diferent modes
let &t_SI = "\<esc>[6 q"
let &t_EI = "\<esc>[2 q"
if exists('&t_SR')
    let &t_SR = "\<esc>[4 q"
endif

"Workaround for termguicolors in st
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

"The time in milliseconds that is waited for a key code or mapped key sequence to complete.
set timeout timeoutlen=1000 ttimeoutlen=100

" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Disable limit of the width in text files
let g:leave_my_textwidth_alone=1

" Toogle spellchecking
nnoremap <silent> <F11> :set spell!<cr>

" Enable filetype plugins
filetype plugin indent on

" Automatically deletes all trailing whitespace and newlines at end of file on save. & reset cursor position
autocmd BufWritePre * let currPos = getpos(".")
autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritePre * %s/\n\+\%$//e
autocmd BufWritePre *.[ch] %s/\%$/\r/e
autocmd BufWritePre * cal cursor(currPos[1], currPos[2])

" Return to last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Compile document, be it groff/LaTeX/markdown/etc.
map <F5> :w! \| !compiler "<c-r>%"<CR>

" Compile Rmd files in R
autocmd filetype rmd map <F5> :!echo<space>"require(rmarkdown);<space>render('<c-r>%')"<space>\|<space>R<space>--vanilla<enter>

" Insert this in Rmd files
autocmd filetype rmd inoremap <leader>r ```{r<space>echo=TRUE}<CR>```<CR><CR><esc>2kO

" Open corresponding .pdf/.html or preview
map <F6> :!opout <c-r>%<CR><CR>

" Runs a script that cleans out tex build files whenever I close out of a .tex file.
autocmd VimLeave *.tex !texclear %

" Covert .odt files to markdown, and coverts back to .odt after salve file
autocmd BufReadPost *.odt silent %!pandoc "%" -tmarkdown -o /dev/stdout
autocmd BufWritePost *.odt :%!pandoc -f markdown "%" -o "%:r".odt

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
set display+=lastline           " Prevente vim show '@' if the line dont fit the screen
set showbreak=﬌                 " Character to show before the lines that have been soft-wrapped
set ma                          " To set mark a at current cursor location.
set number relativenumber       " To switch the line numbers on.
set expandtab                   " To enter spaces when tab is pressed.
set smarttab                    " To use smart tabs.
set autoindent                  " To copy indentation from current line when starting a new line.
set si                          " To switch on smart indentation.

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
set termguicolors
set encoding=utf8               " Set utf8 as standard encoding and
set spelllang=en,pt             " Set standard languages.
set t_Co=256                    " Enable 256 colors palette"
set background=dark
syntax on                       " Enable syntax highlighting.
language en_US.utf-8            " Use English as default
colorscheme cyberpunk-neon

" Files & Backup
set hidden                      " Allows buffers to be hidden
set nobackup                    " Turn off backup.
set nowb                        " Don't backup before overwriting a file.
set noswapfile                  " Don't create a swap file.
set ffs=unix,dos,mac            " Use Unix as the standard file type.

" Misc
set mouse=a                     " Enable mouse support
set ttymouse=sgr                " Fixes mouse scrolling in st
set clipboard=unnamedplus       " Vim clipboard buffer shared with the system clipboard
set wildmenu                    " Vim autocompetion menu
let is_kornshell=1              " use ksh syntax for sh
