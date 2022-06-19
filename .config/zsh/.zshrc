# Files to source
source $ZDOTDIR/.zsh_alias 

# setting ENV VARS to not clog $HOME
export ZSH_COMPDUMP=$ZDOTDIR/cache/.zcompdump-$HOST
export HISTFILE=$ZDOTDIR/cache/.zsh_history
export SAVEHIST=1000

# Plugins :
source $ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZDOTDIR/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh

# Theme
fpath+=$ZDOTDIR/themes/typewritten
autoload -U promptinit; promptinit
prompt typewritten
TYPEWRITTEN_CURSOR="block"

# Set default Editor
export ALTERNATE_EDITOR=""
export EDITOR="emacsclient -t"                  # $EDITOR opens in terminal
export VISUAL="emacsclient -c -a emacs"         # $VISUAL opens in GUI mode

