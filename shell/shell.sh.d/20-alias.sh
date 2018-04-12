#  _        _ _      __
# | |_ _ __| | |__  / _|
# | __| '__| | '_ \| |_
# | |_| |  |_| |_) |  _|
#  \__|_|  (_)_.__/|_|
#

#=============================================================================
# alias for Math.PI
#=============================================================================
alias pi='seq -f '4/%g' 1 2 99999 | paste -sd-+ | bc -l'


#=============================================================================
# alias for apt-get
#=============================================================================
alias aptinstall='sudo apt-get install'
alias update='sudo apt-get update'
alias dist-upgrade='sudo apt-get dist-upgrade'
alias search='apt-cache search'
alias purge='sudo apt-get purge'
alias cleanall='sudo apt-get autoremove && sudo apt-get autoclean && sudo apt-get clean'


#=============================================================================
# alias for ls
#=============================================================================
alias ls='ls -h -NF --show-control-chars --color=always'
alias l='ls -CF'
alias la='ls -Al'
alias lc='ls -lcr'
alias lk='ls -lSr'
alias ll='ls -l'
alias lla='la -l'
alias lm='ls -al | more'
alias lr='ls -lR'
alias lt='ls -lt'
alias ltr='ls -ltr'
alias lu='ls -lu'
alias lur='ls -lur'
alias lx='ls -lXB'


#=============================================================================
# alias for cd
#=============================================================================
alias ..='cd ..'
alias 1='cd -'


#=============================================================================
# alias for cmake
#=============================================================================
alias oocmake='mkdir build && cd build && cmake .. && make' # out-of-source cmake


#=============================================================================
# alias for node
#=============================================================================
alias cnpm="npm --registry=https://registry.npm.taobao.org \
--cache=$HOME/.npm/.cache/cnpm \
--disturl=https://npm.taobao.org/dist \
--userconfig=$HOME/.cnpmrc"



#=============================================================================
# other alias
#=============================================================================
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias md='mkdir -p'
alias vi='vim'
alias grep="grep --color=auto"
alias dic='sdcv'
alias dstat='dstat -cdlmnpsy'
alias clc='clear'

#=============================================================================
# alias for quick open
#=============================================================================
if [ -z "$DISPLAY" ] ; then
    echo
    echo "[WARNING]: DISPLAY environment variable is not defined."
    echo
else
	alias -s png=eog
	alias -s jpg=eog
	alias -s pdf=evince
	alias -s html=google-chrome
    alias -s py=vi
    alias -s js=vi
    alias -s c=vi
    alias -s java=vi
    alias -s txt=vi
    alias -s gz='tar -xzvf'
    alias -s tgz='tar -xzvf'
    alias -s zip='unzip'
    alias -s bz2='tar -xjvf'
fi
