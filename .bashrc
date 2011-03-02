
# Check for an interactive session
[ -z "$PS1" ] && return

PS1='[\u@\h \W]\$ '

alias pacup='pacman -Syu'
alias pacins='pacman -S'
alias make='gmake'


# moving in dirs
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

# git
alias gitps="git push origin master"
alias gitp="git pull"
alias gitc="git commit -a"
alias gitm="git commit "
alias giti="git init"

# power
alias shut="shutdown -h now"


# Paste to sprunge.us
sprunge () 
{ 
        ( [[ -t 0 ]] && exec < "$1";
        URI=$(curl -sF 'sprunge=<-' 'http://sprunge.us');
        [[ ! -t 1 ]] && flag='-n';
        echo $flag "$URI" )
}


# extract function 7z package needed
extract() {
    if [ -f "$1" ] ; then
        case "$1" in
            *.tar.bz2) tar xjf "$1" ;;
            *.tar.gz) tar xzf "$1" ;;
            *.tar.Z) tar xzf "$1" ;;
            *.bz2) bunzip2 "$1" ;;
            *.rar) 7z x "$1" ;;
            *.gz) gunzip "$1" ;;
            *.jar) 7z x "$1" ;;
            *.tar) tar xf "$1" ;;
            *.tbz2) tar xjf "$1" ;;
            *.tgz) tar xzf "$1" ;;
            *.zip) 7z x "$1" ;;
            *.Z) uncompress "$1" ;;
            *.7z) 7z x "$1" ;;
            *) echo "'$1' cannot be extracted" ;;
        esac
    else
        echo "'$1' is not a file"
    fi
}

# Creates an archive from given directory
mktar() { tar cvf "${1%%/}.tar" "${1%%/}/"; }
mktgz() { tar cvzf "${1%%/}.tar.gz" "${1%%/}/"; }
mktbz() { tar cvjf "${1%%/}.tar.bz2" "${1%%/}/"; }

# Copy and Move then follow
cpf() { cp "$@" && goto "$_"; }
mvf() { mv "$@" && goto "$_"; }
goto() { [ -d "$1" ] && cd "$1" || cd "$(dirname "$1")" 




stock ()
{
    lynx -dump "http://www.google.com/finance?client=ob&q=${1}" | sed 's/.*']'//' | perl -00ne "print if /Watch this stock/i" | sed 's/Watch this stock//' | sed 's/Disclaimer//' | sed '/^$/d' | sed 's/Currency in USD//'
}
