sync=1
OPTIONS=-synctex=$(sync) -interaction=nonstopmode


all: cookbook tested


cookbook: ../Cookbook.pdf

../Cookbook.pdf: Cookbook.tex $(wildcard ./entries/*.tex)
	pdflatex $(OPTIONS) -jobname=Cookbook Cookbook.tex > /dev/null
	# Compile again for table of contents
	pdflatex $(OPTIONS) -jobname=Cookbook Cookbook.tex > /dev/null
	mv Cookbook.pdf ../
	mv Cookbook.synctex.gz ../


tested: ../Cookbook-Tested_only.pdf

../Cookbook-Tested_only.pdf: Cookbook.tex $(wildcard ./entries/*.tex)
	pdflatex $(OPTIONS) -jobname=Cookbook-Tested_only $< > /dev/null
	# Compile again for table of contents
	pdflatex $(OPTIONS) -jobname=Cookbook-Tested_only $< > /dev/null
	mv Cookbook-Tested_only.pdf ../
	mv Cookbook-Tested_only.synctex.gz ../

new:
	"$(PWD)/interactive.sh"



packages.used: Cookbook.tex
	pdflatex $(OPTIONS) -recorder -jobname=Cookbook $< > /dev/null


.PHONY: view clean all cookbook tested view-main view-tested new

clean:
	git clean -Xf ..

view: view-main view-tested
view-main: ../Cookbook.pdf
	xdg-open ../Cookbook.pdf
view-tested: ../Cookbook-Tested_only.pdf
	xdg-open ../Cookbook-Tested_only.pdf
