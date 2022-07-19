#!/usr/bin/env bash
# muestra todos los formatos de prompt de bash

TEXT=`echo {30..39}`
BACKGROUND=`echo {40..49}`
STYLES=`echo {0..9}`

color_output()
{   
    echo ["$1|$2|$3"]=
    echo -e "\e[${1};${2};${3}mLorem Ipsum Ethos pathos logos\e[m          "
}


echo $STYLES | tr ' ' '\n' | while read styles; do
    echo $BACKGROUND |  tr ' ' '\n' | while read background; do
        echo $TEXT |  tr ' ' '\n' | while read texts; do
		 color_output `echo $styles` `echo $texts` `echo $background` | tr '\n' ' '
		 echo '-- Style '$styles' -- Text '$texts' -- Background '$background
        done 
    done
done 


cat << 'estructura'
Sintaxis de colores: 

    x        y          z
formato   color-tx   color-bg
       \\    |     //
        \\   |    //
         \\  |   //
---->   \e[x;y;zm $PS1 \e[m


						by: eleAche
estructura