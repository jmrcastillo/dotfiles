
" Reload
nmap <C-w>r :source $MYVIMRC <CR>
"call plug#begin('~/.local/share/nvim/bundle')
call plug#begin('~/.vim/plugged')
"Plugin List
"PlugInstall [name]	- Install Plugins
"PlugUpdate [name]	- Install or update plugins
"PlugClean[!]		- Removed unused directories
"PlugUpgrade 		- Upgrade vim-plug itself
"PlugStatus 		- Check the status of plugins
"PlugDiff		- Examin Changes from previous update

" Python
Plug 'python-mode/python-mode', { 'branch': 'develop' }
Plug 'majutsushi/tagbar'
Plug 'vim-python/python-syntax'   " syntax highlight

" HTML
Plug 'mattn/emmet-vim'           " html shortcut
Plug 'cohama/lexima.vim'         " auto close bracket
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-surround'
Plug 'Yggdroot/indentLine'
Plug 'scrooloose/nerdcommenter' " comment
Plug 'lilydjwg/colorizer'

" Javascript
Plug 'w0rp/ale'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'elzr/vim-json'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'prettier/vim-prettier'

" Vim
Plug 'itchyny/lightline.vim'  " same powerline
Plug 'trevordmiller/nova-vim' " Color scheme for vim
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'     " find files

if has('nvim')
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
	Plug 'Shougo/deoplete.nvim'
	Plug 'roxma/nvim-yarp'
	Plug 'roxma/vim-hug-neovim-rpc'
endif

call plug#end()

"  -   -   -   -   -   -   -   -   -   -
" Plugin Settings
"  -   -   -   -   -   -   -   -   -   -

" SNIPPETS:
" Read an empty html template and move cursor to the line
nmap ,html :-1read $HOME/.config/nvim/.skeleton.html<CR>3jwf<i

" Python Mode
filetype plugin indent on
let g:pytmode_python = 'python3'

" Python Syntax
let g:python_highlight_all = 1

" Deoplete
"enable deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_delay = 100
" Tagbar
nmap <F8> :TagbarToggle<CR>

" NerdTree
map <C-n> :NERDTreeToggle<CR>
" Close vim if only nerdtree is open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" IndentLine
let g:indentLine_setColors = 0
"let g:indentLine_color_term = 20
"let g:indentLine_bgcolor_term = 202
let g:indentLine_char = '┆'

" ctrlp
let g:ctrlp_max_height=5
let g:ctrlp_working_path_mode=0
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*

" lightline
set laststatus=2
let g:lightline = {
	\ 'colorscheme': 'OldHope',
	\ }

" emmet use ,,
let g:user_emmet_expandabbr_key = ',,'
"imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

" javascript
" vim javascript
"let g:javascript_plugin_jsdoc = 1
"let g:javascript_plugin_ngdoc = 1
"let g:javascript_plugin_flow = 1

" vim jsx
" jsx and js / 1 if jsx only
let g:jsx_ext_required = 1
"let g:jsx_pragma_required = 1
" vim pretty
"let g:vim_jsx_pretty_template_tags = []
"let g:vim_jsx_pretty_colorful_config = 1
"let g:vim_jsx_pretty_highlight_close_tag = 1


" emmet html and css only
let g:user_emmet_install_global = 1
autocmd FileType html,css,js,jsx,htmldjango EmmetInstall

" Vim json
let g:vim_json_syntax_conceal = 0


"  -   -   -   -   -   -   -   -   -   -
" Settings
"  -   -   -   -   -   -   -   -   -   -

" Neovim Cursor blinking
set guicursor=sm:block
set guicursor=a:blinkon30
let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1
set guicursor=

set nocompatible
filetype off

" showing line numbers and length
set nu			" show number
set relativenumber 	" show relative line number
set nowrap		" don't automatically wrap on load
set tw=79		" width of document (used by gd)


" Finding Files
" Search down into subfolders
" Provides tab-completion for all file related tasks
set path+=**

" Set Folding
set foldenable 		"Enable folding
set foldlevelstart=10	" Open most of the folds
set foldnestmax=10	" Folds can be nested. set a max value
set foldmethod=manual	" Defines the type of folding.

" enable folding using spacebar
nmap <space> za

" Display all matching files when we tab complete
set wildmenu

" show whitespace
" must be inserted before colorscheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=DarkCyan ctermfg=DarkCyan guifg=DarkCyan  guibg=DarkCyan

" highlight trailing whitespace
match ErrorMsg '\s\+$'

"remove trailing whitespaces automatically
autocmd BufWritePre * :%s/\s\+$//e

