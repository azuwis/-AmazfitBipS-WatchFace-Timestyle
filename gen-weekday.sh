#!/bin/sh

index=21
size=34x12

for i in MON TUE WED THU FRI SAT SUN
do
  file="$(printf "%04d" "$index").png"
  convert -background none -fill white -trim -font LECO-1976-Regular.otf +antialias -pointsize 16 label:"$i" "$file"
  mogrify -background none -extent "$size" -gravity center "$file"
  index="$((index+1))"
done
