#!/bin/sh

for i in *
do
  case "$i" in
    [1-9][0-9]|[1-9]) : ;;
    *) echo "skip $i" ; continue ;;
  esac
  tar cfz fichiers-chapitre-$i.tar.gz $i
done
