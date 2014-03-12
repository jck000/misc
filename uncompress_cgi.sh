#!/bin/sh

progname=`basename $0`
if [ $# -ne 1  ] ; then

  echo "

Usage: $progname <file>

  <file> = dada Mail tar ball
         
  Example:  $progname dada-6_8_1.tar.gz

  NOTE:  This script is a shell script version of the uncpmpress_dada.cgi script.  It takes one arguent which is the name of the dadaMail tar file. The purpose of this script is to allow sysadmins to run installation on the command line.

"

  exit

fi

exit

BASIC=$1;export BASIC

if [ -d 'dada' ] ; then

  echo "

Yikes!  A directory name 'dada' already exists in this location!  Please manually move this directory, before running this script

"
  exit
fi


echo "

Starting Adventure...

Uncompressing $BASIC

"

tar xvzf $BASIC


if [ ! -d 'dada' ]; then

    gunzip $BASIC
    $BASIC =~ s/\.gz$//

    if [ ! -f $BASIC ] ; then

        echo "

Can't find $BASIC to uncompress!
You may have to uncompress and prep Dada Mail manually

"
    else 

        echo "

Success!
Unrolling $BASIC

"

tar xvf $BASIC

    fi

else 

    echo "

Success!

"

fi

echo "

Checking to see if 'dada' directory now exists...

"

if [ ! -d 'dada' ] ; then
  echo "

Can't find 'dada' directory!

"
  exit;

else 

  echo "

Success!
Changing permissions of dada/mail.cgi to 755

"

fi

chmod 755 dada
chmod 755 dada/DADA
chmod 755 dada/mail.cgi
chmod 777 dada/DADA/Config.pm

installer_loc=dada/installer-disabled
new_installer_loc=dada/installer

echo "

Enabling installer at $installer_loc by moving it to $new_installer_loc

"

mv $installer_loc $new_installer_loc

chmod 755 $new_installer_loc
chmod 755 $new_installer_loc/install.cgi

echo "

Done!

"

echo "

  Install and Configure Dada Mail by running the following:

    ./$new_installer_loc/install.cgi

"

