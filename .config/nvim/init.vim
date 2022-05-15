"
"           888b    888 888     888 8888888 888b     d888
"           8888b   888 888     888   888   8888b   d8888
"           88888b  888 888     888   888   88888b.d88888
"           888Y88b 888 Y88b   d88P   888   888Y88888P888
"           888 Y88b888  Y88b d88P    888   888 Y888P 888
"           888  Y88888   Y88o88P     888   888  Y8P  888
"           888   Y8888    Y888P      888   888   "   888
"           888    Y888     Y8P     8888888 888       888
"
"           Author        EthanM <cywinskimoss@gmail.com>
"

" PLUGINS: ---------------------------------------------------------------- {{{
" Install vim-plug if not already installed
set nocompatible
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
let install_plugins = 0
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    let install_plugins = 1
endif

call plug#begin()
Plug 'ryanoasis/vim-devicons'
Plug 'sainnhe/gruvbox-material'
Plug 'vim-airline/vim-airline'
call plug#end()

if install_plugins == 1
    echo "installing plugins"
    silent! PlugInstall
    echo "installation complete"
    q
endif

" PLUGIN SPECIFIC SETTINGS:
" -------------------------

" AIRLINE:
set noshowmode                  " get rid of shown current mode
let g:airline_powerline_fonts=1
let g:airline_theme = 'gruvbox_material'
let g:airline_right_sep=''
let g:airline_left_sep=''

let g:airline#extensions#default#section_truncate_width = {}


" NETRW:
"let g:netrw_banner = 0
"let g:netrw_liststyle = 3
"let g:netrw_browse_split = 4
"let g:netrw_altv = 1
"let g:netrw_winsize = 15

"augroup ProjectDrawer
"  autocmd!
"  autocmd VimEnter * :Vexplore
"augroup END


" }}}

" VIM SETTINGS: ----------------------------------------------------------- {{{

if has('termguicolors')
    set termguicolors
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
set background=dark
colorscheme gruvbox-material

syntax on
"set viminfo+=n~/.vim/viminfo
"set cmdheight=1
set ignorecase                  " case insensitve searching
set smartcase                   " if searching in caps be sensitive
set nowrap                      " No line wrapping.
set cc=80                       " set colour column (max line length)
set hlsearch                    " hightlight search
set scrolloff=10                " set scrolloff limits
set number                      " Absolute line number
set relativenumber              " Realtive numbers elsewhere
set foldcolumn=1                " set addiditonal margin left
set incsearch                   " better searching
set showcmd                     " show partial command
set showmatch
set wildmenu                    " autocomplete on menu
set wildmode=list:longest       " bashlike completion
set cursorline                  " line higlight on cursor
set mouse=a                     " allow mouse use on buffer

set expandtab                   " spaces not tabs
set smarttab                    "
set shiftwidth=4
set tabstop=4
set autoindent
set smartindent

set clipboard=unnamedplus       " sets clipboard to system

" removing old vim stuff
set nobackup                    " no need
set nowritebackup               " no need
set noswapfile                  " no swapfile
set noerrorbells                " old bells
set novisualbell                " visual bells

" }}}

" MAPPINGS: --------------------------------------------------------------- {{{

" Setting leader
nnoremap <SPACE> <Nop>
nmap <SPACE> <LEADER>


" }}}

" VIMSCRIPT: -------------------------------------------------------------- {{{

" This will enable code folding.
" Use the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" More Vimscripts code goes here.

" }}}

" EOF
