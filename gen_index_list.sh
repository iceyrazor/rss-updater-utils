file=$(printf "$1" | sed 's/\.md$//' | sed 's/^\.\///')
title=$(cat "$1" | head -n 1 | sed 's/# //' | sed -e 's/\r//g')

config=$(cat ./config.txt)
url=$(printf "$config" | awk 'gsub(/^url:/,"")');
prime_folder=$(printf "$config" | awk 'gsub(/^prime_folder:/,"")');
post=$(printf "$config" | awk 'gsub(/^post:/,"")');
ftp=$(printf "$config" | awk 'gsub(/^ftp:/,"")');
user=$(printf "$config" | awk 'gsub(/^user:/,"")');


#f_end="$(cat ./$prime_folder/$post/index.html | tail -n 5)"
#f_start=$(cat ./$prime_folder/$post/index.html | awk -v RS="$f_end" 'NR==1{printf $0} NR!=1{printf "%s", $0}')
f_start=$(head -n 6 "./static/$prime_folder$post/index.html")
f_end=$(tail -n +7 "./static/$prime_folder$post/index.html")

f_out=$(printf "$f_start\n<div><a href=\"$url/$prime_folder$post/$file/index.html\">$title</a></div>\n$f_end")

printf "$f_out"
printf "$f_out" > "static/$prime_folder$post/index.html"
