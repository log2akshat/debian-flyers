# Begin Configuration ----------------------------------------
#
#  Please add the native names for the languages you would like to use
#
lang1 = english
lang2 = deutsch
#
# End Configuration ----------------------------------------

base = flyer
texfiles = preamble.tex layout.tex
langfiles = deutsch.tex italiano.tex nederlands.tex english.tex \
	francaise.tex portugues.tex svenska.tex

.SUFFIXES:	.ps .dvi

export TEXINPUTS=./sponsors:

.dvi.ps:
	dvips $*

$(base).ps:

all.dvi: all.tex $(texfiles) $(langfiles)
	echo -n > config.tex
	latex all

$(base).dvi: $(base).tex $(lang1).tex $(lang2).tex $(texfiles) Makefile
	./mkconfig $(lang1) $(lang2)
	rm -f $(base).aux
	latex $(base)

$(base).jpg: $(base).ps
	gs -dBATCH -dNOPAUSE -sDEVICE=jpeg -sPAPERSIZE=a4 -sOutputFile=$(base).jpg $(base).ps
	# mogrify -rotate -90 $(base).jpg

$(base).png: $(base).ps
	gs -dBATCH -dNOPAUSE -sDEVICE=png16 -sPAPERSIZE=a4 -sOutputFile=$(base).png $(base).ps
	# mogrify -rotate -90 $(base).png

300dpi: $(base).dvi
	dvips -D 300 -o $(base)-300dpi.ps $(base)

600dpi: $(base).dvi
	dvips -D 600 -o $(base)-600dpi.ps $(base)

720dpi: $(base).dvi
	dvips -D 720 -o $(base)-720dpi.ps $(base)

# Requires aurora.pro from CTAN
#
cmyk300: $(base).dvi
	dvips -D 300 -h aurora.pro -h magenta.pro -o $(base)-300dpi-magenta.ps $(base)
	dvips -D 300 -h aurora.pro -h yellow.pro -o $(base)-300dpi-yellow.ps $(base)
	dvips -D 300 -h aurora.pro -h cyan.pro -o $(base)-300dpi-cyan.ps $(base)
	dvips -D 300 -h aurora.pro -h black.pro -o $(base)-300dpi-black.ps $(base)

cmyk600: $(base).dvi
	dvips -D 600 -h aurora.pro -h magenta.pro -o $(base)-600dpi-magenta.ps $(base)
	dvips -D 600 -h aurora.pro -h yellow.pro -o $(base)-600dpi-yellow.ps $(base)
	dvips -D 600 -h aurora.pro -h cyan.pro -o $(base)-600dpi-cyan.ps $(base)
	dvips -D 600 -h aurora.pro -h black.pro -o $(base)-600dpi-black.ps $(base)

upload: clean
	$(MAKE) $(base).ps
	-rm -f $(base).{eps,dvi,aux,log}
	rsync -e ssh -va --exclude CVS/ --delete ./ klecker.debian.org:/org/www.debian.org/events-materials/flyers/general/

clean:
	-rm -f $(base).{ps,eps,dvi,aux,log,jpg} *~
	-rm -f all.{ps,eps,dvi,aux,log,jpg}
	-rm -f $(base)-*.ps
