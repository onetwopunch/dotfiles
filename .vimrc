"External plugins used:
" Pathogen
" NERDTree
" AutoComplPop
" DetectIndent
" L9 for autocomplete
" ACK
"
"Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

let g:NERDTreeDirArrows=0
let g:go_fmt_autosave=0
" Allows everything extracted in ~/.vim/bundle to be added to runtimepath
" For installing plugins
execute pathogen#infect()

" set tags to hidden tag file
set tags=./.tags;
:nnoremap <C-]> <C-w><C-]><C-w>T

" Make backspace behave in a sane manner.
set backspace=indent,eol,start
set expandtab
set tabstop=2
set shiftwidth=2
set smartindent

" Make powerline work on Vim
set rtp+=/usr/share/powerline/bindings/vim
set laststatus=2
set t_Co=256

"python3 from powerline.vim import setup as powerline_setup
"python3 powerline_setup()
"python3 del powerline_setup

" Switch syntax highlighting on
syntax enable
set number
let g:molokai_original = 1
let g:rehash256 = 1
colorscheme molokai
"let g:solarized_termcolors=256
"colorscheme desert
"set background=dark
"colorscheme solarized
set gfn=Monaco:h13

" clipboard
vnoremap <C-y> "+y
vnoremap <C-d> "+d


" tabs
nnoremap <C-S-Right> :tabnext<CR>
nnoremap <C-S-Left> :tabprevious<CR>
inoremap <C-S-Right> <Esc>:tabnext<CR>i
inoremap <C-S-Left> <Esc>:tabprevious<CR>i

" incremental search
set incsearch
set hlsearch

"Indent and tabs
autocmd BufReadPost * :DetectIndent
autocmd Filetype ruby setlocal ts=2 sw=2 expandtab

" Remove trailing whitespace on save
autocmd BufWritePost * :s/\s\+$//ge
autocmd BufWritePost *.* :s/\t/  /ge
autocmd BufWritePost Makefile :s/  /\t/ge

"autocomplete
set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <NUL> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" Enable file type detection and do language-dependent indenting.
" filetype plugin indent on

" Enable mouse for iTerm
if has("mouse")
    set mouse=a
endif

"let g:nerdtree_tabs_open_on_console_startup=1

" mappings
map ; :
map <Leader>n <plug>NERDTreeTabsToggle<CR>

set pastetoggle=<Leader>p

function Tags()
  ! ctags -R -f .tags; if [ -e .gitignore ] ; then echo ".tags" >> .gitignore ; fi ;
endfunction


"ctrlp
set wildignore+=*/tmp/*,*.so,*.swp,*.swo,*.zip,*/bower_components/*,*/node_modules/*
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files']

" ack
" brew install the_silver_searcher
if executable('ag')
  let g:ackprg = 'ag  --nogroup --nocolor --column --smart-case'
  cnoreabbrev ag Ack
  cnoreabbrev aG Ack
  cnoreabbrev Ag Ack
  cnoreabbrev AG Ack
endif
let g:ack_autoclose = 1
