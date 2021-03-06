#! /bin/bash
if ! [[ -f /usr/share/xfce4/terminal/colorschemes/$1.theme ]]
then
    echo "No such colorscheme: \$1"
    exit 1
fi
cd ~/.config/xfce4/terminal

# strip settings from any themes
grep -Fxvf <(cat /usr/share/xfce4/terminal/colorschemes/*.theme) terminalrc > .terminalrc.tmp
grep -v -e Name -e Scheme "/usr/share/xfce4/terminal/colorschemes/$1.theme" >> .terminalrc.tmp
cp terminalrc terminalrc.bak

mv .terminalrc.tmp terminalrc
