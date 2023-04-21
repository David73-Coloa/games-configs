#!/bin/bash
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

function testes {
  event=$mainEvent
  #echo $(./event.sh)
  sudo xboxdrv --evdev /dev/input/event${event}  --ui-clear  --evdev-absmap ABS_X=x1,ABS_Y=y1,ABS_RZ=y2,ABS_Z=x2,ABS_HAT0X=dpad_x,ABS_HAT0Y=dpad_y     --axismap -Y1=Y1,-Y2=Y2     --evdev-keymap BTN_START=start,BTN_SELECT=back,BTN_A=a,BTN_B=b,BTN_X=x,BTN_Y=y,BTN_TL=lb,BTN_TR=rb,BTN_TL2=lt,BTN_TR2=rt,BTN_THUMBL=tl,BTN_THUMBR=tr    --mimic-xpad --silent --force-feedback 
}
testes
