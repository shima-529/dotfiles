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
noremap! <C-j> <ESC>
nnoremap / /\v
" 行頭／末へのカーソル移動を直感的に
noremap 1 0
noremap 0 $
noremap Y y$
noremap <SPACE> za
" Split View {{{
noremap <silent> ss :split<CR>
noremap <silent> sv :vsplit<CR>
noremap sh <C-w>h
noremap sj <C-w>j
noremap sk <C-w>k
noremap sl <C-w>l
noremap sH <C-w>H
noremap sJ <C-w>J
noremap sK <C-w>K
noremap sL <C-w>L
noremap s> <C-w>>
noremap s< <C-w><
noremap s+ <C-w>+
noremap s- <C-w>-
" }}}
nmap <silent> <CR> i<CR><C-j>
" 行単位での補完
inoremap <C-l> <C-x><C-l>
" ヘルプを引きやすくする
nnoremap <C-h> :<C-u>help<Space>
" Visualモード中、C-p で縦全部に貼り付けする
vnoremap <C-p> I<C-r>"<ESC><ESC>
"カーソルを表示行で移動する。 {{{
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up>   gk
" }}}
