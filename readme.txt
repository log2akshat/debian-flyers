We have put these files into a git repository which is
publically available.

Through the web:

https://anonscm.debian.org/cgit/debian-flyers/debian-flyers.git/

Through read/write git (if you have an Alioth account in the
debian-flyers group)

   git clone git+ssh://git.debian.org/git/debian-flyers/debian-flyers.git

Through anonymous read-only:

   git clone https://anonscm.debian.org/git/debian-flyers/debian-flyers.git

Compiling the flyer
-------------------

Depending on the target languages, you may need to install these packages:

texlive-lang-german 
texlive-lang-portuguese 
texlive-lang-french  
texlive-lang-italian 
texlive-lang-european


Please use the Makefile which provides several targets for you:

  make flyer.ps

       Compiles the flyer with both languages set in the Makefile.

  make lang1=nederlands lang2=english flyer.ps

       Compiles the flyer, using nederlands for language on front
       page, and english for language on back page.  (You might have
       to run "# dpkg-reconfigure tetex-bin" to add hyphenation
       support for the language to your TeX installation.)

  make flyer.jpg

       Compiles the flyer like with flyer.ps and copies the first page
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

To add a new translation to this general flyer, copy english.tex into
language.tex, where "language" is the local name of your language
(i.e. francaise for french, deutsch for german etc.).  Please add the
file to this directory (e.g. by sending a mail to joey@debian.org or
debian-flyers-devel@lists.alioth.debian.org).

Then modify the mkconfig file and add the translation of your local language to
english, like this:

    YourLocalLanguage)   echo "EnglishTranslation";;

When you add a new translation, please be careful with the size of
your translation.  If the text is too long, an empty page is inserted
by LaTeX and the text doesn't fit on the page.  In such a case, please
shorten the translation somehow without changing the meaning too much.


See also
--------

http://debian-flyers.alioth.debian.org/

