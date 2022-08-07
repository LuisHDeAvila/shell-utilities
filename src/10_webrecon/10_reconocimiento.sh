#!/usr/bin/env bash
# funciones utiles sobre protocolo http

function checkbrokenlinks()
{
wget --spider -nd -e robots=off -prb -o wget-log -nv "$1"
}

function getfullwebsite()
{
wget --random-wait -r -p -e robots=off -U mozilla "$1"
}

function allimages()
{
wget -r -l1 --no-parent -nH -nd -P/tmp -A".gif,.jpg" http://example.com/images
}

function referencias()
{
wget -q "$1" -O - | \
    tr "\t\r\n'" '   "' | \
    grep -i -o '<a[^>]\+href[ ]*=[ \t]*"\(ht\|f\)tps\?:[^"]\+"' | \
    sed -e 's/^.*"\([^"]\+\)".*$/\1/g'
}

