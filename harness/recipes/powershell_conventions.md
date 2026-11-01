# Recipe: PowerShell Conventions

## Purpose
Governs terminal/PowerShell usage in this Windows workspace so the LLM does not issue Linux-style commands that fail.

## Scope
- Integrated terminal in VS Code (PowerShell on Windows)
- Any `.ps1` script creation or editing
- Terminal commands issued via `run_commands`

## Conventions
- Do **not** use `ls -la` — PowerShell does not support `-la`. Use `Get-ChildItem -Force` or `ls` (no flags).
- `pwd` works (alias for `Get-Location`).
- Separate multiple commands with `;` or newlines, not `&&`.
- Save PowerShell scripts as UTF-8 (without BOM for PowerShell 7+).
- Use `New-Item` instead of `touch` or `mkdir` with multiple paths.

## Common Mistakes
| Mistake | Why it happens | Fix / Avoidance |
|---------|---------------|-----------------|
| `ls -la` in terminal | Muscle memory from Linux shells | Use `Get-ChildItem -Force` instead |
| `touch file.txt` | Linux habit | Use `New-Item -Path "file.txt" -ItemType File` |
| `mkdir a b c` | `mkdir` in PowerShell accepts one path | Use `New-Item -ItemType Directory -Path a -Force` per path, or loop |
| `&&` command chaining | Bash habit | Use `;` or newlines |

## Auto-Healing Log
- 2026-10-31 — v1.0.0: Initial recipe created from observed `ls -la` failure in terminal test.