" MY VIMRC FILE
" Using vim-plug
"
" HOW TO SETUP:
" 1. curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"
" 2. :PlugInstall

set nocompatible

""" PLUGINS
call plug#begin()

Plug 'preservim/nerdtree'
Plug 'preservim/tagbar'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround' " ysw)
Plug 'vim-airline/vim-airline'
Plug 'sheerun/vim-polyglot'

" Theming
Plug 'ayu-theme/ayu-vim'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons' " Should be loaded last

call plug#end()


""" VIMOPTS
syntax on
set scrolloff=8
set nowrap
set number
set relativenumber

set autoindent
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4

set hlsearch
set ignorecase
set smartcase

set linebreak
set noerrorbells
set mouse=a
set backspace=indent,eol,start

set viminfo='100,<2000,s100,h
set encoding=UTF-8


""" REMAPS
let mapleader = "\<space>"

" Cycle tabs with tab
nnoremap <Tab> :tabn<CR>

" Change Window
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Resize Window
noremap <C-Left> <C-w><
noremap <C-Right> <C-w>>
noremap <C-Up> <C-w>+
noremap <C-Down> <C-w>-

" Keep search term centered
nnoremap n nzzzv
nnoremap N Nzzzv

" Move selected lines
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Search and replace all instances
nnoremap <leader>s :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>

" Keep selection when shifting
vnoremap > >gv
vnoremap < <gv

" Movement in insert mode
inoremap <C-h> <C-O>h
inoremap <C-j> <C-O>j
inoremap <C-k> <C-O>k
inoremap <C-l> <C-O>l

" NerdTree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-t> :NERDTree<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
let NERDTreeShowHidden=1
" Start NERDTree and put the cursor back in the other window.
" autocmd VimEnter * NERDTree | wincmd p
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
" Open copy of tree in new tabs
autocmd BufWinEnter * silent NERDTreeMirror

" Commentary
imap <C-_> <Plug>CommentaryLine
nmap <C-_> <Plug>CommentaryLine
vmap <C-_> <Plug>Commentary

" Tagbar
nmap <C-m> :TagbarToggle<CR>

" Airline
let g:airline_theme='zenburn'
let g:airline_powerline_fonts = 1


""" COLORSCHEME

set termguicolors
let ayucolor="dark"
colorscheme ayu

hi Comment cterm=italic
" hi Normal     ctermbg=NONE guibg=NONE
" hi LineNr     ctermbg=NONE guibg=NONE
" hi SignColumn ctermbg=NONE guibg=NONE
" hi Comment guifg=#5C6370 ctermfg=59
" hi LineNr ctermbg=NONE guibg=NONE
