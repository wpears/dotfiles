ZSH=~/.oh-my-zsh
ZSH_THEME="af-magic"
plugins=(git)
git config --global url."https://".insteadOf git://

export PATH=~/homebrew/bin:~/homebrew/sbin:~/homebrew/opt/python/libexec/bin:/usr/local/bin:/usr/bin:/usr/sbin:/bin:/sbin:/usr/local/git/bin:$PATH
export VIRTUALENVWRAPPER_PYTHON=~/homebrew/opt/python/libexec/bin/python
export WORKON_HOME=$HOME/.virtualenvs
export NODE_ENV=dev

source $ZSH/oh-my-zsh.sh
source $HOME/.aliases
source ~/homebrew/bin/virtualenvwrapper.sh


#function npm() {
#  if [ "$1" == "publish" ]; then
#    command npm login && command npm "$@" || : && command npm logout
#  else
#    command npm "$@"
#  fi
#}

function rand() {  echo "ibase=16;$(xxd -l $1 -p /dev/urandom | awk '{print toupper($0)}')" | bc ;}
function vimno() { vim --noplugin "$1" ;}
function clone() { git clone "git@github.com:$1.git" ;}
function gra() { git remote add $1 "git@github.com:$2.git" ;}
function grao() { git remote add origin "git@github.com:$1.git" ;}
function addHeader() { find . -type f -name "$1" -exec sed -i '' '1i\
'"$2" {} \; ;}
function geojson(){ ogr2ogr -f GeoJSON /vsistdout/ "$1" | head -n4 | tail -n1 | sed '$s/,$//' | jq . ;}

# https://github.com/exogen/dotfiles/blob/730fb8e2b72b2fc3aa3d90b889874bb5195e1d07/.profile#L65
function play {
    # Skip DASH manifest for speed purposes. This might actually disable
    # being able to specify things like 'bestaudio' as the requested format,
    # but try anyway.
    # Get the best audio that isn't WebM, because afplay doesn't support it.
    # Use "$*" so that quoting the requested song isn't necessary.
    youtube-dl --default-search=ytsearch: \
               --youtube-skip-dash-manifest \
               --output="${TMPDIR:-/tmp/}%(title)s-%(id)s.%(ext)s" \
               --restrict-filenames \
               --format="bestaudio[ext!=webm]" \
               --exec=afplay "$*"
}

function gr {
  grep -riE --exclude='yarn.lock' --exclude-dir='coverage' --exclude-dir='node_modules' --exclude-dir='dist' $* .
}

export NVM_DIR="/Users/pearsallw/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

eval $(docker-machine env default 2> /dev/null)

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
ulimit -n 8096

#source ~/homebrew/bin/virtualenvwrapper.sh
#source ~/.dotfiles/lib/zsh-autoenv/autoenv.zsh

###-begin-npm-completion-###
#
# npm command completion script
#
# Installation: npm completion >> ~/.bashrc  (or ~/.zshrc)
# Or, maybe: npm completion > /usr/local/etc/bash_completion.d/npm
#

if type complete &>/dev/null; then
  _npm_completion () {
    local words cword
    if type _get_comp_words_by_ref &>/dev/null; then
      _get_comp_words_by_ref -n = -n @ -w words -i cword
    else
      cword="$COMP_CWORD"
      words=("${COMP_WORDS[@]}")
    fi

    local si="$IFS"
    IFS=$'\n' COMPREPLY=($(COMP_CWORD="$cword" \
                           COMP_LINE="$COMP_LINE" \
                           COMP_POINT="$COMP_POINT" \
                           npm completion -- "${words[@]}" \
                           2>/dev/null)) || return $?
    IFS="$si"
  }
  complete -o default -F _npm_completion npm
elif type compdef &>/dev/null; then
  _npm_completion() {
    local si=$IFS
    compadd -- $(COMP_CWORD=$((CURRENT-1)) \
                 COMP_LINE=$BUFFER \
                 COMP_POINT=0 \
                 npm completion -- "${words[@]}" \
                 2>/dev/null)
    IFS=$si
  }
  compdef _npm_completion npm
elif type compctl &>/dev/null; then
  _npm_completion () {
    local cword line point words si
    read -Ac words
    read -cn cword
    let cword-=1
    read -l line
    read -ln point
    si="$IFS"
    IFS=$'\n' reply=($(COMP_CWORD="$cword" \
                       COMP_LINE="$line" \
                       COMP_POINT="$point" \
                       npm completion -- "${words[@]}" \
                       2>/dev/null)) || return $?
    IFS="$si"
  }
  compctl -K _npm_completion npm
fi
###-end-npm-completion-###

#grep replacement, stolen from oh-my-zsh
#
# is x grep argument available?
grep-flag-available() {
    echo | grep $1 "" >/dev/null 2>&1
}

GREP_OPTIONS=""

# color grep results
if grep-flag-available --color=auto; then
    GREP_OPTIONS+=" --color=auto"
fi

# ignore VCS folders (if the necessary grep flags are available)
VCS_FOLDERS="{.bzr,CVS,.git,.hg,.svn}"

if grep-flag-available --exclude-dir=.cvs; then
    GREP_OPTIONS+=" --exclude-dir=$VCS_FOLDERS"
elif grep-flag-available --exclude=.cvs; then
    GREP_OPTIONS+=" --exclude=$VCS_FOLDERS"
fi

# export grep settings
alias grep="grep -iE --exclude-dir='coverage' --exclude-dir='node_modules' --exclude-dir='dist' $GREP_OPTIONS"

# clean up
unset GREP_OPTIONS
unset VCS_FOLDERS
unfunction grep-flag-available
