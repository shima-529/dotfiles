" " call dein#addの呼び出し、環境設定 {{{
let s:use_dein = 1
if !&compatible
	set nocompatible
endif
let s:vimdir = $HOME . "/.vim"
if has("vim_starting")
	if ! isdirectory(s:vimdir)
		call system("mkdir " . s:vimdir)
	endif
endif
let s:dein_enabled  = 0
if s:use_dein && v:version >= 704
	let s:dein_enabled = 1
	let s:dein_dir = s:vimdir . '/dein'
	let s:dein_github = s:dein_dir . '/repos/github.com'
	let s:dein_repo_name = "Shougo/dein.vim"
	let s:dein_repo_dir = s:dein_github . '/' . s:dein_repo_name
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
" " }}}
" インデントは2段でO.K.
	call dein#add('Townk/vim-autoclose')
	call dein#add('kana/vim-smartinput')
	" vim-quickrun {{{
	call dein#add('thinca/vim-quickrun')
	let g:quickrun_config = get(g:, 'quickrun_config', {})
	let g:quickrun_config._ = {'runner'    : 'vimproc', 'runner/vimproc/updatetime' : 60, 'outputter' : 'error', 'outputter/error/success' : 'buffer', 'outputter/error/error'   : 'quickfix', 'outputter/buffer/split'  : ':botright 8sp', 'outputter/buffer/close_on_empty' : 1, }
	" }}}
	" vim-easy-align {{{
	" call dein#add('junegunn/vim-easy-align', {'autoload': { 'commands' : ['EasyAlign'], 'mappings' : ['<Plug>(EasyAlign)'],}})
	" vmap <Enter> <Plug>(EasyAlign)
	" nmap <Leader>a <Plug>(EasyAlign)
	" }}}
	" Color Schemes {{{
	" call dein#add('w0ng/vim-hybrid')
	" call dein#add('vim-scripts/twilight')
	call dein#add('altercation/vim-colors-solarized')
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
	call dein#add('Shougo/unite.vim')
	call dein#add('Shougo/neomru.vim')
	" call dein#add('ujihisa/unite-colorscheme')
	call dein#add('kana/vim-operator-user')
	call dein#add('rhysd/vim-operator-surround')
	vmap sa <Plug>(operator-surround-append)
	vmap sd <Plug>(operator-surround-delete)
	vmap sr <Plug>(operator-surround-replace)
	call dein#add('tomtom/tcomment_vim')
	let g:tcommentMapLeader1 = '<C-_>'
	" Neosnippet {{{ 
	call dein#add('Shougo/neosnippet')
	imap <C-k>     <Plug>(neosnippet_expand_or_jump)
	smap <C-k>     <Plug>(neosnippet_expand_or_jump)
	xmap <C-k>     <Plug>(neosnippet_expand_target)
	let g:neosnippet#snippets_directory='~/.vim/dein/mysnippets/'
	" }}}
	call dein#add('Shougo/neosnippet-snippets')
	" Syntastic {{{
	call dein#add('scrooloose/syntastic.git')
	set statusline+=%#warningmsg#
	set statusline+=%{SyntasticStatuslineFlag()}
	set statusline+=%*

	let g:syntastic_always_populate_loc_list = 1
	let g:syntastic_auto_loc_list = 1
	let g:syntastic_check_on_open = 0
	let g:syntastic_check_on_wq = 0
	" let g:syntastic_fortran_checkers = ['gfortran']
	" }}}
	" NeoComplete {{{
