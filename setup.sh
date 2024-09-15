#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

#move out of system32 for wsl
cd

#load scripts
source $SCRIPT_DIR/java/AMGN.sh
source $SCRIPT_DIR/java/jdk17.sh

source $SCRIPT_DIR/misc/aliases.sh
source $SCRIPT_DIR/misc/aws.sh
source $SCRIPT_DIR/misc/env_vars.sh
source $SCRIPT_DIR/misc/tools.sh
source $SCRIPT_DIR/misc/mongodb/start_db.sh


#add cool ascii art B)
RED='\033[0;31m'
echo -e "${RED}.__          __ /\        .__                   __   ._."
echo "|  |   _____/  |)/ ______ |  |__ _____    ____ |  | _| |"
echo "|  | _/ __ \   __\/  ___/ |  |  \\__  \ _/ ___\|  |/ / |"
echo "|  |_\  ___/|  |  \___ \  |   Y  \/ __ \\  \___|    < \|"
echo "|____/\___  >__| /____  > |___|  (____  /\___  >__|_ \__"
echo "          \/          \/       \/     \/     \/     \/\/"
