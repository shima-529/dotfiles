" call dein#addの呼び出し、環境設定 {{{
let s:vimdir = $HOME . "/.vim"
if has("vim_starting")
	if ! isdirectory(s:vimdir)
		call system("mkdir " . s:vimdir)
	endif
endif
if v:version < 704
	finish
endif
let s:dein_dir = s:vimdir . '/dein'
" let s:dein_repo_name = "Shougo/dein.vim"
let s:dein_repo_dir = s:vimdir . '/dein/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
	echo "dein is not installed, install now "
	let s:dein_repo = "https://github.com/" . s:dein_repo_name
	echo "git clone " . s:dein_repo . " " . s:dein_repo_dir
	call system("git clone " . s:dein_repo . " " . s:dein_repo_dir)
endif
let &runtimepath = &runtimepath . ',' . s:dein_repo_dir
call dein#begin(s:dein_dir)
call dein#add('Shougo/dein.vim')
" ===========================================
" }}}
call dein#add('vim-jp/vimdoc-ja')
" *** Color Schemes {{{
" call dein#add('w0ng/vim-hybrid')
" call dein#add('vim-scripts/twilight')
call dein#add('altercation/vim-colors-solarized')
call dein#add('lifepillar/vim-solarized8')
" call dein#add('croaker/mustang-vim')
" call dein#add('jeffreyiacono/vim-colors-wombat')
" call dein#add('nanotech/jellybeans.vim')
" call dein#add('vim-scripts/Lucius')
" call dein#add('vim-scripts/Zenburn')
" call dein#add('mrkn/mrkn256.vim')
" call dein#add('jpo/vim-railscasts-theme')
" call dein#add('therubymug/vim-pyte')
call dein#add('tomasr/molokai')
" }}}
" *** Language Environments {{{
call dein#add('awk.vim', {'on_ft': 'awk'})
call dein#add('sh.vim', {'on_ft': 'sh'})
call dein#add('kballard/vim-swift', {'on_ft': 'swift'})
call dein#add('shima-529/C-prototype.vim', {'on_ft' : ['c', 'cpp', 'cc', 'cxx']})
" jedi-vim {{{
" call dein#add('davidhalter/jedi-vim', {'on_ft' : 'py'})
" autocmd FileType python let g:loaded_neocomplete = 1
" autocmd FileType python setlocal omnifunc=jedi#completions
" autocmd FileType python setlocal completeopt-=preview
" let g:jedi#auto_vim_configuration = 1
" let g:jedi#auto_initialization = 1
" let g:jedi#popup_on_dot = 0
" let g:jedi#completions_command = "<C-r>"
" let g:jedi#goto_assignments_command = "<C-g>"
" let g:jedi#goto_definitions_command = "<C-d>"
" if !exists('g:neocomplete#force_omni_input_patterns')
" 	let g:neocomplete#force_omni_input_patterns = {}
" endif
" let g:neocomplete#force_omni_input_patterns.python = '\h\w*\|[^. \t]\.\w*'
set completeopt-=preview
" }}}
" }}}
" vim-quickrun {{{
call dein#add('thinca/vim-quickrun')
let g:quickrun_config = get(g:, 'quickrun_config', {})
let g:quickrun_config._ = {'runner'    : 'vimproc', 'runner/vimproc/updatetime' : 60, 'outputter' : 'error', 'outputter/error/success' : 'buffer', 'outputter/error/error'   : 'quickfix', 'outputter/buffer/split'  : ':botright 8sp', 'outputter/buffer/close_on_empty' : 1, }
" }}}
" *** Unite {{{
" call dein#add('Shougo/unite.vim')
" call dein#add('Shougo/neomru.vim')
" call dein#add('ujihisa/unite-colorscheme')
" call dein#add('h1mesuke/unite-outline')
" }}}
" *** Completions {{{
" Neosnippet {{{ 
call dein#add('Shougo/neosnippet')
call dein#add('Shougo/neosnippet-snippets')
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
let g:neosnippet#snippets_directory='~/.vim/mysnippets/'
let g:neosnippet#disable_runtime_snippets={
			\ '_':       1,
			\ 'c':       1,
			\ 'cpp':     1,
			\ 'fortran': 1,
			\ 'java':    1,
			\ 'py':    1,
			\ }
