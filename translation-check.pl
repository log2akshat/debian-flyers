#!/usr/bin/perl -w

# $Id: translation-check.pl,v 1.1 2005/02/27 18:11:29 joostvb Exp $
# $Source: /cvsroot/debian-flyers/general/translation-check.pl,v $

# shamelessly stolen by Joost van Baal from
# cvs/cvs.debian.org/webwml/webwml/english/template/debian/translation-check.wml
# , which is by Javier Fernández-Sanguino

# See also http://www.nl.debian.org/devel/website/uptodate and
# cvs/cvs.debian.org/webwml/webwml/check_trans.pl

use strict;

my $debug = 0; # set to 1 for debugging

my $version = '';

$#ARGV == 0 or die 'usage: ./translation-check.pl <language>.tex';

my ($lang) = @ARGV;

# original file
my $file = "english.tex";

# version as stored in translation file translation-check header
my $translation;

# Read the original CVS/Entries file and extract version from it
if (open (CVS_ENTRY,"<CVS/Entries")) {
    while (<CVS_ENTRY>) {
        ($version) = $_ =~ m,/\Q$file\E/([\d\.]*),;
        last if $version;
    }
    close CVS_ENTRY;
} else {
    $version = "1.1";
}

# find translation-check marker in translation
open (FILE, "$lang") or die "No file $lang\n";
while (<FILE>) {
    ($translation) = $_ =~ /translation\-check\ translation="(\d+\.\d+)"/;
    last if $translation;
}

# maj rev of $file, maj rev in $translation,
my ($major_number, $major_translated_number, $last_number, $last_translated_number);

if ($version ne "")
{
    $debug and print "File " . $file . "'s original CVS revision is $version.\n";

    my @version_numbers = split /\./,$version;
    $major_number = $version_numbers[0];
    $last_number = pop @version_numbers;
    die "Invalid CVS revision for $file: $version\n"
        unless ($major_number =~ /\d+/ && $last_number =~ /\d+/);

    my @translation_numbers = split /\./,$translation;
    $major_translated_number = $translation_numbers[0];
    $last_translated_number = pop @translation_numbers;
    die "Invalid translation revision for $file: $translation.\n"
        unless ($major_translated_number =~ /\d+/ && $last_translated_number =~ /\d+/);
}

# Here we compare the original version with the translated one and print
# a note for the user if their first or last numbers are too far apart

$debug and print "Comparing original version $version to translation version $translation.\n";

if ($version eq "") {
    print "Original gone\n";
} elsif ( $major_number > $major_translated_number ) {
    print "Translation $lang out of date: $file has major revision $major_number, while $lang claims to translate major $major_translated_number only.\n";
} elsif ( $last_number > $last_translated_number ) {
    print "Translation $lang out of date: $file has minor revision $last_number, while $lang claims to translate minor $last_translated_number only.\n";
}

