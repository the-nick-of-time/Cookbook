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

view: view-Cookbook.pdf view-Cookbook-Tested.pdf view-Cookbook-Digital.pdf
view-%:
	# $* evaluates to nothing at the point it is evaluated in the dependency list
	# so normal dependencies don't work
	$(MAKE) $*
	xdg-open $*

upload: upload-Cookbook.pdf upload-Cookbook-Tested.pdf upload-Cookbook-Digital.pdf
upload-%:
	# $* evaluates to nothing at the point it is evaluated in the dependency list
	# so normal dependencies don't work
	$(MAKE) $*
	rsync --chown=server:server --chmod=444 $* doksta:/var/www/files/$*

phone-sync: Cookbook.pdf Cookbook-Tested.pdf Cookbook-Digital.pdf
	for file in $^ ; do kdeconnect-cli --share $$file --name "$$PHONE" ; done
