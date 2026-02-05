#!/bin/sh -e

mkdir -p build

for in in $(find -name "*.typ")
do
  out="build/"$(echo $in | sed -e "s/\.\///" -e "s/\//-/" -e "s/\.typ/\.pdf/")
  echo Compiling $in to $out...
  typst compile $in $out
done
