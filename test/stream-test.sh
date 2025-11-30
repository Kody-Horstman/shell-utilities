#!/usr/bin/env bash

. /home/kody/Dev/shell-utilities/src/stream.sh

function print-test {
	if [[ $# -lt 2 ]]; then
		stream::printerr "Error: Expected 2 or more arguments. Got $#"
		stream::printerr "Usage: print-test-body TEST CMD [ARGS]"
		return
	fi

	TEST_LOCAL=$1
	shift
	CMD_LOCAL=$*

	echo $TEST_LOCAL
	printf "\tInput:\t$CMD_LOCAL\n"
	printf "\tOutput:\t$(eval $CMD_LOCAL)\n"
	echo "...done"
	echo

	unset TEST_LOCAL CMD_LOCAL
}

function stream-test::printstd::no-input {
	TEST='TEST: printstd: no-input...'
	CMD='stream::printstd'

	print-test "$TEST" $CMD

	unset TEST CMD
}

function stream-test::printstd::single-string {
	TEST='TEST: printstd: single-string...'
	CMD='stream::printstd "This is a single string"'

	print-test "$TEST" $CMD

	unset TEST CMD
}

function stream-test::printstd::string-and-variable {
	TEST='TEST: printstd: string-and-variable...'
	VAR=234
	CMD='stream::printstd "Var is" $VAR'

	print-test "$TEST" $CMD

	unset TEST CMD VAR
}


function stream-test::printstd::multiple-variables {
	TEST="TEST: printstd: multiple-variables"
	VAR0=123
	VAR1="'Lorem Ipsum'"
	CMD='stream::printstd $VAR0 $VAR1'

	print-test "$TEST" $CMD

	unset TEST VAR0 VAR1 CMD
}

function stream-test::printstd::single-subshell {
	TEST="TEST: printstd: single-subshell"
	CMD='stream::printstd $(ps --no-headers $$)'

	print-test "$TEST" $CMD

	unset TEST CMD
}

function stream-test::printstd::multiple-subshells {
	TEST="TEST: printstd: multiple-subshells"
	CMD='stream::printstd $(ps --no-headers $$) $(uptime -p)'

	print-test "$TEST" $CMD

	unset TEST CMD
}

function stream-test::printstd {
	stream-test::printstd::no-input
	stream-test::printstd::single-string
	stream-test::printstd::string-and-variable
	stream-test::printstd::multiple-variables
	stream-test::printstd::single-subshell
	stream-test::printstd::multiple-subshells
}

function main {

	stream-test::printstd

	exit 0
}
main
