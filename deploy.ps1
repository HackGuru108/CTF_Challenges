# Master CTF Challenge Suite Deployment & Test Script
# Annual CTF Competition — 3 Selected Challenges Track
# (PromptShield, PixelQuest, NeuroCaptcha)

param (
    [string]$Action = "menu"
)

function Check-Docker {
    $check = docker ps 2>&1
    if ($LASTEXITCODE -ne 0) {
        Write-Host "[!] Docker daemon is not running." -ForegroundColor Red
        Write-Host "    Please ensure Docker Desktop is open and WSL 2 is enabled." -ForegroundColor Red
        return $false
    }
    return $true
}

function Start-AllChallenges {
    Write-Host "[*] Launching all 3 CTF Challenges..." -ForegroundColor Cyan

    Write-Host "`n[1/3] Starting 01-easy-promptshield (Port 8001)..." -ForegroundColor Yellow
    Set-Location "$PSScriptRoot\challenges\01-easy-promptshield"
    docker compose up -d --build

    Write-Host "`n[2/3] Starting 04-game-pixelquest (Port 8004)..." -ForegroundColor Yellow
    Set-Location "$PSScriptRoot\challenges\04-game-pixelquest"
    docker compose up -d --build

    Write-Host "`n[3/3] Starting 06-game-neurocaptcha (Port 8006)..." -ForegroundColor Yellow
    Set-Location "$PSScriptRoot\challenges\06-game-neurocaptcha"
    docker compose up -d --build

    Set-Location "$PSScriptRoot"
    Write-Host "`n========================================================" -ForegroundColor Green
    Write-Host " [+] ALL 3 CHALLENGES ARE RUNNING SUCCESSFULLY!" -ForegroundColor Green
    Write-Host "========================================================" -ForegroundColor Green
    Write-Host "  1. [Easy]       PromptShield : http://localhost:8001" -ForegroundColor Cyan
    Write-Host "  2. [Gamified]   PixelQuest   : http://localhost:8004" -ForegroundColor Cyan
    Write-Host "  3. [Gauntlet]   NeuroCaptcha : http://localhost:8006" -ForegroundColor Cyan
    Write-Host "========================================================`n" -ForegroundColor Green
}

function Stop-AllChallenges {
    Write-Host "[*] Stopping challenge containers..." -ForegroundColor Yellow
    docker compose -f "$PSScriptRoot\challenges\01-easy-promptshield\docker-compose.yml" down 2>$null
    docker compose -f "$PSScriptRoot\challenges\04-game-pixelquest\docker-compose.yml" down 2>$null
    docker compose -f "$PSScriptRoot\challenges\06-game-neurocaptcha\docker-compose.yml" down 2>$null
    Write-Host "[+] Containers stopped cleanly." -ForegroundColor Green
}

function Run-Solvers {
    Write-Host "[*] Running automated exploit verification solvers..." -ForegroundColor Cyan
    
    Write-Host "`n--- Testing Challenge 1 (PromptShield - Port 8001) ---" -ForegroundColor Yellow
    python "$PSScriptRoot\challenges\01-easy-promptshield\solution\solve.py"

    Write-Host "`n--- Testing Challenge 2 (PixelQuest - Port 8004) ---" -ForegroundColor Yellow
    python "$PSScriptRoot\challenges\04-game-pixelquest\solution\solve.py"

    Write-Host "`n--- Testing Challenge 3 (NeuroCaptcha - Port 8006) ---" -ForegroundColor Yellow
    python "$PSScriptRoot\challenges\06-game-neurocaptcha\solution\solve.py"
}

# Main Menu
if ($Action -eq "up" -or $Action -eq "start") {
    if (Check-Docker) { Start-AllChallenges }
} elseif ($Action -eq "down" -or $Action -eq "stop") {
    Stop-AllChallenges
} elseif ($Action -eq "test" -or $Action -eq "solve") {
    Run-Solvers
} else {
    Write-Host "=========================================================" -ForegroundColor Magenta
    Write-Host "           ANNUAL CTF CHALLENGES DEPLOYER                " -ForegroundColor Magenta
    Write-Host "=========================================================" -ForegroundColor Magenta
    Write-Host " 1) Start All Challenges (1-3)"
    Write-Host " 2) Stop All Challenges"
    Write-Host " 3) Run Automated Exploit Solvers (Verify flags)"
    Write-Host " 4) Check Status (docker ps)"
    Write-Host " Q) Quit"
    Write-Host ""
    $choice = Read-Host "Select option (1-4 or Q)"
    
    switch ($choice) {
        "1" { if (Check-Docker) { Start-AllChallenges } }
        "2" { Stop-AllChallenges }
        "3" { Run-Solvers }
        "4" { docker ps }
        Default { Write-Host "Exiting." }
    }
}
