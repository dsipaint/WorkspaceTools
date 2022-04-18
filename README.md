# WorkspaceTools
Scripts and useful shortcuts for my wsl environment

### HOWTO
for now, these scripts are standalone and you must call the script to use it. Down the line, I will use a script to set these scripts up as actual commands, and a Makefile to allow certain packages to be installed.
In time, `setup.sh` setup these commands, but for now, it is blank.

## Java
Scripts involving configuring java, or projects written for java

- `AMGNdependencyresolve.sh`
Will add the latest build of AMGN to your system's classpath

- `build_AMGN.sh`
Will build the latest version of AMGN for you in the directory format it needs to run as an executable, ready for use

- `jdk17.sh`
Will configure the JDK 17 classpath for you, assuming you have openjdk-17 installed

## Misc
Random scripts I found it hard to categorise

- `aws_creds.sh`
Will ask for your AWS CLI keys so you don't have to set the environment variables yourself
