#!/bin/sh

RED="\033[0;31m"
NC="\033[0m"

mkdir -p $HOME/psu/bin/tex
cp main.tex preamble.tex macros.tex texinit -t $HOME/psu/bin/tex
chmod +x $HOME/psu/bin/tex/texinit

printf "Appending To Path\n"
if [ -f $HOME/.bashrc.bak ]; then
	printf "${HOME}/.bashrc.bak exists, do you want to remove it? (y/n)"
	read response
	if [ "$response" = "y" ]; then
		rm -rf $HOME/.bashrc.bak
		printf "$HOME/.bashrc.bak ${RED}deleted${NC}\n"
	else
		printf "${RED}FAILED${NC} to back up old configuration!\n"
		printf "Installation ${RED}aborted${NC}\n"
		exit 1
	fi
fi

echo "Backing up old config"
echo "cp $HOME/.bashrc $HOME/.bashrc.bak"
cp $HOME/.bashrc $HOME/.bashrc.bak
echo "PATH=\$PATH:$HOME/psu/bin/tex" >> $HOME/.bashrc
