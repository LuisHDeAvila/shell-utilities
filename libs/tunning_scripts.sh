#!/usr/bin/env bash
# Utilidades para scripts

# color suport
red_="\e[1;31m\033[1m"
green_="\e[0;32m\033[1m"
blue_="\e[0;34m\033[1m"
yellow_="\e[0;33m\033[1m"
purple_="\e[0;35m\033[1m"
turquesa_="\e[0;36m\033[1m"
gray_="\e[0;37m\033[1m"
_end="\033[0m\e[0m"

# banner
IMPRIMIR_BANNER(){
BANNER()
{ 
BANNER_file=$1
cat << ANON
$BANNER_file                                             
ANON
}                                                   
echo -e "${red_}"; BANNER .fichero_con_banner_de_usuario | pv -qL 1100 ; echo -e "${_end}"
}

# SALIDA ESTILIZADA
trap ctrl_c INT         
function ctrl_c()
{
        echo -e "\n\n ${red_}[!] Saliendo..${_end} "
        exit 1
}

