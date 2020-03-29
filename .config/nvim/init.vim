filetype on
set nocompatible
filetype plugin on
syntax on

call plug#begin('~/.vim/plugged')
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
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
	Plug 'machakann/vim-highlightedyank'
	" Better Visual Guide
	Plug 'Yggdroot/indentLine'
	" syntax check
	"Plug 'w0rp/ale'
	" Autocomplete
	Plug 'ncm2/ncm2'
	Plug 'ericcurtin/CurtineIncSw.vim'
	Plug 'roxma/nvim-yarp'
	Plug 'ncm2/ncm2-bufword'
	Plug 'ncm2/ncm2-path'
	Plug 'ncm2/ncm2-jedi'
	Plug 'tpope/vim-commentary'
	Plug 'tpope/vim-unimpaired' 
	Plug 'tpope/vim-fugitive' 
	Plug 'scrooloose/nerdtree'
	Plug 'Xuyuanp/nerdtree-git-plugin'
	Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
"	Plug 'ryanoasis/vim-devicons'
	"
	" Formater
	Plug 'Chiel92/vim-autoformat'
	"Vimwiki
	Plug 'vimwiki/vimwiki'
	Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
	"latex
	Plug 'lervag/vimtex'
	"syntax highlighting
	Plug 'octol/vim-cpp-enhanced-highlight'
	"debugging
	" ist buggy - lol
	" Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh \| UpdateRemotePlugins' }	
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
"set isfname
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
set inccommand=nosplit
set noexpandtab
set smarttab					" insert tabs on the start of a line according to
set hlsearch					" highlight search terms
set incsearch					" show search matches as you type
set history=1000				" remember more commands and search history
set undolevels=1000     			" use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set wildmenu
set wildmode=full
set title               			" change the terminal's title set visualbell          			" don't beep set noerrorbells        			" don't beep
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


"nerdtree
map <leader>nt :NERDTree<CR>
"term
map <leader>tm :edit term=://zsh<CR>

"latex
let g:vimtex_view_method = 'zathura'

"switch Header/Source
map <F5> :call CurtineIncSw()<CR>

"cpp syntax highlighting
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_no_function_highlight = 1

"python support
let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'

let g:loaded_clipboard_provider = 1

"coc
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if has('patch8.1.1068')
  " Use `complete_info` if your (Neo)Vim version supports it.
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
