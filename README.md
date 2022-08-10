# WorkspaceTools
Scripts and useful shortcuts for my wsl environment

### HOWTO


## Java
Scripts involving configuring java, or projects written for java

- `AMGN.sh`
Contains 2 commands
    - `AMGNdependency` will add AMGN to the system classpath
    - `build_AMGN` will actually build out AMGN for you

- `jdk17.sh`
Will configure the JDK 17 classpath for you, assuming you have openjdk-17 installed

## Misc
Random scripts I found it hard to categorise

- `aws.sh`
Contains 2 commands
    - `aws_creds` will make setting aws creds easier
    - `aws_ssh_pass` will allow password authentication on an AWS EC2 instance, in case you either want to use a password or want to use the VSC ssh editor on the EC2 instance

- `aliases.sh`
Contains the following aliases:
    - `twitch` calls ~/twitch-cli_1.1.6_Linux_x86_64/twitch

- `tools.sh`
Contains useful commands:
    - `publicise` moves a file from WSL to my windows desktop
