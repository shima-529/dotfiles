function runJava(){
	local className=${1%.java}
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

function runcpp(){
	g++ $1 -o /tmp/tmp.out && shift && /tmp/tmp.out $@
	rm /tmp/tmp.out 2>&1 > /dev/null
}

alias -s py='python'
alias -s rb='ruby'
alias -s pl='perl'
alias -s php='php'
alias -s f90=runFortran
alias -s c=runC
alias -s cpp=runcpp
alias -s d='rdmd'
alias -s java=runJava
alias -s {css,md,markdown,html,php}='subl'
alias -s {bmp,BMP,png,PNG,jpg,jpeg,JPG,gif,GIF,eps,EPS}='icat'
