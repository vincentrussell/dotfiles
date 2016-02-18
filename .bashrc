source ~/.git-completion.bash
source /opt/cloud-install/cloud-install-bash-include.sh

# The # sign notes that the line is a comment
# v 0.3.2m # I always version to make sure I am not overwriting files.
# 2009-02-13 # This is the last date I edited a file.

# Normal Colors
Black='\e[0;30m'        # Black
Red='\e[0;31m'          # Red
Green='\e[0;32m'        # Green
Yellow='\e[0;33m'       # Yellow
Blue='\e[0;34m'         # Blue
Purple='\e[0;35m'       # Purple
Cyan='\e[0;36m'         # Cyan
White='\e[0;37m'        # White

# Bold
BBlack='\e[1;30m'       # Black
BRed='\e[1;31m'         # Red
BGreen='\e[1;32m'       # Green
BYellow='\e[1;33m'      # Yellow
BBlue='\e[1;34m'        # Blue
BPurple='\e[1;35m'      # Purple
BCyan='\e[1;36m'        # Cyan
BWhite='\e[1;37m'       # White

# Background
On_Black='\e[40m'       # Black
On_Red='\e[41m'         # Red
On_Green='\e[42m'       # Green
On_Yellow='\e[43m'      # Yellow
On_Blue='\e[44m'        # Blue
On_Purple='\e[45m'      # Purple
On_Cyan='\e[46m'        # Cyan
On_White='\e[47m'       # White

NC="\e[m"               # Color Reset


# PS1,PS2, etc. are variables that allow you to customize your command prompt.
# More can be found on this by searching the internet
# Mine tells bash to give me the host name (\h), the highest directory of my working path (\W)
# my user name (\u) and the version of the shell (\v), followed by $, which is a sign used
# to denote that this is not a super user
# It ends up looking like:
# [unimind : ~] sc 3.2$
# PS1="[\[33[0;37m\]\h : \W] \u \v$ "
# $PS1="[\h : \W] \u \v$ "
#export PS1="\e[32;1m\]\u@\[\e[35;1m\]\H \[\e[0m\]\w]\$ "
source ~/.git-prompt.sh
#export PS1="\[\033[36m\][\t] \[\033[1;33m\]\u\[\033[0m\]@\h:\[\033[36m\][\W]:\[\033[0m\] "
export PS1="\[$Green\]\t\[$Red\]-\[$Blue\]\u\[$yellow\]\[$Yellow\]\w\[\033[m\]\[$Magenta\]\$(__git_ps1)\[$White\]\$ "
#mac only
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

function resetaudio() {
  sudo killall coreaudiod
}

function extract-rpm() {
	rpm2cpio $* | cpio -idmv
}


# bash's vi mode - this allows me to use vi like commands in bash. I think this is
# actually a readline feature. Search for 'bash' and 'set' for more info.
# set -o vi

# screen stuff from hans.fugal.net
# This is an environment variable PROMPT_COMMAND that does some
# sneaky things for the program GNU Screen.
#export PROMPT_COMMAND='echo -ne "\ek\e\\"'

# up and down keys search through history like in MATLAB
# bind '"\e[A": history-search-backward'
# bind '"\e[B": history-search-forward'

# more history stuff
# HISTSIZE sets the number of history items to retain but I commented it out for now
# HISCONTROL=ignoredups tells bash not to register two instances of a command in a row
# export HISTSIZE=1000
export HISTCONTROL=ignoredups

# setting ctrl+L behavior to clear screen
bind -m vi-insert \C-l:clear-screen

# GS_OPTIONS are my ghost script options to not compress raster images with epstopdf
export GS_OPTIONS="-dAutoFilterColorImages=false -dColorImageFilter=/FlateEncode"

# set editor variable for general editing
export EDITOR=vi

# MATLAB path information? doesn't appear to work
export MATLABPATH=~/.matlab/R2008a/

# Python startup file
export PYTHONSTARTUP=~/.pythonrc

# PATH is a variable that is tricky. You probably shouldn't use this version but the following:
# export PATH=$PATH
# you can add other paths to this by using the colon notation seen below.
export PATH=$PATH:/bin:/sbin:/usr/X11/bin:/usr/X11R6/bin:/opt/bin:/opt/local/bin:/usr/local/bin:/usr/bin:/usr/sbin:/Developer/usr/bin:/Applications/matlab/bin:/usr/local/git/bin

# Aliases for my sanity
# these let me type the alias instead of the entire command for common commands
# the semicolon separates different commands in bash
alias app='open -a' # usage: 'app itunes' will open itunes, mac only
alias current='cd ~/sandbox/codeproject/current_branch/; pwd'
alias data='cd /repo/data/; pwd; ls'

