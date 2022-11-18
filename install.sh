#!/bin/bash

# _____   ______
# |  __ \ / ____| Rahul Sandhu
# | |__) | (___   rahul@sandhuservices.dev
# |  _  / \___ \  https://sandhuservices.dev/
# | | \ \ ____) | https://gitlab.sandhuservices.dev/rahulsandhu/
# |_|  \_\_____/  https://github.com/rahul-singh-sandhu

NAME="Dotfiles Installer"
CODENAME="dotfilesinstaller"
COPYRIGHT="Copyright (C) 2022 Rahul Sandhu"
LICENSE="GNU General Public License 3.0"
VERSION="0.1"

src_directory=$(pwd)

if [[ -d "/home/$USER/.config" ]]
then
	echo "Directory .config already exists - skipping creation"
else
	echo "Directory .config does not exist - creating"
	mkdir -pv /home/$USER/.config
fi

for config_program in alacritty kanshi kitty mako neofetch nvim rofi sway waybar
do
	ln -sf ${src_directory}/$config_program /home/$USER/.config/
	echo -e "Copying ${config_program}..."
	echo -e "done"
done

