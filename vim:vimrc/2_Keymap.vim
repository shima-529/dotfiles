nnoremap ZZ <Nop>
nnoremap ZQ <Nop>

noremap! <C-j> <ESC>

" Toggle folding
noremap <SPACE> za

" Easy help
nnoremap <C-h> :<C-u>help<Space>

" convenient moves on multiple tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT

" make
nnoremap <silent><Leader>b :wa \| make<CR>
nnoremap <silent><Leader>f :wa \| make flash<CR>
nnoremap <silent><Leader>t :wa \| make term<CR>
nnoremap <silent><Leader>c :make clean<CR>
