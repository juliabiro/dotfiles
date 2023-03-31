# source credentials
. .credentials.fish

# set paths
#set -gx OMF_PATH "/Users/juliabiro/.local/share/omf"
set -x PKG_CONFIG_PATH /opt/X11/lib/pkgconfig/
set -x HAXE_STD_PATH /usr/local/lib/haxe-3.1.3

#set -x PATH $PATH $HOME/.rvm/bin # Add RVM to PATH for scripting
#set -x PATH $PATH $HOME/.emacs.d/ical2org.awk # Add ical2org script
set -x PATH /usr/local/bin /usr/local/Cellar/go/1.19.3/bin $PATH
set -x PATH $PATH /Users/juliabiro/go/bin/
#set -x PATH $PATH /Library/TeX/texbin/
#set -x PATH $PATH /Library/Frameworks/Python.framework/Versions/2.7/bin/
set -x PATH $PATH /usr/local/opt/libpq/bin 

set -x PATH $PATH /Applications/
# expander
set -x PATH $PATH /Users/juliabiro/go/src/github.com/juliabiro/expander
set -x EXPANDER_CONF /Users/juliabiro/.kube/expander_conf.json

# kmux
set -x PATH $PATH /Users/juliabiro/go/src/github.com/juliabiro/kubectl_mux

set -x AWS_CREDENTIAL_FILE $HOME/.aws/credentials

kubectl config use-context minikube

set -x EDITOR emacsclient
#set -x  python2 /usr/bin/python

#kubectl config use-context "NULL"

set -x KUBEBUILDER_ASSETS /usr/local/share/kubebuilder

. .contentful_setup.fish
