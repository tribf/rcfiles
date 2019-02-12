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


function cmakeapp() {
    export APP_NAME=$1
    export APP_CTIME=`date "+%Y-%m-%dT%H:%M:%S%:z"`
    export APP_MAIN_EXE=$1

    APP_DEMO_DIR=${TRIBF_SHELL_HOME}/dev.sh.d/templ/cmake/app-demo
    mkdir -p $APP_NAME/src
    mkdir -p $APP_NAME/src/conf
    mkdir -p $APP_NAME/src/log
    mkdir -p $APP_NAME/src/util
    mkdir -p $APP_NAME/bin
    mkdir -p $APP_NAME/conf

    envsubst '${APP_NAME} ${APP_CTIME}' < $APP_DEMO_DIR/app_cpp_top.tmpl > $APP_NAME/CMakeLists.txt
    envsubst '${APP_NAME} ${APP_CTIME}' < $APP_DEMO_DIR/src/main.cpp.tmpl > $APP_NAME/src/main.cpp
    envsubst '${APP_MAIN_EXE}' < $APP_DEMO_DIR/bin/run.sh.tmpl > $APP_NAME/bin/run.sh

    cp $APP_DEMO_DIR/src/CMakeLists.txt $APP_NAME/src/CMakeLists.txt
    cp $APP_DEMO_DIR/src/conf/AppConfig.h $APP_NAME/src/conf/AppConfig.h
    cp $APP_DEMO_DIR/src/log/Logger.h $APP_NAME/src/log/Logger.h
    cp $APP_DEMO_DIR/src/util/TimeUtil.h $APP_NAME/src/util/TimeUtil.h
    cp $APP_DEMO_DIR/src/CMakeLists.txt $APP_NAME/src/CMakeLists.txt

    cp $APP_DEMO_DIR/conf/app_config.json $APP_NAME/conf/app_config.json

    cd $APP_NAME && mkdir build && cd build && cmake .. && make
}

function cmakeinit() {
  if [ $# != 2 ]; then
      echo "$0 projname [app|lib]"
  else
      case $2 in
          app )
              cmakeapp $1
              ;;
          lib )
              echo "not impl"
              ;;
          * )

              ;;
      esac
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
