ZSH=~/.oh-my-zsh
ZSH_THEME="af-magic"
plugins=(git)
git config --global url."https://".insteadOf git://
source $ZSH/oh-my-zsh.sh
source $HOME/.aliases

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
  ag -i --ignore-dir={.tox,fixtures,__snapshots__,migrations,static,static_built,coverage,node_modules,dist}\
  --ignore={yarn.lock,"*.svg","*.map"}\
  $* .
}

export NVM_DIR="/Users/pearsallw/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

eval $(docker-machine env default 2> /dev/null)

export JAVA_HOME=~/homebrew/opt/openjdk@11/bin
export GOPATH=$HOME/go
ulimit -n 8096

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PYENV_ROOT="$HOME/.pyenv"

export PATH=$PYENV_ROOT/bin:~/.local/bin:~/.yarn/bin:~/.config/yarn/global/node_modules/.bin:\
~/homebrew/bin:~/homebrew/sbin:~/homebrew/opt/ruby/bin:$GOPATH/bin:\
~/homebrew/opt/postgresql@10/bin:$JAVA_HOME:/usr/local/bin:/usr/bin:\
/usr/sbin:/bin:/sbin:/usr/local/git/bin:~/istio-1.1.7/bin:\
/Users/pearsallw/.gem/ruby/2.6.0/bin:~/.cargo/bin:\
/Users/pearsallw/homebrew/opt/openjdk@11/bin:$PATH

eval "$(pyenv init --path)"
eval "$(pyenv init -)"
