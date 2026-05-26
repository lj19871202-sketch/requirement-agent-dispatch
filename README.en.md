# requirement-agent-dispatch

A requirement analysis and agent dispatch skill for [opencode](https://opencode.ai) — breaks down user requirements into actionable tasks and dispatches them to specialized agents.

Built-in mapping of 150+ professional agent scenarios, supporting 5 dispatch modes: single-agent, parallel, pipeline (serial), hybrid, and orchestrator.

## Installation

### Prerequisites

- [opencode](https://opencode.ai) CLI installed
- opencode >= 0.1.0

### Option 1: One-Click Deploy (Recommended)

Clone the repository and run the deployment script:

```bash
git clone https://github.com/lj19871202-sketch/requirement-agent-dispatch.git
cd requirement-agent-dispatch
chmod +x deploy.sh
./deploy.sh
```

The script automatically:

1. Detects `~/.agents/skills/` and deploys `SKILL.md` to `~/.agents/skills/requirement-agent-dispatch/`
2. Detects `~/.opencode/agents/` and copies `agents/*.md` to the global agent directory
3. Verifies the deployment

### Option 2: Manual Deploy

```bash
# Deploy skill
mkdir -p ~/.agents/skills/requirement-agent-dispatch
cp SKILL.md ~/.agents/skills/requirement-agent-dispatch/

# Deploy agents (if agents directory exists)
if [ -d "agents" ]; then
  mkdir -p ~/.opencode/agents
  cp agents/*.md ~/.opencode/agents/
fi
```

### Verify Installation

```bash
# Check skill files
ls ~/.agents/skills/requirement-agent-dispatch/
# Expected: README.md  SKILL.md

# Check agents deployed
ls ~/.opencode/agents/*.md | wc -l

# Reload opencode and list skills
opencode skills list
# Should include: requirement-agent-dispatch
```

## Usage

In an opencode session, when the user presents a requirement that needs multi-step execution, the system automatically detects and prompts to load this skill.

You can also trigger it manually by describing your task requirements in the conversation.

## Hard Rule

**You MUST call the `Task` tool after loading this skill.** Never perform professional operations yourself. The only exception is when you have iterated through all agents and confirmed no match.

## Workflow

1. **Requirement Analysis** → 2. **Task Decomposition** → 3. **Agent Matching** → 4. **Dispatch Execution** → 5. **Result Verification** → 6. **Internet Style Research & Polish**

## Pre-flight Check (Mandatory)

After loading the skill, output a JSON check result containing `user_requirement`, `domain_analysis`, `decision` (dispatch mode), `dispatch_plan`, and `step_6_polishing`.

## Five Dispatch Modes

| Mode | When to Use | Description |
|------|-------------|-------------|
| Single-Agent | Single domain, clear scope | Dispatch one Task with recursive decomposition instruction |
| Parallel | Multiple independent tasks | Fire multiple Tasks simultaneously with no dependencies |
| Pipeline (Serial) | Tasks with sequential dependencies | Chain outputs from one Task to the next |
| Hybrid | Complex requirements | Mix parallel and serial stages |
| Orchestrator | 5+ subtasks | Use the "Agent Orchestrator" as the top-level dispatcher |

## Granularity Rule

Specialized agents take precedence over general-purpose agents. For each sub-domain, you must find the best-matching specialized agent from the full agent list. Never use a general agent when a specialized one is available.

## Step 6 (Mandatory): Internet Style Research & Polish

All human-readable text outputs must go through:
1. Analyze content topic/industry
2. Search the internet for high-quality content in the same style/genre
3. Compile a "style reference guide"
4. Dispatch an agent to polish (never do it yourself)
5. Preserve factual accuracy

## Self-Check Before Completion

- Was `Task()` actually called?
- Was every specialized subtask dispatched to the right agent?
- Was anything done manually "because it seemed simple"?
- **Was Step 6 (polish) executed?**
- Does the granularity audit pass?

## Common Anti-Patterns

- ❌ Researching and writing a report yourself → ✅ Split into multiple agents
- ❌ Using a general agent for specialized tasks → ✅ Use the best-matching specialized agent
- ❌ Skipping the pre-flight check → ✅ Output JSON check result
- ❌ Skipping Step 6 polish → ✅ Dispatch an agent to search style references and polish

## Directory Structure

```
requirement-agent-dispatch/
├── deploy.sh    # One-click deployment script
├── README.md    # Chinese README
├── README.en.md # This file
├── SKILL.md     # Core skill instructions (includes 150+ agent scenario mapping)
└── agents/      # Pre-built agent definitions (deployed to ~/.opencode/agents/)
```

## Related Resources

- [opencode documentation](https://opencode.ai)
- [opencode skills guide](https://opencode.ai/docs/skills)
- [opencode agents](https://github.com/anomalyco/opencode-agents)

## License

MIT
