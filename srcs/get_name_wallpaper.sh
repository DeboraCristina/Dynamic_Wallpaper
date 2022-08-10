path="$HOME/Dwall"
source "$path/srcs/variables.sh"

name=$(ls "$wallpaper_local/$1" | grep "^$hour.$2")
full_name="$wallpaper_local/$1/$name"
