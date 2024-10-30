alias watch='watch '
alias bc="bc -l"
alias dim='identify -format "%wx%h %f\n"'
alias gitfind='git ls-files | grep '
alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias ll="ls -lhA --group-directories-first"
alias llt="ll -tr"
alias psgrep='ps -ef|grep'
alias tf='terraform'
alias init-pyenv='export PATH="/home/max/.pyenv/bin:$PATH" && eval "$(pyenv init -)" && eval "$(pyenv virtualenv-init -)"'
alias beep='ffplay -loglevel error -autoexit -nodisp $(find ~/sounds -name "beep.*" | head -1)> /dev/null'
alias beeperr='ffplay -loglevel error -autoexit -nodisp $(find ~/sounds -name "error.*" | head -1)> /dev/null'

# kubernetes/kind

alias k='kubectl'
alias kcc='kind create cluster --config ~/kind.yaml'
alias kdc='kind delete cluster'

## one-liners
alias k-priv="k get po -A -o json | jq '.items[]|.metadata as \$meta|.spec.containers[]|select(.securityContext.privileged==true)|[\$meta.namespace, \$meta.name, .name]|@tsv' -r|column -t"
alias k-privesc="k get po -A -o json | jq '.items[]|.metadata as \$meta|.spec.containers[]|select(.securityContext.allowPrivilegeEscalation!=false)|[\$meta.namespace, \$meta.name, .name]|@tsv' -r|column -t"

## virtualization
alias virsh="virsh -c qemu:///system"
