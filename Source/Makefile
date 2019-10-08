sync=1
outdir=../
auxdir=./
OPTIONS=-synctex=$(sync) -interaction=nonstopmode -output-directory=$(outdir) -aux-directory=$(auxdir)


all: cookbook tested


cookbook: cookbook_setup cookbook_compile cookbook_cleanup

cookbook_setup:
cookbook_compile: cookbook_setup
	pdflatex $(OPTIONS) -job-name=Cookbook Cookbook.tex > /dev/null
	# Compile again for table of contents
	pdflatex $(OPTIONS) -job-name=Cookbook Cookbook.tex > /dev/null
cookbook_cleanup: cookbook_compile


tested: tested_setup tested_compile tested_cleanup

tested_setup:
	cat Cookbook.tex | python3 remove_untested.py > filtered.tex
tested_compile: tested_setup
	pdflatex $(OPTIONS) -job-name=Cookbook-Tested_only filtered.tex > /dev/null
	# Compile again for table of contents
	pdflatex $(OPTIONS) -job-name=Cookbook-Tested_only filtered.tex > /dev/null
tested_cleanup: tested_compile
	rm filtered.tex


record:
	pdflatex $(OPTIONS) -record-package-usages=./packages.used -job-name=Cookbook Cookbook.tex > /dev/null


.PHONY: view clean

clean:
	rm *.aux *.log *.out *.tmb *.toc ../*.pdf ../*.synctex.gz

view: view-main view-tested
view-main:
	xdg-open ../Cookbook.pdf
view-tested:
	xdg-open ../Cookbook-Tested_only.pdf
