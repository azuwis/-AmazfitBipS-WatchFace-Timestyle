#!/bin/sh

dir="$1"
index="$2"
count="$3"
new_index="$4"

for i in $(seq 0 "$((count-1))")
do
  file="${dir}/$(printf "%04d" "$((index+i))").png"
  new_file="./$(printf "%04d" "$((new_index+i))").png"
  cp "$file" "$new_file"
done
