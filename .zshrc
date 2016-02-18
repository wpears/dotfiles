ZSH=~/.oh-my-zsh
ZSH_THEME="af-magic"
plugins=(git)
export VIRTUALENVWRAPPER_PYTHON=~/homebrew/bin/python

source $ZSH/oh-my-zsh.sh
source $HOME/.aliases

export PATH=~/homebrew/bin:$PATH:/usr/local/bin:/usr/bin:/usr/sbin:/bin:/sbin:/usr/local/git/bin:

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

export NVM_DIR="/Users/pearsallw/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

$(boot2docker shellinit 2>/dev/null)
