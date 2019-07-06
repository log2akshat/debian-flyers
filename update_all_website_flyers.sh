#!/bin/bash

#  Copyright (c) 2019 Software in the Public Interest, Inc.
#  Owner : Alban Vidal <alban.vidal@zordhak.fr>
#
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; version 2 dated June, 1991.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program;  if not, write to the Free Software
#  Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111, USA.

DEBUG=${DEBUG:=false}

################################################################################
# Update "all in one" PostScript and PDF files (all.ps and all.pdf)

make all.ps all.pdf

# Move "all in one" to the final directory
mv all.ps all.pdf pages.debian.net/files/
mv all.pdf pages.debian.net/files/

################################################################################
# Update jpg English flyer (flyer.jpg)

make flyer.jpg

# Move English flyer.jpg to the final directory
mv flyer.jpg pages.debian.net/files/

################################################################################
# Update PostScript and PDF flyers for each languages
# - side 1 English
# - side 2 language

# Languages list
# code:language
list_lang="
da:dansk
de:deutsch
es:espanyol
fr:francaise
it:italiano
nl:nederlands
pt:portugues
sv:svenska
"

for lang in $list_lang ; do

    # Clean for each language
    make clean

    code=${lang%:*} # Extracting language code
    name=${lang#*:} # Extracting language name

    $DEBUG && echo -e "DEBUG: code = $code ; name = $name"

    # Create the flypers
    make lang1=english lang2=$name flyer.ps flyer.pdf

    # Move and rename the flyers to the final directory
    mv flyer.ps pages.debian.net/files/flyer_en_${code}.ps
    mv flyer.pdf pages.debian.net/files/flyer_en_${code}.pdf

done

################################################################################
# Update social contract (social_contract.pdf)

cd social_contract/
make

# Move to final directory
mv social_contract.pdf ../pages.debian.net/files/

# Clean the social_contract directory
make clean

# Return to the parent directory
cd ..

################################################################################
# Final clean
make clean
