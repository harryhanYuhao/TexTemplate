#!bin/sh

mkdir ~/psu/bin/tex
cp main.tex preamble.tex -t ~/psu/bin/tex

cp .texinit -t ~/psu/bin/tex
mv ~/psu/bin/tex/texinit ~/psu/bin/tex/texinit
sudo chmod +x ~/psu/bin/tex/texinit

cp ~/.bashrc ~/.bashrc.bak
echo "PATH=\$PATH:~/psu/bin/tex" >> ~/.bashrc
