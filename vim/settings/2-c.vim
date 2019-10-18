
" c/c++ settings
au bufnewfile,bufread *.h,*.c,*.cpp,*.c++
\ set tabstop=4 |
\ set softtabstop=4 |
\ set shiftwidth=4 |
\ set autoindent |
\ set expandtab |
\ set fileformat=unix |
\ set filetype=c.doxygen |
\ set colorcolumn=90 |
\ hi ColorColumn ctermbg=darkgray |

" compile c/c++ -
" 	% current file
" 	< remove extension and dot
nmap cpr :!gcc % -o %< && ./%< <CR>
nmap cpr :!g++ % -o %< && ./%< <CR>


