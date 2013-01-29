#!/bin/sh

BASEDIR=/var/chroots

if [ $# != 1 ]; then
	echo "Usage: $0 <chrootname>"
 	exit
fi

chr=$BASEDIR/$1

exclude='-e /$ -e /var -e /proc'
copyexcl='--exclude=chroots --exclude=cache/apt --exclude=cache/pbuilder*'

dirs=$(find / -maxdepth 1 -type d | grep -v $exclude)

for dir in $dirs; do
	mkdir -p $chr/$dir
	mount -o bind $dir $chr/$dir
done

mkdir -p $chr/proc
mount -t proc proc $chr/proc
tar c $copyexcl /var | tar x -C $chr

