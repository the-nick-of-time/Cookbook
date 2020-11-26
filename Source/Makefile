sync=1
OPTIONS=-synctex=$(sync) -interaction=nonstopmode


all: cookbook tested digital


cookbook: ../Cookbook.pdf

../Cookbook.pdf: Cookbook.tex $(wildcard ./entries/*.tex)
	latexmk $(OPTIONS) -pdf -jobname=Cookbook $< > /dev/null
	mv Cookbook.pdf ../
	mv Cookbook.synctex.gz ../


tested: ../Cookbook-Tested.pdf

../Cookbook-Tested.pdf: Cookbook.tex $(wildcard ./entries/*.tex)
	latexmk $(OPTIONS) -pdf -jobname=Cookbook-Tested $< > /dev/null
	mv Cookbook-Tested.pdf ../
	mv Cookbook-Tested.synctex.gz ../

digital: ../Cookbook-Digital.pdf

../Cookbook-Digital.pdf: Cookbook.tex $(wildcard ./entries/*.tex)
	latexmk $(OPTIONS) -pdf -jobname=Cookbook-Digital $< > /dev/null
	mv Cookbook-Digital.pdf ../
	mv Cookbook-Digital.synctex.gz ../

new:
	"$(PWD)/interactive.sh"



packages.used: Cookbook.tex
	pdflatex $(OPTIONS) -recorder -jobname=Cookbook $< > /dev/null


.PHONY: view clean all cookbook tested view-main view-tested new

clean:
	git clean -Xf ..

view: view-main view-tested view-digital
view-main: ../Cookbook.pdf
	xdg-open ../Cookbook.pdf
view-tested: ../Cookbook-Tested.pdf
	xdg-open ../Cookbook-Tested.pdf
view-digital: ../Cookbook-Digital.pdf
	xdg-open $<

upload: upload-main upload-tested upload-digital
upload-main: ../Cookbook.pdf
	rsync --chown=server:server --chmod=444 $< doksta:/var/www/files/Cookbook.pdf
upload-tested: ../Cookbook-Tested.pdf
	rsync --chown=server:server --chmod=444 $< doksta:/var/www/files/Cookbook-Tested.pdf
upload-digital: ../Cookbook-Digital.pdf
	rsync --chown=server:server --chmod=444 $< doksta:/var/www/files/Cookbook-Digital.pdf

phone-sync: ../Cookbook.pdf ../Cookbook-Tested.pdf ../Cookbook-Digital.pdf
	kdeconnect-cli --share ../Cookbook.pdf --name "$$PHONE"
	kdeconnect-cli --share ../Cookbook-Tested.pdf --name "$$PHONE"
	kdeconnect-cli --share ../Cookbook-Digital.pdf --name "$$PHONE"
