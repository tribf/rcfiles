#  _        _ _      __
# | |_ _ __| | |__  / _|
# | __| '__| | '_ \| |_
# | |_| |  |_| |_) |  _|
#  \__|_|  (_)_.__/|_|
#



#=============================================================================
# set PATH according to OS type
#=============================================================================
case `uname -o` in
    Msys* )
        echo -e "\n${RED}OS Type :$NC " `uname -o`
        export PATH=/d/msys64/mingw64/bin:$PATH
        alias ping="$TRIBF_BASH_ROOT/msys_win.sh ping"
        alias netstat="$TRIBF_BASH_ROOT/msys_win.sh netstat"
        alias nslookup="$TRIBF_BASH_ROOT/msys_win.sh nslookup"
        alias ipconfig="$TRIBF_BASH_ROOT/msys_win.sh ipconfig"

        export PATH=$PATH:/d/Program\ Files/Haskell\ Platform/7.10.3/bin
        export PATH=$PATH:/c/Users/SIAE302_BF/AppData/Local/atom/bin
        ;;
    GNU/Linux)

        # export PATH=$PATH:/opt/clion-2016.2.2/bin/
        # export PATH=$PATH:/opt/Qt5.7.0/Tools/QtCreator/bin/
        # export PATH=$PATH:/opt/arduino-1.6.12/
        # export PATH=$PATH:/opt/arduino-1.6.12/hardware/tools/avr/bin
        export PATH=$PATH:$HOME/app/racket/bin

        ##########---------- set PATH NodeJS ----------###########
        export N_PREFIX=$HOME/app/noderoot
        export NODEJS_HOME=$N_PREFIX
        export PATH=$PATH:$NODEJS_HOME/bin


        ##########---------- set PATH miniconda3 ----------###########
        export PATH=$PATH:$HOME/app/miniconda3/bin

        ##########---------- set PATH SCALA ----------###########
        export SCALA_HOME=/opt/scala-2.12.1
        export PATH=$PATH:${SCALA_HOME}/bin

        ##########---------- set PATH GO ----------###########
        export GOROOT=$HOME/app/go
        export PATH=$PATH:$GOROOT/bin


        ##########---------- set PATH OC ----------###########
        export PATH=$PATH:$HOME/app/oc

        ##########---------- I can go ANYwhere ----------###########    !!! Have conflict with VIM tab
        # [[ -s /usr/share/autojump/autojump.sh ]] && . /usr/share/autojump/autojump.sh


        ##########---------- set PATH TORCH ----------###########
        # . $HOME/github/torch/install/bin/torch-activate
        ;;
esac
