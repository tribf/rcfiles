#  _        _ _      __
# | |_ _ __| | |__  / _|
# | __| '__| | '_ \| |_
# | |_| |  |_| |_) |  _|
#  \__|_|  (_)_.__/|_|
#


#=============================================================================
# set path for ANT
#=============================================================================
# export ANT_HOME=/home/tribf/app/apache-ant-1.10.1
export ANT_HOME=$HOME/app/apache-ant-1.9.9
export PATH=$PATH:$ANT_HOME/bin

#=============================================================================
# set path for MAVEN
#=============================================================================
export M2_HOME=$HOME/app/apache-maven-3.3.3
export PATH=$PATH:$M2_HOME/bin


export JAVA_HOME=$HOME/app/jdk1.8.0_121
# export JAVA_HOME=$HOME/app/jdk1.7.0_71
export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar:$CLASSPATH
export PATH=$PATH:$JAVA_HOME/bin
