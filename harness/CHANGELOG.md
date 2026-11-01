# Harness Changelog

## v1.0.2 — 2026-11-01
- Moved shelf/scratch files from workspace root into `.scratch/` (gitignored).
- Added `harness/recipes/workspace_layout.md` documenting clean-root convention.
- Updated `harness/README.md` with Workspace Layout section.
- Updated `.gitignore` to ignore `.scratch/`.
- Updated `AGENTS.md` bootstrap version and scratch-dir note.

## v1.0.0 — 2026-10-31
- Initial scaffold created.
- Added `harness/README.md` with core operating rules.
- Added `harness/recipes/TEMPLATE.md` for future recipes.
- Added `harness/recipes/powershell_conventions.md` as the first recipe (includes Common Mistakes section).
- Added `harness/mistakes/registry.json` with one recorded mistake (`ls -la` in PowerShell).
- Added `harness/harness_state.json` for auto-healing state tracking.
- Added this `harness/CHANGELOG.md`.
