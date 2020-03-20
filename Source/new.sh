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
	# python -c 'import sys;title=sys.argv[1];print("./entries/" + title.lower().translate(str.maketrans(" ", "_")) + ".tex")' "$1"
	basename=$(sed 's/[^[:alpha:]]/_/g' <<< "$1")
	echo "$here/entries/$basename.tex"
}

label() {
	sed 's/[^[:alpha:]]//g' <<< "$1"
}


file() {
cat <<< "\\documentclass[../Cookbook.tex]{subfiles}

\\begin{document}

\\begin{recipe}[$(label "$title")]{\\textbf{$title}}{$yield}{$time}
	
\\end{recipe}

\\end{document}
"
}


if [ "$#" -ne 3 ] ; then
	usage
	exit 1
fi

file > "$(filename "$title")"