" }}}
" Syntastic {{{
call dein#add('scrooloose/syntastic.git')
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_kue2_checkers = ['kue2']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_c_compiler_options = '-Wall'
" }}}
" NeoComplete {{{
if !has('nvim')
	call dein#add('Shougo/neocomplete.vim')
	let g:neocomplete#enable_force_overwrite_completefunc=1
	" autocmd BufReadPost,BufEnter,BufWritePost :NeoCompleteBufferMakeCache <buffer>
	let g:neocomplete#enable_at_startup = 1
	let g:neocomplete#enable_ignore_case = 1
	let g:neocomplete#enable_smart_case = 1
	let g:neocomplete#enable_auto_select = 1
	let g:neocomplete#enable_enable_camel_case_completion = 0
	autocmd FileType python set omnifunc=none
	if !exists('g:neocomplete#keyword_patterns')
		let g:neocomplete#keyword_patterns = {}
	endif
	" let g:neocomplete#keyword_patterns._ = '\h\w*'
	let g:neocomplete#keyword_patterns._ = '\w*'
	" <TAB>: completion.
	" inoremap <expr><TAB>  pumvisible() ? '<C-n>' : '<TAB>'
	" " <BS> でポップアップを閉じて文字を削除
	" imap <expr> <BS>
	" 			\ neocomplete#smart_close_popup() . '<Plug>(smartinput_BS)'
	" <C-h> でポップアップを閉じる
	imap <expr> <C-h> neocomplete#cancel_popup()
	" <CR> で候補を選択し改行する
	" ポップアップがないときには改行する
	" imap <expr> <CR> pumvisible() ?
	"       \ neocomplete#close_popup() : '\<Plug>(smartinput_CR)'
	imap <expr> <CR> pumvisible() ? '<C-n><C-p><C-y><C-k>' : '<Plug>(smartinput_CR)'
else
	call dein#add('Shougo/deoplete.nvim')
	let g:deoplete#enable_at_startup = 1
	let g:deoplete#enable_ignore_case = 1
	let g:deoplete#enable_smart_case = 1
	let g:deoplete#enable_auto_select = 1
	let g:deoplete#enable_enable_camel_case_completion = 0
	if !exists('g:deoplete#keyword_patterns')
		let g:deoplete#keyword_patterns = {}
	endif
	let g:deoplete#keyword_patterns._ = '\w*'
	imap <expr> <C-h> deoplete#cancel_popup()
	imap <expr> <CR> pumvisible() ? '<C-n><C-p><C-y><C-k>' : '<Plug>(smartinput_CR)'
endif
" }}}
" }}}
" *** Operators {{{
call dein#add('kana/vim-operator-user')
call dein#add('rhysd/vim-operator-surround')
vmap sa <Plug>(operator-surround-append)
vmap sd <Plug>(operator-surround-delete)
vmap sr <Plug>(operator-surround-replace)
call dein#add('rhysd/clever-f.vim')
call dein#add('tomtom/tcomment_vim')
let g:tcommentMapLeader1 = '<C-_>'
let g:tcommentGuessFileType_awk = 'sh'
" }}}
call dein#add('terryma/vim-expand-region')
call dein#add('AndrewRadev/switch.vim')
let g:switch_mapping = "-"
call dein#add('mhinz/vim-startify')
let g:startify_enable_special         = 1
let g:startify_files_number           = 8
let g:startify_relative_path          = 1
let g:startify_change_to_dir          = 1
let g:startify_update_oldfiles        = 1
let g:startify_session_autoload       = 1
let g:startify_session_persistence    = 1
let g:startify_session_delete_buffers = 1

let g:startify_custom_header = ['		Vim', '	=============', '	Vi IMproved - ' . v:version ]
let g:startify_skiplist = [
			\ $HOME . '/.vim/dein/.dein/doc/'
			\ ]

