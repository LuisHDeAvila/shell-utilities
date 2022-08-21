#!/usr/bin/env bash
# funciones utiles sobre protocolo http
# ** no esta terminado **
URL="$1"
function target {
    whatweb "$1" | 
}
# if [ `ping "$URL"` -eq "0" ]; then

# fi
function checkbrokenlinks()
{
wget --spider -nd -e robots=off -prb -o wget-log -nv "$1"
}

function getfullwebsite()
{
wget --random-wait -r -p -e robots=off -U mozilla "$1"
}

function wgetimages()
{
wget -r -l1 --no-parent -nH -nd -P/tmp -A".gif,.jpg" http://example.com/images
exiftool *.gif
exiftool *.jpg
}

function referenciasinseguras()
{
wget -q "$1" -O - | \
    tr "\t\r\n'" '   "' | \
    grep -i -o '<a[^>]\+href[ ]*=[ \t]*"\(ht\|f\)tps\?:[^"]\+"' | \
    sed -e 's/^.*"\([^"]\+\)".*$/\1/g'
}

function reconocimiento()
{
    whatweb "$1" | grep -Eo '[0-9]+\.[0-9]+\.[0-9]+\.[0-9]' | while read target; do 
        echo '+------------------+'
        echo "'|' $target "
        echo '+------------------+'
        echo '|'`nmap $target -sV`
    done

}

reconocimiento "$1"