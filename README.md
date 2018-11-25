
# dotfiles

Tested on macOS (`xx`) and Debian (`xx`).

## Installation

Having [git](https://git-scm.com/downloads) and the package managers, which are
[brew.sh](https://brew.sh/) for macOS and [APT](https://wiki.debian.org/apt-get)
for Debian, are the prerequisites.

Clone this repo in your home directory (`~/` or `$HOME/`). Then change directory
into the folder and execute the deploy script:
```
git clone git@github.com:strboul/dotfiles.git
cd dotfiles && ./deploy.sh
```

## Brewfile

In the `~/dotfiles` directory, run to install everything:
```
brew bundle
```

For macOS, brew offers a nice package manager to install command-line and binary
applications. See
(homebrew-bundle)[https://github.com/Homebrew/homebrew-bundle/blob/master/README.md]
and
(homebrew-cask)[https://github.com/Homebrew/homebrew-cask/blob/master/USAGE.md].

## Screenshots

<p style="text-align:left;"><a
href="https://storage.googleapis.com/blog-media-881/scr-dotfiles.png"><img
src="https://storage.googleapis.com/blog-media-881/scr-dotfiles.png" width="60%"
height="60%"></a></p>

## Acknowledgments

+ https://github.com/Parth/dotfiles

+ https://github.com/jimhester/dotfiles/

+ https://github.com/fatih/dotfiles


