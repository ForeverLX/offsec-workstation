# Container Profile (Podman rootless) — planned

Goal: a portable operator environment that mounts the workstation directory contract:

- ~/engage
- ~/loot
- ~/notes
- ~/exploitdev
- ~/projects

Principles:
- Rootless by default (no daemon).
- Explicit mounts only (no surprise host access).
- Minimal image surface (no “kitchen sink”).
- Per-engagement optional stacks live under `modules/container/compose/`.

Non-goals:
- Replacing the host workstation.
- Always-on services on the host (Mythic/Dradis should be per-engagement).

Next build steps:
1) Build `offsec-toolbox` image from `modules/container/toolbox/`.
2) Add wrapper script to run toolbox with explicit mounts + sane defaults.
3) Add per-engagement bring-up/tear-down for Mythic + Dradis under `modules/container/compose/`.

