#!/bin/bash

# Color definitions
GREEN='\033[1;32m'
DARK_GREEN='\033[0;32m'
CYAN='\033[1;36m'
MAGENTA='\033[1;35m'
YELLOW='\033[1;33m'
WHITE='\033[1;37m'
NC='\033[0m'

# --- MATRIX ANIMATION ---
matrix_animation() {
    clear
    CHARS="0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz@#$%&*"
    WIDTH=$(tput cols 2>/dev/null || echo 40)
    
    trap 'echo -e "\n\033[1;32m[+] LAUNCHING ZOHIRE...\033[0m"; sleep 1; return' INT

    echo -e "${GREEN}=== ZOHIRE MATRIX STREAM (Press Ctrl+C to continue) ===${NC}\n"
    sleep 1

    while true; do
        LINE=""
        for ((j=0; j<WIDTH; j++)); do
            CHAR=${CHARS:$((RANDOM % ${#CHARS})):1}
            RAND=$((RANDOM % 5))
            if [ $RAND -eq 0 ]; then
                LINE="${LINE}${GREEN}${CHAR}${NC}"
            elif [ $RAND -eq 1 ]; then
                LINE="${LINE}${DARK_GREEN}${CHAR}${NC}"
            else
                LINE="${LINE} "
            fi
        done
        echo -e "$LINE"
        sleep 0.03
    done
}

# Run matrix stream
matrix_animation

# Reset interrupt handler
trap - INT

# Clear and show main banner
clear
echo -e "${CYAN}====================================================${NC}"
echo -e "${MAGENTA}  ███████╗ ██████╗ ██╗  ██╗██╗██████╗ ███╗   ██╗${NC}"
echo -e "${MAGENTA}  ╚══███╔╝██╔═══██╗██║  ██║██║██╔══██╗████╗  ██║${NC}"
echo -e "${CYAN}    ███╔╝ ██║   ██║███████║██║██████╔╝██╔██╗ ██║${NC}"
echo -e "${CYAN}   ███╔╝  ██║   ██║██╔══██║██║██╔══██╗██║╚██╗██║${NC}"
echo -e "${WHITE}  ███████╗╚██████╔╝██║  ██║██║██║  ██║██║ ╚████║${NC}"
echo -e "${WHITE}  ╚══════╝ ╚═════╝ ╚═╝  ╚═╝╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝${NC}"
echo -e "${CYAN}====================================================${NC}"
echo -e "               ${YELLOW}⚡ MADE BY HATHYM ⚡${NC}"
echo -e "${CYAN}====================================================${NC}"
echo ""

USER=$(whoami)
HOST=$(uname -n)
KERNEL=$(uname -r)
UPTIME=$(uptime -p | sed 's/up //')
STORAGE=$(df -h /data 2>/dev/null | awk 'NR==2 {print $3 " / " $2 " (" $5 " used)"}')

LOCAL_IP=$(ip route get 1.1.1.1 2>/dev/null | awk '{print $7}' || echo "Not Connected")
PUBLIC_IP=$(curl -s --connect-timeout 3 ifconfig.me || echo "Offline")

echo -e "${MAGENTA}┌──[ SYSTEM DETAILS ]${NC}"
echo -e "${CYAN}│${NC} ${WHITE}Developer :${NC} ${YELLOW}hathym${NC}"
echo -e "${CYAN}│${NC} ${WHITE}User      :${NC} $USER@$HOST"
echo -e "${CYAN}│${NC} ${WHITE}Kernel    :${NC} $KERNEL"
echo -e "${CYAN}│${NC} ${WHITE}Uptime    :${NC} $UPTIME"
echo -e "${CYAN}│${NC} ${WHITE}Storage   :${NC} $STORAGE"
echo -e "${MAGENTA}├──[ NETWORK DETAILS ]${NC}"
echo -e "${CYAN}│${NC} ${GREEN}Local IP  :${NC} $LOCAL_IP"
echo -e "${CYAN}│${NC} ${GREEN}Public IP :${NC} $PUBLIC_IP"
echo -e "${MAGENTA}└───────────────────────────────────────────────────${NC}"
echo ""
