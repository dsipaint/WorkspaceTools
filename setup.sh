#!/bin/bash

#move out of system32 for wsl
cd

#load scripts
source ~/WorkspaceTools/java/AMGN.sh
source ~/WorkspaceTools/java/jdk17.sh

source ~/WorkspaceTools/misc/aliases.sh
source ~/WorkspaceTools/misc/aws.sh
source ~/WorkspaceTools/misc/env_vars.sh
source ~/WorkspaceTools/misc/tools.sh
source ~/WorkspaceTools/misc/mongodb/start_db.sh


#add cool ascii art B)
RED='\033[0;31m'
echo -e "${RED}.__          __ /\        .__                   __   ._."
echo "|  |   _____/  |)/ ______ |  |__ _____    ____ |  | _| |"
echo "|  | _/ __ \   __\/  ___/ |  |  \\__  \ _/ ___\|  |/ / |"
echo "|  |_\  ___/|  |  \___ \  |   Y  \/ __ \\  \___|    < \|"
echo "|____/\___  >__| /____  > |___|  (____  /\___  >__|_ \__"
echo "          \/          \/       \/     \/     \/     \/\/"
