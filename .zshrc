ZSH=~/.oh-my-zsh
ZSH_THEME="af-magic"
plugins=(git)
export VIRTUALENVWRAPPER_PYTHON=~/homebrew/bin/python

source $ZSH/oh-my-zsh.sh
source $HOME/.aliases

export PATH=~/homebrew/bin:$PATH:/usr/local/bin:/usr/bin:/usr/sbin:/bin:/sbin:/usr/local/git/bin:
alias goog='cd ~/Drive'
alias eu='cd ~/Drive/projects/euler'
alias octave="exec '/Applications/Octave.app/Contents/Resources/bin/octave'"
alias proj="cd ~/Drive/projects/"
alias desk='cd ~/Desktop'
alias http='http-server -s&'
alias mata='cd ~/Drive/projects/matasano'
alias vim='vim --startuptime ~/.vimlog'
alias mkvirtual='source ~/homebrew/bin/virtualenvwrapper.sh'
unalias gm
