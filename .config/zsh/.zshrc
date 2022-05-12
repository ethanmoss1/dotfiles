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
