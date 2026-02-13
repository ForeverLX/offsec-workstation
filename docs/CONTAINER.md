# Container Profile Plan (custom Exegol-style)

Goal: a portable operator environment that is **reproducible**, **local-first**, and **explicit**
about host access—built for the workstation directory contract.

## Non-goals
- Not a full distro replacement
- Not a kitchen-sink image
- No implicit host access (no surprise mounts, no hidden “helpful” shortcuts)

## Execution model
Two modes:

1) **Solo operator (local)**
- rootless Podman
- runs locally
- minimal image surface
- no external services required

2) **Team operator (portable)**
- same image + wrapper script
- consistent mounts + working directories
- optional per-engagement stacks (Mythic/Dradis) are brought up only when needed

## Directory contract (host-mounted)
Default mounts into the container:

- `~/engage`
- `~/loot`
- `~/notes`
- `~/exploitdev`
- `~/projects`

Policy:
- mounts are **explicit** and **narrow**
- provide a **read-only** mode for `~/loot` for safer triage
- never mount `$HOME` or `/` as a convenience

## Wrapper script responsibilities
The wrapper is the “safety gate”:

- verify required directories exist (idempotent, no destructive behavior)
- run with explicit mounts only
- default to rootless + no privileged mode
- optionally enable:
  - read-only loot triage
  - host networking (only when explicitly requested)

## Image principles
- stable, minimal base
- pinned versions (tag now; digest pinning later)
- don’t install “everything”; install what the workflow needs

## Per-engagement options (not always-on)
These are **engagement tools**, not baseline workstation services:

- Mythic (optional, per engagement)
- Dradis (optional, per engagement)

Bring-up/tear-down should be scripted and predictable.

