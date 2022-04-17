#!/bin/bash
#script to actually build out AMGN

rm -rf /tmp/AMGN/

#get AMGN code from web
git clone https://github.com/dsipaint/AMGN.git /tmp/AMGN
#create AMGN jar
mvn package -f "/tmp/AMGN/pom.xml"

AMGN_VERSION="alpha-1.2.0" #CHANGE THE AMGN VERSION AS NEEDED
#add AMGN to classpath
mvn install:install-file -Dfile="/tmp/AMGN/target/AMGN-${AMGN_VERSION}-jar-with-dependencies.jar" -DgroupId=com.github.dsipaint -DartifactId=AMGN -Dversion=$AMGN_VERSION -Dpackaging=jar -DgeneratePom=true

#set up network structure
#if no argument supplied
if [ "$#" -ne 1 ]
then
	    networkname="AMGN-${AMGN_VERSION}"
    else
	        networkname="${1}/${AMGN_VERSION}"
fi
mkdir $networkname
cp "/tmp/AMGN/target/AMGN-${AMGN_VERSION}-jar-with-dependencies.jar" $networkname/
touch "${networkname}/network.yml"
echo "{token: , operators: [475859944101380106]}" | tee "${networkname}/network.yml"
mkdir "${networkname}/plugins"

rm -rf /tmp/AMGN/

echo $networkname has been built out!
