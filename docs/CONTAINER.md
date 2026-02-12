# Container Profile Plan (custom Exegol-style)

Goal: provide a portable operator environment that is:
- reproducible
- local-first by default
- explicit about mounts + permissions
- compatible with the workstation directory contract

## Non-goals
- Not a full distro replacement (yet)
- Not a kitchen-sink image
- No hidden auto-mounts or implicit host access

## Directory contract (host-mounted)
Mount these into the container:
- ~/engage
- ~/loot
- ~/notes
- ~/exploitdev

Policy:
- default mounts are read-write except `~/loot` which should support a read-only mode for safer triage.

## Execution model
Two modes:
1) Solo operator (local): container runs locally, no external services required.
2) Team operator (portable): same container image + wrapper script for consistent mounts.

## Wrapper script responsibilities
- verify required host directories exist
- set safe permissions expectations (warn, don’t mutate unless asked)
- run container with explicit mounts only
- support profiles (minimal vs extended tools)

## Image principles
- base image should be stable and minimal
- version pinning required (tag + digest later)

## Security posture
- no privileged container by default
- no host network by default (opt-in)
- allowlist mounts only
