" runtime! vimrc/*.vim
source $HOME/.vim/vimrc/1_Basic.vim
source $HOME/.vim/vimrc/2_Keymap.vim
source $HOME/.vim/vimrc/3_dein.vim
source $HOME/.vim/vimrc/5_color.vim

hi SpecialKey guibg=Gray15

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
