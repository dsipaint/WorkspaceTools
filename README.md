# WorkspaceTools
Scripts and useful shortcuts for my wsl environment

### HOWTO
#### To set up:
clone this repo in your home directory
add the `setup.sh` file to your .bashrc e.g. `source ~/WorkspaceTools/setup.sh`
run `install`

#### To remove this tool completely
run `uninstall`
remove the line you added in .bashrc

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

- `env_vars.sh`
Contains the following environment variables:
    - `windows` is my windows desktop
    - `cdrive` is my c drive
    - `hdrive` is my h drive
    - `zdrive` is my z drive
    - `backslash` is a backslash character because my keyboard doesn't have one (so I can do `echo $backslash` and have one to paste)
    - `pipe` is a pipe character because my keyboard doesn't have one

- `tools.sh`
Contains useful commands:
    - `mvw` moves a file from WSL to my windows desktop
    - `cpw` moves a file from WSL to my windows desktop

- mongodb
run these scripts to setup and use mongodb
  - `install_mongo.sh` installs mongodb
  -  adds the command `start_db` which will start the database
