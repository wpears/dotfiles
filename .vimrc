set nocompatible               " be iMproved
let mapleader=" "
inoremap ;l <Esc>l
vnoremap < <gv
vnoremap > >gv
nmap U <C-R>
nmap ' ciw'<C-r>"'<left>;l
nmap " ciw"<C-r>""<left>;l
nmap ;' di'hPl2x
nmap ;" di"hPl2x
nnoremap dx "_d
nnoremap mn :noh<CR>
nmap <Tab> i<Tab>;l
nmap <BS> i<BS>;l
nmap <CR> i<CR><Esc>
nmap s <space>w
nmap S <space>b
nmap n nzz
nmap N Nzz
nnoremap l<CR> :lnext<CR>
map <down> g<down>
map <up> g<up>
nmap yyy maggyG`a
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
set clipboard+=unnamed
set number
set nowrap
set smartindent
set smartcase
set hlsearch
set incsearch
"hi Search cterm=bold,standout
"hi Search ctermfg=LightBlue     search highlighting.. in synt. theme
"This unsets the last search pattern register by hitting return
set tabstop=2
set shiftwidth=2
set expandtab
set backspace=indent,eol,start
let macvim_skip_colorscheme = 1
set term=xterm-256color
set t_Co=256
syntax enable 
let g:syntastic_html_tidy_ignore_errors = ['proprietary attribute "async"']

filetype off                   " required!
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/vundle'
Plugin 'flazz/vim-colorschemes'
Plugin 'scrooloose/syntastic'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'henrik/vim-indexed-search'
Plugin 'Valloric/YouCompleteMe'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
call vundle#end() 
filetype plugin indent on     " required!
