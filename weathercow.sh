#!/bin/bash

# there are 46 cowfiles, this picks random number from 1 to 46
whichcow=$(echo `eval `NUMBER=$[($RANDOM % 46) + 1]`` | awk -F"=" '{ print $2}')

# find cowfiles with full paths
cowfiles=$(locate *.cow)

# use randomly generated number from above to pick a cowfile
somecow=`echo $cowfiles | cut -d " " -f $whichcow`

# weather stuff
CURRENT=`elinks -dump \ "http://www.accuweather.com/us/nc/kernersville/27284/city-weather-forecast.aspx" \ | grep -A 2 Currently | grep [00-99] `

# extract temp from weather stuff
TEMP=$(echo $CURRENT | awk -F " " '{print $(NF)}')

message="Right now the temperature is $TEMP"

# make it speak!
cowsay -f $somecow "$message"
