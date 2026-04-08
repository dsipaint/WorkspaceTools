#!/bin/bash

# Take anything inside a particular folder and upload it as a blogpost
function upload_blogpost() {
    # First sanitise/sanity-check the use of this command.
    # blogposts need to at least have an index.html
    if ! [[ $(ls) =~ ^index\.html|[[:space:]]+index\.html ]] ; then
        echo "All blogposts must contain an index.html"
        return 0
    fi

    # must provide a project to upload the blogpost TO
    if [ -z "$1" ]; then
        echo "Must provide a project to upload the blogpost to"
        return 0
    fi

    BLOGPOSTS_LOCATION="finlaywoolfson.com/projects/blogposts/"

    # Check if this project name  already exists or not
    PROJECTS=$(aws s3 ls $BLOGPOSTS_LOCATION)
    if [[ $PROJECTS != *"PRE $1/"* ]] ; then
        echo $1 is not currently a project that exists on the website. Here are the current projects:
        echo
        echo $PROJECTS
        echo
        echo "Do you wish to proceed with a new project? y/n"
        read CONTINUE
        if [[ $CONTINUE != 'y' ]]; then
            echo "Aborting upload"
            return 0
        fi
    fi


    # Confirm blogpost upload
    echo "You are about to upload the following as a new blogpost:"
    ls
    echo "Continue with upload? y/n"
    read CONTINUE

    if [[ $CONTINUE != 'y' ]]; then
        echo "Aborting upload"
        return 0
    fi

    # upload directory as a new blogpost
    uploadtime=$(date '+%Y-%m-%d_%H:%M:%S')
    aws s3 cp . s3://$BLOGPOSTS_LOCATION$1/$uploadtime --recursive
}