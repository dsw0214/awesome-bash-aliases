# change upper
function upper(){
	# Usage: upper "string"
    printf "%s" $1 | tr '[a-z]' '[A-Z]'
}

# change lower
function lower(){
	# Usage: lower "string"
    printf "%s" $1 | tr '[A-Z]' '[a-z]'
}

# mkdir and cd 
function mkdircd() { 
  # Usage: mkdircd "path"
  mkdir -p "$@" && eval cd "\"\$$#\"";
}

# back 
function backup(){ 
    # Usage: backup "file"
    cp -v "$1"{,.bak}
}

# trim string
function trim_string() {
    # Usage: trim_string "   example   string    "
    : "${1#"${1%%[![:space:]]*}"}"
    : "${_%"${_##*[![:space:]]}"}"
    printf '%s\n' "$_"
}

# Get the directory name of a file path
function dirname(){
    # Usage: dirname "path"
    dir=${1:-.}
    dir=${dir%%${dir##*[!/]}}

    [[ "${dir##*/*}" ]] && dir=.

    dir=${dir%/*}
    dir=${dir%%${dir##*[!/]}}

    printf '%s\n' "${dir:-/}"
}

# Get the path base file name
function basename() {
    # Usage: basename "path" ["suffix"]
    local tmp

    tmp=${1%${1##*[!/]}}
    tmp=${tmp##*/}
    tmp=${tmp%${2/$tmp}}
    printf '%s\n' "${tmp:-/}"
}

# Specified Style Output
function print_style () {
    # Usage: print_style "message" "level" 
    if [ "$2" == "info" ] ; then
        COLOR="96m"
    elif [ "$2" == "success" ] ; then
        COLOR="92m"
    elif [ "$2" == "warning" ] ; then
        COLOR="93m"
    elif [ "$2" == "danger" ] ; then
        COLOR="91m"
    else #default color
        COLOR="0m"
    fi

    STARTCOLOR="\e[$COLOR"
    ENDCOLOR="\e[0m"

    printf "$STARTCOLOR%b$ENDCOLOR\n" "$1"
}