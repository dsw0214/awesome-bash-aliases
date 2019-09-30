<p align="center">
  <img width="230" src="http://image.uisdc.com/wp-content/uploads/2017/04/bash.jpg" title="awesome-bash-aliases">
</p>

<h1 align="center">
awesome-bash-aliases
</h1>

<div align="center">A project to collect useful bash aliases and functions</div>
<p align="center"> [![Build Status](https://travis-ci.org/dsw0214/awesome-bash-aliases.svg?branch=master)](https://travis-ci.org/dsw0214/awesome-bash-aliases)
<a href="./LICENSE" title="LICENSE"><img
src="https://img.shields.io/badge/license-MIT-blue.svg"></a>
</p>

## Introduce
* An bash alias is nothing but the shortcut to commands. The alias command allows the user to launch any command or group of commands (including options and filenames) by entering a single word. 

* Use alias command to display a list of all defined aliases. 

* Aliases can help you quickly perform certain operations and reduce the complexity of input code.Create your own alias library to create an efficient work environment.

* You can pull requests if you hava any useful aliases or functions to make things easy.

## How to list bash aliases?
Type the following alias command:
```bash
alias 
```
Sample Output:
```bash
fgrep='fgrep --color=auto'
gh='history|grep'
grep='grep --color=auto'
left='ls -t -1'
ll='ls -alF'
lt='du -sh * | sort -h'
......
```

## How to define or create a bash shell alias?
To create the alias use the following syntax:
```bash
alias name=value
```
In this example, create the alias c for the commonly used clear command, which clears the screen, by typing the following command and then pressing the ENTER key:
```bash
alias c='clear'
```
Then, to clear the screen, instead of typing clear, you would only have to type the letter ‘c’ instead of clear and press the [ENTER] key:
```bash 
c
```
## How to disable a bash alias temporarily?
An alias can be disabled temporarily using the following syntax:
```bash
# path/to/full/command
/usr/bin/clear
```

## How to delete/remove a bash alias?
You need to use the command called unalias to remove aliases. Its syntax is as follows:
```bash
# unalias aliasname
```
In this example, remove the alias c which was created in an earlier example:
```bash
unalias c
```

## How to make bash shell aliases permanent?
The alias c remains in effect only during the current login session. Once you logs out or reboot the system the alias c will be gone. To avoid this problem, add alias to your ~/.bashrc or ~/.bash_profile file .etc, enter:
```bash
vi ~/.bashrc or vim ~/.bash_profile
```
The alias c for the current user can be made permanent by entering the following line:
```bash
alias c='clear'
```
Save the closed file and use the source command to re-execute the newly modified initialization file so that it takes effect immediately without having to log out and log in again.
```bash
source ~/.bashrc
or
source ~/.bash_profile
```
## Document
* .bash_aliases # Common aliase command
* .bash_functions # Common aliase function 
* .bash_git_aliases # Common git aliase command
* test.sh  # Test script

 

## Code Snippet
```bash

# change upper
function upper(){
  #Usage: upper "string"
  printf "%s" $1 | tr '[a-z]' '[A-Z]'
}

# change lower
function lower(){
  #Usage: lower "string"
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
```


## How to use this project?
```bash
* git clone  https://github.com/dsw0214/awesome-bash-aliases.git
* cd awesome-bash-aliases && source .bash_*
```

## Contributing
1. [FORK THIS PROJECT](https://help.github.com/articles/fork-a-repo/ "FORK THIS PROJET") TO YOUR ACCOUNT.
2. [CREATE A BRANCH](https://help.github.com/articles/creating-and-deleting-branches-within-your-repository "CREATE A BRANCH") FOR THE CHANGE YOU INTEND TO MAKE.
3. MAKE YOUR CHANGES TO YOUR FORK.
4. [SEND A PULL REQUEST](https://help.github.com/articles/using-pull-requests/ "SEND A PULL REQUEST") FROM YOUR FORK’S BRANCH TO OUR MASTER BRANCH.

## AFTERWORD
Thanks for reading! If this bible helped you in any way,Please star the repo and share it with your friends!

## License
<a href="./LICENSE.md" title="License">License</a>