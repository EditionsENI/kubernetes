#!/bin/sh

for i in 1 2 3
do
  helm upgrade --install wordpress-$i stable/wordpress \
               --namespace wp-$i                                                                                                                                               
done
