" incsearch {{{
map n  <Plug>(incsearch-nohl-n)
" ↑ nで次の候補へ
map N  <Plug>(incsearch-nohl-N)
" ↑ Nで前の候補へ
map *  <Plug>(incsearch-nohl-*)
" ↑ カーソル上の単語で再検索
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)
" }}}
nnoremap ZZ <Nop>
nnoremap ZQ <Nop>
" " カーソルの左右移動で行末から次の行の行頭への移動が可能になる
" set whichwrap=b,s,h,l,<,>,[,],~
" マウスの有効化
" if has('mouse')
"     set mouse=a
"     if has('mouse_sgr')
"         set ttymouse=sgr
"     elseif v:version > 703 || v:version is 703 && has('patch632')
"         set ttymouse=sgr
"     else
"         set ttymouse=xterm2
"     endif
" endif
noremap! <C-j> <ESC>
" 行頭／末へのカーソル移動を直感的に
" noremap 1 0
" noremap 0 $
noremap Y y$
noremap <SPACE> za
" Split View {{{
" noremap <silent> ss :split<CR>
" noremap <silent> sv :vsplit<CR>
" noremap sh <C-w>h
" noremap sj <C-w>j
" noremap sk <C-w>k
" noremap sl <C-w>l
" noremap sH <C-w>H
" noremap sJ <C-w>J
" noremap sK <C-w>K
" noremap sL <C-w>L
" noremap s> <C-w>>
" noremap s< <C-w><
" noremap s+ <C-w>+
" noremap s- <C-w>-
" }}}
" nmap <silent><CR> i<CR><C-j>

" 行単位での補完
" inoremap <C-l> <C-x><C-l>
" ヘルプを引きやすくする
nnoremap <C-h> :<C-u>help<Space>
" Visualモード中、C-p で縦全部に貼り付けする
vnoremap <C-p> I<C-r>"<ESC><ESC>
inoremap <C-a> <C-o>^
inoremap <C-e> <C-o>$
"カーソルを表示行で移動する。 {{{
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up>   gk
" }}}
" タブ機能
nnoremap <Tab> gt
nnoremap <S-Tab> gT
