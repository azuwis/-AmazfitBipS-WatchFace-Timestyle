#!/bin/sh

index=21
size=34x12
extend=210x12

font_args='-font LECO-1976-Regular.otf +antialias -pointsize 17'
months='JAN FEB MAR APR MAY JUN JUL AUG SEP OCT NOV DEC'

if [ "$1" = 'cn' ]
then
  font_args='-font msyhbd.ttc -pointsize 17 +antialias'
  months='一月 二月 三月 四月 五月 六月 七月 八月 九月 十月 十一 十二'
  size=34x17
  extend=210x17
fi

month=1

for label in $months
do
  if [ "$month" -le 9 ]
  then
    file="$(printf "%04d" "$((index+month))").png"
    background=none
    gravity=east
  elif [ "$month" -eq 10 ]
  then
    file="$(printf "%04d" "$index").png"
    background=black
    gravity=west
  else
    file="tmp-${month}.png"
    background=black
    gravity=west
  fi
  convert -background "$background" -fill white -trim $font_args label:"$label" png:- | \
    convert -background "$background" -extent "$size" -gravity south png:- png:- | \
    convert -background none -extent "$extend" -gravity "$gravity" png:- "$file"
  if [ "$month" -ge 11 ]
  then
    merge="$(printf "%04d" "$((index+month-10))").png"
    convert "$merge" "$file" -composite "$merge"
  fi
  month="$((month+1))"
done
rm tmp-11.png tmp-12.png
