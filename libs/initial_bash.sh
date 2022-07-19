#!/usr/bin/bash
set -o xtrace   
#set -o verbose 
#set -o noexec   

function log() {
	START='\033[01;35m'
	END='\033[00;00m'
	MESSAGE=${@:-""}
	echo -e "${START}${MESSAGE}${END}"
}

log "esto es un texto"