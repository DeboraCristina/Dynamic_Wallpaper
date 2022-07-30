path="$HOME/Dwall"
if [[ ! -f "$path/log" ]] ; then touch $path/log ; fi
source "$path/srcs/variables.sh"
source "$path/srcs/errors.sh"

#  ___________________________________________________________  #
# |                                                           | #
# |                     Select Wallpaper                      | #
# |___________________________________________________________| #
	if [[ -z $1 && -z $wallpaper ]] ; then no_wallpaper_name ; fi
	if [[ ! -d "$wallpaper_local" ]] ; then mkdir $wallpaper_local ; fi
	if [ $1 ]
	then
		if [[ ! -d "$wallpaper_local/$1" ]] ; then no_wallpaper ; fi
	fi

#  ___________________________________________________________  #
# |                                                           | #
# |                       Define Name                         | #
# |___________________________________________________________| #
	if [ -z $1 ]
	then
		name_a=$(cat $path/log | grep "Wallpaper" | cut -d " " -f2)
	fi

#  ___________________________________________________________  #
# |                                                           | #
# |                       Clear Log                           | #
# |___________________________________________________________| #
	if [ $1 ] ; then echo "Wallpaper: $1" > $path/log ; fi

#  ___________________________________________________________  #
# |                                                           | #
# |                     First Execution                       | #
# |___________________________________________________________| #
	source "$path/srcs/get_name_wallpaper.sh" $name_a
	put_message
	execute $full_name
	if [[ "$min" -ne "00" ]] ; then sleep $diff ; fi

#  ___________________________________________________________  #
# |                                                           | #
# |                           Timer                           | #
# |___________________________________________________________| #
	while :
	do
		# --------------------------------------------------------- #
		source "$path/srcs/get_hour.sh"
		# --------------------------------------------------------- #
		source "$path/srcs/get_name_wallpaper.sh" $name_a
		# --------------------------------------------------------- #
		put_message
		execute $full_name
		# --------------------------------------------------------- #
		sleep 3600
		# --------------------------------------------------------- #
	done
