
LANGFILES=sc_en.tex sc_it.tex
LAYOUTFILES=layout.tex preamble.tex social_contract.tex

all: social_contract.pdf

openlogo-nd-alpha.pdf:
	rsvg-convert -f pdf openlogo-nd-alpha.svg > openlogo-nd-alpha.pdf

social_contract.pdf: openlogo-nd-alpha.pdf ${LANGFILES} ${LAYOUTFILES}
	xelatex social_contract.tex
	xelatex social_contract.tex

dist:
	tar cJf ../social_contract.tar.xz --exclude="*.pdf" \
	    --exclude=.gitignore ../social_contract

clean:
	rm -f social_contract.aux social_contract.log social_contract.out openlogo-nd-alpha.pdf

.PHONY: all dist clean
