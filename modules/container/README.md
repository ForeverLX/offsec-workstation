# Container Profile (planned)

Goal: a portable operator environment that mounts the workstation directory contract:
- ~/engage
- ~/loot
- ~/notes
- ~/exploitdev

This will be an optional component after:
- profiles/manifests stabilize
- NightOwl paths stabilize

Design intent:
- local-first by default
- explicit mounts only
- minimal image surface (no “kitchen sink”)
