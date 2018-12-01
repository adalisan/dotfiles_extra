#!/usr/bin/env bash

# Adapted from: https://raw.githubusercontent.com/jimhester/dotfiles/master/setup.sh
make_link(){
    mkdir -p "${1%/*}"
	  if [[ -h "$1" ]]; then
	      rm "$1"
	 elif [[ -f "$1" ]]; then
	    mv "$1" "$1".old
	  fi
	  echo "Symbolic linking $1"
	  ln -s "$2" "$1"
}

make_link "$HOME"/.zshrc "$HOME"/configurations_linux/dotfiles_extra/zsh/zshrc.sh
make_link "$HOME"/.tmux.conf "$HOME"/configurations_linux/dotfiles_extra/tmux/tmux.conf

make_link "$HOME"/.ripgreprc "$HOME"/configurations_linux/dotfiles_extra/tools/ripgreprc


## RStudio snippets link
for snippet in \
	rstudio/{r.snippets,c_cpp.snippets,markdown.snippets} ; do
	 make_link "$HOME"/.R/snippets/"${snippet##*/}" "$HOME"/configurations_linux/dotfiles_extra/"$snippet"
done

make_link "$HOME"/.Rprofile "$HOME"/configurations_linux/dotfiles_extra/R/Rprofile.R



