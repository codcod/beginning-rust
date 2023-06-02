# $ make --version
# GNU Make 3.81
# Copyright (C) 2006  Free Software Foundation, Inc.
# This is free software; see the source for copying conditions.
# There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A
# PARTICULAR PURPOSE.
#
# This program built for i386-apple-darwin11.3.0

.PHONY = clean install

BUILD_DIR = build
BOOK_NAME = beginning-rust
MAIN_FILE = docs/main.adoc
THEME = basic

install:
	brew install asciidoctor
	sudo gem install asciidoctor-epub3 asciidoctor-pdf

clean:
	rm -rf $(BUILD_DIR)

pdf:
	asciidoctor -r asciidoctor-pdf \
		-b pdf \
		-D $(BUILD_DIR)\
		-o $(BOOK_NAME).pdf \
		-a pdf-theme=themes/$(THEME)-theme.yml \
		-a pdf-fontsdir=fonts \
		$(MAIN_FILE)
	open $(BUILD_DIR)/$(BOOK_NAME).pdf

epub:
	asciidoctor-epub3 \
		-D $(BUILD_DIR) \
		-o $(BOOK_NAME).epub \
		-a pdf-theme=themes/$(THEME)-theme.yml \
		-a pdf-fontsdir=fonts \
		$(MAIN_FILE)
	open $(BUILD_DIR)/$(BOOK_NAME).epub

html:
	asciidoctor -D $(BUILD_DIR) \
		-o $(BOOK_NAME).html \
		-a pdf-theme=themes/$(THEME)-theme.yml \
		-a pdf-fontsdir=fonts \
		$(MAIN_FILE)
	open $(BUILD_DIR)/$(BOOK_NAME).html

