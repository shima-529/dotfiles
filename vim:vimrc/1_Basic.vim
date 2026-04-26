" === Basics ===
set number " show line number
set nobackup " do not generate backup files (e.g.: file.txt~)
set clipboard=unnamedplus " Enable clipboard
set display=lastline " do not omit LONG lines
set backspace=indent,eol,start " deletable chars by BackSpace key
set noshowmode " do not show mode in the last line (LightLine replaces this)
set laststatus=2 " always shows status line
set cursorline " highlights cursor line position
set scrolloff=5 " margin of vertical scrolling
set modeline " enables modeline, such as: "// vim: filetype=tex :"

" === Encoding ===
set encoding=utf-8 " Vim internal encoding
set fileencodings=utf-8,iso-2022-jp,euc-jp,ucs-2,cp932,sjis " priorities of file read encoding

" === Brace Pair Match ===
set showmatch
set matchtime=1

" === Special Chars ===
set list " shows listchars
set listchars=tab:»_,trail:_,extends:»,precedes:«,nbsp:%
highlight SpecialKey guibg=Gray15 " color of listchars

" === Indent ===
set autoindent " inherits indentation; exiting insert mode just after line break hides indents.
set tabstop=4 " display witdh of '\t'
set shiftwidth=0 " shift width of indentation on << or >> cmds; if 0, shiftwidth == tabstop

" === Search ===
set incsearch " enables incremental search
set ignorecase
set hlsearch " highlights all matched patterns

" === Completion ===
set wildmenu " completion on ex mode
set wildmode=list:longest " for multiple candidates, show list and completes to the longest
set pumheight=10 " maximum lines of overlay completion list
set completeopt=menuone,noinsert

" === Folding ===
set foldmethod=marker " enables folding; markers are {{{,}}} on default

" === Mouse ===
if $TERM == 'tmux-256color'
	set mouse=a " enables mouse scrolling
endif
