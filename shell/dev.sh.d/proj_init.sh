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

case $1 in
  mvn )
      shift
      mvninit $*
      ;;
esac
