This directory includes an additional two-sided flyer with the text of the
Debian Social Contract and the DFSG.

Compiling the flyer
-------------------

Build dependencies include:

+ make
+ texlive-xetex
+ texlive-lang-english
+ texlive-lang-italian
+ librsvg2-bin

To build a PDF of the flyer, in all available languages, just run `make`.

Adding a translation
--------------------

Step to add a new translation to this flyer:

+ copy`sc_en.tex` to `sc_$LANG.tex`,
+ append this file to the `LANGFILES=` line in the Makefile,
+ add two lines to `social_contract.tex` with includes for your language and
another copy of the `layout`,
+ add your language in the `preamble.tex` file, section **babel**.