let g:startify_bookmarks = [
			\ { 'p': '~/Programming' },
			\ { 'v0': '~/.vim/vimrc' },
			\ { 'v1': '~/.vim/vimrc/1_Basic.vim' },
			\ { 'v2': '~/.vim/vimrc/2_Keymap.vim' },
			\ { 'v3': '~/.vim/vimrc/3_dein.vim' },
			\ { 'z': '~/.zsh.d' },
			\ { 'Z': '~/.zshrc' },
			\ ]
hi StartifyBracket ctermfg=240
hi StartifyFile    ctermfg=147
hi StartifyFooter  ctermfg=240
hi StartifyHeader  ctermfg=114
hi StartifyNumber  ctermfg=215
hi StartifyPath    ctermfg=245
hi StartifySlash   ctermfg=240
hi StartifySpecial ctermfg=240

call dein#add('Townk/vim-autoclose')
call dein#add('kana/vim-smartinput')
" vim-easy-align {{{
call dein#add('junegunn/vim-easy-align', {'autoload': { 'commands' : ['EasyAlign'], 'mappings' : ['<Plug>(EasyAlign)'],}})
vmap <Enter> <Plug>(EasyAlign)
nmap <Leader>a <Plug>(EasyAlign)
" }}}
call dein#add('haya14busa/incsearch.vim')
" vim-multiple-cursors {{{
call dein#add('terryma/vim-multiple-cursors')
function! Multiple_cursors_before()
	if exists(':NeoCompleteLock')==2
		exe 'NeoCompleteLock'
	endif
endfunction

function! Multiple_cursors_after()
	if exists(':NeoCompleteUnlock')==2
		exe 'NeoCompleteUnlock'
	endif
endfunction
" }}}
" LightLine {{{
call dein#add('itchyny/lightline.vim')
let g:lightline = {
			\ 'mode_map': {'c': 'NORMAL'},
			\ 'active': {
			\   'left': [
			\     ['mode', 'paste'],
			\     ['readonly', 'filename', 'modified'],
			\   ],
			\   'right': [
			\     ['lineinfo', 'syntastic'],
			\     ['percent'],
			\     ['charcode', 'fileformat', 'fileencoding', 'filetype'],
			\   ],
			\ },
			\ 'component': {
			\   'readonly': '%{&filetype=="help"?"":&readonly?"⭤":""}',
			\   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}'
			\ },
			\ 'component_expand': {
			\   'syntastic': 'SyntasticStatuslineFlag'
			\ },
			\ 'component_type': {
			\   'syntastic': 'error'
			\ },
			\ 'separator': {'left': '⮀', 'right': '⮂'},
			\ 'subseparator': {'left': '⮁', 'right': '⮃'}
			\ }
let g:syntastic_mode_map = { 'mode': 'passive' }
augroup AutoSyntastic
	autocmd!
	autocmd BufWritePost *.c,*.cpp,*.cs,*.f90,*.py,*.java,*.rb,*.cs call s:syntastic()
augroup END
function! s:syntastic()
	SyntasticCheck
	call lightline#update()
