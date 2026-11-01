# Recipe: Git Conventions (Windows)

## Purpose
Governs git usage in this Windows workspace to avoid setup/operation friction.

## Scope
- Local git repo in this workspace
- Remote operations (SSH, HTTPS)
- Commits triggered by harness rule #7

## Conventions
- Use full path `C:\Program Files\Git\bin\git.exe` if `git` is not on PATH
- Configure user identity before first commit:
  ```
  git config user.email "you@example.com"
  git config user.name "Your Name"
  ```
- Remove stale `.git/index.lock` if git reports another process is running
- Use SSH keys for GitHub remote auth (see `ssh-keygen` note below)
- Commit immediately after any harness file edit (rule #7)

## Common Mistakes
| Mistake | Why it happens | Fix / Avoidance |
|---------|---------------|-----------------|
| `git: command not found` | Git not on PATH in terminal | Use `C:\Program Files\Git\bin\git.exe` or add Git to PATH |
| Commit fails: author identity unknown | `user.email`/`user.name` not set | Run `git config` before committing |
| `index.lock` file exists | Previous git process crashed | Delete `.git/index.lock`, then retry |
| `ssh-keygen -N ""` fails | Windows OpenSSH rejects empty passphrase arg | Use `cmd /c` with `echo y | ssh-keygen ... -N ""` |

## SSH Key Generation (Windows)
```
cmd /c "echo y | C:\Windows\System32\OpenSSH\ssh-keygen.exe -t ed25519 -C \"cline@chat.local\" -f %USERPROFILE%\.ssh\id_ed25519 -N """
```

## Auto-Healing Log
- 2026-10-31 — v1.0.1: Recipe created from git/SSH setup friction in this session.