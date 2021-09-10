" vim: set fdm=marker

"{{{ Settings
syntax enable
set completeopt=menuone,noinsert,noselect
set spell
set iskeyword+=-
set formatoptions-=cro
set list
set listchars=tab:▸\ ,trail:·,precedes:←,extends:→,eol:↲,nbsp:␣
set hidden
set nowrap
set encoding=utf-8
set pumheight=10
set fileencoding=utf-8
set ruler 
set scrolloff=7 
set cmdheight=2 
set mouse=a 
set splitbelow
set splitright
set t_Co=256
set conceallevel=0
set tabstop=2 
set expandtab 
set shiftwidth=2
set softtabstop=2 
set smarttab
set smartindent 
set autoindent
set laststatus=2
set number
set relativenumber
set cursorline
set background=dark 
set showtabline=1 
set noshowmode
set nobackup
set nowritebackup 
set nowritebackup
set shortmess+=c
set signcolumn=yes
set updatetime=300
set timeoutlen=500
set noswapfile
set clipboard+=unnamedplus
"}}}

"{{{ Auto Commands
au! FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
au! BufWritePost $MYVIMRC source %
" Automatically install missing plugins on startup
au! VimEnter *
  \   if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|    PlugInstall --sync | q
  \|  endif
"}}}

"{{{ Mappings

" Leader keys
let mapleader=" "

" don't use Ex mode, use Q for formatting
nnoremap Q gq

" navigate prev/next tab
nnoremap <C-n> gt
nnoremap <C-p> gT

" Yank from current cursor position to the end of the line
" (make it consistent with D, C)
nnoremap Y y$

" Do not include white space characters when using $ in visual mode
xnoremap $ g_

" Jump to matching pairs easily in normal mode
nnoremap <Tab> %

" save the file using sudo
cmap w!! w !sudo tee % > /dev/null<cr>

" better nav for omnicomplete
inoremap <expr> <c-k> ("\<C-n>")
inoremap <expr> <c-j> ("\<C-p>")

" tab for cycling through menu options
inoremap <silent> <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" navigate items in quickfix list
" map <silent> <leader>n :cnext<CR>
" map <silent> <leader>p :cprevious<CR>
" map <silent> <leader>q :cclose<CR>

" navigate prev/next/last buffer
" nnoremap <silent> <leader>n :bn<CR>
" nnoremap <silent> <leader>p :bp<CR>
" nnoremap <silent> <leader>l :b#<CR>
" nnoremap <silent> <leader>b :ls<CR>:buffer<Space>

augroup run
  autocmd! run
  autocmd FileType python nmap <buffer> <localleader>r :w<CR>:!python3 %<CR>
  autocmd FileType sh nmap <buffer> <localleader>r :w<CR>:!sh %<CR>
augroup end

"}}}

"{{{ Plugins

"{{{2 HOWTO
" Check status of plugins
" :PlugStatus
"
" Install all plugins listed here
" :PlugInstall
"
" Update all plugins listed here
" :PlugUpdate
"
" After updating, inspect diffs by pressing 'd' or run
" :PlugDiff
"
" Remove plugins no longer listed here
" :PlugClean
"
" Upgrade vim-plug itself
" :PlugUpgrade
" }}}2

"{{{2 vim-plug setup
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
   \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')
"}}}2

"{{{2 Theme
" Plug 'KeitaNakamura/neodark.vim'
" Plug 'sonph/onehalf', {'rtp': 'vim'}
" Plug 'dylanaraps/wal.vim'
Plug 'itchyny/lightline.vim'
" Plug 'jacoborus/tender.vim'
Plug 'ap/vim-css-color'
Plug 'edkolev/tmuxline.vim'
Plug 'ghifarit53/tokyonight-vim'
" night or storm
let g:tokyonight_style = 'night'
let g:tokyonight_enable_italic = 1
" color of PmenuSel and WildMenu: green, red, or blue
let g:tokyonight_menu_selection_background = 'green'
" control behavior of highlighted word (used by coc-highlight)
" choices are bold, underline, italic, or grey background (default)
let g:tokyonight_current_word = 'grey background'
let g:tokyonight_transparent_background = 1
let g:lightline = {'colorscheme': 'tokyonight'}
"}}}2

"{{{2 Folding
Plug 'pseewald/vim-anyfold'

