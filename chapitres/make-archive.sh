#!/bin/sh

for i in *
do
  tar cfz fichiers-chapitre-$i.tar.gz $i
done
