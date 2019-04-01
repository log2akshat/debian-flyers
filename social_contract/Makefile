################################################################################

# Note for new translations
# Edit the two following variables and add you language

# List of available languages
LANG_LIST = en \
            it \
            fr

# List files for available languages
LANG_FILES = sc_en.tex \
             sc_it.tex \
             sc_fr.tex

################################################################################

# List of necessary files
LAYOUTFILES=layout.tex preamble.tex openlogo-nd-alpha.svg all-in-one_social_contract.tex

# Default lang is english
lang=en

# Create all-in-one file and one file for each translation
all: all-in-one all-lang

# Convert SVG logo to PDF format
openlogo-nd-alpha.pdf:
	rsvg-convert -f pdf openlogo-nd-alpha.svg > openlogo-nd-alpha.pdf

# Create all-in-one file
all-in-one: openlogo-nd-alpha.pdf ${LAYOUTFILES} ${LANG_FILES}
	cp all-in-one_social_contract.tex social_contract.tex
	xelatex social_contract.tex

# Create files for each translation
all-lang: openlogo-nd-alpha.pdf ${LAYOUTFILES} ${LANG_FILES}
	for l in $(LANG_LIST); do make lang lang=$$l; done

# Create file for the current lang
lang: openlogo-nd-alpha.pdf ${LAYOUTFILES} ${LANG_FILES}
	./mklang $(lang)
	xelatex social_contract_$(lang).tex

dist:
	tar cJf ../social_contract.tar.xz --exclude="*.pdf" \
	    --exclude=.gitignore ../social_contract

clean:
	rm -f \
		social_contract* \
		openlogo-nd-alpha.pdf

.PHONY: all dist clean
