ZSH=~/.oh-my-zsh
ZSH_THEME="af-magic"
plugins=(git)
export VIRTUALENVWRAPPER_PYTHON=~/homebrew/bin/python

source $ZSH/oh-my-zsh.sh
source $HOME/.aliases

export PATH=~/homebrew/bin:$PATH:/usr/local/bin:/usr/bin:/usr/sbin:/bin:/sbin:/usr/local/git/bin:
alias goog='cd ~/Drive'
alias proj="cd ~/Drive/projects/"
alias desk='cd ~/Desktop'
alias down='cd ~/Downloads'
alias http='http-server -s&'
alias mata='cd ~/Drive/projects/matasano'
alias mkvirtual='source ~/homebrew/bin/virtualenvwrapper.sh'
unalias gm
function vimno() { vim --noplugin "$1" ;}
function clone() { git clone "git@github.com:$1.git" ;}
function gra() { git remote add $1 "git@github.com:$2.git" ;}
function grao() { git remote add origin "git@github.com:$1.git" ;}
function addHeader() { find . -type f -name "$1" -exec sed -i '' '1i\
'"$2" {} \; ;}
