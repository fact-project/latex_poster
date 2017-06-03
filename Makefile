texoptions = -lualatex \
			 -output-directory=build \
			 -interaction=nonstopmode \
			 -halt-on-error

all: build/example.pdf

build/example.pdf: FORCE | build
	latexmk $(texoptions) example.tex

# this compiles the poster, opens a pdf viewer and 
# then constantly updates if the input files are changed
preview: FORCE | build
	latexmk $(texoptions) -pvc example.tex

FORCE:

build:
	mkdir -p build

clean:
	rm -rf build


.PHONY: clean FORCE all
