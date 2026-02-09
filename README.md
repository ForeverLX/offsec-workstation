# Arch Sway Offensive Security Workstation


## System Snapshot History

- Latest: `docs/system-snapshot.md` (rolling 3-month retention on GitHub)

## Overview
This repository contains the configuration, tools, and resources for setting up a high-performance, secure, and productive offensive security workstation. Built on Arch Linux with the Sway window manager, it is designed to be the ultimate environment for penetration testing, vulnerability research, and offensive security practices. This repository serves as both a personal reference and a public showcase of the setup that fuels my journey as a self-taught penetration tester.

The workstation focuses on minimalism, performance, and security, with tools tailored for red teaming, penetration testing, and security research.

## Setup Instructions

1. **Clone the Repository:**

    To begin using this setup, clone the repository to your local machine:

    ```bash
    git clone https://github.com/ForeverLX/offsec-workstation.git
    ```

2. **Installation:**

    After cloning, review the scripts directory to install the necessary components and tools for the offensive security workstation:

    ```bash
    cd offsec-workstation
    scripts/
    ```

    **Note**: Setup scripts are being finalized; use the scripts directory as reference for manual steps.

## Key Features

- **Arch Linux**: The base operating system, known for its flexibility, speed, and full control over installed components.
- **Sway**: A Wayland compositor that replaces X11 with a more modern and lightweight display server.
- **Offensive Security Toolchain**: A curated collection of open-source tools for penetration testing, CTFs, and vulnerability research.
- **Automated Audits**: Regular audits for installed packages, services, and disk usage to ensure an optimized and secure environment.
- **Custom Dotfiles**: Configurations for a streamlined, efficient development and security testing environment.

## Offensive Security Tools Inventory

This repository includes a documented offensive security tools inventory to clearly show the core tools I use (with invocation methods and purpose) in offensive security workflows and labs — useful for recruiters and technical reviewers.

See `docs/tools-inventory.md`


## Purpose of this Project

The goal of this project is to create a reproducible, secure, and performant workstation for offensive security tasks. It is built to be:
- **Modular**: Easily extensible with new tools and configurations as needed.
- **Minimal**: Avoiding unnecessary bloat and focusing only on what is required for offensive security.
- **Secure**: Prioritizing privacy, data integrity, and minimal attack surface.
- **Documented**: Well-documented, including detailed explanations of configurations and methodologies, to facilitate understanding and onboarding for peers and potential employers.

This repository will evolve as I continue learning and refining my skills in offensive security, with plans for additional sections such as labs, training, and research findings.

### Lab Methodology Example

```markdown
# AD (Active Directory Red Teaming)

## Purpose
This lab focuses on exploiting and defending Active Directory environments through red teaming exercises. It covers techniques such as enumeration, privilege escalation, and lateral movement.

## Tools Used
- BloodHound
- PowerShell Empire
- Impacket
- Mimikatz

## Methodology
1. **Reconnaissance**: Identify attack paths and potential vulnerabilities in the AD setup.
2. **Exploitation**: Use misconfigurations, weak permissions, or vulnerabilities to escalate privileges.
3. **Persistence**: Implement methods for maintaining access within the AD environment.
4. **Defense**: Learn how to harden Active Directory environments.

## Tools Setup
Instructions for setting up the tools used in this lab can be found in the **Tools/** directory.


## Screenshots & Video

Coming soon: workstation screenshots and a short walkthrough video.

## Repo Layout
- `docs/` — snapshots, audits, and tool inventory
- `scripts/` — helper scripts and manual setup references
- `assets/` — images and media
- `artifacts/` — collected outputs and notes



## Labs & Practice
Lab writeups and challenge artifacts live in the security portfolio repository.

- https://github.com/ForeverLX/security-portfolio
