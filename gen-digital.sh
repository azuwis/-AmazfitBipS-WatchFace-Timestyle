#!/bin/sh

index=11
# size=7x11

for i in 0 1 2 3 4 5 6 7 8 9
do
  file="$(printf "%04d" "$index").png"
  convert -background none -fill white -trim -font LECO-1976-Regular.otf +antialias -pointsize 16 label:"$i" "$file"
  # mogrify -background none -extent "$size" -gravity center "$file"
  index="$((index+1))"
done
