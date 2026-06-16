# Context Relay

<p align="center">
  <img src="https://img.shields.io/github/stars/oasunryo/context-relay?style=for-the-badge&color=ffd700" alt="GitHub stars">
  <img src="https://img.shields.io/github/forks/oasunryo/context-relay?style=for-the-badge&color=007acc" alt="GitHub forks">
  <img src="https://img.shields.io/github/issues/oasunryo/context-relay?style=for-the-badge&color=red" alt="GitHub issues">
  <img src="https://img.shields.io/github/license/oasunryo/context-relay?style=for-the-badge" alt="License">
</p>

<p align="center">
  <a href="./README.ko.md"><b>🇰🇷 한국어 설명서</b></a>
</p>

A cross-platform, framework-agnostic system prompt configuration that enables zero-loss development context handovers for AI coding assistants when migrating tasks between different conversation sessions.

---

## 🦄 Compatibility

**Context Relay** works with all major AI coding assistants and LLM chat interfaces:
*   **AI IDEs / Extensions**: Cursor, Cline (Roo Code), Antigravity, GitHub Copilot.
*   **CLI AI Agents**: Claude Code, Aider.
*   **Web Interfaces**: ChatGPT, Claude Projects, Gemini Advanced.

---

## 🦄 What it Does

When you transition a task to a new conversation window, this instruction set forces the AI Agent to:
1. Audit the workspace state (Git diffs, file modifications, architecture choices).
2. Read the active checklists (e.g. `task.md` or `TODO.md`).
3. Generate a highly structured, copy-pasteable context prompt in English for the next conversation.

Pasting this generated output into the new session instantly aligns the new agent to continue working without starting over.

---

## 🚀 Installation & Integration

### Interactive Installation
Clone this repository and run the installer script in your project root or home directory:
```bash
git clone https://github.com/oasunryo/context-relay.git
cd context-relay
chmod +x install.sh
./install.sh
```

Choose from:
*   **Antigravity Custom Skill**: Copies the instruction file into Antigravity's global custom skills directory.
*   **Cursor**: Appends instructions to your project's `.cursorrules`.
*   **Roo Code / Cline**: Copies instructions into `.roo/instructions.md`.

### Manual Configuration
*   **CLI / Other Agents (Claude Code, Copilot, ChatGPT, Claude Projects)**: Copy the contents of `SKILL.md` and append/paste it into your system prompt configurations (e.g., `.claudeprompts`, custom instructions, or reference context).

---

## 📖 Step-by-Step Usage Scenario

Here is an example of how to migrate your work session using **Context Relay**:

### Step 1: Request Handoff
Ask your AI Agent in your active coding session to prepare for migration:
> "이거 다음 대화로 넘겨줘" (Hand this over to the next conversation)
> "다른 대화에서 이어서 하고 싶어요." (I want to continue this in a new conversation.)

### Step 2: Copy the Generated Brief
The AI Agent will output a structured Markdown brief detailing the project's state:
````markdown
# Session Handover Context (Via Context Relay)
We are resuming a development task from a previous conversation session.
Source Session ID: <PREVIOUS_SESSION_ID>
Project Workspace Directory: /path/to/your/project

## 1. High-Level Objective
Implementing user authentication flow using custom JWT.

## 2. Current Development State
- **Files Modified/Created**:
  - `auth.js` -> Added logic for validating tokens.

## 3. Task Status
- [x] Create login layout
- [/] Connect login API with front-end
- [ ] Add session timeout logic

## 4. Next Immediate Steps
1. **Step 1**: Finish connecting the API in `auth.js`.
2. **Step 2**: Run `npm test` to verify login validation passes.
````
**Copy** this Markdown block.

### Step 3: Resume in a New Session
1. Open a **new conversation** window in your AI IDE or chat UI.
2. Select the **same project workspace**.
3. **Paste** the copied Markdown block into the chat.
4. The new AI agent will read the context and resume the task exactly where the last session left off.

---

## 📈 Star History

[![Star History Chart](https://api.star-history.com/svg?repos=oasunryo/context-relay&type=Date)](https://star-history.com/#oasunryo/context-relay&Date)
