set nocompatible               " be iMproved
let mapleader=" "
inoremap ;l <Esc>l
vnoremap < <gv
vnoremap > >gv
vnoremap p "_dP
nmap U <C-R>
nmap ' ciw'<C-r>"'<left>;l
nmap " ciw"<C-r>""<left>;l
nmap ;' di'hPl2x
nmap ;" di"hPl2x
nnoremap dx "_d
nnoremap x "_x
nnoremap mn :noh<CR>
nmap <Tab> i<Tab>;l
nmap <BS> i<BS>;l
nmap <CR> i<CR><Esc>
nmap s <space>w
nmap S <space>b
nmap n nzz
nmap N Nzz
nnoremap \ :lnext<CR>
map <down> g<down>
map <up> g<up>
nmap yyy maggyG`a
nmap = {v}=
nmap j gj
nmap k gk
nmap f <Leader>f
nmap F <Leader>F

let g:ycm_key_list_select_completion = ['<CR>']
map <Leader> <Plug>(easymotion-prefix)
let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
map n <Plug>(easymotion-next)
map N <Plug>(easymotion-previous)
nmap <Leader>s <Plug>(easymotion-sn)
map ] <Plug>(ale_next_wrap)
map } <Plug>(ale_previous_wrap)
set clipboard+=unnamed
set number
set nowrap
set smartindent
set smartcase
set hlsearch
set incsearch
"hi Search cterm=bold,standout
"hi Search ctermfg=LightBlue     search highlighting.. in synt. theme
set nofoldenable    " disable folding
"This unsets the last search pattern register by hitting return
set tabstop=2
set shiftwidth=2
set expandtab
set backspace=indent,eol,start
set backupcopy=yes
let macvim_skip_colorscheme = 1
syntax enable 
set laststatus=2
let g:syntastic_html_tidy_ignore_errors = ['proprietary attribute "async"']
let g:syntastic_javascript_checkers = ['eslint']
let g:snipMate = { 'snippet_version' : 1 }
"Tab titles
set t_ts=]1;
set t_fs=

"Install powerline fonts from https://github.com/powerline/fonts
"Preferred iTerm2 fonts are 13pt Inconsolata-dz and 12pt DejaVu Sans
let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#checks = []
filetype off                   " required!
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/dotfiles
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'henrik/vim-indexed-search'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'Valloric/YouCompleteMe'
Plugin 'evanleck/vim-svelte'
Plugin 'w0rp/ale'
"Plugin 'tomtom/tlib_vim'
"Plugin 'garbas/vim-snipmate'
"Plugin 'honza/vim-snippets'
"Plugin 'leafgarland/typescript-vim'
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
"Plugin 'bling/vim-airline'
"Plugin 'marijnh/tern_for_vim' "need to npm install in .vim/bundle/tern_for_vim
call vundle#end() 
filetype plugin indent on     " required!
color nightsky
set completeopt-=preview

let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'typescript': ['eslint'],
\   'css': ['eslint'],
\   'rust': ['rustfmt']
\}
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'typescript': ['eslint'],
\   'python': ['flake8'],
\   'rust': ['cargo']
\}
let g:ale_linters_explicit = 1
let g:ale_fix_on_save = 1
