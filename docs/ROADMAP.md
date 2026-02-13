# Roadmap

This roadmap tracks the evolution of offsec-workstation from a reproducible host setup
to a production-grade Red Team operator environment.

## Phase 1 — Foundation (COMPLETE)
- Profile-driven installer
- Deterministic tmux layouts
- Directory contract (engage/loot/notes/exploitdev/projects)
- Minimal Neovim IDE (Telescope + rg/fd)
- Locked decision documentation

## Phase 2 — Workflow Hardening (CURRENT)
- Refine manifests (base vs solo vs team)
- Remove accidental bloat
- Improve tmux ergonomics
- Harden loot handling (permissions + safe defaults)
- Audit enabled services for minimal surface

## Phase 3 — Performance + Package Audit (NEXT)
Goal: reduce package count (target: stay <900 if possible) without sacrificing operator workflow.

- Export full package inventory + classify (core / workflow / optional / remove)
- Remove overlaps (duplicate tools with the same job)
- Measure boot + session performance (track deltas)
- Record decisions in docs/performance + docs/DECISIONS

## Phase 4 — Container Profile Architecture (Podman rootless)
- Rootless Podman baseline (no daemon)
- Minimal “offsec-toolbox” image (explicit mounts only)
- Wrapper scripts enforce directory contract mounts:
  - ~/engage
  - ~/loot
  - ~/notes
  - ~/exploitdev
  - ~/projects
- Per-engagement bring-up/tear-down:
  - Mythic (optional)
  - Dradis (optional)

## Phase 5 — AI-VM Profile (Agentic, opt-in)
- OpenClaw introduced ONLY here (VM profile), sandboxed and opt-in
- Allowlist-only tools; no marketplace installs by default
- Strict mounts + explicit operator approval for host access

## Phase 6 — archiso Build
- Convert profiles → archiso profile
- Minimal ISO build
- Solo + Team flavors

