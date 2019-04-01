This directory includes an additional two-sided flyer with the text of the
Debian Social Contract and the DFSG.

------------------------------------------------------------

Compiling the flyer
-------------------

## Build dependencies include:

+ make
+ texlive-xetex
+ texlive-lang-english
+ texlive-lang-italian
+ librsvg2-bin

## Create all flyers (all-in-one flyer + one flyer by language)

```bash
make
# or
make all
```

## Create the all-in-one flyer

```bash
make all-in-one
```

## Create flyer for each translation

```bash
make all-lang
```

## Create flyer for selected language (for example here: french)

```bash
make lang lang=fr
```

------------------------------------------------------------

Adding a translation
--------------------

Step to add a new translation to this flyer:

+ copy`sc_en.tex` to `sc_$LANG.tex`,
+ append this file to the `LANG_FILES` variable in the Makefile,
+ add your language code to the `LANG_LIST` variable in the Makefile,
+ add two lines to `all-in-one_social_contract.tex` with includes for your
language and another copy of the `layout`,
+ add your language in the `preamble.tex` file, section **babel**.
