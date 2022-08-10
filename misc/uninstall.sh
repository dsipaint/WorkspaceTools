#!/bin/bash

#REMOVES ALL EXTERNAL TOOLS NEEDED FOR THIS REPO
function uninstall()
{
    #remove twitch CLI
    echo "Uninstalling Twitch CLI..."
    rm -rf ~/twitch-cli_1.1.6_Linux_x86_64.*


    echo "All external tools uninstalled."
}