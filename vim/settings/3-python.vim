

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

" shortcut python print
"imap ,pr print()<ESC>==f(<right>a
imap ,pr print()<ESC>==f(a

" pdbg
nmap pdbg :!python3 %

" shortcut if name == main
imap ,inm if __name__ == "__main__":
