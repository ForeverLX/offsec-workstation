# Roadmap

This roadmap tracks the evolution of offsec-workstation from reproducible host setup
to a production-grade Red Team operator environment.

## Phase 1 — Foundation (COMPLETE)

- Profile-driven installer
- Deterministic tmux layouts
- Directory contract (engage/loot/notes/exploitdev/projects)
- Minimal Neovim Red Team IDE (Telescope + rg/fd)
- Locked decision documentation

## Phase 2 — Workflow Hardening (CURRENT)

- Refine manifests (base vs solo vs team)
- Remove accidental bloat
- Improve tmux ergonomics
- Harden permissions for loot handling
- Audit enabled services for minimal surface

## Phase 3 — NightOwl Integration (Deterministic)

- Optional NightOwl dev harness integration (paths + tmux layout)
- Standard run directory mapping: ~/engage/nightowl/runs
- Evidence bundle contract (folder layout + required files)
- Orchestration: n8n self-hosted via Docker Compose (local-first, pinned versions)

## Phase 4 — AI-VM Profile (Agentic)

- OpenClaw is introduced ONLY here (VM profile), sandboxed and opt-in
- Skills/tools: allowlist-only; no marketplace installs by default
- Strict mounts + explicit operator approval for any host access

## Phase 5 — Container Artifact

- Build reproducible container operator environment (team-portable)
- Wrapper script for mounting:
  - ~/engage
  - ~/loot
  - ~/notes
  - ~/exploitdev
- Team-operator portable deployment

## Phase 6 — archiso Build

- Convert profiles → archiso profile
- Minimal ISO build
- Solo + Team flavors
