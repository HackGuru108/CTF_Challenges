# Annual CTF Competition — 3-Challenge Track Developer Package

This package contains **3 complete, containerized challenges** across AI security, gamified RPG logic flaws, and an advanced 7-stage sentience gauntlet with secure code review and classical mirror cryptography.

---

## 🏆 Challenge Scoreboard & Matrix

| # | Challenge Name | Difficulty | Category | Target Port | Points | Flag |
| :-: | :--- | :---: | :--- | :---: | :---: | :--- |
| **1** | [**`PromptShield`**](file:///d:/CTF/challenges/01-easy-promptshield) | **Easy** | Web / AI Security (OWASP LLM) | `http://<IP>:8001` | **100** | `CTF{pr0mpt_1nj3ct10n_m4st3r_2026}` |
| **2** | [**`PixelQuest`**](file:///d:/CTF/challenges/04-game-pixelquest) | **Gamified** | Gamified Web / Logic Flaw | `http://<IP>:8004` | **175** | `CTF{r3tr0_g4m3_l0g1c_pwn3d_2026}` |
| **3** | [**`NeuroCaptcha`**](file:///d:/CTF/challenges/06-game-neurocaptcha) | **Hard / Gauntlet** | Multi-Stage Gauntlet & Crypto | `http://<IP>:8006` | **325** | `CTF{m0d3rn_c4ptch4_tur1ng_r1ddl3_pwn3d_2026}` |

---

## 🚀 Quick Deployment Instructions

### Start All 3 Challenges:
```bash
# Universal (Linux / Mac / Windows):
docker compose up -d --build

# Or using scripts:
./deploy.sh up        # Linux/macOS
.\deploy.ps1 up       # Windows PowerShell
```

### Verify Automated Exploit Solvers:
```bash
./deploy.sh test      # Linux/macOS
.\deploy.ps1 test     # Windows PowerShell
```

---

## 📋 CTFd Import JSON Configuration

You can paste this directly into CTFd:

```json
[
  {
    "name": "PromptShield",
    "category": "Web / AI",
    "value": 100,
    "state": "visible",
    "type": "standard",
    "flags": [{"type": "static", "content": "CTF{pr0mpt_1nj3ct10n_m4st3r_2026}"}]
  },
  {
    "name": "PixelQuest",
    "category": "Gamified Web",
    "value": 175,
    "state": "visible",
    "type": "standard",
    "flags": [{"type": "static", "content": "CTF{r3tr0_g4m3_l0g1c_pwn3d_2026}"}]
  },
  {
    "name": "NeuroCaptcha v4.0",
    "category": "Gamified / Crypto",
    "value": 325,
    "state": "visible",
    "type": "standard",
    "flags": [{"type": "static", "content": "CTF{m0d3rn_c4ptch4_tur1ng_r1ddl3_pwn3d_2026}"}]
  }
]
```
