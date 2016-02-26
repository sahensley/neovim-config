call plug#begin('~/.config/nvim/plugged')
" Seoul256 - color scheme
Plug 'junegunn/seoul256.vim'
" Airline - fancy statusline
Plug 'vim-airline/vim-airline'
" BufExplorer - easier buffer switching
Plug 'jlanzarotta/bufexplorer'
" NERDTree - file browser
Plug 'scrooloose/nerdtree'
" Commentary - easy commenting via 'g c'
Plug 'tpope/vim-commentary'
" Fugitive - git wrapper
Plug 'tpope/vim-fugitive'
" Neomake - asynchronous make and syntax checking
Plug 'benekastah/neomake'
" indentLine - shows indention levels with 'set list' on
Plug 'yggdroot/indentline'
" BetterWhitespace - whitespace highlighting
Plug 'ntpeters/vim-better-whitespace'
" Scratch - scratch buffer
Plug 'mtth/scratch.vim'
" Vimwiki - personal wiki
Plug 'vimwiki/vimwiki'
call plug#end()

" Turn on automatic backups and set path
" Check if backup dir exists, if not create
if !isdirectory($HOME . '/.vimhodgepodge/backups')
    silent! call mkdir($HOME . '/.vimhodgepodge/backups','p')
endif
set backupdir=$HOME/.vimhodgepodge/backups

" Check if tmp dir exists, if not create
if !isdirectory($HOME . '/.vimhodgepodge/tmp')
    silent! call mkdir($HOME . '/.vimhodgepodge/tmp','p')
endif
set directory=$HOME/.vimhodgepodge/tmp

" Check if view dir exists, if not create
if !isdirectory($HOME . '/.vimhodgepodge/view')
    silent! call mkdir($HOME . '/.vimhodgepodge/view','p')
endif
set viewdir=$HOME/.vimhodgepodge/view

" Check if view dir exists, if not create
if !isdirectory($HOME . '/.vimhodgepodge/session')
    silent! call mkdir($HOME . '/.vimhodgepodge/session','p')
endif
let g:sessiondir=$HOME . '/.vimhodgepodge/session'

" Check if wiki dir exists, if not create
if !isdirectory($HOME . '/.vimhodgepodge/wiki')
    silent! call mkdir($HOME . '/.vimhodgepodge/wiki','p')
endif

" Check if wiki_html dir exists, if not create
if !isdirectory($HOME . '/.vimhodgepodge/wiki_html')
    silent! call mkdir($HOME . '/.vimhodgepodge/wiki_html','p')
endif

set laststatus=2                " never show the status line
set nu                          " set line numbering
set rnu                         " set relative line number
set cursorline                  " highlight current line
set backspace=indent,eol,start  " delete line breaks, auto ins and start of insert mode
set hlsearch                    " Switch on search pattern highlighting.
set ch=1                        " Make command line two lines high
set mousehide                   " Hide the mouse when typing text
set showcmd                     " Show (partial) command in status line.
set showmatch                   " Show matching brackets.
set ignorecase                  " Do case insensitive matching
set smartcase                   " Do smart case matching
set incsearch                   " Incremental search
set hidden                      " Hide buffers when they are abandoned
set nowrap                      " Turn off line wrapping
set ruler                       " shows the line number on the bar
set undolevels=1000             " 1000 undos
set autoindent                  " copies indention from previous line
set smartindent                 " automatically insert extra level on indent in some cases
set tabstop=4                   " tab stops character is four spaces
set shiftwidth=4                " when pressing << >> or ==, indent a tab that is four spaces in size
set expandtab                   " spaces for tabs
set mouse=n                     " Enable mouse only in normal mode
set scrolloff=3                 " 3 lines on top and bottom when scrolling
set sidescrolloff=3             " 3 lines of buffer when side scrolling
set splitbelow                  " Split windows below current
set splitright                  " Split window to right
set linebreak                   " wrap whole word, 'list on' breaks this
set showbreak=»»»               " Character to show on wrapped lines
set foldmethod=indent           " Create folds at indents
set foldnestmax=5               " Don't go deeper than 5 nested indents
set clipboard=unnamed           " Copy contents into the system clipboard
set listchars=tab:\|\ ,trail:-,extends:>,precedes:<,nbsp:+,eol:$ " when 'list on' is set
" seoul256 (dark) range 233 (darkest) ~ 239 (lightest) default: 237
let g:seoul256_background=236
" seoul256 (light) range 252 (darkest) ~ 256 (lightest) default: 253
let g:seoul256_light_background=252
filetype plugin indent on
syntax enable                   " syntax highlighting
set background=dark             " Use dark backgrounds. If using seoul256-light, set to light.
colorscheme seoul256            " Use seoul256. Change to seoul256-light if wanted.
set colorcolumn=81              " Highlight column 81
au VimResized * :wincmd =       " auto resize split windows on parent resize
nmap <Space> <Leader>

