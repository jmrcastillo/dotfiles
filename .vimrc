

nmap <C-w>r :source $MYVIMRC <CR>

set nocompatible
filetype off

" Resizing splits mouse
set mouse=a
set ttymouse=xterm2

" .swp files
set noswapfile

" showing line numbers and length
set nu			" show number
set relativenumber	" show relative line number
set nowrap 		" don't automatically wrap on load
"set fo-=t		" don't automatically wrap text on typing
set tw=79		" width of document (used by gd)

" FINDING FILES
" Search down into subfolders
" Provides tab-completion for all file related tasks
set path+=**

" Set Folding
set foldenable 		"Enable folding
set foldlevelstart=10	" Open most of the folds
set foldnestmax=10	" Folds can be nested. set a max value
set foldmethod=manual	" Defines the type of folding.

" enable folding with the spacebar
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

" buffer next prev
"map <c-w>< :bprev<CR>
"map <c-w>> :bnext<CR>

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
map <C-p> :-1r !xclip -o -sel clip<CR>

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

" move tab <f9> <f10>
nmap tm :tabm
:execute "tabmove" tabpagenr()
:execute "tabmove" tabpagenr() - 1
map <F9> :execute "tabmove" tabpagenr() - 2<CR>
map <F10> :execute "tabmove" tabpagenr() + 1<CR>

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

" semicolon javascript
"imap <leader> ; <c-o> a;
" A end of line & C-o input single normal mode

" Nerdtree
set runtimepath+=~/.vim/bundle/nerdtree
map <C-n> :NERDTreeToggle<CR>
" code autocmd vimenter * NERDTree
" close vim if only nerdtree is open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" ctrlp
set runtimepath+=~/.vim/bundle/ctrlp.vim
let g:ctrlp_max_height=5
let g:ctrlp_working_path_mode=0
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*

" SNIPPETS:
" Read an empty html template and move cursor to the line
nmap ,html :-1read $HOME/.vim/.skeleton.html<CR>3jwf<i

" pymode
set runtimepath+=~/.vim/bundle/python-mode
filetype plugin indent on
let g:pymode_python = 'python3'
"call pathogen#infect()
"call pathogen#helptags()

" better navigatin throug omnicomplete option list
" see http://stackoverflow.com/questions/2170023/how-to-map-keys-for
set completeopt=longest,menuone
function! OmniPopup(action)
if pumvisible()
	if a:action =='j'
		return "\<C-N>"
	elseif a:action == 'k'
		return "\<C-P>"
	endif
endif
return a:action
endfunction

inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>
" ale
"set runtimepath+=~/.vim/bundle/ale

" unite
set runtimepath+=~/.vim/bundle/unite

" vim-javascript
set runtimepath+=~/.vim/bundle/vim-javascript
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1

" powerline
set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim

" always show statusline
set laststatus=2

" emmet
set runtimepath+=~/.vim/bundle/emmet-vim
" emmet use tab
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
" emmet html and css only
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" nerdcommenter
set runtimepath+=~/.vim/bundle/nerdcommenter

" lexima
set runtimepath+=~/.vim/bundle/lexima

" vim-closetag
set runtimepath+=~/.vim/bundle/vim-closetag

" vim-surround
set runtimepath+=~/.vim/bundle/vim-surround

" python syntax
set runtimepath+=~/.vim/bundle/python-syntax
let g:python_highlight_all = 1

" tagbar
set runtimepath+=~/.vim/bundle/tagbar
nmap <F8> :TagbarToggle<CR>

" indentLine
set runtimepath+=~/.vim/bundle/indentLine
let g:indentLine_setColors = 0
"let g:indentLine_color_term = 20
"let g:indentLine_bgcolor_term = 202
let g:indentLine_char = '┆'
" grateful
