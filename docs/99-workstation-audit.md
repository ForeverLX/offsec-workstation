---
title: Offensive Security Workstation Audit
version: 1.0
date: 2026‑01‑18
---

# Offensive Security Workstation Audit

## 📌 Executive Summary

This audit captures the current state of the offensive security workstation, including strengths, weaknesses, and a prioritized improvement plan. It also includes a **tool taxonomy** and an **actionable checklist** that drives the next phases of implementation (e.g., Dradis reporting, Metasploit integration).

## 🧠 A) Strengths

- **Minimal OS Base:** Arch Linux + Sway/TTY reduces attack surface.
- **Productivity Terminal:** Warp Terminal improves CLI workflow efficiency.
- **Documentation‑First:** Markdown audit scripts & reports prioritized.
- **Security Tool Awareness:** Plans for Snyk CLI integration (pending install/config).

## ⚠️ B) Weaknesses

- **No centralized reporting tool** installed yet (e.g., Dradis CE).  
- **Modular exploit framework (Metasploit)** not installed/configured.  
- **Hardening policies** (firewall/kernel/etc.) are not formalized.  
- **Sandboxing workflows** are not yet in place.  
- **Tool taxonomy** needs clear categories.  
- **Snyk CLI** is not yet configured into audit workflows.

## 🛠 C) Tool Taxonomy

| Category | Tool | Installed | Notes |
|----------|------|:---------:|-------|
| Reporting/Collab | [Dradis CE](https://github.com/dradis/dradis-ce) | ❌ | Open‑source pentest reporting framework. :contentReference[oaicite:4]{index=4} |
| Exploit Framework | Metasploit | ❌ | Modular exploitation platform. :contentReference[oaicite:5]{index=5} |
| Reconnaissance | Nmap | ✅ | Core network/service discovery |
| Web Security | Burp Suite | Partial | Installed but workflow integration needed |
| Vulnerability Scanner | Snyk CLI | ❌ | Installed but not configured |
| Protocol Abuse | Impacket/CME | ❌ | Planned next tools |
| Post‑Exploit | Rubeus/GhostPack | ❌ | Planned after core tools |
| Sandbox | Firejail/Containers | ❌ | Planned isolation tooling |
| Hardening | Firewall/auditd | ❌ | Needs documentation & config |

## 🚀 D) Actionable Checklist

### 📊 Reporting & Exploitation
- [ ] Install Dradis CE
- [ ] Install Metasploit Framework
- [ ] Document Metasploit + PostgreSQL setup

### 🔐 Security Hardening
- [ ] Define/Document Firewall Rules
- [ ] Document Kernel Hardening & Sysctl Configs
- [ ] Add auditd policies & logging

### 🧾 Documentation & Taxonomy
- [ ] Populate tool categories (Recon, Enum, Exploit, Post‑Exploit)
- [ ] Link reports into main docs index
- [ ] Add versioning header block above

### 🧪 Sandbox & IDS
- [ ] Add sandbox execution tooling (Firejail, containers)
- [ ] Add monitoring/IDS for lab workflows

## 🧾 E) Snyk CLI Status

- Installed: Yes (present in stack)  
- Configured: ❌ (pending integration)  
- Planned Integration: Weekly audit pipeline with JSON output ingestion

## 📅 F) Implementation Notes

Each checklist item should be committed with an informative message. Example:

```
Add Dradis CE install section to audit + roadmap
```

Good commit messages aid traceability and future onboarding. :contentReference[oaicite:6]{index=6}

---

## 📚 References

- Dradis Community Edition overview and integration reference. :contentReference[oaicite:7]{index=7}  
- Metasploit Framework installation overview. :contentReference[oaicite:8]{index=8}

