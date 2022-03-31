#!/bin/bash
cp /mnt/h/javaclasses/libs/AMGN/AMGN.jar ./src/main/resources/ #this is the temporary location until I have proper releases for AMGN
mvn install:install-file -Dfile=./src/main/resources/AMGN.jar -DgroupId=com.github.dsipaint -DartifactId=AMGN -Dversion=0.0.1-SNAPSHOT -Dpackaging=jar -DgeneratePom=true