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
