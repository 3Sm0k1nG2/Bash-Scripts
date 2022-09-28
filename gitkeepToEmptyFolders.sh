#!/bin/bash

# COLORS
GREEN='\033[0;32m'
L_GREEN='\033[1;32m'
NC='\033[0m'

# COMMAND
find */ -empty -type d -printf "Added .gitkeep file -> ${GREEN}%p/${L_GREEN}.gitkeep${NC} \n"  -exec touch {}/.gitkeep  \;