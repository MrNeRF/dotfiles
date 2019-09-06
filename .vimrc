filetype on

call plug#begin('~/.vim/plugged')
	Plug 'Valloric/YouCompleteMe'
	Plug 'rdnetto/YCM-Generator'
	Plug 'Shougo/neoinclude.vim'
	Plug 'chriskempson/base16-vim'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'roxma/nvim-yarp'
	Plug 'roxma/vim-hug-neovim-rpc'
	Plug 'jiangmiao/auto-pairs'
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	Plug 'junegunn/fzf.vim'
	" Better Visual Guide
	Plug 'Yggdroot/indentLine'
	" syntax check
	"Plug 'w0rp/ale'
	" Autocomplete
	Plug 'ncm2/ncm2'
	Plug 'roxma/nvim-yarp'
	Plug 'ncm2/ncm2-bufword'
	Plug 'ncm2/ncm2-path'
	Plug 'ncm2/ncm2-jedi'
	Plug 'tpope/vim-commentary'
	Plug 'tpope/vim-unimpaired' 
	" Formater
	Plug 'Chiel92/vim-autoformat'
	"Vimwiki
	Plug 'vimwiki/vimwiki'
	Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
	call plug#end()

" colorscheme
let base16colorspace=256
colorscheme base16-gruvbox-dark-hard
set background=dark
" True Color Support if it's avaiable in terminal
if has("termguicolors")
    set termguicolors
endif

syn on se title
set hidden
set laststatus=2
set nowrap						" don't wrap lines
set tabstop=4					" a tab is four spaces
set backspace=indent,eol,start "		 allow backspacing over everything in insert mode
set softtabstop=4
set ruler
set autoindent					" always set autoindenting on
set copyindent					" copy the previous indentation on autoindenting
set number						" always show line numbers
set shiftwidth=4				" number of spaces to use for autoindenting
set cursorline
set shiftround					" use multiple of shiftwidth when indenting with '<' and '>'
set showmatch					" set show matching parenthesis
set ignorecase smartcase		" ignore case if search pattern is all lowercase,
set noexpandtab
set smarttab					" insert tabs on the start of a line according to
set hlsearch					" highlight search terms
set incsearch					" show search matches as you type
set history=1000				" remember more commands and search history
set undolevels=1000     			" use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set wildmenu
set wildmode=full
set title               		" change the terminal's title set visualbell
set relativenumber
set nocompatible				" be iMproved, required
"set colorcolumn=80

if has('gui_running')
	set guifont=Monospace\ 13
endif
syntax enable
map <esc> :noh<cr>
"<TAB> Completiom
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" YCM dont ask everytime which ycm_extra_conf to load
let g:ycm_confirm_extra_conf = 0

" Airline
let g:airline_left_sep  = ''
let g:airline_right_sep = ''
let g:airline#extensions#ale#enabled = 1
let airline#extensions#ale#error_symbol = 'E:'
let airline#extensions#ale#warning_symbol = 'W:'


" Clang Format
map <C-K> :pyf /usr/share/clang/clang-format-6.0/clang-format.py<cr>
imap <C-K> <c-o>:pyf /usr/share/clang/clang-format-6.0/clang-format.py<cr>
function! Formatonsave()
  let l:formatdiff = 1
  pyf /usr/share/clang/clang-format-6.0/clang-format.py
endfunction
autocmd BufWritePre *.h,*.cc,*.cpp call Formatonsave()

"vimwiki
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
let g:vimwiki_list = [{'path': '~/vimwiki/','syntax': 'markdown', 'ext': '.md'}]
map <leader>md :MarkdownPreview<CR>
