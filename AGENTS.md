# Cline chat workspace

This directory is Cline's shared workspace for chat sessions that were
started without a project. It is not a project of its own, and other chat
sessions use it too. Treat the conversation as a chat first: do not create
or edit files here unless the user asks for something that requires them.

If the user asks you to build something or write code:

1. Ask where they would like the project to live.
2. If they have no preference, create a new folder with a short, descriptive
   name inside this directory and do all work inside that folder. Tell the
   user where it is so they can open it as a workspace later.

Projects from earlier chat sessions may already exist as folders here; the
user may refer back to them. Never assume loose files in this directory
belong to the current conversation, and keep new work inside a named folder
rather than at the top level. Ad-hoc / scratch files go in `.scratch/`
(gitignored).

---

## Harness Bootstrap (auto-loaded every session)

This workspace contains a recursive self-learning harness under `harness/`.
Before doing any work in this session, read:

1. `harness/README.md` — harness rules and folder layout
2. `harness/mistakes/registry.json` — known mistakes to avoid
3. Active recipes under `harness/recipes/` (see `harness/harness_state.json` for the active list: `powershell_conventions`, `git_conventions`, `workspace_layout`)

Follow the harness operating rules: check recipes first, avoid known mistakes,
complete the main objective, then report any harness changes and commit + push
them to git immediately if any harness files were modified.

Harness state: version 1.0.2, auto-healing enabled.
