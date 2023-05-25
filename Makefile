SHELL=/usr/bin/bash
HUGO_BIN=hugo
GO_BIN=go
NPM_BIN=npm


.PHONY: build demo release

build: clean
	$(HUGO_BIN) --cleanDestinationDir

demo:
	$(HUGO_BIN) server --disableFastRender --ignoreCache --port 1326
# -D --port 9001 --bind 0.0.0.0

update:
	$(HUGO_BIN) mod get -u github.com/FortAwesome/Font-Awesome
	$(HUGO_BIN) mod get -u github.com/google/docsy@main
	$(HUGO_BIN) mod get -u github.com/twbs/bootstrap@v5.2

vendor:
	rm -rf _vendor
	$(HUGO_BIN) mod vendor

clean:
	rm -rf public resources
