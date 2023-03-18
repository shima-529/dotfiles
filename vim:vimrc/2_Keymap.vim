" ZZ(変更があれば保存して終了)を無効化
nnoremap ZZ <Nop>
" ZQ(全て保存せずに終了)を無効化
nnoremap ZQ <Nop>

noremap! <C-j> <ESC>

" 折りたたみトグルをSpaceに
noremap <SPACE> za

" ヘルプを引きやすくする
nnoremap <C-h> :<C-u>help<Space>

" 複数ファイルオープン時のタブ移動を直感的に
nnoremap <Tab> gt
nnoremap <S-Tab> gT

" make系
nnoremap <silent><Leader>b :wa \| make<CR>
nnoremap <silent><Leader>f :wa \| make flash<CR>
nnoremap <silent><Leader>t :wa \| make term<CR>
nnoremap <silent><Leader>c :make clean<CR>
