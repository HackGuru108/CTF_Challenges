# Annual CTF Challenge Suite (2026) — 3-Challenge Track

This repository contains the complete, containerized 3-challenge suite for the 2026 Annual CTF Competition.
All 3 challenges are pre-configured to run isolated in Docker with zero host dependencies.

---

## 🏆 Challenge Matrix & Scoreboard

| # | Challenge Name | Theme / Category | Difficulty | Port | Points | Flag |
| :-: | :--- | :--- | :---: | :---: | :---: | :--- |
| **1** | **PromptShield** | AI Security / LLM Prompt Injection | **Easy** | `8001` | **100** | `CTF{pr0mpt_1nj3ct10n_m4st3r_2026}` |
| **2** | **PixelQuest** | 8-Bit Retro RPG Business Logic Flaw | **Gamified** | `8004` | **175** | `CTF{r3tr0_g4m3_l0g1c_pwn3d_2026}` |
| **3** | **NeuroCaptcha** | 7-Stage Gauntlet & Mirror Cryptography | **Gauntlet** | `8006` | **325** | `CTF{m0d3rn_c4ptch4_tur1ng_r1ddl3_pwn3d_2026}` |

---

## 🚀 Instant 1-Command Startup (Host on Docker)

### Option 1: Universal Docker Compose (Any OS: Linux / Mac / Windows)
Simply navigate to this folder in your terminal and run:
```bash
docker compose up -d --build
```
To stop all challenges:
```bash
docker compose down
```

---

### Option 2: Using Automated Deployment Scripts

#### On Linux / macOS / WSL:
```bash
chmod +x deploy.sh
./deploy.sh up        # Starts all 3 containers
./deploy.sh test      # Runs automated exploit solvers to verify all flags
./deploy.sh down      # Stops all containers
```

#### On Windows (PowerShell):
```powershell
.\deploy.ps1 up       # Starts all 3 containers
.\deploy.ps1 test     # Runs automated exploit solvers to verify all flags
.\deploy.ps1 down     # Stops all containers
```

---

## 🔍 Verifying the Setup

Every challenge includes an automated exploit solver in its `solution/solve.py`. To verify that all 3 services are healthy and flags can be retrieved:
```bash
# On Linux/macOS:
./deploy.sh test

# On Windows:
.\deploy.ps1 test
```

---

## 📂 Included Deliverables

* `CTF_Competition_Master_Walkthrough.docx` — Complete, submission-ready Microsoft Word walkthrough with step-by-step solutions, payloads, screenshots explanations, and remediation guides.
* `CHALLENGES_GUIDE.md` — Detailed scoreboard guide and CTFd-compatible JSON configuration file for 1-click scoreboard import.
* `docker-compose.yml` — Root orchestrator to spin up the 3 containers simultaneously.
* `challenges/` — Full source code, Dockerfiles, and writeups for each challenge.
