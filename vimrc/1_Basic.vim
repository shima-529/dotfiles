" set rtp+=/usr/local/opt/fzf
let &t_ti .= "\e[22;0t"
let &t_te .= "\e[23;0t"
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
" Tab{{{
set tabstop=4
set shiftwidth=4
set noexpandtab
set softtabstop=4
" }}}
" 忌まわしき全角スペース
" highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
set cursorline
" highlight CursorLine cterm=NONE ctermfg=NONE
set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
" highlight SpecialKey ctermfg=180
" match ZenkakuSpace /　/
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
" C++のヘッダファイルをcpp形式だと認識させる{{{
" 標準ライブラリへのパスを設定
let $CPP_STDLIB = "/usr/local/Cellar/"
augroup vimrc-set_filetype_cpp
	autocmd!
	" $CPP_STDLIB よりも下の階層のファイルが開かれて
	" filetype が設定されていない場合に filetype=cpp を設定する
	autocmd BufReadPost $CPP_STDLIB/* if empty(&filetype) | set filetype=cpp | endif
augroup END
" }}}
" 前回保存時のカーソル位置を記憶
augroup vimrcEx
  au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal g`\"" | endif
augroup END
