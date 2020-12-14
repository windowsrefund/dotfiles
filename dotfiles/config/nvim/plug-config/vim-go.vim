" write the file when :make is called (which :GoBuild calls)
set autowrite

" we don't want to see identifier info displayed when code completes
let g:go_echo_go_info = 0

" do not highlight all matching IDs by default
let g:go_auto_sameids = 0

" check imports
let g:go_fmt_command = "goimports"

" allow :GoPlay to open a browser tab
let g:go_play_open_browser = 1

" use only quickfix windows (no location lists)
let g:go_list_type = "quickfix"

" :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

" Run a Go program
au FileType go nmap <localleader>r <Plug>(go-run)

" Test a Go program
au FileType go nmap <localleader>t <Plug>(go-test)

au FileType go nmap <localleader>b :<C-u>call <SID>build_go_files()<CR>

" :GoCoverageToggle
au FileType go nmap <localleader>c <Plug>(go-coverage-toggle)

" :GoInfo shows us the signature of a function
au FileType go nmap <localleader>i <Plug>(go-info)

" Set fold method to syntax but disable auto-folding
au FileType go silent set foldmethod=syntax
au FileType go silent set nofoldenable


" :GoAlternate in current buffer
au FileType go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
" :GoAlternative in new vertical split 
au FileType go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
" :GoAlternative in new split 
au FileType go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
" :GoAlternative in new tab
au FileType go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
