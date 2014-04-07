" Need to call on initially to support git
filetype on
filetype off

" forget old vim
set nocompatible
set modelines=0

" Vundle initialization
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" Bundles
Bundle 'ervandew/supertab'
Bundle 'godlygeek/tabular'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-sensible'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-repeat'
Bundle 'flazz/vim-colorschemes'
Bundle 'kana/vim-textobj-user'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'Lokaltog/vim-powerline'
Bundle 'vim-scripts/YankRing.vim'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'garbas/vim-snipmate'
Bundle 'honza/vim-snippets'
Bundle 'gkz/vim-ls'
Bundle 'rking/ag.vim'

" Syntax
Bundle 'groenewege/vim-less'
Bundle 'plasticboy/vim-markdown'
Bundle 'tpope/vim-liquid'
Bundle 'wlangstroth/vim-haskell'
Bundle 'chriseppstein/vim-haml'
Bundle 'pangloss/vim-javascript'
Bundle 'wlangstroth/vim-racket'
Bundle 'vim-scripts/VimClojure'
Bundle 'juvenn/mustache.vim'
Bundle 'elixir-lang/vim-elixir'
Bundle 'vim-scripts/nginx.vim'
Bundle 'stephpy/vim-yaml'

syntax on

" vim/macvim 
if has("gui_running")
  set guioptions=egmrt
  set winaltkeys=no
  set macmeta
  set transparency=0
  set nobeval
  set listchars=tab:>\ ,eol:¬
else
  set clipboard=unnamed
endif
"macmenu File.Print key=<nop>

" colors
set t_Co=256
set background=dark
colorscheme peaksea

au BufNewFile,BufRead *.ejs set filetype=html

" tab and spaces
set nosmarttab
set noexpandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set ffs=unix,dos

" per filetype settings
autocmd Filetype ruby setlocal et ts=2 sts=2 sw=2

" backup
set undodir=~/.vim/tmp/undo//     " undo files
set backupdir=~/.vim/tmp/backup// " backups
set directory=~/.vim/tmp/swap//   " swap files
set nobackup
set nowritebackup
set noswapfile

" comments
set encoding=utf-8
set scrolloff=10
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set nocursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set undofile
set norelativenumber
set number
set foldmethod=manual

" include underscore in word movements
set iskeyword+=_

" wrapping
set nowrap
set linebreak
"set textwidth=79
"set nolinebreak
set formatoptions=qrn1
"set colorcolumn=85

" leader
let mapleader = ","

" navigation
" nnoremap <C-a> ^
" nnoremap <C-e> $

" search/move
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault "/g is default
set incsearch
set showmatch
set hlsearch
"nnoremap <tab> %
"vnoremap <tab> %
nnoremap <leader><space> :noh<cr>

" window, tab and split screen navigation
map <leader>t :tabnew<cr>
nnoremap <leader>v :vsplit<cr>
nnoremap <leader>h :split<cr>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <D-1> 1gt
inoremap <D-1> 1gt
nnoremap <D-2> 2gt
inoremap <D-2> 2gt
nnoremap <D-3> 3gt
inoremap <D-3> 3gt
nnoremap <D-4> 4gt
inoremap <D-4> 4gt
nnoremap <D-5> 5gt
inoremap <D-5> 5gt

nnoremap <C-a> ^
nnoremap <C-e> $


" misc leader mappings
nnoremap <leader>ev <C-w>s<C-w>j<C-w>L:e $MYVIMRC<cr>

" EOL chars
nmap <F3> :set list!<cr>
nnoremap <F4> :set nolist wrap!<cr>

" Trailing whitespace removal
map <f8> :%s/\s\+$//<cr>

" fold html tag
nnoremap <space> za

" ack
nnoremap <leader>a :Ag -i 

" fugitive (git)
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gc :Gcommit<cr>
nnoremap <leader>gw :Gwrite<cr>
nnoremap <leader>gr :Gread<cr>
nnoremap <leader>grm :Gremove<cr>
nnoremap <leader>gmv :Gmove<cr>

" nerdtree
map <F1> :NERDTreeToggle \| :silent NERDTreeMirror<CR>
inoremap <F1> <esc>:NERDTreeToggle<cr>
let NERDTreeIgnore=['.vim$']
au Filetype nerdtree setlocal nolist

" ctrlp
let g:ctrlp_map = ''
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_open_new_file = 'v'
let g:ctrlp_custom_ignore = { 'dir': 'node_modules$' }
nnoremap <leader>f :CtrlP<cr>
nnoremap <leader>m :CtrlPMRUFiles<cr>
nnoremap <leader>b :CtrlPBuffer<cr>
nnoremap <f5> :CtrlPClearCache<cr>
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.log,.DS_Store



" Keys for ctags
map <f9> :!ctags -R --exclude=.git --exclude=.svn --exclude=log * /Users/neektza/.rbenv/versions/1.8.7-p352/lib/ruby/gems/1.8/gems/* /Users/neektza/.rbenv/versions/1.9.2-p290/lib/ruby/gems/1.9.1/gems/*
nnoremap <M-]> <C-]>
nnoremap <M-[> <C-t>
nnoremap <M-n> :tn<cr>
nnoremap <M-p> :tp<cr>

" substitute under visual
function! GetVisual() range
    let reg_save = getreg('"')
    let regtype_save = getregtype('"')
    let cb_save = &clipboard
    set clipboard&
    normal! ""gvy
    let selection = getreg('"')
    call setreg('"', reg_save, regtype_save)
    let &clipboard = cb_save
    return selection
endfunction
vmap <leader>s :<c-U>%s/<c-r>=GetVisual()<cr>/

" Markdown, disable folding
let g:vim_markdown_folding_disabled=1

" Various shortcuts for fugitive
nnoremap <leader>gw :Gwrite<cr>
nnoremap <leader>gr :Gread<cr>
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gc :Gcommit<cr>

" Other shortcuts
inoremap jj <Esc>l
inoremap kk <Esc>l

" up/down through wraps
nnoremap j gj
nnoremap k gk

" MacVIM OSX integration
if has("gui_running")
  nnoremap <D-z> u 
  nnoremap <D-S-z> <C-r>
endif

map <leader>jt <Esc>:%!json_xs -f json -t json-pretty<CR>

if has('conceal')
	if has('autocmd')
		autocmd Syntax * syn keyword Operator not conceal cchar=¬
		autocmd Syntax * syn keyword Operator lambda conceal cchar=λ
		autocmd Syntax ruby syn match rubyKeyword "->" conceal cchar=λ
		autocmd Syntax haskell syn match hsKeyword "\\" conceal cchar=λ
	endif
	hi! link Conceal Operator
	set conceallevel=2
endif
