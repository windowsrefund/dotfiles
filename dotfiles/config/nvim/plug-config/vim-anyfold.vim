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
