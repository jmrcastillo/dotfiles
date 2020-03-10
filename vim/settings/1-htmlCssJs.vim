

" SNIPPETS:
" Read an empty html template and move cursor to the line
"nmap ,html :-1read $HOME/.vim/.skeleton.html<CR>3jwf<i
nmap ,html :-1read ~/dotfiles/vim/.skeleton.html<CR>9jwf<i

au bufnewfile,bufread *.css,*.html,*.js,*.c:
\ set tabstop=4 |
\ set softtabstop=4 |
\ set shiftwidth=4 |
\ set autoindent |
\ set expandtab |
\ set fileformat=unix |
\ set textwidth=150 |

" console log shortcut
imap ,cl console.log()<Esc>==f(a
" shortcut link js
imap ,ljs <script src=".js"> </script><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left>
" shortcut link css
imap ,lcs <link rel="stylesheet" type="text/css"href=".css"><left><left><left><left><left><left>

" json
au BufNewFile,BufRead *.json set filetype=json

augroup json_autocmd
	autocmd!
	autocmd FileType json setlocal autoindent
	autocmd FileType json setlocal tabstop=2
	autocmd FileType json setlocal shiftwidth=2
	autocmd FileType json setlocal softtabstop=2
	autocmd FileType json setlocal formatoptions=tcq21
	autocmd FileType json setlocal foldmethod=syntax
augroup END

" yaml
au FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
