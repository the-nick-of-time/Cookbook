sync=1
OPTIONS=-synctex=$(sync) -interaction=nonstopmode
OUTS=Cookbook.pdf Cookbook-Tested.pdf Cookbook-Digital.pdf

%.pdf: Cookbook.tex $(wildcard ./entries/*.tex)
	latexmk $(OPTIONS) -pdf -jobname=$* $< >/dev/null

all: cookbook tested digital

cookbook: Cookbook.pdf
tested: Cookbook-Tested.pdf
digital: Cookbook-Digital.pdf

new:
	"$(PWD)/new.sh"

Cookbook.zip: $(OUTS)
	zip $@ $^

zip: Cookbook.zip

release: $(OUTS)
	./github-release-api/github_release_manager.sh \
		-l the-nick-of-time -t $$(cat ~/code/github_api_key) \
		-o the-nick-of-time -r Cookbook \
		-d $$(git describe --tags --abbrev=0) \
		-c create
	./github-release-api/github_release_manager.sh \
		-l the-nick-of-time -t $$(cat ~/code/github_api_key) \
		-o the-nick-of-time -r Cookbook \
		-d $$(git describe --tags --abbrev=0) \
		-c upload $^

.PHONY: view clean all cookbook tested view-main view-tested new zip

clean:
	git clean -Xf .

view: view-Cookbook.pdf view-Cookbook-Tested.pdf view-Cookbook-Digital.pdf
view-%: %
	xdg-open $*

upload: upload-Cookbook.pdf upload-Cookbook-Tested.pdf upload-Cookbook-Digital.pdf
upload-%: %
	rsync --chown=server:server --chmod=444 $* doksta:/var/www/files/$*

phone-sync: $(OUTS)
	for file in $^ ; do kdeconnect-cli --share $$file --name "$$PHONE" ; done
