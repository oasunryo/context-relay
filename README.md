# Antigravity Session Handover Skill

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

A custom skill for the Antigravity AI coding assistant that enables zero-loss development context handover between different conversation sessions.

---

## 🦄 What it Does

When you need to transition a task to a new conversation window, this skill automatically audits the current state (workspace path, git changes, `task.md` status, architecture decisions) and generates a copy-pasteable context prompt in English for the next agent.

---

## 🚀 Installation

### Using Installation Script
Clone this repository and run the install script:
```bash
chmod +x install.sh
./install.sh
```

### Manual Installation
Copy the `SKILL.md` file directly into your Antigravity skills directory:
```bash
mkdir -p ~/.gemini/antigravity/scratch/.agents/skills/session-handover
cp SKILL.md ~/.gemini/antigravity/scratch/.agents/skills/session-handover/SKILL.md
```

---

## 📖 How to Use

Simply ask Antigravity in Korean when you want to migrate:
> "다른 대화에서 이어서 하고 싶어요." (I want to continue in another conversation.)
> "작업 이관해줘." (Hand over the tasks.)

Antigravity will output a structured English handover block like this:
```markdown
# Session Handover Context
We are resuming a development task from a previous conversation session.
Source Session ID: 0cdbecce-083c-46cc-a7e9-f5a95c42ec74
Project Workspace Directory: /Users/oasunryo/.gemini/antigravity/scratch/session-handover

## 1. High-Level Objective
...
```
Copy that block, open a new chat session, select the same workspace directory, and paste it to instantly restore state.
