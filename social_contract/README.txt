This directory includes an additional two-sided flyer with the text of the
Debian Social Contract and the DFSG.

Compiling the flyer
-------------------

Build dependencies include:

   make
   texlive-xetex
   texlive-lang-english
   texlive-lang-italian
   texlive-lang-french
   librsvg2-bin

To build a PDF of the flyer, in all available languages, just run make.

Adding a translation
--------------------

To add a new translation to this flyer copy sc_en.tex to sc_$LANG.tex.

Then you need to append this file to the LANGFILES= line in the Makefile,
and add two lines to social_contract.tex with includes for your language and
another copy of the layout.
