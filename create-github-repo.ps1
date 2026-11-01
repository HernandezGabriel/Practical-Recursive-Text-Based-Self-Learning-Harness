# create-github-repo.ps1
#
# Two modes:
#   -Mode SaveToken     Run ONCE locally. Prompts for your GitHub PAT via
#                       Read-Host -AsSecureString, encrypts it with Windows
#                       Data Protection API, and saves to %USERPROFILE%\.github\token.dat
#                       Only your user account on this machine can decrypt it.
#
#   -Mode CreateRepo    Reads the saved token, decrypts it, and creates a repo
#                       via the GitHub API. No interactive prompts — safe to run
#                       non-interactively after SaveToken has been run.
#
# Examples:
#   .\create-github-repo.ps1 -Mode SaveToken
#   .\create-github-repo.ps1 -Mode CreateRepo -RepoName "My-Repo" -Description "Hello" -Private

param(
    [Parameter(Mandatory=$true)]
    [ValidateSet("SaveToken","CreateRepo")]
    [string]$Mode,

    [string]$RepoName,
    [string]$Description = "",
    [switch]$Private
)

$tokenDir  = "$env:USERPROFILE\.github"
$tokenPath = "$tokenDir\token.dat"

function Get-TokenText {
    if (!(Test-Path $tokenPath)) {
        throw "No saved token found. Run with -Mode SaveToken first."
    }
    $encrypted = [Convert]::FromBase64String((Get-Content -Path $tokenPath -Raw))
    $bytes = [System.Security.Cryptography.ProtectedData]::Unprotect(
        $encrypted, $null, [System.Security.Cryptography.DataProtectionScope]::CurrentUser
    )
    return [System.Text.Encoding]::UTF8.GetString($bytes)
}

if ($Mode -eq "SaveToken") {
    if (!(Test-Path $tokenDir)) { New-Item -ItemType Directory -Path $tokenDir -Force | Out-Null }

    $token = Read-Host -AsSecureString -Prompt "Enter your GitHub PAT"
    $tokenText = [Runtime.InteropServices.Marshal]::PtrToStringAuto(
        [Runtime.InteropServices.Marshal]::SecureStringToBSTR($token)
    )
    $bytes = [System.Text.Encoding]::UTF8.GetBytes($tokenText)
    $encrypted = [System.Security.Cryptography.ProtectedData]::Protect(
        $bytes, $null, [System.Security.Cryptography.DataProtectionScope]::CurrentUser
    )
    Set-Content -Path $tokenPath -Value ([Convert]::ToBase64String($encrypted)) -Encoding Byte
    Write-Output "Token saved securely to $tokenPath"
}
elseif ($Mode -eq "CreateRepo") {
    if (-not $RepoName) { throw "-RepoName is required for CreateRepo mode" }

    $tokenText = Get-TokenText
    $headers = @{ Authorization = "token $tokenText" }

    $body = @{
        name        = $RepoName
        description = $Description
        private     = $Private.IsPresent
        auto_init   = $false
    } | ConvertTo-Json

    Write-Output "Creating repo '$RepoName'..."
    $response = Invoke-RestMethod -Uri "https://api.github.com/user/repos" `
        -Method Post -Headers $headers -Body $body -ContentType "application/json"

    Write-Output "Created: $($response.html_url)"
    Write-Output "SSH URL:  $($response.ssh_url)"
}