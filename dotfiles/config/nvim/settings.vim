" vim: set fdm=marker foldlevel=0:
let g:mapleader = "\<Space>"

set timeoutlen=500                      " shorten leader timeout from default of 1000

syntax enable           								" Enables syntax highlighting
set hidden              								" Required to keep multiple buffers open
set nowrap              								" Display long lines as just one line
set encoding=utf-8      								" The encoding displayed
set fileencoding=utf-8  								" The encoding written to file
set pumheight=10        								" Popup menu size in lines
set ruler               								" Show cursor position all the time
set iskeyword+=-        								" Treat dash separated words as a word text object
set mouse=a             								" Enable the mouse
set splitbelow          								" Horizontal splits will automatically be below
set splitright          								" Vertical splits will automatically be to the right
set t_Co=256            								" Support 256 colors
set conceallevel=0                      " So that I can see `` in markdown files
set expandtab                           " Insert spaces when TAB is pressed.
set tabstop=2                           " Use 2 spaces for a TAB
set shiftwidth=2                        " Indentation amount for < and > commands
set softtabstop=2 											" Number of spaces TAB counts for in Insert mode
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set smartindent                         " Makes indenting smart
set autoindent                          " Good auto indent
set laststatus=2                        " Always display the status line. Use 0 to hide
set number                              " Line numbers
set relativenumber
" set cursorline                        " Enable highlighting of the current line
set background=dark                     " Tell vim what the background color looks like
set showtabline=2                       " Always show tabs
set noshowmode                          " We don't need to see things like -- INSERT -- anymore
set timeoutlen=500                      " By default timeoutlen is 1000 ms
" set formatoptions-=cro                  " Stop newline continution of comments
" help fo-table for definitions of options
set formatoptions=qrnj1c
set clipboard=unnamedplus               " Copy paste between vim and everything else
set foldenable
set foldcolumn=2
set noswapfile
set showbreak=↪

au! BufWritePost $MYVIMRC source %                " auto source when writing to init.vim
au! BufWritePre * %s/\s\+$//e                     " automatically deletes all trailing whitespace on save
au! BufWritePost *Xresources, *Xdefaults !xrdb %  " run xrdb whenever Xdefaults or Xresources are updated


" some old things I may still want
" set ignorecase
" set smartcase
" set regexpengine=1

" set sidescrolloff=1 sidescroll=1
" set concealcursor=nivc
" set lazyredraw
" set fillchars+=diff:⣿
" set fillchars+=vert:│
" set fillchars+=fold:-
" set listchars+=eol:¬
" set listchars+=extends:❯
" set listchars+=precedes:❮
" set listchars+=trail:⋅
" set listchars+=nbsp:⋅
" set listchars+=tab:\|\

" next line makes wal.vim plugin work
" set notermguicolors
" set guicursor=
" set nocursorline
" set nocursorcolumn

" messages and info {{{
" set noshowmatch

" tabs and indenting {{{
" set textwidth=80
" Round indent to multiple of shiftwidth. Used for < and >
" set shiftround