endfunction
" }}}
" Vim-Easymotion {{{
call dein#add('Lokaltog/vim-easymotion')
" Lokaltog/vim-easymotion
" http://blog.remora.cx/2012/08/vim-easymotion.html
" ホームポジションに近いキーを使う
let g:EasyMotion_keys='hjklasdfgyuiopqwertnmzxcvbHJKLASDFGYUIOPQWERTNMZXCVB'
" 「;」 + 何かにマッピング
let g:EasyMotion_leader_key=';'
" 1 ストローク選択を優先する
let g:EasyMotion_grouping=1
" カラー設定変更
hi EasyMotionTarget ctermbg=none ctermfg=red
hi EasyMotionShade  ctermbg=none ctermfg=blue
" }}}
call dein#add('Shougo/vimproc', {'build': 'make'})
" call dein#add('Shougo/vimfiler.vim')
" nnoremap <leader>e :VimFilerExplore -split -winwidth=30 -find -no-quit<Cr>
call dein#add('Yggdroot/indentLine')
let g:indentLine_faster = 1
" RainbowParentheses {{{
call dein#add('kien/rainbow_parentheses.vim')
au VimEnter * RainbowParenthesesToggle
au VimEnter * RainbowParenthesesLoadRound
au VimEnter * RainbowParenthesesLoadSquare
au VimEnter * RainbowParenthesesLoadBraces
let g:rbpt_colorpairs = [
			\ ['brown',       'RoyalBlue3'],
			\ ['Darkblue',    'SeaGreen3'],
			\ ['darkgray',    'DarkOrchid3'],
			\ ['darkgreen',   'firebrick3'],
			\ ['darkcyan',    'RoyalBlue3'],
			\ ['darkred',     'SeaGreen3'],
			\ ['darkmagenta', 'DarkOrchid3'],
			\ ['brown',       'firebrick3'],
			\ ['gray',        'RoyalBlue3'],
			\ ['darkmagenta', 'DarkOrchid3'],
			\ ['Darkblue',    'firebrick3'],
			\ ['darkgreen',   'RoyalBlue3'],
			\ ['darkcyan',    'SeaGreen3'],
			\ ['darkred',     'DarkOrchid3'],
			\ ['red',         'firebrick3'],
			\ ]
let g:rbpt_max = 15
" }}}
call dein#add('b4b4r07/vim-shellutils')
" Unused and Unclassified {{{
" call dein#add('YankRing.vim')
" call dein#add('basyura/TweetVim')
" call dein#add('mattn/webapi-vim')
" call dein#add('basyura/twibill.vim')
" call dein#add('tyru/open-browser.vim')
" call dein#add("osyo-manga/vim-precious")
" call dein#add('mattn/sonictemplate-vim')
" call dein#add ('leftouterjoin/changed')
" }}}
" call dein#add('vimtaku/vim-mlh.git')
call dein#add('TagHighlight')
call dein#add('kana/vim-smartchr')
" inoremap <buffer> <expr> = smartchr#loop(' = ', ' == ', '=')
" inoremap <buffer> <expr> . smartchr#loop('.', '->')
" inoremap <buffer> <expr> , smartchr#loop(', ', ',')
call dein#add('fuenor/qfixhowm')
call dein#add('emezeske/manpageview')
hi link CTagsFunction None
hi link CTagsGlobalVariable None
hi link CTagsMember None
call dein#end()
call dein#save_state()
if dein#check_install()
	call dein#install()
endif
" ===========================================
syntax on
filetype plugin indent on
" colorscheme solarized
" カラースキームの色設定 {{{
" For Solarized
" True Color を使えるようになるおまじない
set termguicolors
" 斜体を積極的に使う
" let g:solarized_term_italics = 1
" Solarized Light
if match(execute('echo $ITERM_PROFILE'), 'Solarized Dark')
	colorscheme solarized8_dark
	hi Comment ctermfg=11
elseif match(execute('echo $ITERM_PROFILE'), 'Molokai')
	colorscheme molokai
elseif
	colorscheme solarized
endif
" set term=xterm-256color
" colorscheme solarized
set background=dark
" hi SpecialKey ctermbg=NONE ctermfg=10
" hi SpecialKey ctermbg=8 ctermfg=23
" }}}
" SmartInput Functions {{{
call smartinput#map_to_trigger('i', '<Space>', '<Space>', '<Space>')
call smartinput#define_rule({
			\   'at'    : '(\%#)',
			\   'char'  : '<Space>',
			\   'input' : '<Space><Space><Left>',
			\   })
call smartinput#define_rule({
			\   'at'    : '( \%# )',
			\   'char'  : '<BS>',
			\   'input' : '<Del><BS>',
			\   })
call smartinput#map_to_trigger('i', '<Plug>(smartinput_CR)',
			\                        '<Enter>',
			\                        '<Enter>')
" }}}
