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
let s:dein_repo_dir = s:vimdir . '/dein/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
	echo "dein is not installed, will be installed now "
	let s:dein_repo = "https://github.com/Shougo/dein.vim"
	echo "git clone " . s:dein_repo . " " . s:dein_repo_dir
	call system("git clone " . s:dein_repo . " " . s:dein_repo_dir)
endif
let &runtimepath = &runtimepath . ',' . s:dein_repo_dir

" TOML settings
let s:dein_toml_dir = s:vimdir . '/dein_toml'
let s:dein_toml_file = s:dein_toml_dir . '/dein.toml'
let s:dein_lazy_toml_file = s:dein_toml_dir . '/dein_lazy.toml'
if has("vim_starting")
	if ! isdirectory(s:dein_toml_dir)
		call system("mkdir " . s:dein_toml_dir)
	endif
	if ! isdirectory(s:dein_toml_file)
		call system("touch " . s:dein_toml_file)
	endif
	if ! isdirectory(s:dein_lazy_toml_file)
		call system("touch " . s:dein_lazy_toml_file)
	endif
endif

if dein#load_state(s:dein_dir)
	call dein#begin(s:dein_dir)

	call dein#load_toml(s:dein_toml_file, {'lazy': 0})
	call dein#load_toml(s:dein_lazy_toml_file, {'lazy': 1})

	call dein#end()
	call dein#save_state()
endif
if dein#check_install()
	call dein#install()
endif

filetype plugin indent on
syntax on
" カラースキームの色設定
" Solarized
autocmd ColorScheme * highlight Normal ctermbg=none
autocmd ColorScheme * highlight LineNr ctermbg=none
