param(
    [string]$VaultRoot = (Resolve-Path ".").Path,
    [string]$InputFolder = "00-Inbox/Downloaded",
    [string]$OutputFolder = "00-Inbox/Cleaned"
)

$ErrorActionPreference = "Stop"

function Get-SafeFileName {
    param([string]$Name)
    $invalid = [IO.Path]::GetInvalidFileNameChars()
    $safe = -join ($Name.ToCharArray() | ForEach-Object {
        if ($invalid -contains $_) { "-" } else { $_ }
    })
    $safe = ($safe -replace "\s+", " ").Trim()
    if ($safe.Length -gt 90) { $safe = $safe.Substring(0, 90).Trim() }
    if ([string]::IsNullOrWhiteSpace($safe)) { $safe = "Untitled" }
    return $safe
}

function Get-FirstMatch {
    param([string]$Text, [string[]]$Patterns)
    foreach ($pattern in $Patterns) {
        $match = [regex]::Match($Text, $pattern, "IgnoreCase, Multiline")
        if ($match.Success -and $match.Groups.Count -gt 1) {
            return $match.Groups[1].Value.Trim()
        }
        if ($match.Success -and $match.Groups.Count -eq 1) {
            return $match.Value.Trim()
        }
    }
    return ""
}

function Get-Classification {
    param([string]$Text)

    $rules = @(
        @{ Category = "04-Research/AI/MCP"; Tags = @("topic/mcp", "topic/agent"); Terms = @("mcp", "model context protocol") },
        @{ Category = "04-Research/AI/Workflow"; Tags = @("topic/workflow", "topic/agent"); Terms = @("workflow", "agent workflow", "harness", "pipeline", "process") },
        @{ Category = "04-Research/AI/Automation"; Tags = @("topic/automation", "topic/agent"); Terms = @("automation", "agent teams", "subagent", "auto") },
        @{ Category = "04-Research/AI/Tools"; Tags = @("topic/tools", "topic/codex", "topic/claude-code"); Terms = @("codex", "claude code", "cursor", "tool", "cli") },
        @{ Category = "04-Research/Information-Sources/AI-News"; Tags = @("topic/ai-news", "topic/information-sources"); Terms = @("horizon", "news", "rss", "newsletter", "daily") },
        @{ Category = "04-Research/Business/Monetization"; Tags = @("topic/monetization", "topic/business"); Terms = @("monetization", "revenue", "course", "paid") },
        @{ Category = "04-Research/Business/Entrepreneurship"; Tags = @("topic/business", "topic/entrepreneurship"); Terms = @("startup", "business model", "founder") }
    )

    $lower = $Text.ToLowerInvariant()
    foreach ($rule in $rules) {
        foreach ($term in $rule.Terms) {
            if ($lower.Contains($term.ToLowerInvariant())) {
                return $rule
            }
        }
    }

    return @{ Category = "04-Research/AI/Workflow"; Tags = @("topic/workflow"); Terms = @() }
}

function ConvertTo-CleanMarkdown {
    param([string]$Raw)

    $text = $Raw -replace "`r`n", "`n"
    $text = $text -replace "`r", "`n"
    $text = $text -replace "`n{3,}", "`n`n"
    $text = $text -replace "^[\t ]+", ""
    return $text.Trim() + "`n"
}

$inputPath = Join-Path $VaultRoot $InputFolder
$outputPath = Join-Path $VaultRoot $OutputFolder

if (-not (Test-Path -LiteralPath $inputPath)) {
    throw "Input folder not found: $inputPath"
}

if (-not (Test-Path -LiteralPath $outputPath)) {
    New-Item -ItemType Directory -Path $outputPath | Out-Null
}

$files = Get-ChildItem -LiteralPath $inputPath -Filter "*.md" -File
$results = @()

foreach ($file in $files) {
    $raw = Get-Content -LiteralPath $file.FullName -Raw -Encoding UTF8
    $title = Get-FirstMatch $raw @("^title:\s*[""']?(.+?)[""']?\s*$", "^#\s+(.+?)\s*$")
    if (-not $title) { $title = [IO.Path]::GetFileNameWithoutExtension($file.Name) }

    $source = Get-FirstMatch $raw @("^source:\s*(.+?)\s*$", "^url:\s*(.+?)\s*$", "https?://\S+")
    $author = Get-FirstMatch $raw @("^author:\s*(.+?)\s*$", "^byline:\s*(.+?)\s*$")
    $published = Get-FirstMatch $raw @("^published:\s*(.+?)\s*$", "^date:\s*(.+?)\s*$")
    $classification = Get-Classification $raw
    $safeTitle = Get-SafeFileName $title
    $date = Get-Date -Format "yyyy-MM-dd"
    $targetName = "$date - $safeTitle.md"
    $targetPath = Join-Path $outputPath $targetName
    $counter = 2
    while (Test-Path -LiteralPath $targetPath) {
        $targetName = "$date - $safeTitle ($counter).md"
        $targetPath = Join-Path $outputPath $targetName
        $counter++
    }

    $tags = @("status/cleaned") + $classification.Tags
    $tagLines = ($tags | ForEach-Object { "  - $_" }) -join "`n"
    $cleanBody = ConvertTo-CleanMarkdown $raw

    $frontmatter = @"
---
type: research
title: "$title"
source: "$source"
author: "$author"
published: "$published"
captured: "$date"
primary_category: "$($classification.Category)"
topics:
$tagLines
tags:
$tagLines
status: cleaned
---

# $title

## Source

- URL: $source
- Author: $author
- Published: $published
- Captured: $date
- Suggested primary category: $($classification.Category)
- Suggested topics: $($classification.Tags -join ", ")

## Original Content

"@

    Set-Content -LiteralPath $targetPath -Value ($frontmatter + $cleanBody) -Encoding UTF8
    $results += [PSCustomObject]@{
        Source = $file.FullName
        Output = $targetPath
        Category = $classification.Category
        Topics = ($classification.Tags -join ", ")
    }
}

if ($results.Count -eq 0) {
    Write-Output "No Markdown files found in $inputPath"
} else {
    $results | Format-Table -AutoSize
}

