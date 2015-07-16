texinputs = TEXINPUTS=../proceeding_template:../commons:contents:
bibinputs = BIBINPUTS=../commons:
texoptions = -lualatex \
			 -output-directory=build \
			 -interaction=nonstopmode \
			 -halt-on-error

all: build/poster.pdf

build/poster.pdf: poster.tex poster_header.tex beamerthemefact.sty | build
	$(texinputs) latexmk $(texoptions) poster.tex

preview: poster.tex poster_header.tex beamerthemefact.sty | build
	$(texinputs) latexmk $(texoptions) -pvc poster.tex

build:
	mkdir -p build

clean:
	rm -rf build
