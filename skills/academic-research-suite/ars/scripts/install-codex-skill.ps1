[CmdletBinding()]
param(
  [string]$Destination = (Join-Path $HOME ".codex\skills\academic-research-suite"),
  [switch]$Force
)

$ErrorActionPreference = "Stop"
$repoRoot = Split-Path -Parent $PSScriptRoot
$adapterRoot = Join-Path $repoRoot "codex\academic-research-suite"

if (-not (Test-Path -LiteralPath (Join-Path $adapterRoot "SKILL.md"))) {
  throw "Codex adapter not found at $adapterRoot"
}

$resolvedRepo = (Resolve-Path -LiteralPath $repoRoot).Path
$destParent = Split-Path -Parent $Destination
if (-not (Test-Path -LiteralPath $destParent)) {
  New-Item -ItemType Directory -Path $destParent | Out-Null
}

if (Test-Path -LiteralPath $Destination) {
  if (-not $Force) {
    throw "Destination exists: $Destination. Re-run with -Force to replace it."
  }
  $resolvedDest = (Resolve-Path -LiteralPath $Destination).Path
  if ($resolvedDest -eq [System.IO.Path]::GetPathRoot($resolvedDest)) {
    throw "Refusing to remove filesystem root: $resolvedDest"
  }
  Remove-Item -LiteralPath $resolvedDest -Recurse -Force
}

New-Item -ItemType Directory -Path $Destination | Out-Null
Copy-Item -LiteralPath (Join-Path $adapterRoot "SKILL.md") -Destination $Destination
Copy-Item -LiteralPath (Join-Path $adapterRoot "manifest.json") -Destination $Destination
Copy-Item -LiteralPath (Join-Path $adapterRoot "VERSION") -Destination $Destination

$arsDest = Join-Path $Destination "ars"
New-Item -ItemType Directory -Path $arsDest | Out-Null

$items = @(
  "deep-research",
  "academic-paper",
  "academic-paper-reviewer",
  "academic-pipeline",
  "shared",
  "scripts",
  "examples",
  "docs",
  "commands",
  "hooks",
  "agents",
  "requirements-dev.txt",
  "README.md",
  "README.zh-CN.md",
  "README.zh-TW.md",
  "README.ja-JP.md",
  "QUICKSTART.md",
  "CHANGELOG.md",
  "CONTRIBUTING.md",
  "FORK_NOTICE.md",
  "LICENSE",
  "NOTICE.md",
  "MODE_REGISTRY.md",
  "POSITIONING.md",
  "SECURITY.md"
)

foreach ($item in $items) {
  $source = Join-Path $resolvedRepo $item
  if (Test-Path -LiteralPath $source) {
    Copy-Item -LiteralPath $source -Destination $arsDest -Recurse
  }
}

Write-Output "Installed Codex skill to $Destination"
Write-Output "Restart Codex or open a new conversation, then use `$academic-research-suite."
