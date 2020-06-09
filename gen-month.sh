#!/bin/sh

index=56
size=34x12
extend=200x12

month=1

for label in JAN FEB MAR APR MAY JUN JUL AUG SEP OCT NOV DEC
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
    file="${month}.png"
    background=black
    gravity=west
  fi
  convert -background "$background" -fill white -trim -font LECO-1976-Regular.otf +antialias -pointsize 16 label:"$label" "$file"
  mogrify -background "$background" -extent "$size" -gravity center "$file"
  mogrify -background none -extent "$extend" -gravity "$gravity" "$file"
  if [ "$month" -ge 11 ]
  then
    merge="$(printf "%04d" "$((index+month-10))").png"
    convert "$merge" "$file" -composite "$merge"
  fi
  month="$((month+1))"
done
