#!/bin/bash

#move files easily from WSL to windows desktop
function mvw()
{
    mv $1 /mnt/c/Users/finla/OneDrive/Desktop
}

#move files easily from WSL to windows desktop
function cpw()
{
    cp $1 /mnt/c/Users/finla/OneDrive/Desktop
}