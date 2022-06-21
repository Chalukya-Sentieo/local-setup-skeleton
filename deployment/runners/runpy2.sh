#!/bin/sh
COL='\033[1;92m'
NC='\033[0m' # No Color
echo -e "${COL}Pip Install${NC}"
pip install -r requirements.txt
echo -e "${COL}Starting Gunicorn Server${NC}"
gunicorn -b 0.0.0.0 server:app
