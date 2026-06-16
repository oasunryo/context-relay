---
name: session-handover
description: Triggered when the user wants to hand over the active tasks to a new conversation session (e.g., "다른 대화에서~", "작업 이어서 하고 싶어요"). This skill instructs the agent to audit the current Git diff, task.md, and system logs, and generate a flawless, highly-optimized English context prompt for the next agent.
---

# Skill: Optimized Session Handover Prompt Generator

This skill ensures a seamless, zero-loss transition of the development environment and tasks between different conversation sessions. When triggered, the agent must perform a comprehensive state audit and generate a single, copy-pasteable English prompt designed for the next AI session to digest.

---

## 1. Trigger Phrases (Korean)
The agent must proactively invoke the procedures in this skill when the user says phrases like:
- "다른 대화에서 이어서 하고 싶어요"
- "작업 이관해주세요"
- "새로운 컨버세이션에서 작업할 수 있게 해줘"
- "이거 다음 대화로 넘겨줘"
- Or any equivalent intent of shifting the current session to a new conversation window.

---

## 2. Information Gathering Phase (Before Writing the Prompt)
To prevent context drift, the agent *must* execute the following lookup steps before generating the final prompt:
1. **Analyze `task.md`**: Read the `task.md` file in the artifact directory to extract the exact progress of checklist items (`[x]`, `[/]`, `[ ]`).
2. **Find Modified Files**: Run a Git diff/status check or check recent memory logs to list all created, modified, or deleted files in the workspace.
3. **Trace Architectural Decisions**: Retrieve major decisions (e.g., packages chosen, custom protocols, config adjustments) made in the current conversation.
4. **Identify Next Execution Target**: Determine the exact next step/command that should be executed to verify the code (e.g., tests, dev servers).

---

## 3. Handover Brief Output Schema (Strictly in English)
The agent must output the final package in the chat window. The output must be structured exactly like the template below, contained inside a clear Markdown code block for easy copying.

### [Handover Output Structure]

```markdown
📋 **Task Handover Brief**
Paste the code block below directly into your new conversation window to instantly restore context:

```markdown
# Session Handover Context
We are resuming a development task from a previous conversation session.
Source Session ID: [Insert Current Conv ID]
Project Workspace Directory: [Insert Absolute Workspace Path]

## 1. High-Level Objective
[Write a 2-3 sentence summary of the ultimate goal of the project and current feature build.]

## 2. Current Development State
- **Files Modified/Created**:
  - `[File Name 1]` ([Link to file](file:///absolute/path/to/file1)) -> [Brief description of what was changed inside]
  - `[File Name 2]` ([Link to file](file:///absolute/path/to/file2)) -> [Brief description of what was changed inside]
- **Key Technical Decisions**:
  - [Decision 1 (e.g., Used Vanilla CSS grid instead of Tailwind, used JSON-to-Toon MCP, etc.)]
  - [Decision 2]

## 3. Task Status (Sync with task.md)
[Insert the exact current markdown checklist from task.md, preserving state indicators]
- [x] Done Task A
- [/] In-Progress Task B
- [ ] Todo Task C

## 4. Next Immediate Steps (For the Next Agent)
1. **Step 1**: [Direct instruction of what code to inspect/write first]
2. **Step 2**: [Next verification task/command to run]
3. **Step 3**: [Subsequent task items to resolve]

## 5. Environment Commands
- **Dev Server**: `[Command to run, e.g., npm run dev]`
- **Testing**: `[Command to run, e.g., npm test]`
\```
```

---

## 4. Execution Directive
Upon generating this block, the agent must guide the user on how to use it:
1. Advise the user to open a new conversation.
2. Recommend setting the **same workspace path** as the active workspace in the new session.
3. Instruct them to paste the generated Markdown block into the chat.
4. (Optional) Ask the user if they would like to save this handover brief as `handover_brief.md` in the current artifact directory before closing.
