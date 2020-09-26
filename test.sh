#!/bin/bash
assert() {
	expected="$1"
	input="$2"

	./0xcc "$input" > tmp.s
	cc -o tmp tmp.s
	./tmp
	actual="$?"

	if [ "$actual" = "$expected" ]; then
		echo "$input => $actual"
	else
		echo "$input => $expected expected, but got $actual"
		exit 1;
	fi
}

assert 0 0
assert 42 42
assert 128 128

assert 30 "5+10+15"
assert 21 "0x5+0x10"
assert 15 "20-10+5"
assert 37 "0x20+8-3"

echo OK

		
