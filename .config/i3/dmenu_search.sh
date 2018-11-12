#!/bin/bash

# URL='https://duckduckgo.com/?q=' #uncomment for duckduck go  
URL='https://www.google.com/?q='  #uncomment for google as search engine
QUERY=$(echo '' | dmenu -p "Search:" -fn "-xos4-terminus-medium-r-*-*-14-*" -b)
if [ -n "$QUERY" ]; then
  xdg-open "${URL}${QUERY}" 2> /dev/null
  exec i3-msg [class="^Firefox$"] focus
fi


## FAQ ###############################################

#Let's see, what's happening here. First, we call dmenu with following arguments:

    #-p 'Search:' - use this string as prompt
    #-fn "-xos4-terminus-medium-r-*-*-14-* - use terminus font which also supports utf-8 chartacters
    #-b - dmenu appears at the bottom of the screen

#Then we create a url for request, open it in the default browser via xdg-open and send i3wm signal to focus on specific window (in my case this is Firefox).

#I bind this script to Alt+g (g stands for google) in i3wm config:

#bindsym $mod+g exec --no-startup-id ~/.i3/dmenu_search.sh

#And that's how it works.
#Paste into dmenu

    #C-y - paste from primary X selection
    #C-Y - paste from X clipboard

#Finding window class of any application

#Just run xprop | grep WM_CLASS and click on desired app.
#Swap duckduckgo to Google

#Change URL value in script:

#URL='https://www.google.com/search?q='
#Set default browser for xdg-open

#Find your browser here:

#ls /usr/share/applications

#And then run:

#xdg-settings set default-web-browser <your_browser>.desktop
###
