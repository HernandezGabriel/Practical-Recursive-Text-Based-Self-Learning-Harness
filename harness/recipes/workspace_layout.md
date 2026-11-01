# Recipe: Workspace Layout (Windows)

## Purpose
Governs where ad-hoc / shelf files live so the workspace root stays clean.

## Scope
- Root of this workspace (`c:\Users\herna\.cline\data\workspaces\chat`)
- Scratch / shelf files that are not part of a named project folder

## Conventions
- Keep the workspace root limited to: `AGENTS.md`, `.gitignore`, `harness/`, project folders (e.g. `raffleup/`), and standard dotfiles.
- Put ad-hoc, temporary, or "shelf" files (scripts, exports, notes, specs) in `.scratch/` instead of the root.
- `.scratch/` is gitignored; nothing inside it should be committed.
- Do not place loose files at the top level; create a named folder for any new project/work.

## Common Mistakes
| Mistake | Why it happens | Fix / Avoidance |
|---------|---------------|-----------------|
| Dropping scratch files at workspace root | Convenience / muscle memory | Move them into `.scratch/` |
| Committing `.scratch/` contents | Forgot it is ignored / added with `git add -A` | Keep `.scratch/` in `.gitignore`; never `git add .scratch` |

## Auto-Healing Log
- 2026-11-01 — v1.0.2: Recipe created after moving shelf files into `.scratch/`.