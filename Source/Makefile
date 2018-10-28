sync=1
outdir=../
auxdir=./
OPTIONS=-synctex=$(sync) -interaction=nonstopmode -output-directory=$(outdir) -aux-directory=$(auxdir)


all: cookbook tested


cookbook: cookbook_setup cookbook_compile cookbook_cleanup

cookbook_setup:
cookbook_compile:
	pdflatex $(OPTIONS) -job-name=Cookbook Cookbook.tex > /dev/null
	pdflatex $(OPTIONS) -job-name=Cookbook Cookbook.tex > /dev/null
cookbook_cleanup:


tested: tested_setup tested_compile tested_cleanup

tested_setup:
	cat Cookbook.tex | python3 remove_untested.py > filtered.tex
tested_compile:
	pdflatex $(OPTIONS) -job-name=Cookbook-Tested_only filtered.tex > /dev/null
	pdflatex $(OPTIONS) -job-name=Cookbook-Tested_only filtered.tex > /dev/null
tested_cleanup:
	rm filtered.tex
