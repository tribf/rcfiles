#!/usr/bin/env bash

function mvninit() {
  if [ $# != 3 ]; then
      echo "$0 com.tribf.appname 1.8 qs"
  else
      export APP_GROUP_ID=$1
      export JAVA_VERSION=$2
      TMPL=${TRIBF_SHELL_HOME}/dev.sh.d/templ/mvn/pom.xml.$3.tmpl
      export APP_ARTIFACT_ID=${APP_GROUP_ID##*.}
      TARGET=$APP_ARTIFACT_ID/pom.xml

      JAVA_PKG_DIR=`echo $APP_GROUP_ID | tr . /`
      mkdir -p $APP_ARTIFACT_ID/src/main/java/$JAVA_PKG_DIR/
      mkdir -p $APP_ARTIFACT_ID/src/test/java/$JAVA_PKG_DIR/
      envsubst '${APP_GROUP_ID} ${APP_ARTIFACT_ID} ${JAVA_VERSION}' < ${TMPL} > $TARGET
      cp $TRIBF_SHELL_HOME/dev.sh.d/templ/mvn/log4j.xml $APP_ARTIFACT_ID/log4j.xml
      cp $TRIBF_SHELL_HOME/dev.sh.d/templ/mvn/.gitignore $APP_ARTIFACT_ID/.gitignore
      cd $APP_ARTIFACT_ID
      mvn compile
  fi
}

function cmakeinit() {
  if [ $# != 1 ]; then
      echo "$0 appname"
  else
      export APP_NAME=$1
      export APP_CTIME=`date "+%Y-%m-%dT%H:%M:%S%:z"`

      mkdir -p $APP_NAME/src
      CMK_TMPL=${TRIBF_SHELL_HOME}/dev.sh.d/templ/cmake/simple.cmake.tmpl
      CMK_TARGET=$APP_NAME/CMakeLists.txt
      SRC_TMPL=${TRIBF_SHELL_HOME}/dev.sh.d/templ/cmake/main.cpp.tmpl
      SRC_TARGET=$APP_NAME/src/main.cpp
      envsubst '${APP_NAME} ${APP_CTIME}' < ${CMK_TMPL} > $CMK_TARGET
      envsubst '${APP_NAME} ${APP_CTIME}' < ${SRC_TMPL} > $SRC_TARGET
      cd $APP_NAME && mkdir build && cd build && cmake .. && make
  fi
}

case $1 in
  mvn )
      shift
      mvninit $*
      ;;
  cmake )
      shift
      cmakeinit $*
      ;;

  * )
    echo "$0 [mvn|cmake]"
      ;;
esac
