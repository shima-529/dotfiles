function runJava(){
	className=${1%.java}
	javac $1 && shift && java ${className} $@
}

function runFortran(){
	gfortran $1 -o /tmp/tmp.out && shift && /tmp/tmp.out $@
	rm /tmp/tmp.out 2>&1 > /dev/null
}

alias -s py='python'
alias -s c='c'
alias -s f90=runFortran
alias -s {css,md,markdown,html,php}='subl'
alias -s {vim,rc}='vim'
alias -s java=runJava
