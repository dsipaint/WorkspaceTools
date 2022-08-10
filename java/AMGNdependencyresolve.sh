#!/bin/bash
#script to add AMGN to the system classpath

rm -rf /tmp/AMGN/

#get AMGN code from web
git clone https://github.com/dsipaint/AMGN.git /tmp/AMGN
#create AMGN jar
mvn package -f "/tmp/AMGN/pom.xml"

AMGN_VERSION="alpha-1.4.1" #CHANGE THE AMGN VERSION AS NEEDED
#add AMGN to classpath
mvn install:install-file -Dfile="/tmp/AMGN/target/AMGN-${AMGN_VERSION}-jar-with-dependencies.jar" -DgroupId=com.github.dsipaint -DartifactId=AMGN -Dversion=$AMGN_VERSION -Dpackaging=jar -DgeneratePom=true

rm -rf /tmp/AMGN
