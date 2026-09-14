$ErrorActionPreference = "Stop"

$source = Join-Path $PSScriptRoot "skills"
$target = Join-Path $env:USERPROFILE ".codex\skills"
$skills = @(
  "assessing-ai-scenarios",
  "writing-ai-prds",
  "planning-ai-mvps",
  "designing-ai-metrics",
  "checking-ai-acceptance"
)

if (-not (Test-Path $source)) {
  throw "skills directory not found: $source"
}

New-Item -ItemType Directory -Force -Path $target | Out-Null
foreach ($skill in $skills) {
  Copy-Item -Path (Join-Path $source $skill) -Destination $target -Recurse -Force
}

Write-Host "Installed AI product skills to $target"
Write-Host "Restart Codex or start a new session to use them."
