autocmd! bufwritepost .vimrc source %
syntax on
set clipboard+=unnamedplus
set tabstop=2
set shiftwidth=2
set expandtab
set ai
set number
set relativenumber
set hlsearch
set ruler
set scrolloff=5
" set list
" set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
" set listchars=trail:_
set shortmess=atI
set noerrorbells
set smartindent
" set noswapfile
set hidden
" set nohlsearch
set incsearch
set nowrap
set signcolumn=no
" set colorcolumn=80

call plug#begin('~/.vim/plugged')
" Color Schemes
Plug 'https://github.com/rafi/awesome-vim-colorschemes'
" Surround
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-tbone'
" Plug 'https://github.com/dense-analysis/ale'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'https://github.com/ervandew/supertab'
Plug 'davidhalter/jedi-vim'
Plug 'junegunn/fzf',  {'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'
call plug#end()

set guifont=Consolas

" Themes
filetype on
filetype plugin indent on

colorscheme minimalist
set background=dark

let mapleader=" "

" Auto complete
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1] =~# '\s'
" endfunction
" Coc
" nnoremap <leader>ca :CocList diagnostics<CR>
" nnoremap <leader>cc :CocList commands<CR>
" nnoremap <leader>ce :CocList extensions<CR>
" Code navigation
" nmap <silent>cd <Plug>(coc-definition)
" nmap <silent>cr <Plug>(coc-references)
" nmap <silent>[g <Plug>(ale_previous_wrap)
" nmap <silent>]g <Plug>(ale_next_wrap)
" Buffers
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>m :bnext<CR>
nnoremap <leader>n :bprev<CR>
nnoremap <leader>x :bd!<CR>
"Windows
nnoremap <Up> :resize +2<CR>
nnoremap <Down> :resize -2<CR>
nnoremap <Left> :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>

" let g:ale_linters = {'python':['flake8', 'pylint']}

nmap <leader>p :Tput<CR>

" Undo Tree
set nobackup
set undodir=~/.vim/undodir
set undofile
nnoremap <leader>u :UndotreeShow<CR>

" Search
" Word
nnoremap <leader>psw :CocSearch <C-R>=expand("<cword>")<CR><CR>
" File
nnoremap <leader>ff :Files<CR>
let g:jedi#goto_command = "<leader>gc"
let g:jedi#goto_assignment = ""
let g:jedi#goto_stubs_command = ""
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "K"
let g:jedi#useges_command = "<leader>go"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"
let g:jedi#completions_enabled = 1
let g:jedi#popup_on_dot = 0


" Auto commands
augroup WrapLineInMDFile
  autocmd!
  autocmd FileType md setlocal wrap
augroup END