" Color Scheme
syntax on
set t_Co=256
set background=dark
set termguicolors
colorscheme vim-material

" color of nonText
"hi NonText guibg=ivory4

" Color of Number
hi CursorLineNr ctermfg=6 cterm=bold gui=bold guifg=DarkCyan

" make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

" remove highlight last search
map <F4> :nohl <CR>

" copy paste clipboard
set pastetoggle=<f2>
set clipboard=unnamed
" need xterm_clipboard see at :version
"nmap <c-c> "*y
"vmap <c-c> "*y
"vmap <c-p> "*p

"vmap <c-c> :w! /tmp/vitmp<cr>
"nmap <c-p> :r! cat /tmp/vitmp<cr>

" my vim has no clipboard
" using xclip - - - - - - sudo apt-get install xclip
vmap <C-c> :!xclip -f -sel clip<CR>
nmap <C-v> :-1r !xclip -o -sel clip<CR>

" split navigation using ctrl jklh
nmap <silent> <c-j> :wincmd j <CR>
nmap <silent> <c-k> :wincmd k <CR>
nmap <silent> <c-l> :wincmd l <CR>
nmap <silent> <c-h> :wincmd h <CR>

" select all
map <c-a> ggVG <CR>

" change esc to jj
imap jj <ESC>

" Maximize , Equal
nmap <C-w>M <C-w>\|
nmap <C-w>m <C-w>=

" resizing windows
nmap 8 <c-w>3<
nmap 9 <c-w>3>
nmap 6 <c-w>3+
nmap 7 <c-w>3-

" move tab <f9> <f10>
nmap tm :tabmove<space>
:execute "tabmove" tabpagenr()
:execute "tabmove" tabpagenr() - 1
map <C-F9> :execute "tabmove" tabpagenr() - 2<CR>
map <C-F10> :execute "tabmove" tabpagenr() + 1<CR>

" switch tab
nmap <F9> :tabprevious<CR>
nmap <F10> :tabnext<CR>
" move tab
nmap m<F9> :tabmove -<CR>
nmap m<F10> :tabmove +<CR>

" go to the last tab
if !exists('g:lasttab')
	let g:lasttab = 1
endif

nmap <silent> <C-l>t :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()
" -	-	-	-	-	-
"
" buffers toggle
nmap <F5> :buffers<CR>:buffer<Space>
" vertical split buffer
nmap <F6> :vert sb<space>

" Buffer List
nmap <silent> [b :bp<CR>
nmap <silent> ]b :bn<CR>
nmap <silent> [B :bfirst<CR>
nmap <silent> ]B :blast<CR>

" Swithch between window splits
" and  expands the splits to full size
"
" Move vertically in the window through the
" horizontal splits...
map <c-w>j <c-j><c-w>_
map <c-w>k <c-k><c-w>_

" Move horizontally in the window through
" the vertical splits...
map <c-w>h <c-h><c-w>\|
map <c-w>l <c-l><c-w>\|

" Save  - Put to .zshrc stty-ixon
nmap <C-s> :w<CR>
imap <C-s> <esc>:w<CR>a
" Save and Exit
nmap <C-d> :wq!<CR>
imap <C-d> <esc>:wq!<CR>
" Quit
nmap <C-q> :q!<CR>
imap <C-q> <esc>:q!<CR>

" buffer next prev
"map <c-w>< :bprev<CR>
"map <c-w>> :bnext<CR>

"  change background to transparent
"hi Normal guibg=NONE ctermbg=NONE
"hi NonText cterm=NONE ctermfg=66 ctermbg=23 gui=NONE guibg=#002b36 guifg=#839496

" toggle transparent
let t:is_transparent = 1
function! Toggle_transparent()
if t:is_transparent == 1
	hi normal guibg=NONE ctermbg=NONE
	let t:is_transparent = 0

else
	set background=dark
	let t:is_transparent = 1
endif
endfunction

nnoremap <c-t> :call Toggle_transparent()

" pep 8 indentation
au bufnewfile,bufread *.py
\ set tabstop=4 |
\ set softtabstop=4 |
\ set shiftwidth=4 |
\ set textwidth=79 |
\ set expandtab |
\ set autoindent |
\ set fileformat=unix |
\ hi colorcolumn ctermbg=gray guibg=gray15 |
\ set colorcolumn=80 |

au bufnewfile,bufread *.css,*.html,*.js,*.c:
\ set tabstop=4 |
\ set softtabstop=4 |
\ set shiftwidth=4 |
\ set autoindent |
\ set expandtab |
\ set fileformat=unix |


