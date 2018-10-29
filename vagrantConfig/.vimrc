set nocompatible              " be iMproved, required
filetype off                  " required




let g:ale_linters = {
\   'javascript': ['standard'],
\}
let g:ale_fixers = {'javascript': ['standard']}

let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1


inoremap " ""<left>
inoremap ' ''<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

imap jj <Esc>
set number
set expandtab
set shiftwidth=2
set softtabstop=2
set laststatus=2 " Always display the statusline in all windows
set showtabline=2 " Always display the tabline, even if there is only one tab
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
set t_Co=256



filetype plugin on
set omnifunc=syntaxcomplete#Complete
let g:indentLine_char = '▏'
let g:indentLine_enabled = 1

"--FOLDING --
"set foldmethod=syntax "syntax highlighting items specify folds
set foldmethod=indent "indent highlighting items specify folds
set foldcolumn=1 "defines 1 col at window left, to indicate folding
let javaScript_fold=1 "activate folding by JS syntax
set foldlevelstart=99 "start file with all folds opened
set runtimepath^=~/.vim/bundle/ctrlp.vim
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
 let mapleader= ","
 map <leader>h :wincmd h<CR>
 map <leader>j :wincmd j<CR>
 map <leader>k :wincmd k<CR>
 map <leader>l :wincmd l<CR>
