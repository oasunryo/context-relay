# Context Relay

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

A cross-platform, framework-agnostic system prompt configuration that enables zero-loss development context handovers for AI coding assistants when migrating tasks between different conversation sessions.

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
Run the installer script in your project root or home directory:
```bash
chmod +x install.sh
./install.sh
```

Choose from:
*   **Antigravity Custom Skill**: Copies the instruction file into Antigravity's global custom skills directory.
*   **Cursor**: Appends instructions to your project's `.cursorrules`.
*   **Roo Code / Cline**: Copies instructions into `.roo/instructions.md`.

### Manual Configuration
*   **ChatGPT Custom Instructions / Claude Projects**: Copy the contents of `SKILL.md` and paste it into your system instructions, project knowledge, or custom instructions window.

---

## 📖 Usage Flow

1. Ask the AI agent:
   > "다른 대화에서 이어서 하고 싶어요." (I want to continue this in a new conversation.)
   > "작업 이관해줘." (Hand over the tasks.)
2. Copy the generated markdown output block.
3. Open a new chat session.
4. Select the same workspace path.
5. Paste the markdown block. The new session will immediately resume from the precise checkpoint.
