hour=$(date | awk '{print($5)}' | awk -F ':' '{print($1)}')
echo "$hour" >> $path/temp
if [ "$(cut -b 1 $path/temp)" == "0" ];then hour=$(cut -b 2 $path/temp);fi
rm -f $path/temp

