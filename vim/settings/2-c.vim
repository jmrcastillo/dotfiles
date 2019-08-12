

" c/c++
au BufRead,BufNewFIle *.h,*.c:
\ set filetype=c.doxygen |
\ set colorcolumn=90 |
\ set hi ColorColumn ctermbg=darkgray |

" compile c/c++ -
" 	% current file
" 	< remove extension and dot
nmap cpr :!gcc % -o %< && ./%< <CR>
nmap cpr :!g++ % -o %< && ./%< <CR>


