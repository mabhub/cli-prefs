# Set a default prompt of: user@host and current_directory
# PS1='\[\e]0;\w\a\]\n\[\e[32m\]\u@\h \[\e[33m\]\w\[\e[0m\]\n\$ '

# Enable color support of ls
if [ "$TERM" != "dumb" ]; then
    eval "$(dircolors -b /etc/DIR_COLORS)"
fi

# function to run upon exit of shell
# function _exit() {
#     clear
# }
# trap _exit 0


# Shell options
shopt -s cdspell
shopt -s checkwinsize
shopt -s histappend

# Completion with sudo
complete -cf sudo

# 
# Shell aliases
# 

# Confirm before overwriting
alias cp="cp -i"

# ls defaut config
alias ls='ls --group-directories-first --time-style=+"%Y-%m-%d %H:%M" --color=auto -F' # ls par default (dossier en 1er + mise en forme de l'heure)
alias la='ls -a'
alias l='ls -l'
alias ll='l -a'

#
alias df='df -h'
alias free='free -m'
alias dus='du --max-depth=1 | sort -n'
alias cls='clear'
alias scr='screen -rdR'
alias dns='nslookup'
alias whois='whois -H'

# Use htop instead of top (if possible)
if type -P htop >/dev/null; then
  alias top='htop'
fi

#
# Colors
#
txtblk="\[\e[0;30m\]" # Black
txtred="\[\e[0;31m\]" # Red
txtgrn="\[\e[0;32m\]" # Green
txtylw="\[\e[0;33m\]" # Yellow
txtblu="\[\e[0;34m\]" # Blue
txtpur="\[\e[0;35m\]" # Purple
txtcyn="\[\e[0;36m\]" # Cyan
txtwht="\[\e[0;37m\]" # White
bldblk="\[\e[1;30m\]" # Black - Bold
bldred="\[\e[1;31m\]" # Red
bldgrn="\[\e[1;32m\]" # Green
bldylw="\[\e[1;33m\]" # Yellow
bldblu="\[\e[1;34m\]" # Blue
bldpur="\[\e[1;35m\]" # Purple
bldcyn="\[\e[1;36m\]" # Cyan
bldwht="\[\e[1;37m\]" # White
unkblk="\[\e[4;30m\]" # Black - Underline
undred="\[\e[4;31m\]" # Red
undgrn="\[\e[4;32m\]" # Green
undylw="\[\e[4;33m\]" # Yellow
undblu="\[\e[4;34m\]" # Blue
undpur="\[\e[4;35m\]" # Purple
undcyn="\[\e[4;36m\]" # Cyan
undwht="\[\e[4;37m\]" # White
bakblk="\[\e[40m\]"   # Black - Background
bakred="\[\e[41m\]"   # Red
badgrn="\[\e[42m\]"   # Green
bakylw="\[\e[43m\]"   # Yellow
bakblu="\[\e[44m\]"   # Blue
bakpur="\[\e[45m\]"   # Purple
bakcyn="\[\e[46m\]"   # Cyan
bakwht="\[\e[47m\]"   # White
txtrst="\[\e[0m\]"    # Text Reset

txtblue="\[\e[01;34m\]" # Bleu prompt
txtorange="\[\e[02;33m\]" # Orange prompt
txtgreen="\[\e[01;32m\]" # Vert fluo prompt
txtyellow="\[\e[01;33m\]" # Jaune prompt
txtlightblue="\[\033[1;36m\]" # Bleu clair prompt
txtteal="\[\e[02;36m\]" # turquoise, heure prompt
txtgray="\[\e[30;1m\]" # gris prompt


# Vim
export EDITOR=vim
export VISUAL=vim
if type -P vim >/dev/null; then
  alias vi=vim
fi


# prompt

function truncate_pwd {
 if [ $HOME == $PWD ]
 then
   newPWD="~"
 elif [ $HOME ==  ${PWD:0:${#HOME}} ]
 then
   newPWD="~${PWD:${#HOME}}"
 else
   newPWD=$PWD
 fi

  local pwdmaxlen=15
  if [ ${#newPWD} -gt $pwdmaxlen ]
  then
    local pwdoffset=$(( ${#newPWD} - $pwdmaxlen  ))
    newPWD=".+${newPWD:$pwdoffset:$pwdmaxlen}"
  fi
}

PROMPT_COMMAND=truncate_pwd
ROOT_UID=0

export PS1="${txtrst}${txtgray}[\t] ${txtblue}\u${txtrst}@${txtyellow}\h${txtrst}: ${txtjaunj}\w${txtrst}\$ "
export PS2="        -> "


#
# Functions
# 
myip () {
  wget -q -O - checkip.dyndns.org | sed -e 's/.*Current IP Address: //' -e 's/<.*$//';
}
mktar () { tar cvf  "${1%%/}.tar"     "${1%%/}/"; }
mktgz () { tar cvzf "${1%%/}.tar.gz"  "${1%%/}/"; }
mktbz () { tar cvjf "${1%%/}.tar.bz2" "${1%%/}/"; }

extract () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjvf $1   ;;
      *.tar.gz)    tar xzvf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xvf $1    ;;
      *.tbz2)      tar xjvf $1   ;;
      *.tgz)       tar xzvf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo -e "${bldred}'$1' can't be extracted width extract()" ;;
    esac
  else
    echo -e "\n${bldred}'$1' is not a valid file"
  fi
}

switch-encoding () {
  if [ -f "$1" ] ; then
    case "`file -bi "$1"`" in
      *iso-8859-1)   iconv --from-code=ISO-8859-1 --to-code=UTF-8 "$1" > "$1".utf-8 && echo -e "\n${bldgrn}New file : "$1".utf-8"  ;;
      *utf-8)   iconv --from-code=UTF-8 --to-code=ISO-8859-1 "$1" > "$1".iso-8859-1 && echo -e "\n${bldgrn}New file : "$1".iso-8859-1" ;;
      *us-ascii)   echo -e "\n${bldylw}US-ASCII don't need to be changed"   ;;
      *)           echo -e "\n${bldred}'$1' encoding can't be switched: changeEncoding(`file -bi "$1"`)" ;;
    esac
  else
    echo -e "\n${bldred}'$1' is not a valid file"
  fi
}