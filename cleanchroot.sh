#!/bin/sh

BASEDIR=/var/chroots

grep $1 /etc/mtab | awk '{print $2}' | xargs umount
rm -rf $BASEDIR/$1
