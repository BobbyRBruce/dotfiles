# MEMORY.md - Long-Term Memory

## People
- **Bobby** — you.

## Assistant Identity
- **Name:** Computer
- **Vibe:** calm + competent

## Preferences
- Keep responses calm, competent, and low on filler.

## gem5 Workflow (local + CI)
- Local repo lives at `~/Workspaces/gem5`.
- Typical local build: `scons build/ALL/gem5.opt -j$(nproc)` (build all ISAs/protocols into the `.opt` binary). If incremental builds get weird, delete `build/` and rebuild from scratch.
- Typical run: `./build/ALL/gem5.opt <path to config file>`.
- Pre-commit git hooks should be enabled; hook installer script is `util/pre-commit-install.sh` (Bobby may refer to it as “utils”). Always run it after a fresh clone; ensure hooks actually run on commit.
- Remotes: `origin` is Bobby’s fork (`https://github.com/bobbyrbruce/gem5` / `git@github.com:BobbyRBruce/gem5.git`), `upstream` is `https://github.com/gem5/gem5.git`.
- Work off `upstream/develop`; PRs target `gem5/gem5:develop`.
- Build command convention on Bobby’s Mac: `scons build/ALL/gem5.opt -j$(nproc)` (Homebrew `nproc` is installed; keep the command consistent across machines rather than branching).
- Commit message rules: subject line must start with an allowed tag from `MAINTAINERS.yaml`; commit-msg hook enforces max header length 65 chars (Bobby prefers aiming for ~62 chars). Tags largely map to directory structure (e.g., `util-docker` ↔ `util/dockerfiles`, `mem-cache` ↔ `src/mem/cache`). When in doubt, look at common practice: `git log --oneline -- <path>` and mirror the prevalent tag usage.
- Testing expectations: CI workflows run on every PR and are merge-blocking on failure; Daily/Weekly workflows run on `develop` (Daily can take ~12h; Weekly can take ~2–3 days) and should ideally stay green.
- DRAMSys Daily test is defined in `.github/workflows/daily-tests.yaml` and runs three example configs:
  - `configs/example/gem5_library/dramsys/arm-hello-dramsys.py`
  - `configs/example/gem5_library/dramsys/dramsys-traffic.py`
  - `configs/example/dramsys.py`
- If CI logs are needed, prefer the Chrome **Clawdbot Browser Relay** extension to access authenticated GitHub Actions logs.
- PR flow:
  - create a topic branch from `upstream/develop`
  - commit with gem5-style subject prefix (e.g., `mem:`) and descriptive body
  - push branch to `origin` (BobbyRBruce fork)
  - open PR to `gem5/gem5:develop` via `gh pr create --repo gem5/gem5 --base develop --head BobbyRBruce:<branch>`
