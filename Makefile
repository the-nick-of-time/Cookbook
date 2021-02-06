sync=1
OPTIONS=-synctex=$(sync) -interaction=nonstopmode

%.pdf: Cookbook.tex $(wildcard ./entries/*.tex)
	latexmk $(OPTIONS) -pdf -jobname=$* $< >/dev/null

all: cookbook tested digital

cookbook: Cookbook.pdf
tested: Cookbook-Tested.pdf
digital: Cookbook-Digital.pdf

new:
	"$(PWD)/interactive.sh"

Cookbook.zip: Cookbook.pdf Cookbook-Tested.pdf Cookbook-Digital.pdf
	zip $@ $^

zip: Cookbook.zip

.PHONY: view clean all cookbook tested view-main view-tested new zip

clean:
	git clean -Xf .

view: view-main view-tested view-digital
view-main: Cookbook.pdf
	xdg-open $<
view-tested: Cookbook-Tested.pdf
	xdg-open $<
view-digital: Cookbook-Digital.pdf
	xdg-open $<

upload: upload-main upload-tested upload-digital
upload-main: Cookbook.pdf
	rsync --chown=server:server --chmod=444 $< doksta:/var/www/files/$<
upload-tested: Cookbook-Tested.pdf
	rsync --chown=server:server --chmod=444 $< doksta:/var/www/files/$<
upload-digital: Cookbook-Digital.pdf
	rsync --chown=server:server --chmod=444 $< doksta:/var/www/files/$<

phone-sync: Cookbook.pdf Cookbook-Tested.pdf Cookbook-Digital.pdf
	for file in $^ ; do kdeconnect-cli --share $$file --name "$$PHONE" ; done
