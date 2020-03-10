
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
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
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
" svg css
Plug 'othree/html5.vim'
Plug 'othree/svg-properties-syntax.vim'


" Javascript
"Plug 'w0rp/ale'
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
Plug 'ryanoasis/vim-devicons'
Plug 'vwxyutarooo/nerdtree-devicons-syntax'
Plug 'airblade/vim-gitgutter'
Plug 'severin-lemaignan/vim-minimap'


"" YouCompleteMe
Plug 'ervandew/supertab'
Plug 'ycm-core/youcompleteme'
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

"" Ultisnips
Plug 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
" Path
let g:UltiSnipsSnippetDirectories = ['~/.vim/UltiSnips', 'UltiSnips']

" UltiSnips completion function that tries to expand a snippet. If there's no
" snippet for expanding, it checks for completion window and if it's
" shown, selects first element. If there's no completion window it tries to
" jump to next placeholder. If there's no placeholder it just returns TAB key
function! g:UltiSnips_Complete()
    call UltiSnips_ExpandSnippet()
    if g:ulti_expand_res == 0
        if pumvisible()
            return "\<C-n>"
        else
            call UltiSnips_JumpForwards()
            if g:ulti_jump_forwards_res == 0
               return "\<TAB>"
            endif
        endif
    endif
    return ""
endfunction

exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"

Plug 'honza/vim-snippets'

" Autocomplete
"Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Install Plugin for coc
" CocInstall coc-tabnine
" CocInstall coc-python
" CocUninstall coc-tabnine

" CocList extension

call plug#end()

"  -   -   -   -   -   -   -   -   -   -
" Plugin Settings
"  -   -   -   -   -   -   -   -   -   -

" Python Mode
filetype plugin indent on
let g:pymode_python = 'python3'
" Refactor
nmap ,ref :h pymode-rope-refactoring

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

" closetag
let g:closetag_filenames = '*.html,*.xhtml,*.css,*.js,*.jsx'

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

" Vim devicons
set encoding=utf8
" change folder orange
highlight! link NERDTreeFlags NERDTreeDir

" Gitgutter
nmap git :GitGutterToggle<CR>

" minimap
" leader mm, mc
let g:minimap_highlight='Visual'

"  -   -   -   -   -   -   -   -   -   -
" Settings
"  -   -   -   -   -   -   -   -   -   -
syntax on
" Seperate File
"
" Settings
source ~/dotfiles/vim/settings/settings.vim
" Neovim Settings
source ~/dotfiles/vim/settings/neovim.vim
" Find Grep Settings
source ~/dotfiles/vim/settings/find_grep.vim

"Programming Settings
" Html css js json yaml
source ~/dotfiles/vim/settings/1-htmlCssJs.vim
" C and C++
source ~/dotfiles/vim/settings/2-c.vim
" Python
source ~/dotfiles/vim/settings/3-python.vim
