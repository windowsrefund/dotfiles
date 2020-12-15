" https://github.com/ChristianChiarulli/nvim/blob/master/keys/which-key.vim

" Timeout
let g:which_key_timeout = 500

let g:which_key_display_name = {'<CR>': '↵', '<TAB>': '⇆'}

" Map leader key to which-key
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey ','<CR>

" Do not use floating window
let g:which_key_use_floating_win = 0
let g:which_key_max_size = 0

" hide the status line
autocmd! FileType which_key
autocmd FileType which_key set laststatus=0 noshowmode noruler
      \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

" Leader map
let g:which_key_map = {}

" Leader mappings
let g:which_key_map['.'] = [ ':so $MYVIMRC', 'source init' ]
let g:which_key_map['='] = [ '<c-w>=', 'balance splits' ]
let g:which_key_map['e'] = [ ':e $MYVIMRC', 'edit init' ]
let g:which_key_map['E'] = [ ':tabe $MYVIMRC', 'edit init in new tab' ]
let g:which_key_map['s'] = [ '<c-w>s', 'split below' ]
let g:which_key_map['v'] = [ '<c-w>v', 'split right' ]
let g:which_key_map['w'] = [ '<c-w>', 'navigate splits' ]
let g:which_key_map['n'] = [ ':let @/ = ""', 'no highlight' ]
" vim-windowswap plugin
let g:which_key_map['W'] = [ ':call WindowSwap#EasyWindowSwap', 'move window' ]

" v is for vimrc
let g:which_key_map.v = {
      \ 'name' : '+vimrc' ,
      \ 's' : [':so $MYVIMRC'        , 		'source init'],
      \ 'e' : [':e $MYVIMRC'        , 		'edit init'],
      \ 'E' : [':tabe $MYVIMRC'        , 	'edit init in new tab'],
      \ }

" b is for buffer
let g:which_key_map.b = {
      \ 'name' : '+buffer' ,
      \ '>' : [':BufferMoveNext'        , 'move next'],
      \ '<' : [':BufferMovePrevious'    , 'move prev'],
      \ '1' : [':BufferGoto 1'          , 'buffer 1'],
      \ '2' : [':BufferGoto 2'          , 'buffer 2'],
      \ '3' : [':BufferGoto 3'          , 'buffer 3'],
      \ '4' : [':BufferGoto 4'          , 'buffer 4'],
      \ '5' : [':BufferGoto 5'          , 'buffer 5'],
      \ '6' : [':BufferGoto 6'          , 'buffer 6'],
      \ '7' : [':BufferGoto 7'          , 'buffer 7'],
      \ '8' : [':BufferGoto 8'          , 'buffer 8'],
      \ '9' : [':BufferGoto 9'          , 'buffer 9'],
      \ '0' : [':BufferGoto 0'          , 'buffer 0'],
      \ 'b' : [':BufferPick'            , 'pick buffer'],
      \ 'd' : [':Bdelete'               , 'delete-buffer'],
      \ 'D' : [':BufferOrderByDirectory', 'order by directory'],
      \ 'f' : ['bfirst'                 , 'first-buffer'],
      \ 'l' : ['blast'                  , 'last buffer'],
      \ 'L' : [':BufferOrderByLanguage' , 'order by language'],
      \ 'n' : ['bnext'                  , 'next-buffer'],
      \ 'p' : ['bprevious'              , 'previous-buffer'],
      \ '?' : ['Buffers'                , 'fzf-buffer'],
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

" Localleader map
let g:which_key_localmap = {}
call which_key#register(',', "g:which_key_localmap")