" 	call dein#add('Shougo/neocomplete.vim')
" 	let g:neocomplete#enable_force_overwrite_completefunc=1
" " autocmd BufReadPost,BufEnter,BufWritePost :NeoCompleteBufferMakeCache <buffer>
" 	let g:neocomplete#enable_at_startup = 1
" 	let g:neocomplete#enable_ignore_case = 1
" 	let g:neocomplete#enable_smart_case = 1
" 	let g:neocomplete#enable_auto_select = 1
" 	let g:neocomplete#enable_enable_camel_case_completion = 0
" 	if !exists('g:neocomplete#keyword_patterns')
" 		let g:neocomplete#keyword_patterns = {}
" 	endif
" 	let g:neocomplete#keyword_patterns._ = '\h\w*'
" 	" <TAB>: completion.
" 	inoremap <expr><TAB>  pumvisible() ? '<C-n>' : '<TAB>'
" 	" " <BS> でポップアップを閉じて文字を削除
" 	" imap <expr> <BS>
" 	" 			\ neocomplete#smart_close_popup() . '<Plug>(smartinput_BS)'
" 	" <C-h> でポップアップを閉じる
" 	imap <expr> <C-h> neocomplete#cancel_popup()
" 	" <CR> で候補を選択し改行する
" 	" ポップアップがないときには改行する
" 	" imap <expr> <CR> pumvisible() ?
" 	"       \ neocomplete#close_popup() : '\<Plug>(smartinput_CR)'
" 	imap <expr> <CR> pumvisible() ? '<C-n><C-p><C-y><C-k>' : '<Plug>(smartinput_CR)'
" 	" }}}
" 	call dein#add('haya14busa/incsearch.vim')
" 	" call dein#add('hail2u/vim-css3-syntax', {
" 	" 			\ 'autoload' : {'filetypes' : ['css']}
" 	" 			\ })
" 	" call dein#add 'alpaca-tc/alpaca_powertabline'
" 	" call dein#add 'lokaltog/powerline', { 'rtp' : 'powerline/bindings/vim'}
" 	" call dein#add('lokaltog/powerline-fontpatcher')
" 	call dein#add('terryma/vim-multiple-cursors')
" 	call dein#add('mattn/emmet-vim', {'autoload' : {'filetypes' : ['html', 'htm', 'php']}})
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
		autocmd BufWritePost *.c,*.cpp,*.cs,*.f90 call s:syntastic()
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
	call dein#add('rhysd/clever-f.vim')
	" call dein#add('itchyny/dictionary.vim')
	" call dein#add('Shougo/vimproc.vim')
	call dein#add('Shougo/vimproc', {'build': 'make'})
	" Vim-Brightest {{{
	" call dein#add('osyo-manga/vim-brightest')
	" let g:brightest#highlight = {
	" \   'group' : 'BrightestReverse'
	" \}
	" let g:brightest#pattern = '\k\+'
	" autocmd BufRead * :BrightestDisable
	" command! B BrightestToggle
	" }}}
	" call dein#add('mopp/layoutplugin.vim', {'autoload' : { 'commands' : 'LayoutPlugin'}})
	" call dein#add('OmniSharp/omnisharp-vim', {'autoload' : {'filetypes' : ['cs']}})
	call dein#add('shima-529/C-prototype.vim', {'autoload' : {'filetypes' : ['c', 'cpp']}})
	" call dein#add('YankRing.vim')
	" call dein#add('mbbill/undotree')
	" call dein#add('basyura/TweetVim')
	" call dein#add('mattn/webapi-vim')
	" call dein#add('basyura/twibill.vim')
	" call dein#add('tyru/open-browser.vim')
	call dein#add('h1mesuke/unite-outline')
	" call dein#add('basyura/bitly.vim')
	" let g:tweetvim_display_icon = 1
	" call dein#add('mopp/next-alter.vim')
	" nnoremap <Leader>a :OpenNAlter<CR>
	" call dein#add('kana/vim-smartword')
	" nmap w   <Plug>(smartword-w)
	" nmap b   <Plug>(smartword-b)
	" nmap e   <Plug>(smartword-e)
	call dein#add('Yggdroot/indentLine')
	let g:indentLine_faster = 1
	call dein#add('Shougo/vimfiler.vim')
	" call dein#add('Shougo/context_filetype.vim')
	" call dein#add("osyo-manga/vim-precious")
	nnoremap <leader>e :VimFilerExplore -split -winwidth=30 -find -no-quit<Cr>
	" RainbowParentheses {{{
	call dein#add('kien/rainbow_parentheses.vim')
	au VimEnter * RainbowParenthesesToggle
	" au Syntax * RainbowParenthesesLoadRound
	" au Syntax * RainbowParenthesesLoadSquare
	" au Syntax * RainbowParenthesesLoadBraces
	au VimEnter * RainbowParenthesesLoadRound
	au VimEnter * RainbowParenthesesLoadSquare
	au VimEnter * RainbowParenthesesLoadBraces
	let g:rbpt_colorpairs = [['brown', 'RoyalBlue3'], ['Darkblue', 'SeaGreen3'], ['darkgray', 'DarkOrchid3'], ['darkgreen', 'firebrick3'], ['darkcyan', 'RoyalBlue3'], ['darkred', 'SeaGreen3'], ['darkmagenta', 'DarkOrchid3'], ['brown', 'firebrick3'], ['gray', 'RoyalBlue3'], ['black', 'SeaGreen3'], ['darkmagenta', 'DarkOrchid3'], ['Darkblue', 'firebrick3'], ['darkgreen', 'RoyalBlue3'], ['darkcyan', 'SeaGreen3'], ['darkred', 'DarkOrchid3'], ['red', 'firebrick3'], ]
	let g:rbpt_max = 16
	" }}}
	" call dein#add('sh.vim')
	" call dein#add('mattn/sonictemplate-vim')
	" call dein#add('mattn/benchvimrc-vim')
	" call dein#add ('leftouterjoin/changed')
	call dein#add('vim-jp/vimdoc-ja')
	" call dein#add('lervag/vimtex')
	" call dein#add('davidhalter/jedi-vim')
	"autocmd FileType python setlocal omnifunc=jedi#completions
	"let g:jedi#auto_vim_configuration = 0
	"if !exists('g:neocomplete#force_omni_input_patterns')
		"let g:neocomplete#force_omni_input_patterns = {}
	"endif
	"let g:neocomplete#force_omni_input_patterns.python = '\h\w*\|[^. \t]\.\w*'
	" set completeopt-=preview
	" ===========================================
	call dein#end()
	call dein#save_state()
endif
" もし、未インストールものものがあったらインストール
if dein#check_install()
	call dein#install()
endif
filetype plugin indent on
syntax on
function! DeinReCache() abort
	call system("rm -rf $HOME/.vim/dein/temp $HOME/.vim/dein/rollbacks")
	call dein#recache_runtimepath()
endfunction
" SmartInput Functions {{{
" call smartinput#map_to_trigger('i', '<Space>', '<Space>', '<Space>')
" call smartinput#define_rule({
" 			\   'at'    : '(\%#)',
" 			\   'char'  : '<Space>',
" 			\   'input' : '<Space><Space><Left>',
" 			\   })
" call smartinput#define_rule({
" 			\   'at'    : '( \%# )',
" 			\   'char'  : '<BS>',
" 			\   'input' : '<Del><BS>',
" 			\   })
" call smartinput#map_to_trigger('i', '<Plug>(smartinput_CR)',
" 			\                        '<Enter>',
" 			\                        '<Enter>')
" }}}
colorscheme solarized
" カラースキームの色設定 {{{
" For Solarized
hi Comment ctermfg=11
hi SpecialKey ctermbg=8 ctermfg=23
" }}}
