# Update the OS
#apt update -y && apt upgrade -y

if [ "$1" = "setup" ]
then
	echo 'Downloading themes'
	git clone https://github.com/addy-dclxvi/Xfwm4-Theme-Collections ~/.themes
	
	# Update VIM configuration
	echo 'Updating vimrc...' 
	echo "set number" > ~/.vimrc
	echo 'syntax on' >> ~/.vimrc
	echo 'set tabstop=4' >> ~/.vimrc

	# Download Images
	wget https://i.imgur.com/aSPQKgD.jpg -O ~/Downloads/dark.jpg
	wget https://i.imgur.com/GYHtxD0.png -O ~/Downloads/light.jpg
	
	# Install Icons
	apt install numix-icon-theme
	

	#####################
	### File creation ###
	#####################
	if [[ ! -f ~/change-term.sh ]]; then 
	# CREATE TERMINAL SWITCHER
	cat <<EOT > ~/change-term.sh
	#! /bin/bash
	if ! [[ -f /usr/share/xfce4/terminal/colorschemes/\$1.theme ]]
	then
	    echo "No such colorscheme: \$1"
	    exit 1
	fi
	cd ~/.config/xfce4/terminal
	# strip settings from any themes
	grep -Fxvf <(cat /usr/share/xfce4/terminal/colorschemes/*.theme) terminalrc > .terminalrc.tmp
	grep -v -e Name -e Scheme "/usr/share/xfce4/terminal/colorschemes/\$1.theme" >> .terminalrc.tmp
	cp terminalrc terminalrc.bak
	mv .terminalrc.tmp terminalrc
EOT
	chmod +x ~/change-term.sh
	echo "File change-term created"
	fi
	
	# Install Themes
	if [[ ! -f /usr/share/xfce4/terminal/colorschemes/eighties.themes ]]; then 
	cat <<EOT > /usr/share/xfce4/terminal/colorschemes/eighties.themes
	[Scheme]
	Name=eighties
	ColorForeground=#d3d0c8
	ColorBold=#d3d0c8
	ColorBackground=#2d2d2d
	ColorCursor=#d3d0c8
	ColorPalette=#2d2d2d;#f2777a;#99cc99;#ffcc66;#6699cc;#cc99cc;#66cccc;#d3d0c8;#747369;#f2777a;#99cc99;#ffcc66;#6699cc;#cc99cc;#66cccc;#f2f0ec
	ColorBoldUseDefault=FALSE
EOT
	echo "Theme Eighties created"
	fi
	
	if [[ ! -f /usr/share/xfce4/terminal/colorschemes/ashes.themes ]]; then 
	cat <<EOT > /usr/share/xfce4/terminal/colorschemes/ashes.themes
	[Scheme]
	Name=ashes
	ColorForeground=#c7ccd1
	ColorBold=#c7ccd1
	ColorBackground=#1c2023
	ColorCursor=#c7ccd1
	ColorPalette=#1c2023;#c7ae95;#95c7ae;#aec795;#ae95c7;#c795ae;#95aec7;#c7ccd1;#747c84;#c7ae95;#95c7ae;#aec795;#ae95c7;#c795ae;#95aec7;#f3f4f5
	ColorBoldUseDefault=FALSE
EOT
	fi
	############################
	### END OF FILE CREATION ###
	############################

fi

if [ "$1" = "dark" ]
then
	#Dark Theme manager and Windows Manager
	xfconf-query -c xsettings -p /Net/ThemeName -s "Blackbird"	
	xfconf-query -c xfwm4 -p /general/theme -s "Circela"
	xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitor0/workspace0/last-image -s ~/Downloads/dark.jpg	
	xfconf-query -c xsettings -p /Net/IconThemeName -s "Numix"
	~/change-term.sh ashes
fi

if [ "$1" = "light" ]
then
	# Theme manager and then Window Manager
	xfconf-query -c xsettings -p /Net/ThemeName -s "Adwaita"	
	xfconf-query -c xfwm4 -p /general/theme -s "Rin"
	xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitor0/workspace0/last-image -s ~/Downloads/light.jpg	
	xfconf-query -c xsettings -p /Net/IconThemeName -s "Adwaita"
	~/change-term.sh eighties 	
fi


