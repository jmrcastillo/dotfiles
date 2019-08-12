

" Find vimgrep
" :vimgrep jibr **/*.py
" open list ---> ovg
"
" FLAG
" a - all
" c - confirm
" g - global
nmap vg :vimgrep<space>
" open vimgrep
nmap ovg :cw<CR>

" local replace
nmap gr gd[{v%::s/<c-r>///gc<left><left><left>

" change word in all file directory
" sample :cfdo %s/old/new/gc  | :w
nmap cwa :cfdo %s///gc

" search and replace
nmap sr yiw:%s/\<<C-r>"\>//gc<left><left><left>

