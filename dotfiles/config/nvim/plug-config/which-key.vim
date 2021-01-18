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
let g:which_key_map['f'] = [ ':CocCommand explorer --toggle --sources=file+', 'files' ]
let g:which_key_map['b'] = [ ':CocCommand explorer --toggle --sources=buffer+', 'buffers' ]
let g:which_key_map['q'] = [ ':CocAction quickfix', 'quickfix' ]
let g:which_key_map['w'] = [ '<C-w>', 'window commands' ]

" a is for vim-go
let g:which_key_map.a = {
      \ 'name' : '+actions' ,
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

" l is for language server protocol
let g:which_key_map.l = {
      \ 'name' : '+lsp' ,
      \ '.' : [':CocConfig'                          , 'config'],
      \ ';' : ['<Plug>(coc-refactor)'                , 'refactor'],
      \ 'a' : ['<Plug>(coc-codeaction)'              , 'code action'],
      \ 'A' : ['<Plug>(coc-codeaction-selected)'     , 'selected action'],
      \ 'b' : [':CocNext'                            , 'next action'],
      \ 'B' : [':CocPrev'                            , 'prev action'],
      \ 'c' : [':CocList commands'                   , 'commands'],
      \ 'd' : ['<Plug>(coc-definition)'              , 'definition'],
      \ 'D' : ['<Plug>(coc-declaration)'             , 'declaration'],
      \ 'e' : [':CocList extensions'                 , 'extensions'],
      \ 'f' : ['<Plug>(coc-format-selected)'         , 'format selected'],
      \ 'F' : ['<Plug>(coc-format)'                  , 'format'],
      \ 'h' : ['<Plug>(coc-float-hide)'              , 'hide'],
      \ 'i' : ['<Plug>(coc-implementation)'          , 'implementation'],
      \ 'I' : [':CocList diagnostics'                , 'diagnostics'],
      \ 'j' : ['<Plug>(coc-float-jump)'              , 'float jump'],
      \ 'l' : ['<Plug>(coc-codelens-action)'         , 'code lens'],
      \ 'n' : ['<Plug>(coc-diagnostic-next)'         , 'next diagnostic'],
      \ 'N' : ['<Plug>(coc-diagnostic-next-error)'   , 'next error'],
      \ 'o' : [':Vista!!'                            , 'outline'],
      \ 'O' : [':CocList outline'                    , 'search outline'],
      \ 'p' : ['<Plug>(coc-diagnostic-prev)'         , 'prev diagnostic'],
      \ 'P' : ['<Plug>(coc-diagnostic-prev-error)'   , 'prev error'],
      \ 'q' : ['<Plug>(coc-fix-current)'             , 'quickfix'],
      \ 'r' : ['<Plug>(coc-references)'              , 'references'],
      \ 'R' : ['<Plug>(coc-rename)'                  , 'rename'],
      \ 's' : [':CocList -I symbols'                 , 'references'],
      \ 'S' : [':CocList snippets'                   , 'snippets'],
      \ 't' : ['<Plug>(coc-type-definition)'         , 'type definition'],
      \ 'u' : [':CocListResume'                      , 'resume list'],
      \ 'U' : [':CocUpdate'                          , 'update CoC'],
      \ 'z' : [':CocDisable'                         , 'disable CoC'],
      \ 'Z' : [':CocEnable'                          , 'enable CoC'],
      \ }

" Register which key map
call which_key#register('<Space>', "g:which_key_map")

