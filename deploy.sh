#!/usr/bin/env bash

if [[ ! -d "$HOME"/dotfiles ]]; then
	echo >&2  "dotfiles not found in the home directory."
	exit 0
fi

echo "Updating configuration"
(cd ~/dotfiles && git pull && git submodule update --init --recursive)

# Source: https://stackoverflow.com/a/27875395/
prompt_install() {
	echo -n "$1 is not installed. Would you like to install it? (y/N) " >&2
	old_stty_cfg=$(stty -g)
	stty raw -echo
	answer=$( while ! head -c 1 | grep -i '[ny]' ;do true ;done )
	stty $old_stty_cfg && echo
	if echo "$answer" | grep -iq "^y" ;then
		if [ -x "$(command -v apt-get)" ]; then
			sudo apt-get install $1 -y
		elif [ -x "$(command -v brew)" ]; then
			brew install $1
		else
			echo "platform/pkg manager not supported."
		fi
	fi
}

check_for_software() {
	echo "Checking to see if $1 is installed"
	if ! [ -x "$(command -v $1)" ]; then
		prompt_install $1
	else
		echo "$1 is installed."
	fi
}

dashes="$(printf -- '-%.0s' $(seq 49))"

echo "$dashes"
echo "Configure and install (if not existed) the CLI essentials:"
echo "zsh, nvim, tmux, and fzf"
echo
echo "Let's get started? (y/N)"
old_stty_cfg=$(stty -g)
stty raw -echo
answer=$( while ! head -c 1 | grep -i '[ny]' ;do true ;done )
stty $old_stty_cfg
if echo "$answer" | grep -iq "^y" ;then
	echo "$answer"
	echo
else
	echo "$answer"
	echo "Aborting. No change has been made."
	exit 0
fi

check_for_software zsh
echo
check_for_software nvim
echo
check_for_software tmux
echo
check_for_software ripgrep # ubuntu 16.04 not yet supported
echo
# check_for_software fzf (there is no official apt package)
FZF="$(command -v fzf)"
if [[ "$("$FZF" 2> /dev/null)" == "" ]]; then
	echo "fzf not found. Installing..."
	source "$HOME/dotfiles/zsh/plugins/fzf/install"
else
	echo "fzf is installed."
fi

echo "Press [ENTER] to complete linking."
source "$HOME"/dotfiles/zsh/link.sh

# change the default shell:
# Source: https://github.com/Parth/dotfiles/blob/master/deploy
check_default_shell() {
	if [ -z "${SHELL##*zsh*}" ]; then
			echo "Default shell is zsh."
	else
		echo -n "Default shell is not zsh. Do you want to chsh -s \$(which zsh)? (y/N)"
		old_stty_cfg=$(stty -g)
		stty raw -echo
		answer=$( while ! head -c 1 | grep -i '[ny]' ;do true ;done )
		stty $old_stty_cfg && echo
		if echo "$answer" | grep -iq "^y" ;then
			echo "$answer"
			chsh -s $(which zsh)
		else
			echo "$answer"
			echo "The configuration will not work properly without zsh."
	fi
}
check_default_shell
echo

echo
echo "Please log out and log back in for default shell to be initialized."

# vim: set ts=4 sw=4
