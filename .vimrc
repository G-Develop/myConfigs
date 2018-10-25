set nocompatible              " be iMproved, required
filetype off                  " required
"to set mouse remove quotes on line below
set mouse=a
function! ToggleMouse()
    " check if mouse is enabled
    if &mouse == 'a'
        " disable mouse
        set mouse=
    else
        " enable mouse everywhere
        set mouse=a
    endif
endfunc
"=========================================================="


set clipboard=unnamed  "This will alow to copy to system's clipboard
""set cursorline
"=====================HIGHLIGHT SEARCH ===============
"set hlsearch
set ignorecase
set smartcase
""nnoremap <CR> :nohlsearch<CR><CR>
noremap <F4> :set hlsearch! hlsearch?<CR>
hi Search ctermbg=LightGrey
hi Search ctermfg=White



""  fun! SearchHighlight()
""      silent! call matchdelete(b:ring)
""      let b:ring = matchadd('ErrorMsg', '\c\%#' . @/, 101)
""  endfun
""
""  fun! SearchNext()
""      try
""          execute 'normal! ' . 'Nn'[v:searchforward]
""      catch /E385:/
""          echohl ErrorMsg | echo "E385: search hit BOTTOM without match for: " . @/ | echohl None
""      endtry
""      call SearchHighlight()
""  endfun
""
""  fun! SearchPrev()
""      try
""          execute 'normal! ' . 'nN'[v:searchforward]
""      catch /E384:/
""          echohl ErrorMsg | echo "E384: search hit TOP without match for: " . @/ | echohl None
""      endtry
""      call SearchHighlight()
""  endfun
""
""  " Highlight entry
""  nnoremap <silent> n :call SearchNext()<CR>
""  nnoremap <silent> N :call SearchPrev()<CR>
""
""  " Use <C-L> to clear some highlighting
""  nnoremap <silent> <C-L> :silent! call matchdelete(b:ring)<CR>:nohlsearch<CR>:set nolist nospell<CR><C-L>
"==========================================="



" this is for ejs highlighting:
au BufNewFile,BufRead *.ejs set filetype=html

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
"============EASY MOTION =============
Plugin 'easymotion/vim-easymotion'
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
"nmap s <Plug>(easymotion-overwin-f)
nmap fd <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
"nmap s <Plug>(easymotion-overwin-f2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
"====================================

"============SNIPMATE==========
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
"=============================




"=====Yggdroot/indentLine=======
Plugin 'Yggdroot/indentLine'
let g:indentLine_char = '▏'
let g:indentLine_enabled = 1
"==============================

"======================Ultisnips================================
" Track the engine.
Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<F3>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

"the code below got from stack over flow may not work
"" YouCompleteMe
let g:ycm_key_list_previous_completion=['<Up>']

"" Ultisnips
let g:UltiSnipsExpandTrigger="<c-tab>"
let g:UltiSnipsListSnippets="<c-s-tab>"
"=================================================================


" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'



" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
let g:ale_linters = {
\   'javascript': ['standard'],
\}
let g:ale_fixers = {'javascript': ['standard']}

let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1
"Spell-check set to F6
map <F6> :setlocal spell! spelllang=en_us<CR>

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

imap jk <Esc>
imap jj <Esc>
"uncomment below to set number
set number
"set relativenumber
"set relativenumber
"the below lets me toggel relative number with f5"
noremap <F5> :set relativenumber! relativenumber?<CR> 
set expandtab
set shiftwidth=2
set softtabstop=2
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup
set laststatus=2 " Always display the statusline in all windows
set showtabline=2 " Always display the tabline, even if there is only one tab
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
set t_Co=256

let g:powerline_pycmd = 'py3'

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-master branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'

" Initialize plugin system
call plug#end()
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'ajh17/vimcompletesme'
filetype plugin on
set omnifunc=syntaxcomplete#Complete


"Toggle function for NERDTree"
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
map <C-n> :NERDTreeToggle<CR>

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
 Plug 'airblade/vim-gitgutter'
