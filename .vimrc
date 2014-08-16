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
nnoremap <Leader>f H<Leader>f
let g:EasyMotion_leader_key = '<Leader>'
set clipboard+=unnamed
set number
set nowrap
set smartindent
set smartcase
set hlsearch
set incsearch
"hi Search cterm=bold,standout
"hi Search ctermfg=LightBlue     search highlighting.. in synt. theme
"This unsets the "last search pattern" register by hitting return
set tabstop=2
set shiftwidth=2
set expandtab
let macvim_skip_colorscheme = 1
set term=xterm-256color
set t_Co=256
colorscheme grb256
syntax enable 
let g:syntastic_html_tidy_ignore_errors = ['proprietary attribute "async"']
set nocompatible               " be iMproved
filetype off                   " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'scrooloose/syntastic'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'henrik/vim-indexed-search'
filetype plugin indent on     " required!
