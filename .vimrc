set nocompatible
" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
syntax on

" Set to my favorite color scheme
colorscheme zenburn

" Set to always show the numbers on the left
set number

" Always show highlighting of the line my cursor is on
set cursorline

" Turn on search highlighting
set hlsearch
hi Search ctermbg=LightBlue
hi Search ctermfg=Black

" Clear seach highlights
noremap <leader><space> :noh<cr>:call clearmatches()<cr> 

" Set end of line listchar
set list
set listchars=tab:▸\ ,eol:¬

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
call pathogen#infect()
filetype plugin indent on
if has("autocmd")
  filetype plugin indent on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set smartindent     " These commands set the
set tabstop=4       " tab tabbing to 4 spaces
set shiftwidth=4    " istead of the standard.
set expandtab       " It also set some auto indenting
set autoindent      " 
set cindent         " 
set softtabstop=4   " 

"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

" Key Bindings
imap <leader>'      ''<ESC>i
imap <leader>(      ()<ESC>i
imap <leader>[      []<ESC>i
imap <leader>"      ""<ESC>i
imap <leader>{      {}<ESC>i
imap <leader>`      ``<ESC>i
nmap <leader>ne     :NERDTreeToggle<CR>
map <leader>]      <ESC>A {<CR>}<ESC>O
imap <leader>]      <ESC>A {<CR>}<ESC>O
imap <F2>           <ESC>A;<ESC>
imap ^[             <ESC>
cmap W              w

" LaTeX Key Bindings
map <leader>be  o\begin{equation*}<CR>\end{equation*}<ESC>O
map <leader>ba  o\begin{align*}<CR>\end{align*}<ESC>O

" Do some python shit
set rtp+=$HOME/.local/lib/python3.2/site-packages/powerline/bindings/vim/

" Always show statusline
set laststatus=2

" Disable the auto comment when newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
"
" " Use 256 colours (Use this setting only if your terminal supports 256
" colours)
 set t_Co=256

 " Define some macros
let @q = "ggi#include <stdio.h>\n\nint main( void ) {\n}^["

" Auto-save folds
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview
