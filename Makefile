#   Copyright (c) 2002 Software in the Public Interest, Inc.
#
#   This program is free software; you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation; version 2 dated June, 1991.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with this program;  if not, write to the Free Software
#   Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111, USA.

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
origfile = english.tex
transfiles = deutsch.tex italiano.tex nederlands.tex francaise.tex \
	portugues.tex svenska.tex dansk.tex

langfiles = $(origfile) $(transfiles)

.SUFFIXES:	.ps .pdf .dvi

export TEXINPUTS=./sponsors:

.dvi.ps:
	dvips $*

.dvi.pdf:
	dvipdf $*

$(base).ps:

all.dvi: all.tex $(texfiles) $(langfiles)
	echo -n > config.tex
	latex all

all.ps.gz: all.ps
	gzip -c $< > $@

$(base).dvi: $(base).tex $(lang1).tex $(lang2).tex $(texfiles) Makefile
	./mkconfig $(lang1) $(lang2)
	rm -f $(base).aux
	latex $(base)

$(base).jpg: $(base).ps
	gs -dBATCH -dNOPAUSE -sDEVICE=jpeg -sPAPERSIZE=a4 -sOutputFile=$(base).jpg $(base).ps
	# mogrify -rotate -90 $(base).jpg

$(base).png: $(base).ps
	gs -dBATCH -dNOPAUSE -sDEVICE=png256 -sPAPERSIZE=a4 -sOutputFile=$(base).png $(base).ps
	# gs -dBATCH -dNOPAUSE -sDEVICE=png16 -sPAPERSIZE=a4 -sOutputFile=$(base).png $(base).ps
	# mogrify -rotate -90 $(base).png

300dpi: $(base).dvi
	dvips -D 300 -o $(base)-300dpi.ps $(base)

600dpi: $(base).dvi
	dvips -D 600 -o $(base)-600dpi.ps $(base)

720dpi: $(base).dvi
	dvips -D 720 -o $(base)-720dpi.ps $(base)

# Requires aurora.pro from CTAN: http://www.ctan.org/tex-archive/support/aurora/
# Aurora.pro is not free software, and therefore not in Debian main.  If you
# dislike this, try colorsep.pro.
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

cmyk600pdf: cmyk600
	ps2pdf $(base)-600dpi-magenta.ps $(base)-600dpi-magenta.pdf
	ps2pdf $(base)-600dpi-yellow.ps $(base)-600dpi-yellow.pdf
	ps2pdf $(base)-600dpi-cyan.ps $(base)-600dpi-cyan.pdf
	ps2pdf $(base)-600dpi-black.ps $(base)-600dpi-black.pdf

#
# sponsor logos
#

# Murphy sponsored nederlands.tex
sponsors/murphy.eps:
	cd sponsors; wget http://www.murphy.nl/picts/logo_new_top64.gif; convert logo_new_top64.gif murphy.eps

#
# housekeeping targets
#

# check up-to-dateness of translations
check:
	@for l in $(transfiles); do ./translation-check.pl $$l; done

# upload: clean
# 	$(MAKE) $(base).ps
# 	-rm -f $(base).{eps,dvi,aux,log}
# 	rsync -e ssh -va --exclude CVS/ --delete ./ klecker.debian.org:/org/www.debian.org/events-materials/flyers/general/
# 	ssh klecker "cd /org/www.debian.org/events-materials/flyers/general && chgrp -R webwml * && chmod -R g+w *"


upload: flyer.png all.ps.gz all.pdf
	scp $? haydn.debian.org:/org/alioth.debian.org/chroot/ftproot/pub/debian-flyers/

clean:
	-rm -f $(base).{ps,eps,dvi,aux,log,jpg} *~
	-rm -f all.{ps,eps,dvi,aux,log,jpg}
	-rm -f $(base)-*.ps

ChangeLog: NEWS
	cvs2cl --accum --prune

