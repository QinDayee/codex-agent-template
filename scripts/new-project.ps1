param(
    [Parameter(Mandatory = $true)]
    [string]$ProjectName,

    [string]$DestinationRoot,

    [string]$RemoteUrl,

    [string]$InitialCommitMessage = "chore: initialize from codex-agent-template"
)

$ErrorActionPreference = "Stop"

$templateRoot = Split-Path -Parent $PSScriptRoot
if (-not $DestinationRoot) {
    $DestinationRoot = Split-Path -Parent $templateRoot
}

$targetPath = Join-Path $DestinationRoot $ProjectName

if (Test-Path -LiteralPath $targetPath) {
    throw "Target path already exists: $targetPath"
}

New-Item -ItemType Directory -Path $targetPath -Force | Out-Null

$robocopyArgs = @(
    $templateRoot,
    $targetPath,
    "/E",
    "/XD", ".git",
    "/XF", "*.user",
    "/NFL",
    "/NDL",
    "/NJH",
    "/NJS",
    "/NC",
    "/NS",
    "/NP"
)

robocopy @robocopyArgs | Out-Null
$robocopyExitCode = $LASTEXITCODE
if ($robocopyExitCode -ge 8) {
    throw "robocopy failed with exit code $robocopyExitCode"
}

$changeLogPath = Join-Path $targetPath "CHANGELOG.md"
$changeLogContent = @"
# CHANGELOG.md

## Project Initialization
### Changed
- Created project from codex-agent-template

### Verified
- Template files copied into the new project directory
- Fresh git repository initialized

### Remaining Risks
- PROJECT_PROFILE.md still needs project-specific commands and environment details
"@
[System.IO.File]::WriteAllText($changeLogPath, $changeLogContent)

git -C $targetPath init -b main | Out-Null
git -C $targetPath add . | Out-Null
git -C $targetPath commit -m $InitialCommitMessage | Out-Null

if ($RemoteUrl) {
    git -C $targetPath remote add origin $RemoteUrl | Out-Null
}

Write-Output "Project created: $targetPath"
Write-Output "Initial commit created on branch main."
if ($RemoteUrl) {
    Write-Output "Remote added: origin -> $RemoteUrl"
}
