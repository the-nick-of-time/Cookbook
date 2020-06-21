sync=1
OPTIONS=-synctex=$(sync) -interaction=nonstopmode


all: cookbook tested


cookbook: Cookbook.pdf

Cookbook.pdf: Cookbook.tex $(wildcard ./entries/*.tex)
	xelatex $(OPTIONS) -jobname=Cookbook Cookbook.tex > /dev/null
	# Compile again for table of contents
	xelatex $(OPTIONS) -jobname=Cookbook Cookbook.tex > /dev/null


tested: Cookbook-Tested_only.pdf

Cookbook-Tested_only.pdf: Cookbook.tex $(wildcard ./entries/*.tex)
	xelatex $(OPTIONS) -jobname=Cookbook-Tested_only $< > /dev/null
	# Compile again for table of contents
	xelatex $(OPTIONS) -jobname=Cookbook-Tested_only $< > /dev/null

new:
	"$(PWD)/interactive.sh"



packages.used: Cookbook.tex
	xelatex $(OPTIONS) -recorder -jobname=Cookbook $< > /dev/null


.PHONY: view clean all cookbook tested view-main view-tested new

clean:
	git clean -Xf .

view: view-main view-tested
view-main: Cookbook.pdf
	xdg-open Cookbook.pdf
view-tested: Cookbook-Tested_only.pdf
	xdg-open Cookbook-Tested_only.pdf

upload: upload-main upload-tested
upload-main: Cookbook.pdf
	rsync --chown=server:server --chmod=444 $< doksta:/var/www/files/Cookbook.pdf
upload-tested: Cookbook-Tested_only.pdf
	rsync --chown=server:server --chmod=444 $< doksta:/var/www/files/Cookbook-Tested_only.pdf

release:
	./release.sh