# common/overloaded util names
# I do this because i want these programs to always run in these modes
alias mv='mv -iv'
alias cp='cp -iv'
alias df='df -h'
alias eject='hdiutil eject' # usage: 'eject /Volume/LIBRARY' will unmount and eject LIBRARY
alias unmount='hdiutil unmount' # usage: 'unmount disk3s1' will unmount disk3s1
alias mount-iso='hdiutil mount'
alias ip='ipconfig getifaddr en0'
alias sys_prefs='open -a System\ Preferences'

## Moving around & all that jazz
alias back='cd "$OLDPWD"'
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."


# title creation function
# I don't ever use this but it shows that many other things are possible in .bashrc
function title ()
{
case $TERM in
*term | ansi | xterm-color | rxvt |vt100 | gnome* )
echo -n -e "33]0;$*07" ;;
*) ;;
esac
}

# specific program paths
# more aliases
alias matlab='matlab -nodesktop -nosplash'
alias matlabnj='matlab -nojvm'
alias matlabh='matlab -nojvm -display $DISPLAY'
alias matlab64='/Applications/matlab64/bin/matlab -nodesktop -arch maci64'
alias neuron='/Applications/NEURON-5.9/nrn/i686/bin/nrngui'
alias gmail='open -a google\ notifier'
alias preview='open -a preview'
alias vpn='open -a /Applications/Shimo.app/'
alias xterm2='xterm -geometry 80x60+575+5 &'
alias ducks='du -cks * | sort -rn | head -11'
alias reload='source ~/.bashrc'
alias ll='ls -alh -G'
alias diskspace="du -S | sort -n -r |more"
alias folders="find . -maxdepth 1 -type d -print | xargs du -sk | sort -rn"
alias explore="open ."
alias wget='wget -c'
alias winmerge='opendiff'
alias mvn-install='mvn -DskipTests=true install'
alias cached='git diff --cached'

alias mvn-install='mvn -Dinvoker.skip=true -DskipTests=true clean install'
alias ingest-install='cd ~/Workspace/c3/c3-ingest/; mvn -Dinvoker.skip=true -DskipTests=true clean install; cd $OLDPWD'
alias mvn-site='mvn -Dinvoker.skip=true -DskipTests=true clean site:site'
alias mvn-local='mvn -Dinvoker.skip=true -DskipTests=true -Plocal-test clean install'
alias mvn-config='cd ~/Workspace/c3/c3-ingest/ingest-config; mvn-install; cd $OLDPWD'
alias mvn-rpm='mvn -Dinvoker.skip=true -DskipTests=true -P rpm clean package'


function chmod-help() {
   echo "read = 4"
   echo "write = 2"
   echo "execute = 1"
   echo "owner/group/other"
   echo "such that 644 does rw-r-r"
}

function lister {
    ls -l `if [ "$1" == '' ]; then echo '.'; else echo "$1"; fi`
}
# List only directories:
function lsd {
    lister $1 | egrep '^d'
}

function path() {
    echo $(cd $(dirname "$1") && pwd -P)/$(basename "$1")
}

# More memorable version:
alias lsdirs=lsd
# List only files:
function lsf {
    lister $1 | egrep -v '^d'
}
# More memorable version:
alias lsfiles=lsf

# QuickLook from the command line
# Display files in Quick Look
function ql () {
	(qlmanage -p "$@" > /dev/null 2>&1 &
	local ql_pid=$!
	read -sn 1
	kill ${ql_pid}) > /dev/null 2>&1
}
# Display any filetype as plain text
function qlt () {
	(qlmanage -p -c public.plain-text "$@" > /dev/null 2>&1 &
	local ql_pid=$!
	read -sn 1
	kill ${ql_pid}) > /dev/null 2>&1
}

function kill-grep() {
   ps -ef | grep -i "$@"  | grep -v grep | awk '{print $2}' | xargs kill -9
}

extract () {
   if [ -f $1 ] ; then
       case $1 in
           *.tar.bz2)   tar xvjf $1 && cd $(echo $1 | sed 's/.tar.bz2//')    ;;
           *.tar.gz)    tar xvzf $1 && cd $(echo $1 | sed 's/.tar.gz//')    ;;
           *.bz2)       bunzip2 $1 && cd $(echo $1 | sed 's/.bz2//')    ;;
           *.rar)       unrar x $1 && cd $(echo $1 | sed 's/.rar//')    ;;
           *.gz)        gunzip $1 && cd $(echo $1 | sed 's/.gz//')    ;;
           *.tar)       tar xvf $1 && cd $(echo $1 | sed 's/.tar//')    ;;
           *.tbz2)      tar xvjf $1 && cd $(echo $1 | sed 's/.tbz2//')    ;;
           *.tgz)       tar xvzf $1 && cd $(echo $1 | sed 's/.tgz//')    ;;
           *.zip)       unzip $1 && cd $(echo $1 | sed 's/.zip//')    ;;
           *.Z)         uncompress $1 && cd $(echo $1 | sed 's/.Z//')    ;;
           *.7z)        7z x $1 && cd $(echo $1 | sed 's/.7z//')    ;;
           *)           echo "don't know how to extract '$1'..." ;;
       esac
   else
       echo "'$1' is not a valid file!"
   fi
}


