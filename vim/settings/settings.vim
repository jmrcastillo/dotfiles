
" Mouse
set mouse=a

" Save  - Put to .zshrc stty-ixon
nmap <C-s> :w<CR>
imap <C-s> <esc>:w<CR>a
" Save and Exit
"nmap <C-d> :wq!<CR>
"imap <C-d> <esc>:wq!<CR>
" Quit
nmap <C-q> :q!<CR>
imap <C-q> <esc>:q!<CR>

" Color Scheme
syntax on
set t_Co=256
set background=dark
set termguicolors
colorscheme vim-material

" color of nonText
"hi NonText guibg=ivory4

" auto scroll
set scrolloff=18	" keep 3 lines below and above the cursor

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

" backspace
set backspace=indent,eol,start

" save fold
augroup remember_folds
	autocmd!
	autocmd BufWrite * mkview
	autocmd BufRead * silent! loadview
augroup END

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

" Color of Number
hi CursorLineNr ctermfg=6 cterm=bold gui=bold guifg=DarkCyan

" make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

" remove highlight last search
map <F4> :nohl <CR>
map nh :nohl <CR>

" copy paste clipboard
set pastetoggle=<f2>
set clipboard=unnamed

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
nmap <silent> bp :bp<CR>
nmap <silent> bn :bn<CR>
nmap <silent> bP :bfirst<CR>
nmap <silent> bN :blast<CR>

" Switch between window splits
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
