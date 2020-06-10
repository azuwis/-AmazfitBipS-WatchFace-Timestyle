#!/bin/sh

index=41
size=36x12

for i in MON TUE WED THU FRI SAT SUN
do
  file="$(printf "%04d" "$index").png"
  convert -background none -fill white -trim -font LECO-1976-Regular.otf +antialias -pointsize 17 label:"$i" png:- | \
    convert -background none -extent "$size" -gravity center png:- "$file"
  index="$((index+1))"
done
