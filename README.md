The Debian Flyer
================

Website page
------------

[Debian flyers Website]

VCS access
----------

We have put these files into a git repository which is publically available.

### Through the web:

[Debian flyers Salsa repository]

### Through read/write git :

(if you have a Salsa account in the **debian-flyers** or **debian** groups)

```bash
git clone git@salsa.debian.org:debian/debian-flyers.git
```

### Through anonymous read-only:

```bash
git clone https://salsa.debian.org/debian/debian-flyers.git
```


Compiling the flyer
-------------------

Depending on the target languages, you may need to install these packages:

+ texlive-lang-german 
+ texlive-lang-portuguese 
+ texlive-lang-french  
+ texlive-lang-italian 
+ texlive-lang-spanish
+ texlive-lang-european

Please use the Makefile which provides several targets for you:

+ Compiles the flyer with both languages set in the Makefile.

  ```bash
  # Postscript format
  make flyer.ps
  # PDF format
  make flyer.pdf
  ```

+ Compiles the flyer, using nederlands for language on front
  page, and english for language on back page. (You might have
  to run `dpkg-reconfigure tetex-bin` to add hyphenation
  support for the language to your TeX installation.)

  ```bash
  # Postscript format
  make lang1=nederlands lang2=english flyer.ps
  # PDF format
  make lang1=nederlands lang2=english flyer.pdf
  ```

+ Compiles the flyer like with `flyer.ps` and copies the first page
  into a JPEG file.

  ```bash
  make flyer.jpg
  ```

+ Compiles all currently available translation into one file.

  ```bash
  # Postscript format
  make all.ps
  # PDF format
  make all.pdf
  ```

+ Creates a special nnn dpi version of the Postscript file for
  the flyer, this is useful for high-quality printers.

  ```bash
  make 300dpi
  # or
  make 600dpi
  # or
  make 720dpi
  ```


+ Cleans up the directory, removes all compiled files.

  ```bash
  make clean
  ```


Adding a translation
--------------------

To add a new translation to this general flyer, copy `english.tex` into
`language.tex`, where **language** is the local name of your language
(i.e. `francaise` for **french**, `deutsch` for **german** etc.).  Please add the
file to this directory (e.g. by sending a mail to
**debian-flyers-devel@alioth-lists.debian.net**).

Then modify the `mkconfig` file and add the translation of your local language to
english, like this:

    YourLocalLanguage)   echo "EnglishTranslation";;

When you add a new translation, please be careful with the size of
your translation.  If the text is too long, an empty page is inserted
by LaTeX and the text doesn't fit on the page.  In such a case, please
shorten the translation somehow without changing the meaning too much.

See also
--------

+ [hexagonal-sticker](hexagonal-sticker/)
+ [social_contract](social_contract/)
+ [README-printing](README-printing.md)


[Debian flyers Website]: https://debian.pages.debian.net/debian-flyers/
[Debian flyers Salsa repository]: https://salsa.debian.org/debian/debian-flyers
