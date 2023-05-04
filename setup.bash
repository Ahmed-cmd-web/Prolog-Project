#!/bin/bash


BYellow='\033[1;33m'
NC='\033[;0m'
BBlue='\033[1;34m'
BPurple='\033[1;35m'
BGreen='\033[1;32m'       # Green
BRed='\033[1;31m'

printf "${BYellow}Starting your enviroment... \n ${NC}"

brew install swi-prolog


printf "\n \n${BGreen}Your enviroment has started... \n"

printf "\nInstructions:"
printf "\n${BPurple}To exit press: cmd + c,then press a.\n \n"

printf "${BBlue}Happy Hacking!😊 \n \n \n${NC}"


swipl index.pl
