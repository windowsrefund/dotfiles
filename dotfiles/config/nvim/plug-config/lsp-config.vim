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

