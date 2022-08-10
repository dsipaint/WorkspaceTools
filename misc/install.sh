#!/bin/bash

#INSTALLS ALL EXTERNAL TOOLS NEEDED FOR THIS REPO
function install()
{
    #install twitch CLI
    echo "Installing Twitch CLI..."
    wget https://github.com/twitchdev/twitch-cli/releases/download/v1.1.6/twitch-cli_1.1.6_Linux_x86_64.tar.gz -P ~
    tar -xf ~/twitch-cli_1.1.6_Linux_x86_64.tar.gz


    echo "All external tools installed."
}