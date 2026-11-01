# PowerShell Convention (Windows)

This workspace runs on **Windows PowerShell**. When using the integrated terminal in VS Code, follow these conventions:

## Terminal commands

- **Do not use Linux-style flags.** `ls -la` will fail in PowerShell.
  - Use `Get-ChildItem -Force` or simply `ls` (without `-la`) instead.
- `pwd` works (it is an alias for `Get-Location`).
- Separate multiple commands with `;` or newlines, not `&&`.
- PowerShell is case-insensitive for cmdlets and parameters.

## File encoding

- Save PowerShell scripts (`.ps1`) as **UTF-8** (without BOM for PowerShell 7+).
- VS Code is configured to auto-format PowerShell files on save using the `ms-vscode.powershell` extension.

## Recommended VS Code extensions

- `ms-vscode.powershell` — PowerShell language support, IntelliSense, and script analysis.

## Example

```powershell
# List all files including hidden
Get-ChildItem -Force

# Current directory
pwd

# Create a new file
New-Item -Path "example.txt" -ItemType File
```