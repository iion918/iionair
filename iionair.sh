#!/bin/bash
clear

function initialize_colors() {
	normal_color="\e[1;0m"
	green_color="\033[1;32m"
	green_color_title="\033[0;32m"
	red_color="\033[1;31m"
	red_color_slim="\033[0;031m"
	blue_color="\033[1;34m"
	cyan_color="\033[1;36m"
	brown_color="\033[0;33m"
	yellow_color="\033[1;33m"
	pink_color="\033[1;35m"
	white_color="\e[1;97m"
}

function print_intro {
  clear
  echo -e "${green_color_title}*************************** Coded by iion91 ****************************"
sleep 0.15 &&  echo -e "${yellow_color}                    .__.__  "
sleep 0.15 &&  echo -e "${yellow_color}                    |__|__| ____   ____  "
sleep 0.15 &&  echo -e "${yellow_color}                    |  |  |/  _ \ /    \ "
sleep 0.15 &&  echo -e "${yellow_color}                    |  |  (  <_> )   |  \ "
sleep 0.15 &&  echo -e "${yellow_color}                    |__|__|\____/|___|  / "
sleep 0.15 &&  echo -e "${yellow_color}                                      \/ "
  echo -e "${green_color_title}***************** github.com/iion918 | ara-systems.net *****************"
  echo -e "${normal_color}"
sleep 1.5
check_root_permissions
}
function exit_with_code {
 if ["${exit_code}" = "1"]
  then echo -e "${red_color}No root permissions! Exiting..." && exit
 fi
}

function check_root_permissions  {
 user=$(whoami)
 if [ "${user}" = "root" ]
  then echo -e "${yellow_color}Root permissions successfully detected!" && check_programs
 else
  exit_code=1
  exit_with_code
 fi
}

function check_programs {
 echo
 dots='echo -n ".";sleep 0.15; echo -n ".";sleep 0.15;echo -n ".";sleep 0.15; echo -n ".";sleep 0.15'
 program_ok="echo -e '[${green_color}OK${normal_color}]'"
 program_error='echo -e "[${red_color}ERROR${normal_color}]"'

 echo -e "${blue_color}Essential tools: checking...${normal_color}"
  if command -v aircrack-ng >/dev/null
   then echo -n "aircrack-ng "; eval "$dots"; eval "$program_ok"
  else
   echo -n "aircrack-ng "; eval "$dots"; eval "$program_error"; echo -e -n "${normal_color}"
  fi
  if command -v iw >/dev/null
   then echo -n "iw"; eval "$dots"; eval "$program_ok"
  else
   echo -n "iw"; eval "$dots"; eval "$program_error"; echo -e -n "${normal_color}"
  fi
  if command -v ip >/dev/null
   then echo -n "ip"; eval "$dots"; eval "$program_ok"; echo -e -n "${normal_color}"
  else 
   echo -n "ip"; eval "$dots"; eval "$program_ok"; echo -e -n "${normal_color}"
  fi
  if command -v bettercap >/dev/null
   then echo -n "bettercap"; eval "$dots"; eval "$program_ok"; echo -e -n "${normal_color}"
  else
   echo -n "bettercap"; eval "$dots"; eval "$program_error"; echo -e -n "${normal_color}"
  fi
}

function main {
  initialize_colors
  print_intro
}
main
