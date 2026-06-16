# Context Relay Instructions

This instruction guide configures AI coding agents (such as Antigravity, Cursor, Cline, Roo Code, or ChatGPT/Claude) to perform seamless, zero-loss development context handovers when migrating tasks between different conversation sessions.

---

## 1. Trigger Phrases
The agent must proactively invoke the procedures in this specification when the user says phrases indicating a session transition, such as:
- "Let's continue this in a new conversation window"
- "Generate session handover brief"
- "Migrate this session to a new chat"
- "이거 다음 대화로 넘겨줘" (Korean)
- "다른 대화에서 이어서 하고 싶어요" (Korean)

---

## 2. Information Gathering Phase
Before generating the final handover prompt, the agent *must* perform a comprehensive state audit of the current workspace:
1. **Track Task Status**: Analyze active task lists (`task.md`, `TODO.md`, or in-memory checklists) to extract completed (`[x]`), in-progress (`[/]`), and remaining (`[ ]`) items.
2. **Find Modified Files**: Inspect git status/diff or check file modification history to list all created, modified, or deleted files.
3. **Trace Architectural Decisions**: Document major technical decisions made in the current session (e.g., specific libraries chosen, custom patterns implemented).
4. **Identify Next Action Target**: Define the immediate next step or command to run to continue/verify the work (e.g., tests, dev servers).

---

## 3. Handover Brief Output Schema
The agent must output the final package in the chat window inside a copy-pasteable Markdown block structured exactly as follows:

```markdown
# Session Handover Context (Via Context Relay)
We are resuming a development task from a previous conversation session.
Source Session ID: [Insert Current Conv/Session ID]
Project Workspace Directory: [Insert Absolute Workspace Path]

## 1. High-Level Objective
[2-3 sentence summary of the project's ultimate goal and the current feature build.]

## 2. Current Development State
- **Files Modified/Created**:
  - `[File Name 1]` ([Link to file](file:///absolute/path/to/file1)) -> [Brief description of changes]
  - `[File Name 2]` ([Link to file](file:///absolute/path/to/file2)) -> [Brief description of changes]
- **Key Technical Decisions**:
  - [Decision 1 (e.g., Used Vanilla CSS grid instead of Tailwind)]
  - [Decision 2]

## 3. Task Status
- [x] Done Task A
- [/] In-Progress Task B
- [ ] Todo Task C

## 4. Next Immediate Steps
1. **Step 1**: [Direct instruction of what code to inspect/write first]
2. **Step 2**: [Next verification task/command to run]

## 5. Environment Commands
- **Dev Server**: `[Command to run, e.g., npm run dev]`
- **Testing**: `[Command to run, e.g., npm test]`
```

---

## 4. Execution Directive
Upon generating this block, the agent must guide the user on the next steps:
1. Instruct the user to open a new conversation window.
2. Advise setting the **same workspace path** in the new session.
3. Instruct them to paste the generated Markdown block directly into the chat to instantly restore context.
