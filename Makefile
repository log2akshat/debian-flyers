base = flyer

export TEXINPUTS=./sponsors:

$(base).dvi: $(base).tex
	latex $(base)

$(base).ps: $(base).tex
	dvips $(base)

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

clean:
	-rm -f $(base).{ps,eps,dvi,aux,log,jpg} *~
	-rm -f $(base)-*.ps
