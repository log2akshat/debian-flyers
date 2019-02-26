See [README.md](README.md) for general information.

Professional offset printing presses need color separated files, in order to
create one printing plate per color: cyan, magenta, yellow, and black (CMYK).
The cmyk600pdf make target will produce 4 files; one for each color.

Requires aurora.pro from CTAN: http://www.ctan.org/tex-archive/support/aurora/
Aurora.pro is not free software, and therefore not in Debian main.  If you
dislike this, try colorsep.pro.

Beware!  These days, printing shops quite often no longer know how
to deal with PostScript files.  A lot of them can process PDF files only.

If you want to save money and get the job done in 2 print stages instead of 4,
by printing only black and red, you'd have to send flyer-600dpi-magenta.pdf and
flyer-600dpi-black.pdf only.
