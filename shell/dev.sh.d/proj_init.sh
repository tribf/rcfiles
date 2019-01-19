





function mvninit() {
	if [ $# != 3 ]; then
		echo "$0 com.tribf.appname 1.8 qs"
	else
		
		APP_GROUP_ID=$1
		JAVA_VERSION=$2
		TMPL=$TRIBF_SHELL_HOME/dev.sh.d/templ/mvn/pom.xml.$3.tmpl
		APP_NAME=${APP_GROUP_ID##*.}
		TARGET=$APP_NAME/pom.xml

		JAVA_PKG_DIR=`echo ${APP_GROUP_ID/./\\}`
		mkdir -p $APP_NAME/src/main/java/$JAVA_PKG_DIR/
		mkdir -p $APP_NAME/src/test/java/$JAVA_PKG_DIR/
		APP_GROUP_ID=${APP_GROUP_ID} APP_ARTIFACT_ID=${APP_ARTIFACT_ID} JAVA_VERSION=${JAVA_VERSION} envsubst < $TMPL > $TARGET
		cp $TRIBF_SHELL_HOME/dev.sh.d/templ/mvn/log4j.xml $APP_NAME/log4j.xml
		cp $TRIBF_SHELL_HOME/dev.sh.d/templ/mvn/.gitignore $APP_NAME/.gitignore
		cd $APP_NAME
		mvn compile
	fi

}
