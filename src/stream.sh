
# Prints arguments to STDOUT
function stream::printstd {
	printf "$*\n" >&1 ;
}

# Prints arguments to STDERR
function stream::printerr {
	printf "$*\n" >&2 ;
}

