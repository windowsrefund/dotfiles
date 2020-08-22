set iskeyword+=-                        " Treat dash separated words as a word text object
set formatoptions-=cro                  " Stop newline continution of comments

if !exists('g:vscode')
  set list
  set listchars=tab:▸\ ,trail:·,precedes:←,extends:→,eol:↲,nbsp:␣
  syntax enable                           " Enables syntax highlighting
  set hidden                              " Required to keep multiple buffers open
  set nowrap                              " Display long lines as just one line
  set encoding=utf-8                      " The encoding displayed
  set pumheight=10                        " Popup menu size in lines
  set fileencoding=utf-8                  " The encoding written to file
  set ruler                               " Show cursor position all the time
  set cmdheight=2                         " More space for displaying messages
  set mouse=a                             " Enable the mouse
  set splitbelow                          " Horizontal splits will automatically be below
  set splitright                          " Vertical splits will automatically be to the right
  set t_Co=256                            " Support 256 colors
  set conceallevel=0                      " So that I can see `` in markdown files
  set tabstop=2                           " Use 2 spaces for a TAB
  set expandtab                           " Insert spaces when TAB is pressed.
  set shiftwidth=2                        " Indentation amount for < and > commands
  set softtabstop=2                       " Number of spaces TAB counts for in Insert mode
  set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
  set smartindent                         " Makes indenting smart
  set autoindent                          " Good auto indent
  set laststatus=2                        " Always display the status line. Use 0 to hide
  set number                              " Line numbers
  set relativenumber
  set nocursorline                        " Enable highlighting of the current line
  set background=dark                     " Tell vim what the background color looks like
  set showtabline=1                       " Show tabline when 2 or more pages open
  set noshowmode                          " We don't need to see things like -- INSERT -- anymore
  set nobackup                            " This is recommended by CoC
  set nowritebackup                       " This is recommended by CoC
  set nowritebackup
  set shortmess+=c                        " Don't pass messages to |ins-completion-menu|.
  set signcolumn=yes                      " Always show the signcolumn, otherwise it would shift the text each time
  set updatetime=300                      " Faster completion
  set timeoutlen=100                      " By default timeoutlen is 1000 ms
  set noswapfile
  set clipboard+=unnamedplus              " Use system clipboard"

  autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
endif
