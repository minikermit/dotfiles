# System-wide .bashrc file for interactive bash(1) shells.

# To enable the settings / commands in this file for login shells as well,
# this file has to be sourced in /etc/profile.


# configuration
#source ~/.dotfiles/zsh/aliases
#source ~/.dotfiles/zsh/zsh_aliases

# Things I don't want to publish to github
#source ~/.secrets

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
# PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '

#################
# prompt stuff #
#################
YELLOW="\[\033[0;33m\]"
export PS1="=================================================================================================================================================\n\[\033[01;32m\]\u@\h\[\033[01;34m\] \w$YELLOW \$(parse_git_branch) \$\[\033[00m\] "




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

# alias for terminator config file edition
alias sterm='sudo vim ~/.config/terminator/config'

#bash copy to source repository
alias bashcopy='sudo cp /etc/bash.bashrc /var/www/dotfiles/bash/bash.bashrc'
alias bashcopy2='sudo cp ~/.bash_ps1 /var/www/dotfiles/bash/.bash_ps1'

#vim copy to source directory + shortcut
alias svimrc='sudo vim ~/.vim/vimrc'
alias vimcopy='sudo cp ~/.vim/vimrc /var/www/dotfiles/vim/vimrc'
alias dotfiles='cd /var/www/dotfiles'

# alias for text editors
alias rmi='sudo ~/Downloads/RubyMine/bin/rubymine.sh'
alias rvim='rvmsudo vim '
alias svim='sudo vim '
alias snano='sudo nano '
alias rnano='rvmsudo nano'
alias vi='vim '
alias vim-='find . -type f' #search all files under current dir
export EDITOR=vim
export VISUAL=vim

 #alias for moves back in directories
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
alias wmain='firefox file:///home/minikermit/Public/rails31/test/qcm/public/main.html'

# alias for ubuntu updates and install
alias agi='sudo apt-get install'
alias agup='sudo apt-get update'
alias agug='sudo apt-get upgrade'
alias agud='sudo apt-get dist-upgrade'
alias agre='sudo apt-get autoremove'
alias agcl='sudo apt-get clean'
alias agu='sudo apt-get update && sudo apt-get upgrade && sudo apt-get dist-upgrade'

# alias for rvm and gemsets
alias 19332='rvm use 1.9.3@rails32'
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
alias sgem='sudo vim Gemfile'
alias ssho='sudo vim show.html.erb'
alias sedi='sudo vim edit.html.erb'
alias sind='sudo vim index.html.erb'
alias snew='sudo vim new.html.erb'


alias be='rvmsudo bundle exec'
alias bi='rvmsudo bundle install'
alias ber="rmvsudo bundle exec rspec"
alias bes="rvmsudo bundle exec spec"
alias bec="rmvsudo bundle exec cucumber"
alias ano="rvmsudo bundle exec annotate"
alias precomp="rvmsudo bundle exec rake assets:precompile"

alias gemi='rvmsudo gem install --no-rdoc --no-ri'
alias gemu='rvmsudo gem uninstall'

alias ss='rvmsudo rails s'
alias pass='rvmsudo passenger start'
alias ttr='touch tmp/restart' # restart passenger

alias dbm='rvmsudo rake db:migrate'
alias dbmp='rvmsudo rake db:migrate RAILS_ENV="production"'
alias r='rails' # rails 3 shortcut 'r'

# rails logs, tailing and cleaning

alias log='tail -f -0 ./log/*.log &'
alias stoplog='killall tail'
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

# alias for rails best practices (run + show in browser)
alias bestp='rails_best_practices -f html .'
alias bests='firefox rails_best_practices_output.html'

# alias for guard (continuous testing)
alias guar='rvmsudo guard'

# git
alias gitdm='git diff | mate'
alias gitdm2='git diff --cached | mate'
alias gits='git status'
alias gitcm='git commit -m'
alias gitlog='git --no-pager log -n 20 --pretty=format:%h%x09%an%x09%ad%x09%s --date=short --no-merges'
alias gitb='git branch -v'
alias gitcd='git add .;gitcm "done"'
alias gitpush='git push -u origin master'

# Git
alias ungit="find . -name '.git' -exec rm -rf {} \;"
alias ga='git add'
alias gb='git branch'
alias gba='git branch -a'
alias gc='git commit -v'
alias gca='git commit -v -a'

# Commit pending changes and quote all args as message
function gg() {
  sudo git commit -v -a -m "$*"
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
  sudo git clone git://github.com/$USER/$1.git
}

# MySQL
#alias start_mysql='sudo mysqld_safe --user=mysql &'

# Postgress
#alias startpg='sudo /Library/StartupItems/PostgreSQL/PostgreSQL start'


