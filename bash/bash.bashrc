# System-wide .bashrc file for interactive bash(1) shells.

# To enable the settings / commands in this file for login shells as well,
# this file has to be sourced in /etc/profile.

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, overwrite the one in /etc/profile)
PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '

# Commented out, don't overwrite xterm -T "title" -n "icontitle" by default.
# If this is an xterm set the title to user@host:dir
#case "$TERM" in
#xterm*|rxvt*)
#    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'
#    ;;
#*)
#    ;;
#esac

# enable bash completion in interactive shells
#if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
#    . /etc/bash_completion
#fi

# sudo hint
if [ ! -e "$HOME/.sudo_as_admin_successful" ]; then
    case " $(groups) " in *\ admin\ *)
    if [ -x /usr/bin/sudo ]; then
	cat <<-EOF
	To run a command as administrator (user "root"), use "sudo <command>".
	See "man sudo_root" for details.
	
	EOF
    fi
    esac
fi

# if the command-not-found package is installed, use it
if [ -x /usr/lib/command-not-found -o -x /usr/share/command-not-found ]; then
	function command_not_found_handle {
	        # check because c-n-f could've been removed in the meantime
                if [ -x /usr/lib/command-not-found ]; then
		   /usr/bin/python /usr/lib/command-not-found -- $1
                   return $?
                elif [ -x /usr/share/command-not-found ]; then
		   /usr/bin/python /usr/share/command-not-found -- $1
                   return $?
		else
		   return 127
		fi
	}
fi

# alias for bash file edition
alias sbash='sudo vim /etc/bash.bashrc'

#bash copy to source repository
alias bashcopy='sudo cp /etc/bash.bashrc /var/www/dotfiles/bash/bash.bashrc' 

# alias for text editors
alias rmi='sudo ~/Downloads/RubyMine/bin/rubymine.sh'
alias rvim='rvmsudo vim '
alias svim='sudo vim '
alias snano='sudo nano '
alias rnano='rvmsudo nano'
alias vi='vim '

# alias for moves back in directories
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias home='cd ~' # because tilda is hard to reach !!!
alias disk="cd /" # move to root of filesystem
alias s='cd ..' # up one dir # variant of the above .. (shorter by one letter !)
alias cdd='cd -' # goto last dir cd'ed from


# alias for moves in usefull directories
alias cpub='cd Public'
alias cdown='cd Downloads'
alias cdoc='cd Documents'

# alias for ubuntu updates and install
alias agi='sudo apt-get install'
alias agup='sudo apt-get update'
alias agug='sudo apt-get upgrade'
alias agud='sudo apt-get dist-upgrade'

# alias for rvm and gemsets
alias 19231='rvm use 1.9.2@rails31'
alias 1923='rvm use 1.9.2@rails3'
alias gemup='rvmsudo gem update'

# alias for rails apps
alias current='cd ~/Public/rails31/test/qcm'
alias cview='cd app/views/'
alias ccont='cd app/controllers/'
alias cmodel='cd app/models/'
alias cconf='cd config'
alias cdb='cd db'
alias cassets='cd app/assets/'
alias csheets='cd app/assets/stylesheets/'
alias cjava='cd app/assets/javascripts/'
alias cpic='cd app/assets/images/'

alias sdb='sudo vim config/database.yml'
alias sroutes='sudo vim config/routes.rb'
alias sapperb='sudo vim app/views/layouts/application.html.erb'

alias ss='rvmsudo rails s'
alias pass='rvmsudo passenger start'

alias dbm='sudo rake db:migrate'
alias r='rails' # rails 3 shortcut 'r'

# rails logs, tailing and cleaning
alias tdl='tail -f ./log/development.log'
alias ttl='tail -f ./log/test.log'
alias ctl='> ./log/test.log'
alias cdl='> ./log/development.log'
alias tl='tail -f log/*.log'

# alias for git
alias gb='git branch'
alias gc='git commit -v'
alias gca='git commit -a -v'
alias gco='git checkout'
alias gd='git diff'
alias gdc='git diff --cached'
alias gdh='git diff HEAD'
alias gp='git push'
alias gl='git pull'
alias gpr='git pull --rebase'
alias gst='git status'
alias gap='git add -p'
alias glg='git log --pretty=oneline --abbrev-commit'

export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
source ~/.git-completion.sh

# alias for rspec
alias rs='rvmsudo rake spec'

# alias for cucumber
alias cuke='rvmsudo rake cucumber'
alias feat='cd features '
alias supp='cd features/support '

# git
alias gitdm='git diff | mate'
alias gitdm2='git diff --cached | mate'
alias gits='git status'
alias gitcm='git commit -m'
alias gitlog='git --no-pager log -n 20 --pretty=format:%h%x09%an%x09%ad%x09%s --date=short --no-merges'
alias gitb='git branch -v'
alias gitcd='git add .;gitcm "done"'
alias gitpush='git push origin master'

# Git
alias ungit="find . -name '.git' -exec rm -rf {} \;"
alias ga='git add'
alias gb='git branch'
alias gba='git branch -a'
alias gc='git commit -v'
alias gca='git commit -v -a'
# Commit pending changes and quote all args as message
function gg() {
    git commit -v -a -m "$*"
}
alias gco='git checkout'
alias gd='git diff -u --ignore-all-space | mate'
alias gdm='git diff -u master'
alias gl='git pull'
alias gnp="git-notpushed"
alias gp='git push'
alias gst='git status'
alias gt='git status'
alias g='git status'
alias gk='gitk --all &'
alias gx='gitx --all'
alias eg='sudo nano .git/config'

# Git clone from GitHub
function gch() {
  git clone git://github.com/$USER/$1.git
}

# MySQL
#alias start_mysql='sudo mysqld_safe --user=mysql &'

# GENERAL BASH commands
alias ls='ls -G -color'
alias dir='ls -l'
alias h='history'
alias dns_flush='dscacheutil -flushcache'
alias ping='ping -c 10'
alias openports='netstat -nape --inet'
alias da=' date "+%Y-%m-%d %A %T %Z"'
alias trash="rm -fr ~/.Trash" # empty trash
alias mv='mv -i'
alias cp='cp -i'


# Utilities
alias zipr='zip -9 -r' # usage : zipr directory.zip directory (with maximum compression)
alias un='tar -zvxf'
alias search='locate -r' # because i never remember this command
alias compiz='cscm' # compiz manager in case I tweak too much the system and break the graphic layer ;-)


# a nice function to send authorized keys to the server
# picked up from deploying rails applications ( pragprog.com)
# Usage: authme 123.45.67.89
function authme {
   ssh $1 'cat >> .ssh/authorized_keys' < ~/.ssh/id_dsa.pub
 }











