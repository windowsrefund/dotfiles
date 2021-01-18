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

