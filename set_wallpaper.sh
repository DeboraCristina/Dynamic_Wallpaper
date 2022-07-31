path="$HOME/Dwall"
source "$path/srcs/variables.sh"

name_a=$(cat $path/log | grep "Wallpaper" | cut -d " " -f2)

source "$path/srcs/get_name_wallpaper.sh" $name_a
execute $full_name
execute $full_name
execute $full_name

sed -i "s/$name_a/$1/" $path/log

echo mudou para "$1"
