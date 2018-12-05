# Developed for fun and profit with love and love 

if [ "$1" = "setup" ]
then
	echo 'Downloading themes'
	git clone https://github.com/addy-dclxvi/Xfwm4-Theme-Collections ~/.themes
	git clone https://github.com/rafacuevas3/dots-theme.git ~/.themes/dot-theme
	cp ~/.themes/dot-themes/Dots* -r ~/.themes	

	# Update VIM configuration
	#echo 'Updating vimrc...' 
	#echo "set number" > ~/.vimrc
	#echo 'syntax on' >> ~/.vimrc
	#echo 'set tabstop=4' >> ~/.vimrc

	# Download Images
	wget https://i.imgur.com/aSPQKgD.jpg -O ~/Downloads/dark.jpg
	wget https://i.imgur.com/GYHtxD0.png -O ~/Downloads/light.jpg
	wget https://i.imgur.com/mlvyx89.jpg -O ~/Downloads/cat1.jpg	

	# Install Icons
	apt install numix-icon-theme

	# Transfer change-term
	chmod +x ~/change-term.sh
	echo "File change-term created"
	
	# Install Themes
	if [[ ! -f /usr/share/xfce4/terminal/colorschemes/eighties.themes ]]; then 
	cp Colorschemes/eighties.themes /usr/share/xfce4/terminal/colorschemes/eighties.themes
	echo "Colorscheme Eighties added"
	fi
	
	if [[ ! -f /usr/share/xfce4/terminal/colorschemes/ashes.themes ]]; then 
	cp Colorschemes/ashes.themes /usr/share/xfce4/terminal/colorschemes/ashes.themes
	echo "Created ColorScheme"
	fi

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

if [ "$1" = "cat" ]
then
	# Theme manager and then Window Manager
	xfconf-query -c xsettings -p /Net/ThemeName -s "Kali-X-Dark"	
	xfconf-query -c xfwm4 -p /general/theme -s "Dots Black"
	xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitor0/workspace0/last-image -s ~/Downloads/cat1.jpg	
	xfconf-query -c xsettings -p /Net/IconThemeName -s "Numix"
	~/change-term.sh eighties 	
fi


