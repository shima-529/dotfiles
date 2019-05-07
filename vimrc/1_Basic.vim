" set rtp+=/usr/local/opt/fzf
set visualbell t_vb=
set wildmenu " exモードでの補完
set wildmode=list:longest " 候補が複数の場合はリスト表示、最長一致文字列まで補完
set scrolloff=5 " スクロール行数余裕
set pumheight=10 " 補完リストの最大表示行数。0とおくと一杯に表示
set display=lastline " 長〜い業を最後まで省略せず表示
set laststatus=2 " ステータスラインを常に表示
set cmdheight=1 " exコマンド入力の行数
set noshowmode " モード表示なし
set nobackup " バックアップファイル生成なし
set encoding=utf-8 " Vim内部でのファイルエンコードを指定
set fileencodings=utf-8,iso-2022-jp,euc-jp,ucs-2,cp932,sjis " ファイル読み込み時のエンコード判定試行優先順位
set autoindent " 前行からインデントを引き継ぐ。改行後何もしないで入力を抜けると削除される
set number " 行数を表示
set showmatch " カッコを入力時にマッチする部分にカーソルを一瞬移動
set matchtime=1 " x 0.1 sec だけ移動時間を持つ
set showcmd " キーバインド操作時のコマンドを画面下部に表示
set title " ファイル情報等をターミナルのタイトルに表示する
set foldmethod=marker " マーカーで折りたたみを行う
set printexpr=system('open\ -a\ Preview\ '.v:fname_in)\ .\ v:shell_error " プリンター出力
set printoptions=number:y
" Tab{{{
set tabstop=4
set shiftwidth=4
set noexpandtab
set softtabstop=4
" }}}
set cursorline
set list
set listchars=tab:»-,trail:_,eol:↲,extends:»,precedes:«,nbsp:%
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
augroup auto_comment_off
    autocmd!
    autocmd BufEnter * setlocal formatoptions-=r
    autocmd BufEnter * setlocal formatoptions-=o
augroup END

function! s:header_c() abort
	let name = expand("%:r") " exclude extension
	exe "vs " name . ".h"
endfunction
function! s:header_cpp() abort
	let name = expand("%:r") " exclude extension
	exe "vs " name . ".hpp"
endfunction
autocmd BufEnter *.c command! Header call s:header_c()
autocmd BufEnter *.cpp command! Header call s:header_cpp()

" プロジェクト毎にvimrcを読ませる
augroup vimrc-local
  autocmd!
  autocmd BufNewFile,BufReadPost * call s:vimrc_local(expand('<afile>:p:h'))
augroup END

function! s:vimrc_local(loc)
  let files = findfile('.vimrc.local', escape(a:loc, ' ') . ';', -1)
  for i in reverse(filter(files, 'filereadable(v:val)'))
    source `=i`
  endfor
endfunction
