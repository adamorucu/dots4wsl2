" ### Auto Commands
autocmd! bufwritepost .vimrc source %  " Autoload .vimrc when changed

augroup AdamsAuto
  autocmd!
  autocmd bufwritepost init.vim source %    " Autoload .vimrc when changed
  autocmd BufWritePre *.py :%s/\s\+$//e
	autocmd FileType markdown set wrap        " Wraps markdown files
augroup END

set encoding=utf-8
" ######## General Settings ########
set number            " Line numbering
set relativenumber    " Relative line numbering
set ruler 						" Show current line and character number
set shortmess=atI     " Don't display message on start page
set guicursor=        " Block cursor

set tabstop=2         " Tab = 2 spaces
set shiftwidth=2      " Number of spaces used for (auto)indent
set expandtab         " Replaces tabs with spaces
set ai                " Auto indent
set smartindent       " Smart indent

set hlsearch          " Highlight items found in the search
set incsearch         " Incrementally highlight whilst typing in search
set ignorecase        " Case insensitive search
set smartcase         " If search capital letter then case sensitive

set hidden            " You are allowed to switch buffers without saving
set cmdheight=1       " Height of the command line
set updatetime=300    " Swap file creation frequency

set colorcolumn=80    " Show a line on 80th character
set nowrap 						" Text doesn't wrap at the end of line
set spell             " Check spelling of text

filetype plugin on
set nocompatible

set pt=<leader>p      " Paste mode toggle
set wildmenu          " Menu with completion
set showtabline=2     " Always display tabline
set noshowmode        " Don't show current mode (because there is the airline)

set scrolloff=5 			" Start scrolling 5 lines before end

" ######## Imports ########
call plug#begin('~/.vim/plugged')
Plug 'https://github.com/rafi/awesome-vim-colorschemes'		" Color schemes
Plug 'sheerun/vim-polyglot' 															" Language packs
Plug 'tpope/vim-commentary' 															" Commenting code
Plug 'tpope/vim-surround' 																" Surround text
Plug 'tpope/vim-fugitive' 																" Git
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } 			" Fuzzy file finder
Plug 'junegunn/fzf.vim' 																	" Fuzzy file finder
Plug 'neoclide/coc.nvim', {'branch': 'release'}           " Completion
Plug 'vimwiki/vimwiki'                                    " Vim wiki
Plug 'scrooloose/nerdtree'                                " File navigation
Plug 'bling/vim-airline'                                  " Airline
Plug 'junegunn/goyo.vim'                                  " Focused theme
call plug#end()

" ######## Themes ########
syntax on             " Syntax highlighting
set termguicolors     " Enable true colors support
set background=dark
colorscheme gruvbox

" ### Airline
let g:airline_powerline_fonts = 1
let g:airline_enable_syntastic = 1
let g:airline#extensions#tabline#buffer_nr_format = '%s '
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#fnamecollapse = 0
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_left_sep = ''
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_right_sep = ''
" let g:airline_symbols.maxlinenr = ''
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
" let g:airline_symbols = 'L '

" ######## Navigation ########
let mapleader=" "
" ### File
set path+=**

let NERDTreeIgnore=['\~$', '.o$', 'bower_components', 'node_modules', '__pycache__']
let NERDTreeWinSize=30

nnoremap <leader>ff :Files<CR>              " Search in files
nnoremap <leader>fg :GFiles<CR>             " Search in git project
nnoremap <leader>fr :Rg<CR>                 " Ripgrep

nnoremap <leader>ft :NERDTreeToggle<CR>     " File tree

nnoremap <leader>cd :lcd %:h<CR>            " cd to directory containing file

" ### Window Navigation
" Change window
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
" Window size
nnoremap <Up> :resize +2<CR>
nnoremap <Down> :resize -2<CR>
nnoremap <Left> :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>
" Window split
nnoremap <leader>" :vsp<CR>               " Vertical split
nnoremap <leader>% :sp<CR>                " Horizontal split

" ### Buffer navigation
nnoremap <leader>b :Buffers<CR>           " List buffers
nnoremap <leader>m :bnext<CR>             " Next buffers
nnoremap <leader>n :bprev<CR>             " Previous buffers
nnoremap <leader>x :bd!<CR>               " Delete buffer


" ### Code Navigation
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader> gy <Plug>(coc-type-definition)

" ######## Other Maps ########
nmap <leader>pr :CocCommand python.execInTerminal<CR>   " Execute python code in terminal

nnoremap <C-j> o<ESC>k																	" Create empty line below
nnoremap <C-k> O<ESC>j																	" Create empty line above

nnoremap <leader>; :set hlsearch! hlsearch?<CR>          " Clear highlight

nnoremap <leader>pfw :CocSearch <C-R>=expand("<cword>")<CR><CR>

nnoremap <leader>K :call <SID>show_documentation()<CR>

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

" Note taking
let g:vimwiki_list = [{'path': '/mnt/c/Users/adamd/Dropbox/vimnotes',
      \'syntax': 'markdown', 'ext': '.md',
      \'auto_diary_index': 1}]

" Vimwiki Journal
nnoremap <leader>vj :VimwikiMakeDiaryNote<CR>:Goyo<CR>G:put=expand('%:t:r')<CR>:put=strftime('%H:%M %A')<CR>i> <esc>kkJi# <esc>Go<CR>
nnoremap <leader>vg :VimwikiGenerateLinks<CR>
nnoremap <leader>va :VimwikiDiaryIndex<CR>
nnoremap <leader>vi :VimwikiIndex<CR>

" Goyo
let g:goyo_width=100

" ######## Functions ########
"
" Delete white spaces
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~# '\s'
endfunction

" Show documentation
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

