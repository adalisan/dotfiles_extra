
# How can I set my default shell to start up tmux https://unix.stackexchange.com/a/113768
if command -v tmux>/dev/null; then
	[ -z "$TMUX" ] && exec tmux
else
	echo "tmux not installed. Run ./deploy to configure dependencies"
fi

# Vars
HISTFILE=~/.zsh_history
setopt inc_append_history # To save every command before it is executed
setopt share_history # setopt inc_append_history

# Aliases
alias v='eval $(command -v nvim)'
alias cp='cp -iv' # 'cp' prompt and verbose
alias mv='mv -iv' # 'mv' prompt and verbose
mkdir -p /tmp/log

# Functions
# Custom cd (always ls when into a folder)
c() {
	cd $1;
	ls;
}
alias cd="c"

# Distraction free vim (Goyo plugin) with tmux window:
vg() {
	if [[ ! -z "$@" ]]; then
		tmux new-window -n "$@" nvim "$@" -c ":GoyoMode"
	else
		tmux new-window nvim -c ":GoyoMode"
	fi
	}

# git log alias
alias gg="git log --graph --pretty=format:'%C(blue)%h%Creset%C(magenta)%d%Creset %C(bold)%s%Creset %C(yellow)<%an> %C(cyan)(%ci)%Creset' --abbrev-commit --date=iso"

# Fzf git-log (interactive)
# Source: https://gist.github.com/junegunn/f4fca918e937e6bf5bad
ggshow() {

	if [ ! -d .git ];then
		echo >&2 "No git repository found."
		return 0
	fi

	gg |
	     fzf --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort \
		     --bind "ctrl-m:execute:
		             (grep -o '[a-f0-9]\{7\}' | head -1 |
		              xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
		              {}
 				     FZF-EOF"
}

# Settings
export VISUAL=vim

source ~/dotfiles/zsh/plugins/fixls.zsh

source ~/dotfiles/zsh/plugins/oh-my-zsh/lib/history.zsh
source ~/dotfiles/zsh/plugins/oh-my-zsh/lib/key-bindings.zsh
source ~/dotfiles/zsh/plugins/oh-my-zsh/lib/completion.zsh
source ~/dotfiles/zsh/plugins/vi-mode.plugin.zsh
source ~/dotfiles/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/dotfiles/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source ~/dotfiles/zsh/keybindings.sh
source ~/dotfiles/zsh/prompt.sh

# fzf (managed by fzf):
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Google Cloud platform (managed by the Google Cloud SDK)
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then source "$HOME/google-cloud-sdk/path.zsh.inc"; fi
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then source "$HOME/google-cloud-sdk/completion.zsh.inc"; fi
