# ------------------------------------------------------------ #
path="$HOME/Dwall"
wallpaper_local="$HOME/Dwall/Wallpapers"
# ------------------------------------------------------------ #

# ------------------------------------------------------------ #
min=$(date | awk '{print($5)}' | awk -F ':' '{print($2)}')
echo "$min" >> $path/temp
if [ "$(cut -b 1 $path/temp)" == "0" ];then min=$(cut -b 2 $path/temp);fi
rm -f $path/temp
# ------------------------------------------------------------ #

# ------------------------------------------------------------ #
declare -i diff
diff=(60-$min)*60-1
# ------------------------------------------------------------ #

# ------------------------------------------------------------ #
source "$path/srcs/get_hour.sh"
# ------------------------------------------------------------ #

# ------------------------------------------------------------ #
message_log=$(date | awk '{print($2 " " $3 " " $5 "\n")}')
put_message() { echo "$message_log" >> $path/log ; }
# ------------------------------------------------------------ #

# ------------------------------------------------------------ #
wallpaper=$(cat $path/log | grep "Wallpaper")
# ------------------------------------------------------------ #

# ------------------------------------------------------------ #
execute()
{ 
	gsettings set org.gnome.desktop.background picture-uri-dark "file://$1"
}
