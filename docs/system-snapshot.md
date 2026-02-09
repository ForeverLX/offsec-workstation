# System Snapshot History

## 2026-02-07 — Current Reality Snapshot

**Host**
- Hostname: Konoha
- Firmware: Gigabyte B560 DS3H AC-Y1, BIOS F11 (2023-12-19)

**OS / Kernel / Boot**
- Distro: Arch Linux (rolling)
- Kernel: 6.18.7-zen1-1-zen
- Bootloader: GRUB 2.13
- Kernel cmdline: `... quiet nvidia-drm.modeset=1 ...`

**Session (Sway/Wayland)**
- Session type: Wayland
- Sway: 1.11
- WAYLAND_DISPLAY: `wayland-1`

**GPU / NVIDIA**
- GPU: NVIDIA GeForce GTX 1650 (TU117)
- Driver: 590.48.01 (via `nvidia-smi`)
- Kernel driver in use: `nvidia`

**Audio (service health only)**
- pipewire: active (running)
- pipewire-pulse: active
- wireplumber: active

**Installed kernels**
- linux-zen: installed (`/usr/lib/modules/6.18.7-zen1-1-zen`)
- linux-zen-headers: installed

**Pacman cache**
- `/var/cache/pacman/pkg`: ~2.7G
- `paccache`: not installed / not found

**Enabled system services (systemd --system)**
- auditd.service
- iptables.service
- ip6tables.service
- NetworkManager.service
- NetworkManager-dispatcher.service
- systemd-resolved.service
- systemd-timesyncd.service
- nginx.service
- postgresql.service
- nvidia-suspend.service
- nvidia-hibernate.service
- nvidia-resume.service
- nvidia-suspend-then-hibernate.service

**Enabled user services (systemd --user)**
- pipewire.service
- pipewire-pulse.service
- wireplumber.service
- cliphist.service

**Tooling quick status**
- Present: warp-terminal, gh, git, jq, yazi, nuclei, rusthound-ce
- Missing from PATH: resolve (exists at `~/resolve/bin/resolve`), caido, sliver, impacket
- Ghidra: `~/Tools/bin/ghidra` exists; `~/Tools/ghidra_11.4.3_PUBLIC/ghidraRun` missing

