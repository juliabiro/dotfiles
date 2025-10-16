#!/usr/local/bin/fish

#aliases

alias ll="ls -lah"

# set easyssh_executor "(if-command (ssh-exec-parallel) (if-one-target (ssh-login) (csshx)))"
# set easyssh_discoverer "(first-matching (comma-separated))"
# set easyssh_filter "(list (ec2-instance-id us-east-1) (ec2-instance-id us-west-1))"

# alias s="easyssh -e='$easyssh_executor' -d='$easyssh_discoverer' -f='$easyssh_filter'"
# alias sr='s -l root'

alias gs="git status"
alias gc="git commit -m"
alias ga="git add"
alias gca="git commit --amend"
alias gco="git checkout"
alias gcom="gco master"
alias gpr="git pull --rebase"
alias gp="git push"
alias gpf="git push --force"
alias gpn="git_push_new"
alias gb="git branch"
alias grm="git_rebase_master"
alias gdm="git diff master...head"

alias em="emacsclient"
alias sed="gsed"
alias find='gfind'
alias kctl='kubectl'
alias k='kubectl'
#alias k='kubectl_context'
alias pfw='kubectl port-forward'


# function kubectl_context
#     kubectl $argv[1..-2] --context ( expander ex "$argv[-1]" )
# end

function git_push_new
  git push --set-upstream origin (git rev-parse --abbrev-ref HEAD)
end


function git_rebase_master
  set -L current_branch (git rev-parse --abbrev-ref HEAD)
  gco master
  gpr
  gco $current_branch
  git rebase master
end

#set up kops state stores
function check_env
	pwd | grep $argv[1] 
end


function fix_camera
  sudo killall VDCAssistant
end

