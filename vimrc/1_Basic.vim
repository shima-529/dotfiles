" === 基本設定 ===
set number " 行数
set nobackup " バックアップファイル生成なし
set title " ターミナルタイトルを表示(ファイル情報等)
set noshowmode " モード表示なし
set showcmd " キーバインド入力(画面下部)
set cmdheight=1 " exコマンド入力の行数
set laststatus=2 " ステータスラインを常に表示
set cursorline " カーソル行位置ハイライト
set list " 下記listcharsを表示
set listchars=tab:»_,trail:_,eol:↲,extends:»,precedes:«,nbsp:%
set scrolloff=5 " スクロール上下のマージン行数
set clipboard=unnamedplus " Enable clipboard
set display=lastline " 長〜い行を最後まで省略せず表示
set encoding=utf-8 " Vim内部でのファイルエンコードを指定
set fileencodings=utf-8,iso-2022-jp,euc-jp,ucs-2,cp932,sjis " ファイル読み込み時のエンコード判定試行優先順位
set showmatch " カッコを入力時にマッチする部分にカーソルを一瞬移動
set matchtime=1 " x 0.1 sec だけ移動時間を持つ
set backspace=indent,eol,start " BackSpaceで削除可能な文字列

" === インデント ===
set autoindent " 前行からインデントを引き継ぐ。改行後何もしないでinsert modeを抜けると削除される
set tabstop=4
set shiftwidth=4
set noexpandtab
set softtabstop=4

" === 検索 ===
set incsearch " インクリメンタルサーチ(文字入力によって随時検索)
set ignorecase
set hlsearch

" === 補完 ===
set wildmenu " exモードでの補完
set wildmode=list:longest " 候補が複数の場合はリスト表示、最長一致文字列まで補完
set pumheight=10 " 補完リストの最大表示行数。0とおくと一杯に表示
set completeopt=menuone,noinsert

" === 折りたたみ ===
set foldmethod=marker " マーカーで折りたたみを行う デフォルトで{{{,}}}

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
