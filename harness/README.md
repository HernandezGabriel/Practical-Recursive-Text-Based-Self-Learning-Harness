# VS Code LLM Harness — Auto-Improving Text-Based System

This is a simplistic, text-based harness that helps the LLM agent improve itself across sessions.
It lives in this workspace and travels with it.

## Core Operating Rules (read before every session)

1. **Check recipes first.** Before doing any work, read the relevant recipe file(s) under `harness/recipes/`.
2. **Check the mistakes registry.** Read `harness/mistakes/registry.json` to avoid repeating known common mistakes.
3. **Complete the main objective first.** Do the actual work the user asked for.
4. **Report harness changes only if files changed.** After the main objective is done, state explicitly what harness files were edited and why — but only if the harness was actually modified. Do not put this before the main work, and do not report if nothing changed.
5. **Auto-heal.** If a common mistake occurs during this session, add it to the registry and update the relevant recipe's "Common Mistakes" section so the next session avoids it.
6. **Only edit the harness when needed.** Do not make gratuitous changes. Every edit must be justified.

## Folder Layout

```
harness/
├── README.md              # This file — harness rules & layout
├── recipes/
│   └── *.md               # Domain recipe files (e.g., powershell_conventions.md)
├── mistakes/
│   └── registry.json      # Cross-session common-mistakes tracker
├── harness_state.json     # Auto-healing state: version, fixes applied, last session
└── CHANGELOG.md           # Log of harness edits made by the LLM
```

## How Auto-Healing Works

- During a session, if the LLM catches itself making (or about to make) a known mistake, it records it in `mistakes/registry.json`.
- The relevant recipe file under `harness/recipes/` gets a new entry in its "Common Mistakes" section.
- `harness_state.json` is bumped to a new version and logs what was healed.
- At the start of the next session, the LLM reads the registry + recipes and avoids those mistakes.

## How to Add a New Recipe

Create a new `.md` file in `harness/recipes/` using the template in `recipes/TEMPLATE.md`.
Reference it in `harness_state.json` if it is active for this workspace.