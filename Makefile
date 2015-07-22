texoptions = -lualatex \
			 -output-directory=build \
			 -interaction=nonstopmode \
			 -halt-on-error

all: build/poster.pdf

build/poster.pdf: poster.tex beamerthemefact.sty | build
	latexmk $(texoptions) poster.tex

# this compiles the poster, opens a pdf viewer and 
# then constantly updates if the input files are changed
preview: poster.tex beamerthemefact.sty | build
	latexmk $(texoptions) -pvc poster.tex

build:
	mkdir -p build

clean:
	rm -rf build