# MongoDB
#export PATH=/usr/mongodb/bin:$PATH

#Redis
alias redis-start='redis-server /usr/local/etc/redis.conf'


# GENERAL BASH commands
# alias ls='ls -G -color'
alias h='history'
alias dns_flush='dscacheutil -flushcache'
alias ping='ping -c 10'
alias openports='netstat -nape --inet'
alias da=' date "+%Y-%m-%d %A %T %Z"'
alias trash="rm -fr ~/.Trash" # empty trash
alias mv='mv -i'
alias cp='cp -i'
alias rm='rm -i'

# -> Prevents accidentally clobbering files.
alias mkdir='mkdir -p'
alias j='jobs -l'
alias which='type -a'

#-------------------------------------------------------------
# The 'ls' family (this assumes you use a recent GNU ls)
#-------------------------------------------------------------
alias ll="ls -l --group-directories-first"
alias dir='ls -l'
alias lsa='ls -a -color'
alias ls='ls -hF --color'  # add colors for filetype recognition
alias la='ls -Al'          # show hidden files
alias lx='ls -lXB'         # sort by extension
alias lk='ls -lSr'         # sort by size, biggest last
alias lc='ls -ltcr'        # sort by and show change time, most recent last
alias lu='ls -ltur'        # sort by and show access time, most recent last
alias lt='ls -ltr'         # sort by date, most recent last
alias lm='ls -al |more'    # pipe through 'more'
alias lr='ls -lR'          # recursive ls
alias tree='tree -Csu'     # nice alternative to 'recursive ls'

# If your version of 'ls' doesn't support --group-directories-first try this:
# function ll(){ ls -l "$@"| egrep "^d" ; ls -lXB "$@" 2>&-| \
  #                egrep -v "^d|total "; }

# Utilities
alias zipr='sudo zip -9 -r' # usage : zipr directory.zip directory (with maximum compression)
alias un='tar -zvxf'
alias search='locate -r' # because i never remember this command
alias compiz='cscm' # compiz manager in case I tweak too much the system and break the graphic layer ;-)
alias reload='. ~/.bash_profile'
alias sterm='sudo vim  ~/config/terminator/config'


# Functions

function extract()      # Handy Extract Program.
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xvjf $1     ;;
      *.tar.gz)    tar xvzf $1     ;;
      *.bz2)       bunzip2 $1      ;;
      *.rar)       unrar x $1      ;;
      *.gz)        gunzip $1       ;;
      *.tar)       tar xvf $1      ;;
      *.tbz2)      tar xvjf $1     ;;
      *.tgz)       tar xvzf $1     ;;
      *.zip)       unzip $1        ;;
      *.Z)         uncompress $1   ;;
      *.7z)        7z x $1         ;;
      *)           echo "'$1' cannot be extracted via >extract<" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# a nice function to send authorized keys to the server
# picked up from deploying rails applications ( pragprog.com)
# Usage: authme 123.45.67.89
function authme {
   ssh $1 'cat >> .ssh/authorized_keys' < ~/.ssh/id_dsa.pub
 }

function my_ip() # Get IP adresses.
 {
  MY_IP=$(/sbin/ifconfig ppp0 | awk '/inet/ { print $2 } ' | \
    sed -e s/addr://)
  MY_ISP=$(/sbin/ifconfig ppp0 | awk '/P-t-P/ { print $3 } ' | \
    sed -e s/P-t-P://)
 }

function ii() # Get current host related info.
 {
  echo -e "\nYou are logged on ${RED}$HOST"
  echo -e "\nAdditionnal information:$NC " ; uname -a
  echo -e "\n${RED}Users logged on:$NC " ; w -h
  echo -e "\n${RED}Current date :$NC " ; date
  echo -e "\n${RED}Machine stats :$NC " ; uptime
  echo -e "\n${RED}Memory stats :$NC " ; free
   my_ip 2>&- ;
  echo -e "\n${RED}Local IP Address :$NC" ; echo ${MY_IP:-"Not connected"}
  echo -e "\n${RED}ISP Address :$NC" ; echo ${MY_ISP:-"Not connected"}
  echo -e "\n${RED}Open connections :$NC "; netstat -pan --inet;
  echo
 }

#Create and change into a new directory
function take() {
    mkdir -p "$*"
    cd "$*"
  }


# Alias to local server example
alias tom=' ssh 192.168.1.0 -l root'

# Alias to remote server example
alias ANYNAMEHERE=' ssh YOURWEBSITE.com -l USERNAME -p PORTNUMBERHERE'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# enable a clean command prompt after each command
if [ -f "$HOME/.bash_ps1" ]; then
    . "$HOME/.bash_ps1"
fi
