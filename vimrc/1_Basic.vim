" set rtp+=/usr/local/opt/fzf
" let &t_ti .= "\e[22;0t"
" let &t_te .= "\e[23;0t"
" set t_ke=""
" set t_ut=""
" set timeout timeoutlen=50 " Escで待たされる現象解消
" 詳しくは http://yukidarake.hateblo.jp/entry/2015/07/10/201356 へ
set wildmenu
set scrolloff=5
set pumheight=10
set display=lastline
set visualbell t_vb=
set noerrorbells
set laststatus=2
set cmdheight=1
set noshowmode
set nobackup
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,ucs-2,cp932,sjis
set autoindent
set number
set showmatch
set matchtime=1
set showcmd
set title
set ruler
set foldmethod=marker
set printexpr=system('open\ -a\ Preview\ '.v:fname_in)\ .\ v:shell_error
set printoptions=number:y
" Tab{{{
set tabstop=4
set shiftwidth=4
set noexpandtab
set softtabstop=4
" }}}
set cursorline
set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
" 検索系{{{
set incsearch
set ignorecase
set clipboard+=unnamed
set backspace=indent,eol,start
set hlsearch
let g:incsearch#auto_nohlsearch = 1
" }}}
" 色 {{{
" 折りたたみの色設定
" highlight Folded ctermbg=181 ctermfg=240
" 補完時の色
" highlight Pmenu ctermbg=224
" highlight PmenuSel ctermbg=213
" highlight PmenuThumb ctermfg=202
" highlight CursorLineNr term=bold   cterm=NONE ctermfg=202 ctermbg=223
" }}}
" 前回保存時のカーソル位置を記憶
augroup vimrcEx
  au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal g`\"" | endif
augroup END
" 改行時のコメントアウトを無効化する
set formatoptions-=r
set formatoptions-=o
