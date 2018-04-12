#  _        _ _      __
# | |_ _ __| | |__  / _|
# | __| '__| | '_ \| |_
# | |_| |  |_| |_) |  _|
#  \__|_|  (_)_.__/|_|
#


#=============================================================================
# a beautiful man page
#=============================================================================
# export PAGER=most
export PAGER=more
export MANWIDTH=80


#=============================================================================
# fcitx input method
#=============================================================================
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"


#=============================================================================
# fix sublime chinese
#=============================================================================
alias sublime="LD_PRELOAD='/home/tribf/apps/st2/libsublime-imfix.so' /home/tribf/apps/st2/sublime_text"


alias httpUpload='cd /home/tribf/tribfworkplace/python/flask/ ;sudo  python ./main.py'

