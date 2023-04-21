counter=0
mainEvent=""
events=$(cat /proc/bus/input/devices | awk '/Version=0110/{for(a=0;a>=0;a++){{getline;if(/Handlers/ == 1){ print $Ne;exit 0;}}}}' | grep -P -o '[0-9]+')
#echo $events
for event in $events ;do
  if ((counter < 1)); then 
    mainEvent=$event
  fi
  
  counter=${counter+1}

done
echo $mainEvent
