# Path to Oh My Fish install.
set -gx OMF_PATH "$HOME/.local/share/omf"

# Customize Oh My Fish configuration path.
set -gx OMF_CONFIG "$HOME/.config/omf"


# Load oh-my-fish configuration.
source $OMF_PATH/init.fish
source $HOME/.profile.fish
source $HOME/.alias.fish
#ssh-add ~/.ssh/id_rsa_*

#if test -e "$HOME/.rvm/scripts/rvm"
 #   "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
#end
#rvm --default use 2.1.0
eval (direnv hook fish)
eval "$(/opt/homebrew/bin/brew shellenv)"

function fish_title
  true
end
