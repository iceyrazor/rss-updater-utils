config=$(cat ./config.txt)
file=$(printf "$1" | sed 's/\.md$//' | sed 's/^\.\///')
url=$(printf "$config" | awk 'gsub(/^url:/,"")');
prime_folder=$(printf "$config" | awk 'gsub(/^prime_folder:/,"")');
css_file=$(printf "$config" | awk 'gsub(/^css_file:/,"")');
css_upload_folder=$(printf "$config" | awk 'gsub(/^css_upload_folder:/,"")');
post=$(printf "$config" | awk 'gsub(/^post:/,"")');
ftp=$(printf "$config" | awk 'gsub(/^ftp:/,"")');
user=$(printf "$config" | awk 'gsub(/^user:/,"")');

prime_folder_cmd=""
prime_cd_cmd=""
prime_mkdir=""
if [ "$prime_folder" != "" ]; then
    prime_folder_cmd="lcd $prime_folder"
    prime_cd_cmd="cd $prime_folder"
    prime_mkdir="mkdir $prime_folder"
fi

read -s -p "ftp_password: " pass
printf "\n\n"

if [ "$1" == "" ]; then

#upload only index.xml/html listing and other assets
ftp -n <<EOF
open $ftp
user $user $pass 

cd public_html
cd $css_upload_folder
lcd static
put $css_file
cd /public_html

$prime_mkdir
$prim_cd_cmd

$prime_folder_cmd

mkdir "$post"
cd "$post"
lcd "$post"
put index.xml
put index.html
EOF

elif [ "$1" == "ALL" ]; then
    printf "not implemented \n\n"
else

    ftp -n -vvv <<EOF
open $ftp
user $user $pass 

cd public_html
cd $css_upload_folder
lcd static
put $css_file

cd /public_html

$prime_mkdir
$prim_cd_cmd

$prime_folder_cmd


mkdir "$post"
cd "$post"
lcd "$post"
put index.xml
put index.html

mkdir "$file"
cd "$file"
lcd "$file"
put index.html
EOF

fi
