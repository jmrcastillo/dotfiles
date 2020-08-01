
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

" map leader
let mapleader=" "
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=DarkCyan ctermfg=DarkCyan guifg=DarkCyan  guibg=DarkCyan

" Color Scheme
set t_Co=256
set background=dark
set termguicolors
colorscheme vim-material

" color of nonText
"hi NonText guibg=ivory4

" cursor center
set scrolloff=18
nmap j jzz
nmap k kzz

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
filetype on

" no swap file
set noswapfile

" Move Line
vmap J :m '>+1<CR>gv=gv
vmap K :m '<-2<CR>gv=gv


" showing line numbers and length
set nu			" show number
set relativenumber 	" show relative line number
set nowrap		" don't automatically wrap on load
set tw=79		" width of document (used by gd)

" Finding Files
" search down into subfolders
" provides tab-completion for all file related tasks
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
nmap <space>f za

" Display all matching files when we tab complete
set wildmenu

" Highgligh Search
highlight Search ctermbg=DarkCyan ctermfg=DarkCyan  guifg=Black guibg=DarkCyan

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

" Open vsplit at right
set splitright

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
" or use leader jk
nmap <leader>j :tabprevious<CR>
nmap <leader>k :tabnext<CR>
nmap <leader>h :tabr<CR>
nmap <leader>l :tabl<CR>
" Using arrow
nmap <leader><Left> :tabprevious<CR>
nmap <leader><Right> :tabnext<CR>
nmap <leader><Up> :tabr<CR>
nmap <leader><Down> :tabl<CR>
" Arrow
"nmap <Left> :bp<CR>
"nmap <Right> :bn<CR>
nmap <Up> 6kzz
nmap <Down> 6jzz

" tab number
nmap <leader>1 1gt
nmap <leader>2 2gt
nmap <leader>3 3gt
nmap <leader>4 4gt
nmap <leader>5 5gt
nmap <leader>6 6gt

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
"nmap <silent> bp :bp<CR>
"nmap <silent> bn :bn<CR>
"nmap <silent> bP :bfirst<CR>
"nmap <silent> bN :blast<CR>

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

