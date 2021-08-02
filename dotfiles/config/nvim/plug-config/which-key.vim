" https://github.com/ChristianChiarulli/nvim/blob/master/keys/which-key.vim
let @s = 'veS"'

" Timeout
let g:which_key_timeout = 500

let g:which_key_display_name = {'<CR>': '↵', '<TAB>': '⇆'}

" Map leader key to which-key
nnoremap <silent> <leader> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent WhichKeyVisual '<Space>'<CR>

" Do not use floating window
let g:which_key_use_floating_win = 0

" hide the status line
autocmd! FileType which_key
autocmd FileType which_key set laststatus=0 noshowmode noruler
      \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

let g:which_key_vertical = 0

" Leader map
let g:which_key_map = {}

" Single mappings
let g:which_key_map['/'] = [ ':Commentary', 'comment' ]
let g:which_key_map['w'] = [ '<C-w>', 'window commands' ]

let g:which_key_map.f = {
      \ 'name' : '+actions' ,
      \ 'f' : [ ':Files!', 'files' ],
      \ 'g' : [ ':GFiles!', 'git files' ],
      \ 'c' : [ ':BCommits!', 'commits' ],
      \ }

" a is for actions
let g:which_key_map.a = {
      \ 'name' : '+actions' ,
      \ 'a' : [ ':AnyFoldActivate', 'anyfold activate' ],
      \ 'm' : [ ':MarkdownPreview', 'markdown preview' ],
      \ 'i' : [ ':IndentLinesToggle', 'indentLines toggle' ],
      \ 'h' : [ ':let @/ =""', 'no highlight' ],
      \ 'n' : [ ':set nonumber!', 'nums toggle' ],
      \ 'r' : [ ':set norelativenumber!', 'rel nums toggle' ],
      \ 'w' : [ ':StripWhitespace', 'strip whitespace' ],
      \ }

" g is for vim-go
let g:which_key_map.g = {
      \ 'name' : '+go' ,
      \ 'a' : [ ':GoAlternate', ':GoAlternate' ],
      \ 'r' : [ '<Plug>(go-run)', ':GoRun' ],
      \ 't' : [ '<Plug>(go-test)', ':GoTest' ],
      \ 'T' : [ '<Plug>(go-test)', ':GoTestFunc' ],
      \ 'i' : [ '<Plug>(go-info)', ':GoInfo' ],
      \ 'C' : [ '<Plug>(go-coverage-toggle)', ':GoCoverageToggle' ],
      \ 'b' : [ '<Plug>(go-build)', ':GoBuild' ],
      \ }

" v is for vimrc
let g:which_key_map.v = {
      \ 'name' : '+vimrc' ,
      \ '.' : [':so $MYVIMRC', 		              'source config'],
      \ 'e' : [':vsp $MYVIMRC', 		            'edit config'],
      \ 'l' : [':vsp $XDG_CONFIG_HOME/nvim', 		'list configs'],
      \ }

" Register which key map
call which_key#register('<Space>', "g:which_key_map")

