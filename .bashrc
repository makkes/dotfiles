# shellcheck disable=SC1091
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
[ -f /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion

export PATH=$PATH:~/bin
export PATH=$PATH:~/go/bin
export PATH=$PATH:/usr/local/go/bin
export PATH="$PATH:${KREW_ROOT:-$HOME/.krew}/bin"
export PATH=$PATH:/usr/local/kubebuilder/bin

# git prompt
# shellcheck disable=SC1090
source "$(dirname "$(readlink ~/.bashrc)")/git-prompt.sh"
# shellcheck disable=SC2034
GIT_PS1_SHOWCOLORHINTS=1
# shellcheck disable=SC2034
GIT_PS1_SHOWDIRTYSTATE=1

# shellcheck source=/dev/null
[ -f ~/.bash_aliases ] && . ~/.bash_aliases

export CLICOLOR=1
export LS_COLORS='rs=0:di=01;34:ln=00;36:mh=00:pi=40;33:so=00;35:do=00;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=00;32:*.tar=00;31:*.tgz=00;31:*.arc=00;31:*.arj=00;31:*.taz=00;31:*.lha=00;31:*.lz4=00;31:*.lzh=00;31:*.lzma=00;31:*.tlz=00;31:*.txz=00;31:*.tzo=00;31:*.t7z=00;31:*.zip=00;31:*.z=00;31:*.dz=00;31:*.gz=00;31:*.lrz=00;31:*.lz=00;31:*.lzo=00;31:*.xz=00;31:*.zst=00;31:*.tzst=00;31:*.bz2=00;31:*.bz=00;31:*.tbz=00;31:*.tbz2=00;31:*.tz=00;31:*.deb=00;31:*.rpm=00;31:*.jar=00;31:*.war=00;31:*.ear=00;31:*.sar=00;31:*.rar=00;31:*.alz=00;31:*.ace=00;31:*.zoo=00;31:*.cpio=00;31:*.7z=00;31:*.rz=00;31:*.cab=00;31:*.wim=00;31:*.swm=00;31:*.dwm=00;31:*.esd=00;31:*.jpg=00;35:*.jpeg=00;35:*.mjpg=00;35:*.mjpeg=00;35:*.gif=00;35:*.bmp=00;35:*.pbm=00;35:*.pgm=00;35:*.ppm=00;35:*.tga=00;35:*.xbm=00;35:*.xpm=00;35:*.tif=00;35:*.tiff=00;35:*.png=00;35:*.svg=00;35:*.svgz=00;35:*.mng=00;35:*.pcx=00;35:*.mov=00;35:*.mpg=00;35:*.mpeg=00;35:*.m2v=00;35:*.mkv=00;35:*.webm=00;35:*.ogm=00;35:*.mp4=00;35:*.m4v=00;35:*.mp4v=00;35:*.vob=00;35:*.qt=00;35:*.nuv=00;35:*.wmv=00;35:*.asf=00;35:*.rm=00;35:*.rmvb=00;35:*.flc=00;35:*.avi=00;35:*.fli=00;35:*.flv=00;35:*.gl=00;35:*.dl=00;35:*.xcf=00;35:*.xwd=00;35:*.yuv=00;35:*.cgm=00;35:*.emf=00;35:*.ogv=00;35:*.ogx=00;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:'

__kube_ctx() {
    ctx=$(kubectl config current-context 2>/dev/null | cut -c1-20)
    [ -z "$ctx" ] && return 0
    # shellcheck disable=SC2059
    printf "$1" "${ctx}"
}
export PS1='\[\e[31m\]$(__kube_ctx "[%s]")\[\e[m\]\[\e[33m\]$(__git_ps1 "[%s]")\[\e[m\][\[\e[1;32m\]\w\[\e[m\]]\n\u@\h $ '
GPG_TTY=$(tty)
export GPG_TTY

# history size
export HISTFILESIZE=1000000
export HISTSIZE=10000
export HISTTIMEFORMAT="%Y-%m-%d %T "
export PROMPT_COMMAND="history -a"
export PROMPT_COMMAND="echo -ne '\033]0;\007';$PROMPT_COMMAND"

[ -f "$HOME/.bcrc" ] && export BC_ENV_ARGS="-l $HOME/.bcrc"
export LESS="-iMRFX"

if [ -d ~/.j ] ; then
    # shellcheck disable=SC1090
    source ~/.j/j.sh
    # shellcheck disable=SC1090
    source ~/.j/j_completion
fi
# shellcheck disable=SC1090
source <(kubectl completion bash)
complete -F __start_kubectl k

export PATH="/home/max/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# If not running interactively, do not do anything
[[ $- != *i* ]] && return
[ ! -t 1 ] && return
[[ -z "$TMUX" ]] && exec tmux -u

[[ -n "$TMUX" ]] && export TERM=screen-256color

# shellcheck source=/dev/null
[ -f ~/.bashrc_local ] && . ~/.bashrc_local
