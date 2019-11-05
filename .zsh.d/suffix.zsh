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