" activate anyfold by default
" augroup anyfold
"   autocmd!
"   autocmd FileType * AnyFoldActivate
" augroup END

" disable anyfold for large files
let g:LargeFile = 1000000 " file is large if size is > 1MB
autocmd BufReadPre,BufRead * let f=getfsize(expand("<afile>")) | if f > g:LargeFile || f == -2 | call LargeFile() | endif
function LargeFile()
	augroup anyfold
		autocmd! " remove AnyFoldActivate
		autocmd Filetype <filetype> setlocal foldmethod=indent " fall back to indent folding
	augroup END
endfunction

" Minimalistic display of closed folds
let g:anyfold_fold_display = 1

" Fold multiine comments
let g:anyfold_fold_comments = 1
let g:anyfold_identify_comments = 2
let g:anyfold_comments = []

Plug 'arecarn/vim-fold-cycle'

" disable default mappings
let g:fold_cycle_default_mapping = 0
nmap <Tab><Tab> <Plug>(fold-cycle-open)
nmap <S-Tab><S-Tab> <Plug>(fold-cycle-close)
"}}}2

" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'

" Markdown
Plug 'plasticboy/vim-markdown'
" disable header folding
let g:vim_markdown_folding_disabled = 1
" do not use conceal feature, the implementation is not so good
let g:vim_markdown_conceal = 0
" disable math tex conceal feature
let g:tex_conceal = ""
let g:vim_markdown_math = 1

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & npm install'  }
" prevent preview tab from closing when switching buffer
let g:mkdp_auto_close = 0

" A game used to learn Vim
Plug 'https://github.com/ThePrimeagen/vim-be-good'

" Closes brackets when Enter key is pressed
Plug 'rstacruz/vim-closer'

" fancy start screen
Plug 'mhinz/vim-startify'

" file tree viewer
Plug 'tpope/vim-vinegar'
nmap t <Plug>VinegarTabUp
" starts with dot files hidden. Use gh to toggle this
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'

" Plug 'antionemadec/FixCursorHold.nvim'
" Plug 'lambdalisue/nerdfont.vim'
" Plug 'lambdalisue/fern-renderer-nerdfont.vim'
" Plug 'lambdalisue/glyph-palette.vim'
" Plug 'lambdalisue/fern.vim'

" open focus to last place of file
Plug 'farmergreg/vim-lastplace'

" decrypt and edit gpg encrypted files
Plug 'jamessan/vim-gnupg'

" change surroundings
Plug 'tpope/vim-surround'

" commenting
Plug 'tpope/vim-commentary'

" improve repeating with .
Plug 'tpope/vim-repeat'

""{{{2 which-key
"Plug 'liuchengxu/vim-which-key'

"" https://github.com/ChristianChiarulli/nvim/blob/master/keys/which-key.vim
"let @s = 'veS"'

"" Timeout
"let g:which_key_timeout = 500

"let g:which_key_display_name = {'<CR>': '↵', '<TAB>': '⇆'}

"" Map leader key to which-key
"nnoremap <silent> <leader> :silent WhichKey '<Space>'<CR>
"vnoremap <silent> <leader> :silent WhichKeyVisual '<Space>'<CR>

"" Do not use floating window
"let g:which_key_use_floating_win = 0

"" hide the status line
"autocmd! FileType which_key
"autocmd FileType which_key set laststatus=0 noshowmode noruler
"      \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

"let g:which_key_vertical = 0

"" Leader map
"let g:which_key_map = {}

"" Single mappings
"let g:which_key_map['/'] = [ ':Commentary', 'comment' ]
"let g:which_key_map['w'] = [ '<C-w>', 'window commands' ]

"let g:which_key_map.f = {
"      \ 'name' : '+actions' ,
"      \ 'f' : [ ':Files!', 'files' ],
"      \ 'g' : [ ':GFiles!', 'git files' ],
"      \ 'c' : [ ':BCommits!', 'commits' ],
"      \ }

"" a is for actions
"let g:which_key_map.a = {
"      \ 'name' : '+actions' ,
"      \ 'a' : [ ':AnyFoldActivate', 'anyfold activate' ],
"      \ 'm' : [ ':MarkdownPreview', 'markdown preview' ],
"      \ 'i' : [ ':IndentLinesToggle', 'indentLines toggle' ],
"      \ 'h' : [ ':let @/ =""', 'no highlight' ],
"      \ 'n' : [ ':set nonumber!', 'nums toggle' ],
"      \ 'r' : [ ':set norelativenumber!', 'rel nums toggle' ],
"      \ 'w' : [ ':StripWhitespace', 'strip whitespace' ],
"      \ }

"" g is for vim-go
"let g:which_key_map.g = {
"      \ 'name' : '+go' ,
"      \ 'a' : [ ':GoAlternate', ':GoAlternate' ],
"      \ 'r' : [ '<Plug>(go-run)', ':GoRun' ],
"      \ 't' : [ '<Plug>(go-test)', ':GoTest' ],
"      \ 'T' : [ '<Plug>(go-test)', ':GoTestFunc' ],
"      \ 'i' : [ '<Plug>(go-info)', ':GoInfo' ],
"      \ 'C' : [ '<Plug>(go-coverage-toggle)', ':GoCoverageToggle' ],
"      \ 'b' : [ '<Plug>(go-build)', ':GoBuild' ],
"      \ }

"" v is for vimrc
"let g:which_key_map.v = {
"      \ 'name' : '+vimrc' ,
"      \ '.' : [':so $MYVIMRC', 		              'source config'],
"      \ 'e' : [':vsp $MYVIMRC', 		            'edit config'],
"      \ 'l' : [':vsp $XDG_CONFIG_HOME/nvim', 		'list configs'],
"      \ }

"" Register which key map
"call which_key#register('<Space>', "g:which_key_map")

""}}}2

