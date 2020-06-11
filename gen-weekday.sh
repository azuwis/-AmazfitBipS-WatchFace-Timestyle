#!/bin/sh

index=41
size=36x12

font_args='-font LECO-1976-Regular.otf +antialias -pointsize 17'
weekdays='MON TUE WED THU FRI SAT SUN'

if [ "$1" = 'cn' ]
then
  font_args='-font msyhbd.ttc -pointsize 22 +antialias'
  weekdays='一 二 三 四 五 六 日'
  size=36x21
fi

for i in $weekdays
do
  file="$(printf "%04d" "$index").png"
  convert -background none -fill white -trim $font_args label:"$i" png:- | \
    convert -background none -extent "$size" -gravity center png:- "$file"
  index="$((index+1))"
done
