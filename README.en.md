# Requirement Agent Dispatch Skill Pack

One-click deployment package containing the `requirement-agent-dispatch` skill and **215 specialized AI agents**.

---

## Overview

The Requirement Agent Dispatch skill is OpenCode's **central orchestrator**:

1. **Requirement Decomposition** — Break down user requests into actionable tasks
2. **Agent Matching** — Match each subtask with the most specialized Agent
3. **Dispatch & Execution** — Support parallel, sequential, hybrid, and orchestrator modes
4. **Validation & Polish** — Collect results, verify quality, and polish via web style research (Step 6)

---

## Agent Category Reference

This package includes **215 Agents** across these domains:

| Category | Count | Coverage |
|----------|-------|----------|
| Product & Project | 6+ | PRD, Sprint planning, project coordination, task breakdown |
| Design & UX | 8+ | UI design, UX research, branding, accessibility, whimsy |
| Frontend | 4+ | Web, mini-program, mobile, rapid prototyping |
| Backend & Architecture | 8+ | System architecture, database, data engineering, embedded, IoT, FPGA |
| AI & Data | 5+ | ML models, data remediation, prompt engineering, voice AI |
| Content & Marketing (CN) | 20+ | Content creation, SEO, Xiaohongshu, Douyin, Zhihu, Bilibili |
| Overseas Social Media | 10+ | LinkedIn, Instagram, TikTok, Twitter, YouTube |
| Testing & Quality | 8+ | API testing, performance, security audit, code review |
| Operations & SRE | 6+ | DevOps, SRE, threat detection, incident response |
| Business & Operations | 15+ | Private domain, cross-border e-commerce, legal, HR, supply chain |
| Gaming & XR | 20+ | Unity, Unreal, Godot, Roblox, XR development |
| Finance & Investment | 8+ | Financial analysis, investment research, tax, risk control |
| Professional Services | 15+ | Healthcare, legal, procurement, logistics |
| Paid Media | 8+ | Google Ads, social ads, programmatic, search query analysis |
| Sales & Business | 10+ | Sales strategy, presales, outbound, proposals |

See all 215 `.md` files under the `agents/` directory for the complete list.

---

## One-Click Deployment

```bash
# After cloning or extracting, simply run:
./deploy.sh
```

The script will automatically:
1. Deploy `SKILL.md` to the OpenCode skills directory
2. Deploy all 215 Agents to the agents directory (skips if already present)
3. Verify deployment integrity

### Manual Deployment

```bash
# macOS / Linux
mkdir -p ~/.config/opencode/skills/requirement-agent-dispatch
cp SKILL.md ~/.config/opencode/skills/requirement-agent-dispatch/
cp agents/*.md ~/.opencode/agents/
```

### Windows (PowerShell)

```powershell
New-Item -ItemType Directory -Force -Path "$env:USERPROFILE\.config\opencode\skills\requirement-agent-dispatch"
Copy-Item "SKILL.md" "$env:USERPROFILE\.config\opencode\skills\requirement-agent-dispatch\"
Copy-Item "agents\*" "$env:USERPROFILE\.opencode\agents\"
```

---

## Usage

After deployment, restart/reload OpenCode and describe your requirements:

> "Build an e-commerce mini-program including requirements analysis, UI design, frontend/backend development, and testing."

The skill will automatically:
1. Decompose the request → match corresponding Agents
2. Dispatch based on dependency (hybrid sequential/parallel)
3. Collect all outputs
4. Search the web for similar content styles and polish the final output

### Dispatch Mode Quick Reference

| Task Complexity | Recommended Mode | Description |
|----------------|-----------------|-------------|
| 1 task | Single Agent | Dispatch one Task with recursive decomposition hint |
| 2-4 independent tasks | Parallel | Dispatch simultaneously |
| Sequential dependencies | Pipeline | Pass output from one to the next |
| Mixed dependencies | Hybrid | Partial parallel + partial sequential |
| 5+ subtasks | Orchestrator | Use Agent Orchestrator for unified management |

---

## Agent Matching Principles

- **Greedy Granularity Matching** — Match each subdomain to its most specialized Agent; never use a generic one when a specialist exists
- **Mandatory Step 6** — All human-facing output must go through web style research and polishing
- **Recursive Dispatch** — Even single tasks hint agents to further decompose

---

## Key Files

| File | Description |
|------|-------------|
| `SKILL.md` | Core skill definition with full dispatch workflow and 300+ scenario-to-agent mappings |
| `deploy.sh` | One-click deployment script (Linux/macOS) |
| `agents/*.md` | 215 dispatchable specialized AI agents |
