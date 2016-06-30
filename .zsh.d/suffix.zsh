function runJava(){
	className=${1%.java}
	javac $1 && shift && java ${className} $@
	rm ./${className}.class
}

function runFortran(){
	gfortran $1 -o /tmp/tmp.out && shift && /tmp/tmp.out $@
	rm /tmp/tmp.out 2>&1 > /dev/null
}

function runC(){
	gcc $1 -o /tmp/tmp.out && shift && /tmp/tmp.out $@
	rm /tmp/tmp.out 2>&1 > /dev/null
}

function runCpp(){
	g++ $1 -o /tmp/tmp.out && shift && /tmp/tmp.out $@
	rm /tmp/tmp.out 2>&1 > /dev/null
}

alias -s py='python'
alias -s c=runC
alias -s cpp=runCpp
alias -s f90=runFortran
alias -s {css,md,markdown,html,php}='subl'
alias -s {vim,rc}='vim'
alias -s java=runJava
