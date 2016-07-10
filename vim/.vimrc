""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM SETTINGS
"
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"
set nocompatible
filetype off

" Sets how many lines of history VIM has to remember
set history=700

" With a map leader it's possible to do extra key combinations
let mapleader = ","
let g:mapleader = ","

" Quickly source this file
nnoremap <leader>sv :source ~/.vimrc<return>

" Set to auto read when a file is changed from the outside
set autoread

" Fast saving
nmap <leader>w :w!<cr>

" :W sudo saves the file 
" (useful for handling the permission-denied error)
command! W w !sudo tee % > /dev/null

" Toggle paste mode
set pastetoggle=<F5>

" Tab settings
filetype plugin indent on
set tabstop=4
set shiftwidth=2
set expandtab

" Always show some lines after the cursor
set scrolloff=8

" Wrap lines, but only insert newlines when enter is pressed
set wrap " Wrap words visually
set linebreak " wrap only at the 'breakat' option
set nolist " list disables linebreak
" Prevent Vim from automatically inserting line 
"   breaks in newly entered text
set textwidth=0
set wrapmargin=0

" Turn on line numbers
set number

" Spell check commit messages, text, and markdown files
autocmd BufNewFile,BufRead *.md setlocal spell
autocmd BufNewFile,BufRead *.txt setlocal spell
autocmd BufNewFile,BufRead COMMIT_EDITMSG setlocal spell

" Open split windows below / to the right
set splitbelow
set splitright

" Fix Alt+Key combinations in the terminal
let c='a'
while c <= 'z'
  exec "set <M-".toupper(c).">=\e".c
  exec "imap \e".c." <M-".toupper(c).">"
  let c = nr2char(1+char2nr(c))
endw

" Get rid of the delay when pressing the ESC key to exit insert mode
set timeoutlen=1000 ttimeoutlen=0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Moving around
"
" Faster window switching
nmap <c-j> <c-w>j
nmap <c-k> <c-w>k
nmap <c-l> <c-w>l
nmap <c-h> <c-w>h

" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search Options
" 
" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Makes search act like search in modern browsers
set incsearch 

" Don't redraw while executing macros (good performance config)
set lazyredraw 

" For regular expressions turn magic on
set magic

" Don't highlights all search hits
set nohlsearch

" Toggle search highlighting
nnoremap <F3> :set hlsearch!<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" User Interface
" 
" Show matching brackets when text indicator is over them
set showmatch 
" How many tenths of a second to blink when matching brackets
set mat=2

" Enable 256 colors
set t_Co=256

" Syntax highlighting
syntax enable

" Use the vim wildmenu for command completion
set wildmenu
set wildmode=longest:full,full

" Ignore files in the wildmenu
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,.meteor/*


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Filetypes
"
" Force *.md files to be recognized as markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Plugins
"
call plug#begin('~/.vim/plugged')

" Get some sensible default settings
Plug 'tpope/vim-sensible'

" Yank and delete without worry
Plug 'maxbrunsfeld/vim-yankstack'

" Auto-close parens, brackets, quotes, etc.
Plug 'jiangmiao/auto-pairs'

" Handy mappings for deleting, changing, and adding parenthesis, brackets, etc
Plug 'tpope/vim-surround'

" Easier moving around between tabs, args, etc
Plug 'tpope/vim-unimpaired'

" Helpful commenting mappings
Plug 'tpope/vim-commentary'

" Add . repeat support for many plugins
Plug 'tpope/vim-repeat'

" Useful git mappings
Plug 'tpope/vim-fugitive'

" Helpful git icons in the gutter
Plug 'airblade/vim-gitgutter'

" Nice visualization of directories
Plug 'scrooloose/nerdtree'

" Fuzzy file finder
Plug 'ctrlpvim/ctrlp.vim'

" The ultimate snippet solution
Plug 'SirVer/ultisnips'

" Giant collection of snippets
Plug 'honza/vim-snippets'

" Vim auto-completion support
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }

" Helpful for making YCM and Ultisnips play nice together
Plug 'ervandew/supertab'

" Add git flags support to NerdTree
Plug 'Xuyuanp/nerdtree-git-plugin'

" A light and configurable status/tab line
Plug 'itchyny/lightline.vim'

" Visually display indent levels
Plug 'Yggdroot/indentLine'

" Color schemes!
Plug 'flazz/vim-colorschemes'

" Allow for pressing F8 to cycle through themes
Plug 'felixhummel/setcolors.vim'

" Interactive command execution
Plug 'Shougo/vimproc.vim', { 'do': 'make' }

" Indenting for JavaScript and TypeScript files
Plug 'jason0x43/vim-js-indent', { 'for': ['javascript', 'typescript'] }

" TypeScript syntax and highlighting
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }

" TypeScript IDE goodies
Plug 'Quramy/tsuquyomi', { 'for': 'typescript' }

call plug#end()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CtrlP Configuration
"
" Change the default mapping
let g:ctrlp_map = '<C-f>'

" Show hidden files too
let g:ctrlp_show_hidden = 1

" Ignore some files when fuzzy searching
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.?(git|hg|svn|meteor|bundle|node_modules|bower_components|dist)$',
  \ 'file': '\v\.(so|swp|zip)$'
  \ }


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree configuration
"
" Toggle NERDTree shortcut
map ,nt :NERDTreeToggle<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-fugitive git shortcuts
"
nnoremap <leader>gs :Gstatus<return>
nnoremap <leader>gd :Gdiff<return>
nnoremap <leader>gb :Gblame<return>
nnoremap <leader>gr :Gread<return>
nnoremap <leader>gc :Gcommit<return>
nnoremap <leader>gw :Gwrite<return>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-unimpaired extensions
"
nmap [g :tabprev<return>
nmap ]g :tabnext<return>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Color scheme setup
"
set background=light
let g:solarized_termcolors=256
colorscheme triplejelly


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" YouCompleteMe setup
"
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" UltiSnips setup
"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