" Load matchit.vim, but only if the user hasn't installed a newer version.
" From TPope's sensible.vim
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

" Vimwiki plugin configuration
let g:vimwiki_list = [{'path': '~/.vimhodgepodge/wiki',
            \ 'path_html': '~/.vimhodgepodge/wiki_html',
            \ 'syntax': 'markdown', 'ext': '.wiki'}]

" Scratch plugin configuration
let g:scratch_top = 0
let g:scratch_insert_autohide = 0
let g:scratch_autohide = 0
let g:scratch_no_mappings = 1


" Airline plugin configuration
" Don't use powerline patched fonts in airline
let g:airline_powerline_fonts = 0
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_extensions = ['branch']

" Turn on backups
set backup
" When file is written, grab the current timestamp and use as the backup
" extension.  I.E. example.txt_1970-01-01.0000.bak
:au BufWritePre * let &backupext=strftime("_%Y-%m-%d.%H%M.bak")

" restore_view.vim saves views with these options
set viewoptions=cursor,folds,slash
set sessionoptions=buffers
" Do not save buffer options which breaks syntax highlighting on restore
set sessionoptions-=options

" ###### Keymappings ######
" Easy navigation while in split and terminal modes
" Quick escape to Normal mode in a Terminal buffer.  Alt+j Alt+j.
:tnoremap <A-j><A-j> <C-\><C-n>
" Navigation from Terminal to other splits in Insert mode.  Alt+h,j,k,l.
:tnoremap <A-h> <C-\><C-n><C-w>h
:tnoremap <A-j> <C-\><C-n><C-w>j
:tnoremap <A-k> <C-\><C-n><C-w>k
:tnoremap <A-l> <C-\><C-n><C-w>l
" Navigation to splits in Normal mode.  Alt+h,j,k,l.
:nnoremap <A-h> <C-w>h
:nnoremap <A-j> <C-w>j
:nnoremap <A-k> <C-w>k
:nnoremap <A-l> <C-w>l

" Exit to Normal mode from Insert mode. j+j.
:imap jj <Esc>

" Map j and k to only move one line on the screen when word wrapped
nnoremap j gj
nnoremap k gk

" Unmap Ex mode
nnoremap Q <Nop>

" Map the Function keys
" unmap F1
inoremap <F1> <Nop>
nnoremap <F1> <Nop>
vnoremap <F1> <Nop>
" Turn off highlighting
:nnoremap <F1> :nohlsearch<CR>
" Toggle paste mode
:nnoremap <F2> :set paste! paste?<CR>
" Toggle spell check
:nnoremap <F3> :set spell! spell?<CR>
" Goto previous tab (moves forward/right)
:nnoremap <F9> :tabprevious<CR>
" Goto next tab (moves forward/right)
:nnoremap <F10> :tabNext<CR>
" Goto previous buffer (moves backward/left)
:nnoremap <F11> :bprevious<CR>
" Goto next buffer (moves forward/right)
:nnoremap <F12> :bNext<CR>

" Map NERDTree quick access
nnoremap <C-n> :NERDTreeToggle<cr>

