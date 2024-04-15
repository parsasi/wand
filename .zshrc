# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
export PATH="/usr/local/opt/php@7.4/bin:$PATH"
export PATH="/usr/local/opt/php@7.4/sbin:$PATH"


source $(brew --prefix nvm)/nvm.sh

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"

# Alias for sudo
alias please='sudo'

# Alias for php artisan
alias artisan='php artisan'

#Alias for wand shell
alias killport="sh $HOME/wand/kill-port.sh"
alias wakeup="sh $HOME/wand/wakeup.sh"

# Aliases Kubernetes
alias k='kubectl'

# Alias to switch kubectl context 
alias timeforproduction='k config use-context $(cat $HOME/wand/bnw-prod.txt)'
alias timeforstaging='k config use-context $(cat $HOME/wand/bnw-staging.txt)'
