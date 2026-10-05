#!/usr/bin/env bash
# Master CTF Challenge Suite Deployment & Test Script
# Annual CTF Competition — 3 Selected Challenges Track
# (PromptShield, PixelQuest, NeuroCaptcha)

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd "$DIR"

ACTION="${1:-menu}"

check_docker() {
    if ! docker info >/dev/null 2>&1; then
        echo -e "\033[0;31m[!] Docker daemon is not running.\033[0m"
        echo "    Please ensure Docker is installed and running."
        exit 1
    fi
}

start_all() {
    check_docker
    echo -e "\033[0;36m[*] Launching all 3 CTF Challenges via Docker Compose...\033[0m"
    docker compose up -d --build
    echo ""
    echo -e "\033[0;32m========================================================\033[0m"
    echo -e "\033[0;32m [+] ALL 3 CHALLENGES ARE RUNNING SUCCESSFULLY!         \033[0m"
    echo -e "\033[0;32m========================================================\033[0m"
    echo -e "  1. [Easy]       PromptShield : \033[0;36mhttp://localhost:8001\033[0m"
    echo -e "  2. [Gamified]   PixelQuest   : \033[0;36mhttp://localhost:8004\033[0m"
    echo -e "  3. [Gauntlet]   NeuroCaptcha : \033[0;36mhttp://localhost:8006\033[0m"
    echo -e "\033[0;32m========================================================\033[0m"
}

stop_all() {
    echo -e "\033[1;33m[*] Stopping challenge containers...\033[0m"
    docker compose down
    echo -e "\033[0;32m[+] Containers stopped cleanly.\033[0m"
}

run_solvers() {
    echo -e "\033[0;36m[*] Running automated exploit verification solvers...\033[0m"
    
    echo -e "\n\033[1;33m--- Testing Challenge 1 (PromptShield - Port 8001) ---\033[0m"
    python3 "$DIR/challenges/01-easy-promptshield/solution/solve.py"

    echo -e "\n\033[1;33m--- Testing Challenge 2 (PixelQuest - Port 8004) ---\033[0m"
    python3 "$DIR/challenges/04-game-pixelquest/solution/solve.py"

    echo -e "\n\033[1;33m--- Testing Challenge 3 (NeuroCaptcha - Port 8006) ---\033[0m"
    python3 "$DIR/challenges/06-game-neurocaptcha/solution/solve.py"
}

case "$ACTION" in
    up|start)
        start_all
        ;;
    down|stop)
        stop_all
        ;;
    test|solve)
        run_solvers
        ;;
    status)
        docker compose ps
        ;;
    *)
        echo -e "\033[0;35m=========================================================\033[0m"
        echo -e "\033[0;35m           ANNUAL CTF CHALLENGES DEPLOYER                \033[0m"
        echo -e "\033[0;35m=========================================================\033[0m"
        echo " 1) Start All Challenges (1-3)"
        echo " 2) Stop All Challenges"
        echo " 3) Run Automated Exploit Solvers (Verify flags)"
        echo " 4) Check Status (docker compose ps)"
        echo " Q) Quit"
        echo ""
        read -p "Select option (1-4 or Q): " choice
        case "$choice" in
            1) start_all ;;
            2) stop_all ;;
            3) run_solvers ;;
            4) docker compose ps ;;
            *) echo "Exiting." ;;
        esac
        ;;
esac
