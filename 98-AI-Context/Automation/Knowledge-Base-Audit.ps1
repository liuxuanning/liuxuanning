param(
    [string]$VaultRoot = (Resolve-Path ".").Path,
    [string]$ReportFolder = "98-AI-Context"
)

$ErrorActionPreference = "Stop"

$ignoreParts = @(".git", ".obsidian", ".venv", "node_modules", "__pycache__")
function Test-IgnoredPath {
    param([string]$Path)
    $relative = $Path.Replace($VaultRoot, "").TrimStart("\")
    $parts = $relative -split "[\\/]+"
    foreach ($part in $parts) {
        if ($ignoreParts -contains $part) { return $true }
    }
    return $false
}
$allFiles = Get-ChildItem -LiteralPath $VaultRoot -Recurse -File -Force | Where-Object {
    -not (Test-IgnoredPath $_.FullName)
}

$mdFiles = $allFiles | Where-Object { $_.Extension -ieq ".md" }
$emptyDirs = Get-ChildItem -LiteralPath $VaultRoot -Recurse -Directory -Force | Where-Object {
    -not (Test-IgnoredPath $_.FullName) -and
    -not (Get-ChildItem -LiteralPath $_.FullName -Force | Select-Object -First 1)
}

$duplicateNames = $mdFiles |
    Group-Object Name |
    Where-Object { $_.Count -gt 1 } |
    ForEach-Object {
        "### $($_.Name)`n" + (($_.Group | ForEach-Object { "- $($_.FullName.Replace($VaultRoot + '\', ''))" }) -join "`n")
    }

$badNames = $allFiles | Where-Object {
    $_.Name -match "[<>:""/\\|?*]" -or $_.Name.Length -gt 120 -or $_.Name -match "^\s|\s$"
}

$junkFiles = $allFiles | Where-Object {
    $_.Name -match "(\.tmp$|\.bak$|\.log$|~$|\.DS_Store$|Thumbs\.db$)"
}

$orphanMd = $mdFiles | Where-Object {
    $text = Get-Content -LiteralPath $_.FullName -Raw -Encoding UTF8
    $hasWikiLink = $text -match "\[\[.+?\]\]"
    $hasTag = $text -match "(?m)^tags:|#[A-Za-z0-9_\-/\u4e00-\u9fa5]+"
    -not $hasWikiLink -and -not $hasTag
}

$topicTags = @{}
foreach ($file in $mdFiles) {
    $text = Get-Content -LiteralPath $file.FullName -Raw -Encoding UTF8
    foreach ($match in [regex]::Matches($text, "topic/[A-Za-z0-9_\-]+")) {
        $key = $match.Value
        if (-not $topicTags.ContainsKey($key)) { $topicTags[$key] = 0 }
        $topicTags[$key]++
    }
}

$reportPath = Join-Path (Join-Path $VaultRoot $ReportFolder) ("Knowledge Base Audit - " + (Get-Date -Format "yyyy-MM-dd HHmm") + ".md")

$report = @()
$report += "# Knowledge Base Audit"
$report += ""
$report += "- Generated: $(Get-Date -Format "yyyy-MM-dd HH:mm:ss")"
$report += "- Vault: $VaultRoot"
$report += "- Markdown files: $($mdFiles.Count)"
$report += "- All files: $($allFiles.Count)"
$report += "- Empty directories: $($emptyDirs.Count)"
$report += "- Duplicate Markdown file names: $($duplicateNames.Count)"
$report += "- Suspicious file names: $($badNames.Count)"
$report += "- Junk-like files: $($junkFiles.Count)"
$report += "- Orphan Markdown files: $($orphanMd.Count)"
$report += ""
$report += "## Topic Tags"
$report += ""
if ($topicTags.Count -eq 0) {
    $report += "No topic tags found yet."
} else {
    $topicTags.GetEnumerator() | Sort-Object Value -Descending | ForEach-Object {
        $report += "- $($_.Key): $($_.Value)"
    }
}
$report += ""
$report += "## Duplicate Markdown File Names"
$report += ""
if ($duplicateNames.Count -eq 0) { $report += "None." } else { $report += $duplicateNames }
$report += ""
$report += "## Empty Directories"
$report += ""
if ($emptyDirs.Count -eq 0) {
    $report += "None."
} else {
    $emptyDirs | ForEach-Object { $report += "- $($_.FullName.Replace($VaultRoot + '\', ''))" }
}
$report += ""
$report += "## Suspicious File Names"
$report += ""
if ($badNames.Count -eq 0) {
    $report += "None."
} else {
    $badNames | ForEach-Object { $report += "- $($_.FullName.Replace($VaultRoot + '\', ''))" }
}
$report += ""
$report += "## Junk-like Files"
$report += ""
if ($junkFiles.Count -eq 0) {
    $report += "None."
} else {
    $junkFiles | ForEach-Object { $report += "- $($_.FullName.Replace($VaultRoot + '\', ''))" }
}
$report += ""
$report += "## Orphan Markdown Files"
$report += ""
if ($orphanMd.Count -eq 0) {
    $report += "None."
} else {
    $orphanMd | ForEach-Object { $report += "- $($_.FullName.Replace($VaultRoot + '\', ''))" }
}
$report += ""
$report += "## Deletion Policy"
$report += ""
$report += "This audit does not delete files. Any cleanup must be reviewed manually, and deletion must target one explicit file path at a time."

Set-Content -LiteralPath $reportPath -Value ($report -join "`n") -Encoding UTF8
Write-Output $reportPath
