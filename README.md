# WorkspaceTools
Scripts and useful shortcuts for my wsl environment

### HOWTO
#### To set up:
clone this repo in your home directory
add the `setup.sh` file to your .bashrc e.g. `source ~/WorkspaceTools/setup.sh`

#### To remove this tool completely
remove the line you added in .bashrc

# COMMANDS

## Aws
Scripts involving easy AWS management, often involving my personal infra

- `testbox`
Use this command with the arguments:
    - `-c|--create` to create a test ec2 box
    - `-d|--destroy` to destroy the current ec2 test box
    - `-l|--login` to login to the current ec2 test box
    - `-i|--identify` to show current ec2 box IP and status
    - `-t|--toggle` to toggle the box on or off

- `updatetestboxssh`
Use this command to update the ssh keys for the ec2 box, for example if the box has been stopped and started and has a new public IP. This should happen automatically if the testbox commands are used, but the command is offered as a manual failsafe

- `aws_creds`
will make setting aws creds/keys easier
- `ec2_ssh_pass`
(to be used on an ec2 instance itself) will allow password authentication on an AWS EC2 instance, in case you either want to use a password or want to use the VSC ssh editor on the EC2 instance

## Java
Scripts involving configuring java, or projects written for java

- `AMGNdependency`
will add AMGN to the system classpath
- `build_AMGN`
will actually build out AMGN for you
- `jdk17`
Will configure the JDK 17 classpath for you, assuming you have openjdk-17 installed

## Misc
Random scripts I found it hard to categorise

- `aliases.sh`
Contains the following aliases:
    - `twitch` calls ~/twitch-cli_1.1.6_Linux_x86_64/twitch

- `env_vars.sh`
Contains the following environment variables:
    - `windows` is my windows desktop
    - `cdrive` is my c drive
    - `hdrive` is my h drive
    - `zdrive` is my z drive

- `mvw` moves a file from WSL to my windows desktop
- `cpw` moves a file from WSL to my windows desktop

- `upload_blogpost [project name]` lets you upload a directory as a blogpost to my website (if you have my creds)

# ONE-OFF SCRIPTS
There are a couple of scripts that will only ever need to be run once, so they are not included in the setup script and should be manually called. Run these once in your environment, or if you uninstall them:

- `misc/install_twitch.sh`
installs the twitch cli

- `misc/install_mongo.sh`
installs mongodb into your environment
To use mongo, use `systemctl` to manage the `mongod` process. By default mongo uses `/data/db` for its database file storage.
