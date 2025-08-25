# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
export PATH="/usr/local/opt/php@7.4/bin:$PATH"
export PATH="/usr/local/opt/php@7.4/sbin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="/opt/homebrew/opt/mysql@5.7/bin:$PATH"
export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"
export PATH="$HOME/nvim-0.10.4/bin:$PATH"

# export NVM_DIR="$HOME/.nvm"
#     [ -s "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" ] && \. "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" # This loads nvm
#     [ -s "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

[[ -f "/Applications/Herd.app/Contents/Resources/config/shell/zshrc.zsh" ]] && builtin source "/Applications/Herd.app/Contents/Resources/config/shell/zshrc.zsh"
# Herd injected PHP binary.
export PATH="/Users/ndc/Library/Application Support/Herd/bin/":$PATH
# Herd injected PHP 8.2 configuration.
export HERD_PHP_82_INI_SCAN_DIR="/Users/ndc/Library/Application Support/Herd/config/php/82/"


# Herd injected PHP 8.3 configuration.
export HERD_PHP_83_INI_SCAN_DIR="/Users/ndc/Library/Application Support/Herd/config/php/83/"
source $(brew --prefix nvm)/nvm.sh

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
export PATH="~/.local/.bin:$PATH"

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
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
