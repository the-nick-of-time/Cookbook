#!/bin/bash

exe="$0"
title="$1"
time="$2"
yield="$3"
here=$(dirname "$(readlink -f "$0")")

usage() {
	cat <<< "$exe TITLE TIME YIELD"
}

filename() {
	echo "$here/entries/$(label).tex"
}

label() {
	python -c 'from sys import argv;from re import sub;print(sub(r"[^\w]", "", argv[1].title()),end="")' "$title"
}


file() {
cat <<< "\\documentclass[../Cookbook.tex]{subfiles}

\\begin{document}

\\begin{recipe}[$(label)]{$title}{$yield}{$time}

\\end{recipe}

\\end{document}
"
}


if [ "$#" -ne 3 ] ; then
	usage
	exit 1
fi

file > "$(filename)"
echo "Created entries/$(basename "$(filename)")" >&2
