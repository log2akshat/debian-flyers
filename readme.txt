For convenience Joey put these files into a cvs repository which is
publically available.

Through the web:

  http://cvs.infodrom.org/goodies/flyers/general/?cvsroot=debian

Through anonymous CVS:

  cvs -d :pserver:anonymous@cvs.infodrom.org:/var/cvs/debian login
  [Enter]

  cvs -d :pserver:anonymous@cvs.infodrom.org:/var/cvs/debian co -d flyer goodies/flyers/general

Compiling the flyer
-------------------

Please use the Makefile which provides several targets for you:

  make flyer.ps

       Compiles the flyer with both languages set in the Makefile.

  make flyer.jpg

       Compils the flyer like with flyer.ps and copies the first page
       into a JPEG file.

  make all.ps

       Compiles all currently available translation into one file.

  make 300dpi|600dpi|720dpi

       Creates a special nnn dpi version of the Postscript file for
       the flyer, this is useful for high-quality printers.

  make clean

       Cleans up the directory, removes all compiled files.

Adding a translation
--------------------

To add a new translation to this general flyer, copy english.txt into
language.tex, where "language" is the local name of your language
(i.e. francaise for french, deutsch for german etc.).  Please add the
file to this directory (e.g. by sending a mail to joey@debian.org).

When you add a new translation, please be careful with the size of
your translation.  If the text is too long, an empty page is inserted
by LaTeX and the text doesn't fit on the page.  In such a case, please
shorten the translation somehow without changing the meaning too much.
