#!/usr/bin/bash
#script to actually build out owen's bot

rm -rf /tmp/AMGN/
rm -rf /tmp/JuiceBot/

#get AMGN code from web
git clone https://github.com/dsipaint/AMGN.git /tmp/AMGN
#create AMGN jar
mvn package -f "/tmp/AMGN/pom.xml"

AMGN_VERSION="alpha-1.2.0" #CHANGE THE AMGN VERSION AS NEEDED
#add AMGN to classpath
mvn install:install-file -Dfile="/tmp/AMGN/target/AMGN-${AMGN_VERSION}-jar-with-dependencies.jar" -DgroupId=com.github.dsipaint -DartifactId=AMGN -Dversion=$AMGN_VERSION -Dpackaging=jar -DgeneratePom=true

#set up network structure
networkname="AMGN-${AMGN_VERSION}"
mkdir $networkname
cp "/tmp/AMGN/target/AMGN-${AMGN_VERSION}-jar-with-dependencies.jar" $networkname/
touch "${networkname}/network.yml"
echo "{token: , operators: [475859944101380106]}" | tee "${networkname}/network.yml"
mkdir "${networkname}/plugins"

#fetch code for Juice Machine
git clone https://github.com/dsipaint/JuiceBot.git /tmp/JuiceBot

#build out the Juice Machine plugins
mvn package -f "/tmp/JuiceBot/juicebot/modessentials/pom.xml"
mvn package -f "/tmp/JuiceBot/juicebot/antispam/pom.xml"
mvn package -f "/tmp/JuiceBot/juicebot/serverstats/pom.xml"
mvn package -f "/tmp/JuiceBot/juicebot/welcoming/pom.xml"

cp /tmp/JuiceBot/juicebot/modessentials/target/*.jar $networkname/plugins/
cp /tmp/JuiceBot/juicebot/antispam/target/*.jar $networkname/plugins/
cp /tmp/JuiceBot/juicebot/serverstats/target/*.jar $networkname/plugins/
cp /tmp/JuiceBot/juicebot/welcoming/target/*.jar $networkname/plugins/

rm -rf /tmp/AMGN/
rm -rf /tmp/JuiceBot

echo $networkname has been built out!