" golang
Plug 'fatih/vim-go'
" write the file when :make is called (which :GoBuild calls)
set autowrite

" syntax highlighting
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1

" auto formatting and importing on save
let g:go_fmt_command = "goimports"

" we don't want to see identifier info displayed when code completes
let g:go_echo_go_info = 0

" do not highlight all matching IDs by default
let g:go_auto_sameids = 0

" do not automatically show types info for word under cursor in status line
let g:go_auto_type_info = 0

" allow :GoPlay to open a browser tab
let g:go_play_open_browser = 1

" use only quickfix windows (no location lists)
let g:go_list_type = "quickfix"

" use gopls for :GoDef and :GoInfo
let g:go_def_mode = 'gopls'
let g:go_info_mode = 'gopls'

" Set fold method to syntax but disable auto-folding
au FileType go silent set foldmethod=syntax nofoldenable


" native LSP
Plug 'neovim/nvim-lspconfig'
" LSP config
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definitions()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declarations()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.reference()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <C-n> <cmd>lua vim.lsp.buf.goto_next()<CR>
nnoremap <silent> <C-p> <cmd>lua vim.lsp.buf.goto_prev()<CR>

 " auto-format
" autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 100)


" autocomplete
"Plug 'hrsh7th/nvim-compe'
" luafile ~/.config/nvim/lua/nvim-compe.lua

" auto set indent settings
Plug 'tpope/vim-sleuth'

" smooth scroll
Plug 'psliwka/vim-smoothie'

" show trailing whitespace
Plug 'ntpeters/vim-better-whitespace'
let g:better_whitespace_enabled=0

" Snippets
Plug 'honza/vim-snippets'
Plug 'andrewstuart/vim-kubernetes'

" Easy Align
Plug 'junegunn/vim-easy-align'

" Graphviz
Plug 'liuchengxu/graphviz.vim'
let g:graphviz_output_format = 'png'

" syntax support for JSON comments
Plug 'neoclide/jsonc.vim'

" handle unicode and digraphs characters
Plug 'chrisbra/unicode.vim'

" Run terraform fmt on save and other goodies
Plug 'hashivim/vim-terraform'
let g:terraform_fold_sections=1
let g:terraform_fmt_on_save=1

" show vertical lines for indent levels
Plug 'Yggdroot/indentLine'
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

" better syntax support
Plug 'sbulav/vim-helm'
Plug 'sheerun/vim-polyglot'
" let g:polyglot_disabled = ['csv']
let g:python_highlight_all=1
let g:vim_jsx_pretty_colorful_config = 1
set re=0

" plugins I should checkout
" romgrk/barbar.nvim
" moll/vim-bbye
" romainl/vim-qf


" plugs I've tried and do not like or can't figure out
" jiangmiao/auto-pairs - vim-closer is better

" requires nvim >= 5.0
" Plug 'romgrk/barbar.nvim'


call plug#end()

"}}}

colorscheme tokyonight
