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

src_directory=/home/$USER/.dotfiles

if [[ $1 == "-p" ]] || [[ $1 == "--packer" ]]|| [[ $2 == "-p" ]] || [[ $2 == "--packer" ]]; then
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
fi

if [[ $1 == "-z" ]] || [[ $1 == "--zsh" ]]|| [[ $2 == "-z" ]] || [[ $2 == "--zsh" ]]; then
CHSH=no RUNZSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
cp ${src_directory}/.zshrc /home/$USER/
cp ${src_directory}/.zshenv /home/$USER/
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi

if [[ -d "/home/$USER/.config" ]]; then
	echo "Directory .config already exists - skipping creation"
else
	echo "Directory .config does not exist - creating"
	mkdir -pv /home/$USER/.config
fi

for config_program in alacritty kanshi kitty mako neofetch nvim rofi sway waybar; do
	ln -sf ${src_directory}/$config_program /home/$USER/.config/
	echo -e "Copying ${config_program}..."
	echo -e "done"
done

