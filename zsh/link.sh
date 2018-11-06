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

make_link "$HOME"/.zshrc "$HOME"/dotfiles/zsh/zshrc.sh
make_link "$HOME"/.tmux.conf "$HOME"/dotfiles/tmux/tmux.conf

make_link "$HOME"/.ripgreprc "$HOME"/dotfiles/tools/ripgreprc

make_link "$HOME"/.gitconfig "$HOME"/dotfiles/git/gitconfig
make_link "$HOME"/.gitignore "$HOME"/dotfiles/git/gitignore

## RStudio snippets link
for snippet in \
	rstudio/{r.snippets,c_cpp.snippets,markdown.snippets} ; do
	 make_link "$HOME"/.R/snippets/"${snippet##*/}" "$HOME"/dotfiles/"$snippet"
done

make_link "$HOME"/.Rprofile "$HOME"/dotfiles/R/Rprofile.R

make_link "$HOME"/.config/nvim/init.vim "$HOME"/dotfiles/nvim/init.vim
make_link "$HOME"/.config/nvim/UltiSnips "$HOME"/dotfiles/nvim/ultisnips/

# Install nvim colorschemes
make_link "$HOME"/.config/nvim/colors/ "$HOME"/dotfiles/nvim/colors/* # (linking all files)

# Install nvim plugins
NVIM=$(command -v nvim)
$NVIM +PlugInstall +qall