#-----------------------------------
# File & strings related functions:
#-----------------------------------
function find-wildcard() { find . -name '*'$1'*' ; }                 # find a file
function find-fullpath() { find `pwd` -name '*'$1'*' ; }                 # find a file and display fullpath
function find-exec() { find . -name '*'$1'*' -exec $2 {} \; ; }  # find a file and run $2 on it
function grep-jar() {
	find . -iname "*.jar" | while read fname; do jar tf $fname | grep -i "$1" && echo $fname; done
}
function find-cd() {
	filename=$(find . -name '*'$1'*' | sed 1q)

	if [ -n "$filename" ]; then

		dirname=$(dirname $filename)
		echo "changing directory: $filename "
		cd $dirname
	fi

}


function find-str() # find a string in a set of files
{
    if [ "$#" -gt 2 ]; then
        echo "Usage: fstr \"pattern\" [files] "
        return;
    fi
    SMSO=$(tput smso)
    RMSO=$(tput rmso)
    find . -type f -name "${2:-*}" -print | xargs grep -sin "$1" | \
sed "s/$1/$SMSO$1$RMSO/gI"
}

# Makes directory then moves into it
function mkcdr {
    mkdir -p -v $1
    cd $1
}

# Creates an archive from given directory
mktar() { tar cvf  "${1%%/}.tar"     "${1%%/}/"; }
mktgz() { tar cvzf "${1%%/}.tar.gz"  "${1%%/}/"; }
mktbz() { tar cvjf "${1%%/}.tar.bz2" "${1%%/}/"; }

# higrep
function higrep() {
local pattern=$1
	if [ $# -lt 1 ]; then
		echo "usage: higrep PATTERN [FILE]" >&2
		return
	fi
	if [ $# -eq 1]; then
		# for use with a pipe
		egrep --color=auto "$pattern|$"
	fi

	shift

	# for use with files
	egrep --color=auto "$pattern|$" $@
}

function copy-ssh-public-key() {
	KEY="$HOME/.ssh/id_rsa.pub"
	if [ ! -f $KEY ];then
		echo "private key not found at $KEY"
		echo "* please create it with "ssh-keygen -t rsa" *"
		echo "* to login to the remote host without a password, don't give the key you create with ssh-keygen a password! *"
		exit
	fi
	if [ -z $1 ];then
		echo "Please specify user@host.tld as the first switch to this script"
		exit
	fi
	echo "Putting your key on $1... "
	KEYCODE=`cat $KEY`
	ssh -q $1 "mkdir -p ~/.ssh 2>/dev/null; chmod 700 ~/.ssh; echo "$KEYCODE" >> ~/.ssh/authorized_keys; chmod 644 ~/.ssh/authorized_keys"
	echo "done!"

}


# clock - a little clock that appeares in the terminal window.
clock ()
{
while true;do clear;echo "===========";date +"%r";echo "===========";sleep 1;done
}

#dirsize - finds directory sizes and lists them for the current directory
dirsize () {
	du -shx * .[a-zA-Z0-9_]* 2> /dev/null | \
	egrep '^ *[0-9.]*[MG]' | sort -n > /tmp/list
	egrep '^ *[0-9.]*M' /tmp/list
	egrep '^ *[0-9.]*G' /tmp/list
	rm -rf /tmp/list
}



export ANT_HOME=~/Library/Dependencies/apache-ant-1.8.4
export MAVEN_HOME=~/Library/Dependencies/apache-maven-3.2.1
export GRAILS_HOME=~/Library/Dependencies/grails-1.3.7.1
export GROOVY_HOME=~/Library/Dependencies/groovy-2.1.7
#export JAVA_HOME=/usr/java/latest
export JAVA_HOME="$(/usr/libexec/java_home -v 1.7)"
export HADOOP_HOME=/Users/vrussell/Libraries/Dependencies/hadoop-2.0.0-cdh4.6.0
export ZOOKEEPER_HOME=/Users/vrussell/Libraries/Dependencies/zookeeper-3.4.5-cdh4.6.0

#export MAVEN_OPTS="-Xdebug -Xnoagent -Djava.compiler=NONE -Xrunjdwp:transport=dt_socket,address=8786,server=y,suspend=n"

export MAVEN_OPTS="-Djavax.net.ssl.trustStore=/Users/vrussell/.m2/devforce.jks -Djavax.net.ssl.trustStorePassword=changeit -Xmx512m -XX:MaxPermSize=128m"

export PATH=$PATH:~/bin:$JAVA_HOME/bin:$PATH:$ANT_HOME/bin:$MAVEN_HOME/bin:$GRAILS_HOME/bin:$GROOVY_HOME/bin

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
