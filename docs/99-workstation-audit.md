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
- **Modular exploit framework (Metasploit)** not configured into workflow.  
- **Hardening policies** (firewall/kernel/etc.) are not formalized.  
- **Sandboxing workflows** are not yet in place.  
- **Tool taxonomy** needs clear categories.  
- **Snyk CLI** is not yet configured into audit workflows.

## 🛠 C) Tool Taxonomy

| Category | Tool | Installed | Notes |
|----------|------|:---------:|-------|
| Reporting/Collab | [Dradis CE](https://github.com/dradis/dradis-ce) | ❌ | Open‑source pentest reporting framework. |
| Exploit Framework | Metasploit | ✅ | `msfconsole`, `msfvenom` present |
| Reconnaissance | Nmap / Masscan | ✅ | Core network/service discovery |
| Web Security | Gobuster | ✅ | Directory and content discovery |
| Vulnerability Scanner | Snyk CLI | ❌ | Planned install + integration |
| Protocol Abuse | Impacket/CME | ❌ | Planned next tools |
| Post‑Exploit | Rubeus/GhostPack | ❌ | Planned after core tools |
| Sandbox | Firejail/Containers | ❌ | Planned isolation tooling |
| Hardening | Firewall/auditd | ⚠️ | Services present; policy docs pending |

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

- Installed: ❌ (planned)  
- Configured: ❌ (pending integration)  
- Planned Integration: Weekly audit pipeline with JSON output ingestion

## 📅 F) Implementation Notes

Each checklist item should be committed with an informative message. Example:

```
Add Dradis CE install section to audit + roadmap
```

Good commit messages aid traceability and future onboarding.

---

## 📚 References

- Dradis Community Edition overview and integration reference.  
- Metasploit Framework installation overview.
