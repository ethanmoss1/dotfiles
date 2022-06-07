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
"               Author        EthanM
"

" PLUGINS: ---------------------------------------------------------------- {{{
" Install vim-plug if not already installed
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
let install_plugins = 0
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    let install_plugins = 1
endif

call plug#begin()

" Appearance
Plug 'ryanoasis/vim-devicons'
Plug 'itchyny/lightline.vim'
Plug 'mhinz/vim-startify'
Plug 'lukas-reineke/indent-blankline.nvim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'OmniSharp/omnisharp-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'sainnhe/gruvbox-material'

call plug#end()

if install_plugins == 1
    echo "installing plugins"
    silent! PlugInstall
    echo "installation complete"
    q
endif

" PLUGIN SPECIFIC SETTINGS:
" -------------------------

" LIGHTLINE:
set noshowmode                          " get rid of shown current mode
let g:lightline = {'colorscheme': 'gruvbox_material'}

" NETRW:
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 15

" CoC:
inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"


" }}}

" VIM SETTINGS: ----------------------------------------------------------- {{{

set nocompatible
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
set ignorecase                          " case insensitve searching
set smartcase                           " if searching in caps be sensitive
set nowrap                              " No line wrapping.
set cc=80                               " set colour column (max line length)
set hlsearch                            " hightlight search
set scrolloff=10                        " set scrolloff limits
set sidescrolloff=5                     " horizontal scroll off
set number                              " Absolute line number
"set relativenumber                     " Realtive numbers elsewhere
set foldcolumn=1                        " set addiditonal margin left
set incsearch                           " better searching
set showcmd                             " show partial command
set showmatch
set wildmenu                            " autocomplete on menu
set wildmode=full:longest               " bashlike completion
set cursorline                          " line higlight on cursor
set mouse=a                             " allow mouse use on buffer
set laststatus=3                        " sets the statusline to bottom only
set shortmess+=c                        " gets rid of 'match 1 of x' messages
set signcolumn=number                   " sets very left to have signs or nums

set expandtab                           " spaces not tabs
set smarttab                            " 
set shiftwidth=4
set tabstop=4
set autoindent
set smartindent

set clipboard=unnamedplus               " sets clipboard to system

" removing old vim stuff
set nobackup                            " no need
set nowritebackup                       " no need
set noswapfile                          " no swapfile
set noerrorbells                        " old bells
set novisualbell                        " visual bells

" }}}

" MAPPINGS: --------------------------------------------------------------- {{{

" Leader Mappings
nnoremap <SPACE> <Nop>
nmap <SPACE> <LEADER>

nmap <LEADER>v :e $XDG_CONFIG_HOME/nvim/init.vim<CR>  " open vimrc
nmap <LEADER>c :source $MYVIMRC<CR>     " Source VIMRC (or INIT.VIM)
nmap <LEADER>p :Lexplore<CR>            " Open 'project draw'

" Other mappings:
nmap Q @q                               " run Q recording with shift q

" changing how arrowkeys work on wildmenu to be more intuitive
set wildcharm=<C-Z>
cnoremap <expr> <up> wildmenumode() ? "\<left>" : "\<up>"
cnoremap <expr> <down> wildmenumode() ? "\<right>" : "\<down>"
cnoremap <expr> <left> wildmenumode() ? "\<up>" : "\<left>"
cnoremap <expr> <right> wildmenumode() ? " \<bs>\<C-Z>" : "\<right>"

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
