#!/usr/bin/env bash
# cifra el contenido del script sin perder la capacidad de ejecutarse.
function encryptscript()
{
read -p 'filename: ' S && C=$S.crypt H='eval "$((dd if=$0 bs=1 skip=//|gpg -d)2>/dev/null)"; exit;' && gpg -c<$S|cat >$C <(echo $H|sed s://:$(echo "$H"|wc -c):) - <(chmod +x $C)
}

echo ' 	encriptacion de scripts '
encryptscript "$1"