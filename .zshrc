ZSH=~/.oh-my-zsh
ZSH_THEME="af-magic"
plugins=(git)

source $ZSH/oh-my-zsh.sh
source /usr/local/bin/virtualenvwrapper.sh

export PATH=$PATH:/usr/local/bin:/usr/bin:/usr/sbin:/bin:/sbin:/usr/local/git/bin:
alias goog='cd ~/Drive'
alias eu='cd ~/Drive/projects/euler'
alias octave="exec '/Applications/Octave.app/Contents/Resources/bin/octave'"
alias proj="cd ~/Drive/projects/"
alias desk='cd ~/Desktop'

