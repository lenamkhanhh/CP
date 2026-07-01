param(
    [string]$OutputPath = ""
)

$ErrorActionPreference = 'Stop'

function Get-Color([int]$r, [int]$g, [int]$b) {
    return $r + (256 * $g) + (65536 * $b)
}

function New-Matrix([object[]]$Rows, [int]$ColumnCount) {
    $matrix = New-Object 'object[,]' $Rows.Count, $ColumnCount
    for ($r = 0; $r -lt $Rows.Count; $r++) {
        for ($c = 0; $c -lt $ColumnCount; $c++) {
            $matrix[$r, $c] = $Rows[$r][$c]
        }
    }
    return ,$matrix
}

function Write-Rows($Sheet, [int]$StartRow, [int]$StartColumn, [object[]]$Rows) {
    if ($Rows.Count -eq 0) { return }
    $columnCount = $Rows[0].Count
    $matrix = New-Matrix $Rows $columnCount
    $endRow = $StartRow + $Rows.Count - 1
    $endColumn = $StartColumn + $columnCount - 1
    $range = $Sheet.Range($Sheet.Cells($StartRow, $StartColumn), $Sheet.Cells($endRow, $endColumn))
    $range.Value2 = $matrix
}

function Set-Header($Range, [int]$Background, [int]$Foreground) {
    $Range.Interior.Color = $Background
    $Range.Font.Color = $Foreground
    $Range.Font.Bold = $true
    $Range.HorizontalAlignment = -4108
    $Range.VerticalAlignment = -4108
    $Range.WrapText = $true
}

function Set-Borders($Range, [int]$Color) {
    $Range.Borders.LineStyle = 1
    $Range.Borders.Color = $Color
    $Range.Borders.Weight = 2
}

function Add-Table($Sheet, $Range, [string]$Name, [string]$Style) {
    $table = $Sheet.ListObjects.Add(1, $Range, $null, 1)
    $table.Name = $Name
    $table.TableStyle = $Style
    return $table
}

function Add-ListValidation($Range, [string]$Formula) {
    $Range.Validation.Delete()
    $Range.Validation.Add(3, 1, 1, $Formula)
    $Range.Validation.IgnoreBlank = $true
    $Range.Validation.InCellDropdown = $true
    $Range.Validation.ShowError = $true
}

function Freeze-At($Excel, $Sheet, [int]$Row, [int]$Column) {
    $Sheet.Activate()
    $Excel.ActiveWindow.FreezePanes = $false
    $Excel.ActiveWindow.SplitRow = $Row
    $Excel.ActiveWindow.SplitColumn = $Column
    $Excel.ActiveWindow.FreezePanes = $true
}

function Release-Com($Object) {
    if ($null -ne $Object) {
        [void][Runtime.InteropServices.Marshal]::FinalReleaseComObject($Object)
    }
}

function Test-CoreDay([datetime]$Date) {
    # Mon-Thu + Sat are core days; Friday is Lead Track, Sunday is rest.
    if ($Date.DayOfWeek -in @([DayOfWeek]::Friday,[DayOfWeek]::Sunday)) { return $false }
    if ($Date.Date -eq (Get-Date '2026-11-09').Date) { return $false }
    return $true
}

function Move-ToCoreDay([datetime]$Date) {
    $result = $Date
    while (-not (Test-CoreDay $result)) { $result = $result.AddDays(1) }
    return $result
}

function Move-ToFriday([datetime]$Date) {
    $result = $Date
    while ($result.DayOfWeek -ne [DayOfWeek]::Friday) { $result = $result.AddDays(1) }
    return $result
}

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$cpRoot = Split-Path -Parent $scriptDir
$taskRoot = Join-Path $cpRoot 'regional\Tasks'
if (-not $OutputPath) {
    $OutputPath = Join-Path $cpRoot 'ICPC_Solo_Training_Schedule_2026_2027.xlsx'
}
$OutputPath = [IO.Path]::GetFullPath($OutputPath)
if (-not $OutputPath.StartsWith([IO.Path]::GetFullPath($cpRoot), [StringComparison]::OrdinalIgnoreCase)) {
    throw "Output must stay inside CP: $OutputPath"
}

$ownerMap = @{
    'Sliding Window Cost' = '00_implementation_greedy_search'
    'Prefix Flip Hard Version' = '00_implementation_greedy_search'
    'COT' = '03_tree'
    'ICPC 2025 Regional - Finest Final String' = '04_dp_advanced'
    'ICPC 2025 Regional - Hamiltonian Path Remix' = '04_dp_advanced'
    'ICPC 2025 Regional - Group Raiding' = '05_math_counting'
    'Fancy Fence' = '07_geometry'
    'ICPC 2025 Regional - Divisibility Grid' = '08_proof_constructive_game'
}

$tasks = [System.Collections.Generic.List[object]]::new()
$taskId = 1
Get-ChildItem -LiteralPath $taskRoot -Directory | Sort-Object Name | ForEach-Object {
    $folder = $_.Name
    $path = Join-Path $_.FullName 'README.md'
    $lines = Get-Content -LiteralPath $path -Encoding UTF8
    $topic = (($lines | Where-Object { $_ -match '^# ' } | Select-Object -First 1) -replace '^#\s*', '')
    $tier = ''

    for ($i = 0; $i -lt $lines.Count; $i++) {
        if ($lines[$i] -match '^## ([A-E]) - (.+)$') {
            $tier = "$($matches[1]) - $($matches[2])"
            continue
        }
        if ($lines[$i] -notmatch '^- \[ \] \*\*(.+?)\*\*') { continue }

        $name = $matches[1]
        $url = ''
        $key = ''
        $why = ''
        $contestSource = ''
        $editorial = ''
        $sourceTypeHint = ''
        $thinkingHint = ''
        $implementationHint = ''
        $expectedHours = ''
        $j = $i + 1
        while ($j -lt $lines.Count -and $lines[$j] -notmatch '^- \[ \] \*\*' -and $lines[$j] -notmatch '^## ') {
            if ($lines[$j] -match '^\s*Submit:\s*\[[^\]]+\]\((https?://[^)]+)\)') { $url = $matches[1].Trim() }
            if ($lines[$j] -match '^\s*(Key|Focus):\s*(.+)$') { $key = $matches[2].Trim() }
            if ($lines[$j] -match '^\s*Why:\s*(.+)$') { $why = $matches[1].Trim() }
            if ($lines[$j] -match '^\s*Pipeline:\s*(.+)$' -and -not $why) { $why = $matches[1].Trim() }
            if ($lines[$j] -match '^\s*Contest/source:\s*(.+)$') { $contestSource = $matches[1].Trim() }
            if ($lines[$j] -match '^\s*Source:\s*(.+)$') { $sourceTypeHint = $matches[1].Trim() }
            if ($lines[$j] -match '^\s*Editorial:\s*(.+)$') { $editorial = $matches[1].Trim() }
            if ($lines[$j] -match '^\s*Thinking:\s*([1-5])\s*$') { $thinkingHint = [int]$matches[1] }
            if ($lines[$j] -match '^\s*Implementation:\s*([1-5])\s*$') { $implementationHint = [int]$matches[1] }
            if ($lines[$j] -match '^\s*Hours:\s*([0-9]+(\.[0-9]+)?)\s*$') { $expectedHours = [double]$matches[1] }
            $j++
        }

        $owner = if ($ownerMap.ContainsKey($name)) { $ownerMap[$name] } else { $folder }
        if ($owner -ne $folder) { continue }
        $tasks.Add([pscustomobject]@{
            Id = $taskId
            Folder = $folder
            Topic = $topic
            Tier = $tier
            Name = $name
            Url = $url
            Technique = $key
            Description = (($key, $why | Where-Object { $_ }) -join ' | ')
            ContestSource = $contestSource
            Editorial = $editorial
            Why = $why
            SourceTypeHint = $sourceTypeHint
            ThinkingHint = $thinkingHint
            ImplementationHint = $implementationHint
            ExpectedHours = $expectedHours
            Source = $path.Substring($cpRoot.Length + 1)
        })
        $taskId++
    }
}

# Virtual Contest schedule (used inline as Contest/Upsolve rows in the spiral).
$virtualSpecs = @(
    @('Southern 2021','Southern','https://oj.vnoi.info/contest/icpc21_mn'),
    @('Southern 2022','Southern','https://oj.vnoi.info/contest/icpc22_mn'),
    @('Southern 2023','Southern','https://oj.vnoi.info/contest/icpc23_mn'),
    @('Southern 2024','Southern','https://oj.vnoi.info/contest/icpc24_mn'),
    @('Southern 2025','Southern','https://oj.vnoi.info/contest/icpc25_mn'),
    @('National 2021','National','https://oj.vnoi.info/contest/icpc21_national'),
    @('National 2022','National','https://oj.vnoi.info/contest/icpc22_national'),
    @('National 2023','National','https://oj.vnoi.info/contest/icpc23_national'),
    @('National 2024','National','https://oj.vnoi.info/contest/icpc24_national'),
    @('National 2025','National','https://oj.vnoi.info/contest/icpc25_national'),
    @('Regional 2021','Regional','https://oj.vnoi.info/contest/icpc21_regional_m'),
    @('Regional 2022','Regional','https://oj.vnoi.info/contest/icpc22_regional'),
    @('Regional 2023','Regional','https://oj.vnoi.info/contest/icpc23_regional'),
    @('Regional 2024','Regional','https://oj.vnoi.info/contest/icpc24_regional'),
    @('Regional 2025','Regional','https://oj.vnoi.info/contest/icpc25_regional')
)

$apacVirtualSpecs = @(
    @('APAC 2024','APAC','https://fileserv.icpc.jp/championship2024/tasks.pdf'),
    @('APAC 2025','APAC','https://fileserv.icpc.jp/championship2025/problemset.pdf'),
    @('APAC 2026','APAC','https://apac.icpc.global/assets/championship/2026/problemset.pdf')
)

$lateRegionalVirtualSpecs = @{
    16 = @('Chengdu Regional 2025','Regional','https://contest.ucup.ac/contest/2567?v=1')
    17 = @('Nanjing Regional 2025','Regional','https://contest.ucup.ac/contest/2581?v=1')
    18 = @('Shenyang Regional 2025','Regional','https://contest.ucup.ac/contest/2641?v=1')
    19 = @('Shanghai Regional 2025','Regional','https://contest.ucup.ac/contest/2908?v=1')
}

$topicRows = @(
    @('00 - Implementation, Greedy, Search','P0','','Sorting, prefix, two pointers, greedy, binary search, simulation','MITM, local contribution, casework','3 easy tasks inside 90 minutes; no overflow/reset/indexing error'),
    @('01 - Graph and Modeling','P0/P1','','Shortest path, SCC, low-link, MST, 2-SAT, flow/matching','Block-cut tree, functional graph, bitset DAG, min-cost flow','Dijkstra/SCC/low-link/Dinic from scratch; one modeling pipeline AC'),
    @('02 - Data Structures','P0/P2','','Fenwick, lazy segment tree, sparse table, order statistic','Persistent, Beats, Mo, rollback/PBS','Lazy assign/add from scratch; persistence AC; owner rollback/PBS'),
    @('03 - Tree','P0/P1','','LCA, Euler, rerooting, HLD, path difference','DSU on tree, centroid, virtual tree','LCA/Euler/HLD from scratch; reroot AC; one advanced owner'),
    @('04 - Advanced DP','P0/P1','','Interval, bitmask, digit, profile, tree DP','CHT, D&C, Knuth, WQS','One AC per core type; explain optimization conditions'),
    @('05 - Math and Counting','P0/P2','','Modular, CRT, combinatorics, sieve, inclusion-exclusion','Mobius/phi, floor sum, NTT, Gaussian/XOR basis','Formula derived and brute checked; one advanced owner'),
    @('06 - Strings','P0/P1','','KMP/Z/hash, trie/Aho, suffix array/LCP','Suffix automaton, Manacher, automaton DP','KMP/Z/hash from scratch; Aho AC; suffix-array AC'),
    @('07 - Geometry','P1','','Orientation, intersection, polygon, hull, sweep','Calipers, circle, precision','Integer primitives pass edge cases; hull + sweep AC'),
    @('08 - Proof, Constructive, Game','P1','','Exchange argument, invariant, necessary/sufficient','SG, tree game, hard constructive','Two written greedy proofs; brute-small-to-proof workflow')
)

$timelineWorkTypes = @('Learn','Hard','Review','Sprint','Contest','Upsolve')

# ---------------------------------------------------------------------------
# SPIRAL / interleaved scheduling.
# Each week mixes a Main topic, a Secondary topic, manual Review rows, plus
# (on full weeks) one Contest and one Upsolve row in the SAME timeline.
# Per-folder task queues are tier-sorted, so consuming them front-to-back makes
# difficulty climb across cycles (cycle 1 ~ tier A-B, later cycles ~ C-D-E).
# ---------------------------------------------------------------------------
$tierRank = @{ 'A' = 0; 'B' = 1; 'C' = 2; 'D' = 3; 'E' = 4 }
$stageByTier = @{
    'A' = '1 Nen tang'
    'B' = '2 Core'
    'C' = '3 Nang cao'
    'D' = '4 ICPC thuc chien'
    'E' = '5 Gym / OI stretch'
}
$hoursByTier = @{ 'A' = 1.5; 'B' = 2.5; 'C' = 4.0; 'D' = 5.0; 'E' = 5.5 }

$weekStart = Get-Date '2026-07-20'   # First full training week after exams (no rows before 17/07/2026)

# Map folder prefix (00..08) -> folder name and topic display name.
$folderByPrefix = @{}
$topicByFolder = @{}
foreach ($t in $tasks) {
    $folderByPrefix[$t.Folder.Substring(0,2)] = $t.Folder
    $topicByFolder[$t.Folder] = $t.Topic
}

# 9-week rotation of (main, secondary, old topic) by folder prefix.
# The third entry is kept as a reminder of the last covered topic, but Review
# rows are manual self-practice rather than new submit tasks.
$rotation = @(
    @('00','01','00'),
    @('01','02','00'),
    @('02','04','01'),
    @('04','03','02'),
    @('03','06','04'),
    @('06','05','01'),
    @('05','07','02'),
    @('07','08','04'),
    @('08','01','06')
)

function Get-PhaseBudget([int]$wk) {
    $wkFrom = $weekStart.AddDays(7 * ($wk - 1))
    if ($wkFrom.Date -eq (Get-Date '2026-11-30').Date) {
        # Week before Regional: lighter, no new virtual. Patch weak points and keep hands warm.
        return @{ Cap = 22; Main = 0; Secondary = 0; Problem = 0; Sprint = 4; Review = 18; Contest = $false; ContestHours = 0; UpsolveHours = 0 }
    }
    if ($wkFrom.Date -eq (Get-Date '2026-12-07').Date) {
        # Regional week: real taper. No fresh hard task, no virtual.
        return @{ Cap = 10; Main = 0; Secondary = 0; Problem = 0; Sprint = 4; Review = 6; Contest = $false; ContestHours = 0; UpsolveHours = 0 }
    }
    if ($wk -le 8) {
        # Summer camp mode: anh is all-in during the first 8 weeks after exams.
        return @{ Cap = 45; Main = 16; Secondary = 11; Problem = 27; Sprint = 4; Review = 4; Contest = $true; ContestHours = 5; UpsolveHours = 5 }
    }
    # Summer load: average 5h/day ~= 35h/week.
    # Four goals: 4h review, 17h Learn/Hard tasks, 4h sprint, 10h contest/upsolve.
    return @{ Cap = 35; Main = 10; Secondary = 7; Problem = 17; Sprint = 4; Review = 4; Contest = $true; ContestHours = 5; UpsolveHours = 5 }
}

function Get-TaskHours($Task) {
    $tier = $Task.Tier.Substring(0,1)
    $base = $hoursByTier[$tier]
    if ($tier -eq 'D') { $base = 5.5 }
    if ($tier -eq 'E') { $base = 7.0 }
    $thinking = Get-ThinkingScore $Task
    $implementation = Get-ImplementationScore $Task
    if ($thinking -ge 5 -or $implementation -ge 5) { $base = [Math]::Max($base, 5.5) }
    if ((Get-SourceType $Task) -in @('OI / oj.uz','QOJ / Universal Cup','Codeforces Gym') -and $tier -in @('D','E')) {
        $base = [Math]::Max($base, 7.0)
    }
    return $base
}

function Get-PlannedHours($Task) {
    if ($Task.ExpectedHours) { return [double]$Task.ExpectedHours }
    return Get-TaskHours $Task
}

function Get-SourceType($Item) {
    if ($Item.SourceTypeHint) { return $Item.SourceTypeHint }
    if ($Item.Url -match 'oj\.uz') { return 'OI / oj.uz' }
    if ($Item.Url -match 'contest\.ucup\.ac|qoj\.ac') { return 'QOJ / Universal Cup' }
    if ($Item.Url -match 'codeforces\.com/gym') { return 'Codeforces Gym' }
    if ($Item.Url -match 'open\.kattis\.com|icpc\.kattis\.com') { return 'Kattis ICPC' }
    if ($Item.Name -match '^ICPC' -or $Item.Url -match 'icpc') { return 'ICPC / VNOI' }
    if ($Item.Url -match 'codeforces\.com') { return 'Codeforces' }
    if ($Item.Url -match 'cses\.fi') { return 'CSES' }
    if ($Item.Url -match 'spoj\.com') { return 'SPOJ' }
    if ($Item.Url -match 'oj\.vnoi\.info') { return 'VNOJ / FreeContest' }
    return 'Other judge'
}

function Get-ThinkingScore($Item) {
    if ($Item.ThinkingHint) { return [int]$Item.ThinkingHint }
    $tier = $Item.Tier.Substring(0,1)
    $score = switch ($tier) { 'A' { 2 } 'B' { 3 } 'C' { 4 } 'D' { 4 } 'E' { 5 } default { 3 } }
    $text = "$($Item.Topic) $($Item.Technique) $($Item.Name)"
    if ($text -match 'proof|constructive|invariant|game|counting|combinatorics|Mobius|CRT|Gaussian|XOR basis|digit|optimization|WQS|convex|geometry|sweep|flow|matching|min-cut') {
        $score = [Math]::Max($score, 4)
    }
    if ($Item.Url -match 'oj\.uz') { $score = 5 }
    return [Math]::Min($score, 5)
}

function Get-ImplementationScore($Item) {
    if ($Item.ImplementationHint) { return [int]$Item.ImplementationHint }
    $tier = $Item.Tier.Substring(0,1)
    $score = switch ($tier) { 'A' { 2 } 'B' { 3 } 'C' { 4 } 'D' { 4 } 'E' { 5 } default { 3 } }
    $text = "$($Item.Topic) $($Item.Technique) $($Item.Name)"
    if ($text -match 'Segment Tree Beats|persistent|rollback|parallel binary search|Dinic|min-cost|HLD|virtual tree|suffix array|automaton|Aho|Li Chao|2D|sweep|profile|bitset|heavy|long-implementation') {
        $score = [Math]::Max($score, 4)
    }
    if ($Item.Url -match 'oj\.uz') { $score = 5 }
    return [Math]::Min($score, 5)
}

function Get-PracticeType($Task) {
    $tier = $Task.Tier.Substring(0,1)
    $thinking = Get-ThinkingScore $Task
    $implementation = Get-ImplementationScore $Task
    if ($tier -in @('D','E') -or $thinking -ge 5 -or $implementation -ge 5 -or ($thinking + $implementation) -ge 9 -or (Get-PlannedHours $Task) -ge 5.0) {
        return 'Hard'
    }
    return 'Learn'
}

function New-TimelineProblemRow($Task, [string]$WorkType, [int]$Week, [datetime]$WeekFrom, [datetime]$WeekTo, [string]$MainTopic, [string]$SecondaryTopic, [int]$Order) {
    $tier = $Task.Tier.Substring(0,1)
    $hours = Get-PlannedHours $Task
    return [pscustomobject]@{
        Order = $Order; Week = $Week; WeekFrom = $WeekFrom; WeekTo = $WeekTo
        WorkType = $WorkType; MainTopic = $MainTopic; SecondaryTopic = $SecondaryTopic
        Topic = $Task.Topic; Stage = $stageByTier[$tier]; Tier = $Task.Tier
        Name = $Task.Name; Technique = $Task.Technique; SourceType = Get-SourceType $Task
        Thinking = Get-ThinkingScore $Task; Implementation = Get-ImplementationScore $Task
        ContestSource = $Task.ContestSource
        Editorial = if ($Task.Editorial) { $Task.Editorial } else { 'See official statement/source page or contest editorial when available.' }
        Why = if ($Task.Why) { $Task.Why } elseif ($Task.Description) { $Task.Description } else { 'Selected for this topic pipeline.' }
        Url = $Task.Url; Hours = $hours; UpsolveUrl = ''
    }
}

function New-ManualRow([string]$WorkType, [string]$Name, [string]$Technique, [double]$Hours, [int]$Week, [datetime]$WeekFrom, [datetime]$WeekTo, [string]$MainTopic, [string]$SecondaryTopic, [int]$Order, [string]$Why, [string]$Editorial = '') {
    return [pscustomobject]@{
        Order = $Order; Week = $Week; WeekFrom = $WeekFrom; WeekTo = $WeekTo
        WorkType = $WorkType; MainTopic = $MainTopic; SecondaryTopic = $SecondaryTopic
        Topic = $WorkType; Stage = $WorkType; Tier = $WorkType
        Name = $Name; Technique = $Technique; SourceType = 'Self practice'; ContestSource = ''
        Thinking = 3; Implementation = 4; Editorial = $Editorial; Why = $Why
        Url = ''; Hours = $Hours; UpsolveUrl = ''
    }
}

function Test-CanScheduleTask($Task, [double]$Remaining, [bool]$PreRegional, [int]$HardCount, [double]$HardHours) {
    $hours = Get-PlannedHours $Task
    if ($hours -gt ($Remaining + 0.001)) { return $false }
    if (-not $PreRegional) { return $true }
    if ((Get-PracticeType $Task) -ne 'Hard') { return $true }
    $hardLimit = if ($script:CurrentHardLimit) { [int]$script:CurrentHardLimit } else { 2 }
    $hardHourLimit = if ($script:CurrentHardHourLimit) { [double]$script:CurrentHardHourLimit } else { 13.0 }
    if ($HardCount -ge $hardLimit) { return $false }
    if ($HardCount -ge 1 -and ($HardHours + $hours) -gt $hardHourLimit) { return $false }
    return $true
}

function Try-TakeFromQueue($Queue, [double]$Remaining, [bool]$PreRegional, [int]$HardCount, [double]$HardHours) {
    if ($null -eq $Queue -or $Queue.Count -eq 0) { return $null }
    $skipped = [System.Collections.Generic.List[object]]::new()
    $rest = [System.Collections.Generic.List[object]]::new()
    $picked = $null

    while ($Queue.Count -gt 0) {
        $candidate = $Queue.Dequeue()
        if (Test-CanScheduleTask $candidate $Remaining $PreRegional $HardCount $HardHours) {
            $picked = $candidate
            break
        }
        [void]$skipped.Add($candidate)
    }
    while ($Queue.Count -gt 0) {
        [void]$rest.Add($Queue.Dequeue())
    }
    foreach ($task in $skipped) { $Queue.Enqueue($task) }
    foreach ($task in $rest) { $Queue.Enqueue($task) }
    return $picked
}

function Add-ReviewRows($Timeline, [double]$ReviewHours, [int]$Week, [datetime]$WeekFrom, [datetime]$WeekTo, [string]$MainTopic, [string]$SecondaryTopic, [ref]$OrderRef) {
    if ($ReviewHours -le 0) { return }
    if ($ReviewHours -le 4.0) {
        $OrderRef.Value++
        $Timeline.Add((New-ManualRow 'Review' 'Review +7: repair recent AC/WA' 'Pick one recent slow AC, repeated bug, or near-AC' 1.5 $Week $WeekFrom $WeekTo $MainTopic $SecondaryTopic $OrderRef.Value 'Use the last 7 days. Notes: Target | Outline min | First compile min | AC/final min | WA/RE | Bug class | Stress Y/N.'))
        $remaining = $ReviewHours - 1.5
        if ($remaining -gt 0.001) {
            $OrderRef.Value++
            $Timeline.Add((New-ManualRow 'Review' 'Review +21: high-transfer re-solve' 'Write invariant first, then re-code without old code' $remaining $Week $WeekFrom $WeekTo $MainTopic $SecondaryTopic $OrderRef.Value 'Pick the highest-transfer task from three weeks ago. Keep old code closed for the first 25 minutes; mark Recall-only if the invariant cannot be reconstructed.'))
        }
        return
    }

    $left = $ReviewHours
    $reviewIndex = 1
    while ($left -gt 0.001) {
        $chunk = [Math]::Min(3.0, $left)
        $name = if ($reviewIndex % 2 -eq 1) { 'Taper review: weak-topic patch' } else { 'Taper review: re-code old hard implementation' }
        $technique = if ($reviewIndex % 2 -eq 1) { 'Notes, templates, missed observations' } else { 'Known solution from memory + stress test' }
        $why = if ($reviewIndex % 2 -eq 1) { 'Patch weak patterns without opening a fresh hard problem.' } else { 'Keep implementation hands warm without adding new problem debt.' }
        $OrderRef.Value++
        $Timeline.Add((New-ManualRow 'Review' $name $technique $chunk $Week $WeekFrom $WeekTo $MainTopic $SecondaryTopic $OrderRef.Value $why))
        $left -= $chunk
        $reviewIndex++
    }
}

$learnSupportByWeek = @{
    1  = @{ Name='Template hygiene: compile-all smoke'; Hours=2.0; Reading='https://wiki.vnoi.info/algo/skill/sinh-test-new'; Output='Compile the contest kit under gnu++20; repair warnings and run DSU/Dijkstra smoke tests.' }
    2  = @{ Name='Fenwick + lazy segment tree stress'; Hours=2.5; Reading='https://usaco.guide/gold/PURS'; Output='Run 30 randomized add/assign/query tests against a brute array; record invariant failures.' }
    3  = @{ Name='Subset DP + submask sanity'; Hours=3.0; Reading='https://usaco.guide/gold/dp-bitmasks'; Output='Rebuild submask/SOS loops and compare against brute for n <= 16 on 20 seeds.' }
    4  = @{ Name='Tree path toolkit hardening'; Hours=3.0; Reading='https://usaco.guide/gold/tree-euler'; Output='Rebuild LCA, Euler order and path-difference helpers; verify on 30 random trees.' }
    5  = @{ Name='KMP/Z/prefix-function regression'; Hours=4.0; Reading='https://usaco.guide/adv/string-search'; Output='Implement KMP and Z from blank; run 30 random border/matching comparisons and write when-to-use notes.' }
    6  = @{ Name='CRT + rolling-hash self-test'; Hours=4.0; Reading='https://cp-algorithms.com/algebra/chinese-remainder-theorem.html'; Output='Stress CRT merges and double hash on random small cases; document overflow and collision traps.' }
    7  = @{ Name='Convex hull + XOR basis harness'; Hours=4.0; Reading='https://usaco.guide/adv/xor-basis'; Output='Check hull/diameter and XOR-basis answers against brute on random small inputs.' }
    8  = @{ Name='Rerooting + invariant notebook'; Hours=4.0; Reading='https://usaco.guide/gold/all-roots'; Output='Build a reroot skeleton and rewrite three constructive tasks as state/move/invariant/terminal notes.' }
    9  = @{ Name='Dinic + min-cut certificate'; Hours=4.0; Reading='https://cp-algorithms.com/graph/dinic.html'; Output='Implement Dinic from blank and verify 30 random min-cuts against brute enumeration.' }
    10 = @{ Name='Matching toolkit + random checker'; Hours=4.0; Reading='https://cp-algorithms.com/graph/kuhn_maximum_bipartite_matching.html'; Output='Implement Kuhn and Hopcroft-Karp APIs; compare on 30 random bipartite graphs.' }
    11 = @{ Name='Low-link decomposition stress'; Hours=4.0; Reading='https://cp-algorithms.com/graph/bridge-searching.html'; Output='Implement bridges/articulation and compare with edge/vertex removal brute checks.' }
    12 = @{ Name='Segment Tree Beats survival kit'; Hours=4.0; Reading='https://usaco.guide/adv/segtree-beats'; Output='Rebuild the template, run a brute comparator, and save ten killer cases plus failure notes.' }
    13 = @{ Name='DP optimization condition sheet'; Hours=4.0; Reading='https://cp-algorithms.com/dynamic_programming/divide-and-conquer-dp.html'; Output='Write the conditions for D&C/CHT/Knuth and validate one tiny recurrence for each applicable method.' }
    14 = @{ Name='HLD + virtual tree hardening'; Hours=4.0; Reading='https://cp-algorithms.com/graph/hld.html'; Output='Rebuild HLD and virtual-tree builders; test path queries and LCA closure on random trees.' }
    15 = @{ Name='Aho-Corasick + suffix toolkit'; Hours=4.0; Reading='https://cp-algorithms.com/string/aho_corasick.html'; Output='Implement AC fail aggregation and SA/LCP wrappers; compare query answers with brute strings.' }
    16 = @{ Name='NTT + modular convolution checks'; Hours=4.0; Reading='https://cp-algorithms.com/algebra/fft.html'; Output='Implement forward/inverse NTT and compare 30 random convolutions with O(n^2).' }
    17 = @{ Name='Geometry sweep-line sanity pack'; Hours=4.0; Reading='https://cp-algorithms.com/geometry/intersecting_segments.html'; Output='Document event ordering and active-set invariants; run crafted degeneracy cases under sanitizers.' }
    18 = @{ Name='Sprague-Grundy + MITM pack'; Hours=4.0; Reading='https://cp-algorithms.com/game_theory/sprague-grundy-nim.html'; Output='Verify SG on random DAG games and benchmark split-enumerate helpers on three toy models.' }
    19 = @{ Name='Regional template freeze + timing drill'; Hours=4.0; Reading='https://wiki.vnoi.info/algo/skill/sinh-test-new'; Output='Compile the final kit, run smoke tests, then time Dinic/HLD/AC re-codes from blank.' }
}

function Add-PlannedLearnSupportRow($Timeline, [int]$Week, [datetime]$WeekFrom, [datetime]$WeekTo, [string]$MainTopic, [string]$SecondaryTopic, [ref]$OrderRef) {
    if (-not $learnSupportByWeek.ContainsKey($Week)) { return }
    $spec = $learnSupportByWeek[$Week]
    $OrderRef.Value++
    $Timeline.Add((New-ManualRow 'Learn' $spec.Name $spec.Output ([double]$spec.Hours) $Week $WeekFrom $WeekTo $MainTopic $SecondaryTopic $OrderRef.Value "Concrete deliverable: $($spec.Output)" $spec.Reading))
}

# Keep CSES as primitive/template warm-up only. The bank can still document
# legacy CSES tasks, but the generated training timeline must be Gym/OI/ICPC-heavy.
$folderTargets = @{
    '00_implementation_greedy_search' = 18
    '01_graph_modeling' = 26
    '02_data_structures' = 24
    '03_tree' = 24
    '04_dp_advanced' = 26
    '05_math_counting' = 22
    '06_strings' = 20
    '07_geometry' = 22
    '08_proof_constructive_game' = 25
}
$sourceCaps = @{
    'CSES' = 10
    'Codeforces' = 15
    'SPOJ' = 5
    'Other judge' = 5
}

function Get-SourceRank($Task) {
    $src = Get-SourceType $Task
    if ($src -eq 'QOJ / Universal Cup') { return 0 }
    if ($src -eq 'Codeforces Gym') { return 1 }
    if ($src -eq 'OI / oj.uz') { return 2 }
    if ($src -eq 'Kattis ICPC') { return 3 }
    if ($src -eq 'ICPC / VNOI') { return 4 }
    if ($src -eq 'Codeforces') { return 5 }
    if ($src -eq 'SPOJ') { return 6 }
    if ($src -eq 'Other judge') { return 7 }
    if ($src -eq 'CSES') { return 8 }
    return 9
}

function Test-CanKeepTask($Task, $KeptBySource, $SourceCaps) {
    $src = Get-SourceType $Task
    if (-not $KeptBySource.ContainsKey($src)) { $KeptBySource[$src] = 0 }
    if ($SourceCaps.ContainsKey($src) -and $KeptBySource[$src] -ge $SourceCaps[$src]) { return $false }
    return $true
}

function Add-SelectedTask($Task, $Selected, $SelectedIds, $KeptBySource) {
    if ($SelectedIds.Contains($Task.Id)) { return }
    [void]$Selected.Add($Task)
    [void]$SelectedIds.Add($Task.Id)
    $src = Get-SourceType $Task
    if (-not $KeptBySource.ContainsKey($src)) { $KeptBySource[$src] = 0 }
    $KeptBySource[$src]++
}

$keptBySource = @{}
$filteredTasks = [System.Collections.Generic.List[object]]::new()
foreach ($folder in ($folderTargets.Keys | Sort-Object)) {
    $target = $folderTargets[$folder]
    $selected = [System.Collections.Generic.List[object]]::new()
    $selectedIds = [System.Collections.Generic.HashSet[int]]::new()
    $folderTasks = @($tasks | Where-Object { $_.Folder -eq $folder })

    # Keep one primitive CSES warm-up per topic, then fill from
    # QOJ/Gym/OJ/Kattis/ICPC sources.
    foreach ($task in ($folderTasks |
            Where-Object { (Get-SourceType $_) -eq 'CSES' -and $_.Tier.StartsWith('A') } |
            Sort-Object Id | Select-Object -First 1)) {
        if ($selected.Count -ge $target) { break }
        if (Test-CanKeepTask $task $keptBySource $sourceCaps) {
            Add-SelectedTask $task $selected $selectedIds $keptBySource
        }
    }

    foreach ($task in ($folderTasks |
            Sort-Object @{ Expression = { Get-SourceRank $_ } },
                        @{ Expression = { $tierRank[$_.Tier.Substring(0,1)] } },
                        Id)) {
        if ($selected.Count -ge $target) { break }
        if ($selectedIds.Contains($task.Id)) { continue }
        if (-not (Test-CanKeepTask $task $keptBySource $sourceCaps)) { continue }
        Add-SelectedTask $task $selected $selectedIds $keptBySource
    }

    foreach ($task in ($selected | Sort-Object @{ Expression = { $tierRank[$_.Tier.Substring(0,1)] } }, Id)) {
        [void]$filteredTasks.Add($task)
    }
}
$tasks = $filteredTasks

function Test-PostRegionalTask($Task) {
    $text = "$($Task.Name) $($Task.ContestSource) $($Task.Url)"
    if ($Task.Name -eq 'IOI 2021 - Mutating DNA') { return $false }
    if ($Task.ContestSource -match '2025 ICPC Asia (Chengdu|Nanjing|Shenyang|Shanghai) Regional') { return $true }
    if ($text -match 'APAC') { return $true }
    if ($text -match 'IOI|APIO|JOI|JOISC|CEOI|BOI' -and $Task.Tier.Substring(0,1) -in @('D','E')) { return $true }
    if ($Task.Name -in @(
        'IOI 2018 - Werewolf',
        'IOI 2018 - Seats',
        'APIO 2018 - New Home',
        'JOI 2019 - Unique Cities',
        'JOISC 2021 - Meetings 2',
        'JOISC 2020 - Constellation 3',
        'IOI 2016 - Aliens',
        'APIO 2016 - Fireworks',
        'IOI 2021 - Game',
        'JOI 2018 - Candies',
        'IOI 2014 - Holiday',
        'IOI 2019 - Rectangles',
        'IOI 2023 - Longest Trip',
        'APIO 2021 - Road Closures',
        'APIO 2024 - September'
    )) { return $true }
    return $false
}

function Get-PreRegionalQueueRank($Task) {
    # One transferable OI anchor should appear before the generic Tier-E tail.
    if ($Task.Name -eq 'IOI 2021 - Mutating DNA') { return 3.5 }
    return [double]$tierRank[$Task.Tier.Substring(0,1)]
}

# Tier-sorted queue per folder, built after source caps are applied. Stretch OI/APAC
# tasks wait until after Regional; pre-Regional stays focused on Regional transfer.
$queues = @{}
$postRegionalQueues = @{}
foreach ($f in ($tasks | Select-Object -ExpandProperty Folder -Unique)) {
    $q = [System.Collections.Generic.Queue[object]]::new()
    $postQ = [System.Collections.Generic.Queue[object]]::new()
    foreach ($t in (@($tasks | Where-Object { $_.Folder -eq $f -and -not (Test-PostRegionalTask $_) }) |
            Sort-Object @{ Expression = { Get-PreRegionalQueueRank $_ } }, Id)) {
        $q.Enqueue($t)
    }
    foreach ($t in (@($tasks | Where-Object { $_.Folder -eq $f -and (Test-PostRegionalTask $_) }) |
            Sort-Object @{ Expression = { $tierRank[$_.Tier.Substring(0,1)] } }, Id)) {
        $postQ.Enqueue($t)
    }
    $queues[$f] = $q
    $postRegionalQueues[$f] = $postQ
}

function Get-RemainingQueueCount($Queues) {
    return ($Queues.Values | ForEach-Object { $_.Count } | Measure-Object -Sum).Sum
}

function Merge-PostRegionalQueues($Queues, $PostQueues) {
    foreach ($f in $PostQueues.Keys) {
        if (-not $Queues.ContainsKey($f)) {
            $Queues[$f] = [System.Collections.Generic.Queue[object]]::new()
        }
        while ($PostQueues[$f].Count -gt 0) {
            $Queues[$f].Enqueue($PostQueues[$f].Dequeue())
        }
    }
}

# Folders (other than the excluded ones) with tasks left, heaviest first - used
# as fallback so a week never goes near-empty just because its rotation folders
# are already drained.
function Get-FallbackQueues([string[]]$exclude) {
    $list = [System.Collections.Generic.List[object]]::new()
    foreach ($f in ($queues.Keys | Where-Object { $exclude -notcontains $_ } |
            Sort-Object @{ Expression = { $queues[$_].Count } } -Descending)) {
        if ($queues[$f].Count -gt 0) { [void]$list.Add($queues[$f]) }
    }
    return $list
}

$timeline = [System.Collections.Generic.List[object]]::new()
$order = 0
$week = 0
$contestPtr = 0
$apacContestPtr = 0
$prevContest = $null
$postRegionalMerged = $false
$maxTimelineWeeks = 40

while ($week -lt $maxTimelineWeeks -and ((Get-RemainingQueueCount $queues) + (Get-RemainingQueueCount $postRegionalQueues) -gt 0)) {
    $week++
    if (-not $postRegionalMerged -and $week -ge 22) {
        Merge-PostRegionalQueues $queues $postRegionalQueues
        $postRegionalMerged = $true
    }
    $budget = Get-PhaseBudget $week
    $rot = $rotation[($week - 1) % $rotation.Count]
    $mainFolder = $folderByPrefix[$rot[0]]
    $secFolder = $folderByPrefix[$rot[1]]
    $mainTopic = $topicByFolder[$mainFolder]
    $secTopic = $topicByFolder[$secFolder]
    $wkFrom = $weekStart.AddDays(7 * ($week - 1))
    $wkTo = $wkFrom.AddDays(6)
    $preRegional = $wkTo -le (Get-Date '2026-12-06')
    $script:CurrentHardLimit = if ($week -le 8) { 3 } else { 2 }
    $script:CurrentHardHourLimit = if ($week -le 8) { 20.0 } else { 13.0 }

    $supportHours = 0.0
    if ($preRegional -and $week -lt 20 -and $learnSupportByWeek.ContainsKey($week)) {
        $supportHours = [double]$learnSupportByWeek[$week].Hours
    }
    $taskBudget = [Math]::Max(0.0, [double]$budget.Problem - $supportHours)

    $problemUsed = 0.0
    $hardCount = 0
    $hardHours = 0.0
    $slotUsed = @{ Main = 0.0; Secondary = 0.0 }
    $slotDefs = @(
        @{ Name = 'Main';      Work = 'Task';      Folder = $mainFolder; Target = [double]$budget.Main },
        @{ Name = 'Secondary'; Work = 'Task';      Folder = $secFolder;  Target = [double]$budget.Secondary }
    )
    $slotIndex = 0

    while ($problemUsed -lt ($taskBudget - 0.001)) {
        $remaining = $taskBudget - $problemUsed
        $picked = $null
        $pickedWork = 'Task'

        for ($attempt = 0; $attempt -lt $slotDefs.Count; $attempt++) {
            $slot = $slotDefs[($slotIndex + $attempt) % $slotDefs.Count]
            if ($slotUsed[$slot.Name] -ge $slot.Target -and $remaining -gt 7.0) { continue }
            $candidate = Try-TakeFromQueue $queues[$slot.Folder] $remaining $preRegional $hardCount $hardHours
            if ($null -ne $candidate) {
                $picked = $candidate
                $pickedWork = $slot.Work
                $slotUsed[$slot.Name] += Get-PlannedHours $picked
                $slotIndex = ($slotIndex + $attempt + 1) % $slotDefs.Count
                break
            }
        }

        if ($null -eq $picked) {
            $fallbackFolders = @($mainFolder,$secFolder) + @($queues.Keys | Where-Object { $_ -notin @($mainFolder,$secFolder) } | Sort-Object @{ Expression = { $queues[$_].Count } } -Descending)
            foreach ($f in $fallbackFolders) {
                $candidate = Try-TakeFromQueue $queues[$f] $remaining $preRegional $hardCount $hardHours
                if ($null -ne $candidate) {
                    $picked = $candidate
                    $pickedWork = 'Task'
                    break
                }
            }
        }

        if ($null -eq $picked) { break }
        $order++
        if ($pickedWork -eq 'Task') { $pickedWork = Get-PracticeType $picked }
        if ($pickedWork -eq 'Hard') {
            $hardCount++
            $hardHours += Get-PlannedHours $picked
        }
        $problemUsed += Get-PlannedHours $picked
        $timeline.Add((New-TimelineProblemRow $picked $pickedWork $week $wkFrom $wkTo $mainTopic $secTopic $order))
    }

    if ($preRegional -and $week -lt 20) {
        Add-PlannedLearnSupportRow $timeline $week $wkFrom $wkTo $mainTopic $secTopic ([ref]$order)
    }

    if ([double]$budget.Review -gt 0) {
        Add-ReviewRows $timeline ([double]$budget.Review) $week $wkFrom $wkTo $mainTopic $secTopic ([ref]$order)
    }

    if ([double]$budget.Sprint -gt 0) {
        $order++
        $timeline.Add((New-ManualRow 'Sprint' 'Sprint short: blank-file re-code' 'Re-code one accepted template/problem or repair one WA' 1.5 $week $wkFrom $wkTo $mainTopic $secTopic $order 'Notes: Target | Outline min | First compile min | AC/final min | WA/RE | Bug class | Stress Y/N. This is speed practice, not a fresh solve.'))
        $order++
        $timeline.Add((New-ManualRow 'Sprint' 'Sprint long: implementation + stress' 'Known medium/hard implementation, then brute/stress' ([double]$budget.Sprint - 1.5) $week $wkFrom $wkTo $mainTopic $secTopic $order 'Use 20-30 minutes for brute/stress. Notes: Target | Outline min | First compile min | AC/final min | WA/RE | Bug class | Stress Y/N.'))
    }

    # Contest + Upsolve rows live in the SAME timeline (full weeks only).
    if ($budget.Contest) {
        if ($lateRegionalVirtualSpecs.ContainsKey($week)) {
            $c = $lateRegionalVirtualSpecs[$week]
        } elseif ($week -ge 22 -and $apacVirtualSpecs.Count -gt 0) {
            $c = $apacVirtualSpecs[$apacContestPtr % $apacVirtualSpecs.Count]
            $apacContestPtr++
        } else {
            $c = $virtualSpecs[$contestPtr % $virtualSpecs.Count]
            $contestPtr++
        }
        $order++
        $timeline.Add([pscustomobject]@{
            Order = $order; Week = $week; WeekFrom = $wkFrom; WeekTo = $wkTo
            WorkType = 'Contest'; MainTopic = $mainTopic; SecondaryTopic = $secTopic
            Topic = 'Contest'; Stage = 'Contest'; Tier = "Set - $($c[1])"
            Name = "$($c[0]) (virtual 5h)"; Technique = 'Mixed set - simulate real contest'
            SourceType = 'Contest set'; ContestSource = $c[1]; Thinking = 4; Implementation = 4
            Editorial = ''; Why = 'Weekly 5h mixed set for contest conversion.'
            Url = $c[2]; Hours = [double]$budget.ContestHours; UpsolveUrl = ''
        })
        $up = if ($prevContest) { $prevContest } else { $c }
        $order++
        $timeline.Add([pscustomobject]@{
            Order = $order; Week = $week; WeekFrom = $wkFrom; WeekTo = $wkTo
            WorkType = 'Upsolve'; MainTopic = $mainTopic; SecondaryTopic = $secTopic
            Topic = 'Upsolve'; Stage = 'Upsolve'; Tier = "Set - $($up[1])"
            Name = "Upsolve: $($up[0])"; Technique = 'Editorial + re-implement missed problems'
            SourceType = 'Contest set'; ContestSource = $up[1]; Thinking = 4; Implementation = 4
            Editorial = ''; Why = 'Editorial pass and re-implementation of missed contest problems.'
            Url = ''; Hours = [double]$budget.UpsolveHours; UpsolveUrl = $up[2]
        })
        $prevContest = $c
    }
}

$studyStart = $weekStart
$totalWeeks = $week
$lastWeekTo = $weekStart.AddDays(7 * $totalWeeks - 1)

# Per-week hour totals + over-budget detection (acceptance: none should exceed).
$weekHours = @{}
foreach ($it in $timeline) {
    if (-not $weekHours.ContainsKey($it.Week)) { $weekHours[$it.Week] = 0.0 }
    $weekHours[$it.Week] += $it.Hours
}
$overBudget = [System.Collections.Generic.List[string]]::new()
foreach ($wk in ($weekHours.Keys | Sort-Object)) {
    $cap = (Get-PhaseBudget $wk).Cap
    if ($weekHours[$wk] -gt $cap + 0.001) { [void]$overBudget.Add("W$wk=$($weekHours[$wk])h>$cap") }
}

# Pre-Regional coverage per topic (cutoff 06/12/2026).
$regionalCutoff = Get-Date '2026-12-06'
$coverage = [System.Collections.Generic.List[object]]::new()
foreach ($tr in $topicRows) {
    $tp = $tr[0]
    $items = @($timeline | Where-Object { $_.Topic -eq $tp })
    $weeksSeen = @($items | Select-Object -ExpandProperty Week -Unique)
    $preItems = @($items | Where-Object { $_.WeekTo -le $regionalCutoff })
    $coverage.Add([pscustomobject]@{
        Topic = $tp; Tasks = $items.Count; Weeks = $weeksSeen.Count
        FirstWeek = if ($weeksSeen.Count) { ($weeksSeen | Measure-Object -Minimum).Minimum } else { 0 }
        PreRegional = $preItems.Count
    })
}

$excel = $null
$workbook = $null
try {
    $excel = New-Object -ComObject Excel.Application
    $excel.Visible = $false
    $excel.DisplayAlerts = $false
    $excel.ScreenUpdating = $false
    $workbook = $excel.Workbooks.Add()
    while ($workbook.Worksheets.Count -gt 1) { $workbook.Worksheets.Item($workbook.Worksheets.Count).Delete() }

    $dashboard = $workbook.Worksheets.Item(1)
    $dashboard.Name = 'Dashboard'

    $profileSheet = $workbook.Worksheets.Add($null, $workbook.Worksheets.Item($workbook.Worksheets.Count))
    $profileSheet.Name = 'Profile Basis'
    
    $solo = $workbook.Worksheets.Add($null, $workbook.Worksheets.Item($workbook.Worksheets.Count))
    $solo.Name = 'Solo Timeline'

    $weeklySheet = $workbook.Worksheets.Add($null, $workbook.Worksheets.Item($workbook.Worksheets.Count))
    $weeklySheet.Name = 'Weekly Brief'

    $linksSheet = $workbook.Worksheets.Add($null, $workbook.Worksheets.Item($workbook.Worksheets.Count))
    $linksSheet.Name = 'All Links'

    $sourceSheet = $workbook.Worksheets.Add($null, $workbook.Worksheets.Item($workbook.Worksheets.Count))
    $sourceSheet.Name = 'Sources'

    $listSheet = $workbook.Worksheets.Add($null, $workbook.Worksheets.Item($workbook.Worksheets.Count))
    $listSheet.Name = 'Lists'

    $navy = Get-Color 28 47 65
    $teal = Get-Color 22 112 107
    $orange = Get-Color 224 122 57
    $green = Get-Color 53 134 83
    $red = Get-Color 194 65 65
    $white = Get-Color 255 255 255
    $border = Get-Color 205 215 218
    $muted = Get-Color 93 110 116

    foreach ($sheet in @($dashboard,$profileSheet,$solo,$weeklySheet,$linksSheet,$sourceSheet,$listSheet)) {
        $sheet.Cells.Font.Name = 'Segoe UI'
        $sheet.Cells.Font.Size = 10
    }

    Write-Rows $listSheet 1 1 @(
        @('Status','Upsolve','Work Type'),
        @('Not started','No','Learn'),
        @('Solving','Yes','Hard'),
        @('AC','Done','Review'),
        @('Upsolve','','Sprint'),
        @('Retry','','Contest'),
        @('Skip','','Upsolve')
    )
    $workbook.Names.Add('SoloStatusList','=Lists!$A$2:$A$7') | Out-Null
    $workbook.Names.Add('UpsolveList','=Lists!$B$2:$B$4') | Out-Null
    $workbook.Names.Add('WorkTypeList','=Lists!$C$2:$C$7') | Out-Null

    # Profile Basis
    $profileSheet.Range('A1:F2').Merge()
    $profileSheet.Range('A1').Value2 = 'PROFILE BASIS - WHY THIS PLAN STARTS ABOVE BEGINNER LEVEL'
    Set-Header $profileSheet.Range('A1:F2') $navy $white
    $profileSheet.Range('A1').Font.Size = 18

    Write-Rows $profileSheet 4 1 @(
        @('Account','Current / max','Evidence','Solved','Last active / rank','Planning implication'),
        @('Codeforces: Average2k7','1789 / 1790 (Expert)','20 rated contests','123 unique','Active 09 Jun 2026','Current form; use as primary rating signal'),
        @('Codeforces: wibulord','1443 / 1516 (Specialist)','47 rated contests','412 unique','20/08/2024','Older, broader solved history'),
        @('Codeforces combined','533 unique','109 solved at 1800+; 18 at 2400+','max solved 3000','39 solves in last 90 days','Skip beginner classics; train conversion and weak topics'),
        @('VNOJ: khanhss','1412 / 1511 (Specialist)','402 solved; 63.59 points','402','#591 by points','Strong Vietnam/OI exposure; recent public submissions checked')
    )
    Set-Header $profileSheet.Range('A4:F4') $teal $white
    Add-Table $profileSheet $profileSheet.Range('A4:F8') 'ProfileAccountsTable' 'TableStyleMedium4' | Out-Null

    Write-Rows $profileSheet 11 1 @(
        @('Area','CF 1800+ evidence','Assessment','Action in this schedule'),
        @('Data structures','60 solved','Strong','No basic Fenwick/segment-tree drill; persistence and offline DS remain'),
        @('DP','43 solved','Strong','Keep profile/automaton/heavy modeling, skip elementary DP'),
        @('Math','38 solved','Strong','Keep CRT/counting/NTT transfer, not routine modular arithmetic'),
        @('Flow / min-cut','0 tagged solves','Priority gap','Download Speed, Police Chase, Task Assignment, Delivery Bears, Joint Farm'),
        @('Geometry','2 tagged solves','Priority gap','Hull, rectangle sweep, Area Query, Fancy Fence'),
        @('Matching','1 tagged solve','Gap','School Dance and assignment modeling'),
        @('FFT / NTT','0 tagged solves','Gap','F-Convolution plus prerequisite counting work'),
        @('Game / proof','1 tagged solve','Gap','Number Game, Divisibility Grid, Group Raiding'),
        @('Contest conversion','Practice max 3000 vs rating 1789','Main performance gap','Deadlines, 2-3-session cap, mandatory upsolve/retry columns')
    )
    Set-Header $profileSheet.Range('A11:D11') $orange $white
    Add-Table $profileSheet $profileSheet.Range('A11:D20') 'ProfileGapsTable' 'TableStyleMedium9' | Out-Null

    Write-Rows $profileSheet 23 1 @(
        @('Public profile','URL'),
        @('Codeforces Average2k7','https://codeforces.com/profile/Average2k7'),
        @('Codeforces wibulord','https://codeforces.com/profile/wibulord'),
        @('VNOJ khanhss','https://oj.vnoi.info/user/khanhss')
    )
    Set-Header $profileSheet.Range('A23:B23') $teal $white
    for ($row = 24; $row -le 26; $row++) {
        $url = [string]$profileSheet.Cells($row,2).Value2
        $profileSheet.Hyperlinks.Add($profileSheet.Cells($row,2),$url,$null,'Open public profile',$url) | Out-Null
    }
    $profileSheet.Columns.Item('A').ColumnWidth = 28
    $profileSheet.Columns.Item('B').ColumnWidth = 28
    $profileSheet.Columns.Item('C').ColumnWidth = 35
    $profileSheet.Columns.Item('D').ColumnWidth = 26
    $profileSheet.Columns.Item('E').ColumnWidth = 25
    $profileSheet.Columns.Item('F').ColumnWidth = 48
    $profileSheet.Range('A4:F26').WrapText = $true
    $profileSheet.Range('A4:F26').VerticalAlignment = -4160
    Freeze-At $excel $profileSheet 4 1

    # Solo Timeline: Review/Learn/Hard/Sprint map directly to the four training goals.
    $headers = @('Week','Week from','Week to','Work type','Main topic','Secondary topic','Topic','Stage','Tier','Task name','Technique','Source type','Contest/source','Thinking','Implementation','Editorial/blog','Why this problem','Submit link','Expected hours','Status','AC date','WA count','Notes','Upsolve link','Retry +7','Retry +21')
    Write-Rows $solo 1 1 @(,$headers)
    $rows = [System.Collections.Generic.List[object[]]]::new()
    foreach ($item in $timeline) {
        $submit = if ($item.Url) { 'Submit' } else { '' }
        $upLabel = if ($item.UpsolveUrl) { 'Open set' } else { '' }
        $rows.Add(@($item.Week,$item.WeekFrom,$item.WeekTo,$item.WorkType,$item.MainTopic,$item.SecondaryTopic,$item.Topic,$item.Stage,$item.Tier,$item.Name,$item.Technique,$item.SourceType,$item.ContestSource,$item.Thinking,$item.Implementation,$item.Editorial,$item.Why,$submit,$item.Hours,'Not started','','','',$upLabel,'',''))
    }
    Write-Rows $solo 2 1 $rows
    $lastRow = $timeline.Count + 1
    Set-Header $solo.Range("A1:Z1") $navy $white
    for ($row = 2; $row -le $lastRow; $row++) {
        $item = $timeline[$row - 2]
        $solo.Cells($row,2).Value2 = $item.WeekFrom.ToOADate()
        $solo.Cells($row,3).Value2 = $item.WeekTo.ToOADate()
        if ($item.Url) {
            $solo.Hyperlinks.Add($solo.Cells($row,18),$item.Url,$null,'Open submit judge','Submit') | Out-Null
        }
        if ($item.UpsolveUrl) {
            $solo.Hyperlinks.Add($solo.Cells($row,24),$item.UpsolveUrl,$null,'Open contest set','Open set') | Out-Null
        }
        # Retry dates derive from AC date (column U).
        $solo.Cells($row,25).Formula = "=IF(U$row=`"`",`"`",U$row+7)"
        $solo.Cells($row,26).Formula = "=IF(U$row=`"`",`"`",U$row+21)"
    }
    $solo.Range("B2:C$lastRow").NumberFormat = 'dd/mm/yyyy'
    $solo.Range("U2:U$lastRow").NumberFormat = 'dd/mm/yyyy'
    $solo.Range("Y2:Z$lastRow").NumberFormat = 'dd/mm/yyyy'
    Add-ListValidation $solo.Range("T2:T$lastRow") '=SoloStatusList'
    Add-ListValidation $solo.Range("D2:D$lastRow") '=WorkTypeList'
    Add-Table $solo $solo.Range("A1:Z$lastRow") 'SoloTimelineTable' 'TableStyleMedium2' | Out-Null

    $solo.Columns.Item('A').ColumnWidth = 7
    $solo.Columns.Item('B:C').ColumnWidth = 12
    $solo.Columns.Item('D').ColumnWidth = 12
    $solo.Columns.Item('E:F').ColumnWidth = 22
    $solo.Columns.Item('G').ColumnWidth = 22
    $solo.Columns.Item('H').ColumnWidth = 17
    $solo.Columns.Item('I').ColumnWidth = 17
    $solo.Columns.Item('J').ColumnWidth = 36
    $solo.Columns.Item('K').ColumnWidth = 40
    $solo.Columns.Item('L').ColumnWidth = 17
    $solo.Columns.Item('M').ColumnWidth = 28
    $solo.Columns.Item('N:O').ColumnWidth = 12
    $solo.Columns.Item('P').ColumnWidth = 26
    $solo.Columns.Item('Q').ColumnWidth = 38
    $solo.Columns.Item('R').ColumnWidth = 11
    $solo.Columns.Item('S').ColumnWidth = 11
    $solo.Columns.Item('T').ColumnWidth = 13
    $solo.Columns.Item('U').ColumnWidth = 12
    $solo.Columns.Item('V').ColumnWidth = 9
    $solo.Columns.Item('W').ColumnWidth = 34
    $solo.Columns.Item('X').ColumnWidth = 11
    $solo.Columns.Item('Y:Z').ColumnWidth = 12
    $solo.Range("A2:Z$lastRow").WrapText = $true
    $solo.Range("A2:Z$lastRow").VerticalAlignment = -4160

    $solo.Range("T2:T$lastRow").FormatConditions.Delete()
    $fc = $solo.Range("T2:T$lastRow").FormatConditions.Add(1,3,'="AC"')
    $fc.Interior.Color = Get-Color 216 239 220
    $fc.Font.Color = $green
    $fc = $solo.Range("T2:T$lastRow").FormatConditions.Add(1,3,'="Retry"')
    $fc.Interior.Color = Get-Color 255 238 204
    $fc.Font.Color = Get-Color 145 92 15
    $fc = $solo.Range("T2:T$lastRow").FormatConditions.Add(1,3,'="Upsolve"')
    $fc.Interior.Color = Get-Color 255 204 204
    $fc.Font.Color = $red
    # Tint Contest/Upsolve/Sprint rows so the main training blocks are easy to scan.
    $fc = $solo.Range("A2:Z$lastRow").FormatConditions.Add(2,$null,'=$D2="Contest"')
    $fc.Interior.Color = Get-Color 218 232 244
    $fc = $solo.Range("A2:Z$lastRow").FormatConditions.Add(2,$null,'=$D2="Upsolve"')
    $fc.Interior.Color = Get-Color 252 244 224
    $fc = $solo.Range("A2:Z$lastRow").FormatConditions.Add(2,$null,'=$D2="Sprint"')
    $fc.Interior.Color = Get-Color 226 239 218
    Freeze-At $excel $solo 1 10

    # Weekly Brief: one row per week with what matters first.
    $weeklyHeaders = @('Week','Week from','Week to','Phase','Total hours','Urgent first','Required this week','Main tasks','Contest / Upsolve','Done check')
    Write-Rows $weeklySheet 1 1 @(,$weeklyHeaders)
    $weeklyRows = [System.Collections.Generic.List[object[]]]::new()
    foreach ($wk in ($timeline | Select-Object -ExpandProperty Week -Unique | Sort-Object)) {
        $weekNumber = [int]$wk
        $items = @($timeline | Where-Object { $_.Week -eq $wk } | Sort-Object Order)
        $wkFrom = $items[0].WeekFrom
        $wkTo = $items[0].WeekTo
        $hours = ($items | Measure-Object Hours -Sum).Sum
        $learn = @($items | Where-Object { $_.WorkType -eq 'Learn' })
        $hard = @($items | Where-Object { $_.WorkType -eq 'Hard' })
        $review = @($items | Where-Object { $_.WorkType -eq 'Review' })
        $sprint = @($items | Where-Object { $_.WorkType -eq 'Sprint' })
        $contest = @($items | Where-Object { $_.WorkType -eq 'Contest' } | Select-Object -First 1)
        $upsolve = @($items | Where-Object { $_.WorkType -eq 'Upsolve' } | Select-Object -First 1)
        $phase = if ($wk -le 19) { 'Regional build' } elseif ($wk -eq 20) { 'Regional taper -1' } elseif ($wk -eq 21) { 'Regional week' } else { 'Asia/APAC stretch' }
        $urgent = if ($wk -eq 20) {
            'No fresh problem. Patch weak topics, re-code old hard implementations, clean notes.'
        } elseif ($wk -eq 21) {
            'No fresh problem. Template sanity, sleep, light re-code only.'
        } elseif ($hard.Count -ge 2) {
            'Contest/upsolve first, then Hard rows. If debt exceeds 5h, postpone one fresh Hard.'
        } elseif ($hard.Count -eq 1) {
            'Contest/upsolve first, then the Hard row. Use remaining room for concrete Learn/Review/Sprint.'
        } else {
            'Contest/upsolve first. Keep minimum Review/Sprint; use Learn only when debt is under control.'
        }
        $required = "Review $($review.Count), Learn $($learn.Count), Hard $($hard.Count), Sprint $($sprint.Count)"
        $mainNames = @($items | Where-Object { $_.WorkType -in @('Learn','Hard') } | Select-Object -First 5 | ForEach-Object { "$($_.WorkType): $($_.Name)" }) -join "`n"
        if (-not $mainNames) { $mainNames = 'No fresh task this week.' }
        $contestText = (($contest | ForEach-Object { $_.Name }) + ($upsolve | ForEach-Object { $_.Name })) -join "`n"
        if (-not $contestText) { $contestText = 'No contest/upsolve; taper or recovery week.' }
        $doneCheck = if ($wk -le 19) {
            'Debt rule: 1 high-transfer miss => +2h upsolve from Learn; 2+ misses => freeze fresh Hard. Sprint metrics and bug class logged.'
        } elseif ($wk -le 21) {
            'No new debt; templates compile; weak-topic notes are short and usable.'
        } else {
            'Asia/APAC stretch notes kept; do not let stretch debt hide Regional basics.'
        }
        $weeklyRows.Add(@($weekNumber,$wkFrom,$wkTo,$phase,$hours,$urgent,$required,$mainNames,$contestText,$doneCheck))
    }
    Write-Rows $weeklySheet 2 1 $weeklyRows
    $weeklyLastRow = $weeklyRows.Count + 1
    Set-Header $weeklySheet.Range('A1:J1') $navy $white
    Add-Table $weeklySheet $weeklySheet.Range("A1:J$weeklyLastRow") 'WeeklyBriefTable' 'TableStyleMedium4' | Out-Null
    $weeklySheet.Range("B2:C$weeklyLastRow").NumberFormat = 'dd/mm/yyyy'
    $weeklySheet.Columns.Item('A').ColumnWidth = 7
    $weeklySheet.Columns.Item('B:C').ColumnWidth = 12
    $weeklySheet.Columns.Item('D').ColumnWidth = 18
    $weeklySheet.Columns.Item('E').ColumnWidth = 11
    $weeklySheet.Columns.Item('F').ColumnWidth = 48
    $weeklySheet.Columns.Item('G').ColumnWidth = 28
    $weeklySheet.Columns.Item('H').ColumnWidth = 52
    $weeklySheet.Columns.Item('I').ColumnWidth = 38
    $weeklySheet.Columns.Item('J').ColumnWidth = 44
    $weeklySheet.Range("A2:J$weeklyLastRow").WrapText = $true
    $weeklySheet.Range("A2:J$weeklyLastRow").VerticalAlignment = -4160
    Freeze-At $excel $weeklySheet 1 5

    # All Links: one searchable link index for submit, contest/upsolve, editorial/blog and solution notes.
    $linkHeaders = @('Week','Work type','Topic','Task / item','Submit link','Contest/Upsolve link','Editorial/blog','GitHub solution','Technique','Source type','Contest/source','Why')
    Write-Rows $linksSheet 1 1 @(,$linkHeaders)
    $linkRows = [System.Collections.Generic.List[object[]]]::new()
    foreach ($item in ($timeline | Sort-Object Week, Order)) {
        $submit = if ($item.Url) { 'Submit' } else { '' }
        $setLink = if ($item.UpsolveUrl) { 'Open set' } elseif ($item.WorkType -eq 'Contest' -and $item.Url) { 'Open set' } else { '' }
        $editorialText = if ($item.Editorial) { $item.Editorial } else { '' }
        $linkRows.Add(@($item.Week,$item.WorkType,$item.Topic,$item.Name,$submit,$setLink,$editorialText,'',$item.Technique,$item.SourceType,$item.ContestSource,$item.Why))
    }
    Write-Rows $linksSheet 2 1 $linkRows
    $linksLastRow = $linkRows.Count + 1
    Set-Header $linksSheet.Range('A1:L1') $navy $white
    Add-Table $linksSheet $linksSheet.Range("A1:L$linksLastRow") 'AllLinksTable' 'TableStyleMedium2' | Out-Null
    for ($row = 2; $row -le $linksLastRow; $row++) {
        $item = $timeline[$row - 2]
        if ($item.Url) {
            $linksSheet.Hyperlinks.Add($linksSheet.Cells($row,5),$item.Url,$null,'Open submit or contest','Submit') | Out-Null
            if ($item.WorkType -eq 'Contest') {
                $linksSheet.Hyperlinks.Add($linksSheet.Cells($row,6),$item.Url,$null,'Open contest set','Open set') | Out-Null
            }
        }
        if ($item.UpsolveUrl) {
            $linksSheet.Hyperlinks.Add($linksSheet.Cells($row,6),$item.UpsolveUrl,$null,'Open upsolve set','Open set') | Out-Null
        }
        $editorialUrl = ''
        if ($item.Editorial -match '(https?://[^\s\)]+)') { $editorialUrl = $matches[1] }
        if ($editorialUrl) {
            $linksSheet.Hyperlinks.Add($linksSheet.Cells($row,7),$editorialUrl,$null,'Open editorial/blog',[string]$linksSheet.Cells($row,7).Value2) | Out-Null
        }
    }
    $linksSheet.Columns.Item('A').ColumnWidth = 7
    $linksSheet.Columns.Item('B').ColumnWidth = 12
    $linksSheet.Columns.Item('C').ColumnWidth = 24
    $linksSheet.Columns.Item('D').ColumnWidth = 42
    $linksSheet.Columns.Item('E:F').ColumnWidth = 17
    $linksSheet.Columns.Item('G').ColumnWidth = 34
    $linksSheet.Columns.Item('H').ColumnWidth = 22
    $linksSheet.Columns.Item('I').ColumnWidth = 40
    $linksSheet.Columns.Item('J').ColumnWidth = 18
    $linksSheet.Columns.Item('K').ColumnWidth = 28
    $linksSheet.Columns.Item('L').ColumnWidth = 44
    $linksSheet.Range("A2:L$linksLastRow").WrapText = $true
    $linksSheet.Range("A2:L$linksLastRow").VerticalAlignment = -4160
    Freeze-At $excel $linksSheet 1 4


    # Sources Sheet
    $sourceSheet.Range('A1:D1').Merge()
    $sourceSheet.Range('A1').Value2 = 'SOURCES AND FILE MAP'
    Set-Header $sourceSheet.Range('A1:D1') $navy $white
    Write-Rows $sourceSheet 3 1 @(
        @('Name','Type','Location / URL','Use'),
        @('CP Control Board','Local','CP\README.md','Milestones and topic priority'),
        @('Regional Tasks','Local','CP\regional\Tasks\README.md','Full A/B/C/D/E bank'),
        @('Solo builder','Local','CP\scripts\build_solo_training_schedule.ps1','Regenerate after changing task bank'),
        @('VNOI Judge','Judge','https://oj.vnoi.info/','Vietnam ICPC submit judge'),
        @('GitHub solutions','Upsolve','https://github.com/','Single repo for all your solutions + notes (replaces References sheet)'),
        @('oj.uz','Judge','https://oj.uz/','APIO/JOI/CEOI/POI archive - long-implementation OI tasks'),
        @('QOJ / Universal Cup','Judge','https://contest.ucup.ac/contests','Asia Regional, EC-Final and UCup team-training sets'),
        @('Kattis ICPC Archive','Judge','https://open.kattis.com/problem-sources','ICPC World Finals and official archive problems'),
        @('Free Contest','Judge','https://oj.vnoi.info/','VN training sets, heavy implementation VOI-style'),
        @('Codeforces Gym','Contest','https://codeforces.com/gyms','Petrozavodsk / ICPC mirrors - 5h combine-heavy sets')
    )
    Set-Header $sourceSheet.Range('A3:D3') $teal $white
    Add-Table $sourceSheet $sourceSheet.Range('A3:D13') 'SoloSourcesTable' 'TableStyleMedium4' | Out-Null
    for ($row = 4; $row -le 13; $row++) {
        $url = [string]$sourceSheet.Cells($row,3).Value2
        if ($url -match '^https?://') {
            $sourceSheet.Hyperlinks.Add($sourceSheet.Cells($row,3),$url,$null,'Open source',$url) | Out-Null
        }
    }
    $sourceSheet.Columns.Item('A').ColumnWidth = 28
    $sourceSheet.Columns.Item('B').ColumnWidth = 15
    $sourceSheet.Columns.Item('C').ColumnWidth = 70
    $sourceSheet.Columns.Item('D').ColumnWidth = 45
    $sourceSheet.Range("A2:D13").WrapText = $true

    # Dashboard Sheet
    $dashboard.Range('A1:J2').Merge()
    $dashboard.Range('A1').Value2 = 'ICPC SOLO TRAINING - SPIRAL WEEKLY PLAN'
    $dashboard.Range('A1').Interior.Color = $navy
    $dashboard.Range('A1').Font.Color = $white
    $dashboard.Range('A1').Font.Bold = $true
    $dashboard.Range('A1').Font.Size = 22
    $dashboard.Range('A1').HorizontalAlignment = -4108
    $dashboard.Range('A1').VerticalAlignment = -4108
    $dashboard.Range('A3:J3').Merge()
    $dashboard.Range('A3').Value2 = 'SPIRAL: no scheduled training before 17/07/2026. Week 1 starts 20/07/2026. W1-W8 are summer camp mode ~45h: 4h Review, 27h Learn/Hard, 4h Sprint, 5h Contest, 5h Upsolve. After that normal weeks target ~35h. Regional week 07/12 is a light taper.'
    $dashboard.Range('A3').Font.Color = $muted
    $dashboard.Range('A3').HorizontalAlignment = -4108

    # Work-type breakdown table (left).
    $wtCounts = @{}
    foreach ($wt in $timelineWorkTypes) {
        $wtCounts[$wt] = @($timeline | Where-Object { $_.WorkType -eq $wt }).Count
    }
    $wtTable = [System.Collections.Generic.List[object[]]]::new()
    $wtTable.Add(@('WORK TYPE','ROWS','HOURS'))
    foreach ($wt in $timelineWorkTypes) {
        $h = ($timeline | Where-Object { $_.WorkType -eq $wt } | Measure-Object Hours -Sum).Sum
        if ($null -eq $h) { $h = 0 }
        $wtTable.Add(@($wt, $wtCounts[$wt], $h))
    }
    Write-Rows $dashboard 5 1 $wtTable
    Set-Header $dashboard.Range('A5:C5') $orange $white
    Set-Borders $dashboard.Range("A5:C$(5 + $wtTable.Count - 1)") $border

    # KPIs (right).
    Write-Rows $dashboard 5 6 @(
        @('KPI','VALUE'),
        @('Judged task rows',''),
        @('Total weeks',''),
        @('Estimated hours',''),
        @('Contest rows',''),
        @('Upsolve rows',''),
        @('Problem AC',''),
        @('% AC (problems)',''),
        @('Last week ends',''),
        @('Over-budget weeks',''),
        @('Tail vs Regional','')
    )
    Set-Header $dashboard.Range('F5:G5') $teal $white
    $dashboard.Cells(6, 7).Formula = "=COUNTIFS('Solo Timeline'!`$D:`$D,`"Learn`",'Solo Timeline'!`$L:`$L,`"<>Self practice`")+COUNTIFS('Solo Timeline'!`$D:`$D,`"Hard`",'Solo Timeline'!`$L:`$L,`"<>Self practice`")"
    $dashboard.Cells(7, 7).Formula = "=MAX('Solo Timeline'!`$A:`$A)"
    $dashboard.Cells(8, 7).Formula = "=SUM('Solo Timeline'!`$S:`$S)"
    $dashboard.Cells(9, 7).Formula = "=COUNTIF('Solo Timeline'!`$D:`$D,`"Contest`")"
    $dashboard.Cells(10, 7).Formula = "=COUNTIF('Solo Timeline'!`$D:`$D,`"Upsolve`")"
    $dashboard.Cells(11, 7).Formula = "=COUNTIFS('Solo Timeline'!`$D:`$D,`"Learn`",'Solo Timeline'!`$L:`$L,`"<>Self practice`",'Solo Timeline'!`$T:`$T,`"AC`")+COUNTIFS('Solo Timeline'!`$D:`$D,`"Hard`",'Solo Timeline'!`$L:`$L,`"<>Self practice`",'Solo Timeline'!`$T:`$T,`"AC`")"
    $dashboard.Cells(12, 7).Formula = "=IFERROR(G11/G6,0)"
    $dashboard.Cells(13, 7).Formula = "=DATE($($studyStart.Year),$($studyStart.Month),$($studyStart.Day))+7*G7-1"
    $dashboard.Cells(14, 7).Value2 = $overBudget.Count
    $dashboard.Cells(15, 7).Formula = "=IF(G13>DATE(2026,12,10),`"Tail runs past Regional (OK)`",`"Fits before Regional`")"
    $dashboard.Range('G12').NumberFormat = '0%'
    $dashboard.Range('G13').NumberFormat = 'dd/mm/yyyy'
    Set-Borders $dashboard.Range('F5:G15') $border
    $dashboard.Range("G14").FormatConditions.Delete()
    $fc = $dashboard.Range("G14").FormatConditions.Add(2,$null,'=G14>0')
    $fc.Interior.Color = Get-Color 255 204 204
    $fc.Font.Color = $red

    # Pre-Regional topic coverage (cutoff 06/12) - catches geometry/constructive dumped late.
    $covTable = [System.Collections.Generic.List[object[]]]::new()
    $covTable.Add(@('TOPIC COVERAGE (pre-Regional)','FIRST WK','WEEKS','TASKS','PRE-REG'))
    foreach ($c in $coverage) {
        $covTable.Add(@($c.Topic, $c.FirstWeek, $c.Weeks, $c.Tasks, $c.PreRegional))
    }
    Write-Rows $dashboard 12 1 $covTable
    Set-Header $dashboard.Range('A12:E12') $navy $white
    $covEnd = 12 + $covTable.Count - 1
    Set-Borders $dashboard.Range("A12:E$covEnd") $border
    # Flag any core topic (00-06) whose first appearance is late or pre-Regional count is 0.
    $dashboard.Range("E13:E$covEnd").FormatConditions.Delete()
    $fc = $dashboard.Range("E13:E$covEnd").FormatConditions.Add(2,$null,'=E13=0')
    $fc.Interior.Color = Get-Color 255 204 204
    $fc.Font.Color = $red

    # Instructions section on Dashboard
    $dashboard.Range('G17:J17').Merge()
    $dashboard.Range('G17').Value2 = 'HOW TO USE'
    Set-Header $dashboard.Range('G17:J17') $orange $white
    $dashboard.Range('G18:J26').Merge()
    $dashboard.Range('G18').Value2 = "1. No planned rows before 17/07/2026; Week 1 starts Monday 20/07/2026.`n2. W1-W8 are summer camp mode ~45h/week: 4h review, 27h Learn/Hard, 4h sprint, 5h contest, 5h upsolve.`n3. After W8, normal week target ~35h: 4h review, 17h Learn/Hard, 4h sprint, 5h contest, 5h upsolve.`n4. APAC/OI stretch is held mostly after Regional; before Regional focuses on Southern/National/Regional transfer.`n5. Plan by WEEK; on a 3-7h day, pull the next rows from that week. Carry leftovers forward - no hard per-task deadline.`n6. Keep all solutions in one GitHub repo (link in Sources)."
    $dashboard.Range('G18').WrapText = $true
    $dashboard.Range('G18').VerticalAlignment = -4160
    $dashboard.Range('G18').HorizontalAlignment = -4131
    Set-Borders $dashboard.Range('G17:J26') $border


    $dashboard.Range('A28:J28').Merge()
    $dashboard.Range('A28').Value2 = "Week 1 starts: $($studyStart.ToString('dd/MM/yyyy')) | Total weeks: $totalWeeks | Last week ends: $($lastWeekTo.ToString('dd/MM/yyyy')) | Regional: 10/12/2026"
    $dashboard.Range('A28').Interior.Color = Get-Color 230 239 240
    $dashboard.Range('A28').Font.Bold = $true
    $dashboard.Range('A28').HorizontalAlignment = -4108

    $dashboard.Columns.Item('A').ColumnWidth = 34
    $dashboard.Columns.Item('B').ColumnWidth = 11
    $dashboard.Columns.Item('C').ColumnWidth = 9
    $dashboard.Columns.Item('D').ColumnWidth = 9
    $dashboard.Columns.Item('E').ColumnWidth = 10
    $dashboard.Columns.Item('F').ColumnWidth = 26
    $dashboard.Columns.Item('G').ColumnWidth = 16
    $dashboard.Columns.Item('H:J').ColumnWidth = 13
    $dashboard.PageSetup.PrintArea = '$A$1:$J$28'
    $dashboard.PageSetup.Orientation = 2
    $dashboard.PageSetup.Zoom = $false
    $dashboard.PageSetup.FitToPagesWide = 1
    $dashboard.PageSetup.FitToPagesTall = 1
    $dashboard.Activate()

    $excel.ActiveWindow.DisplayGridlines = $false
    $excel.ActiveWindow.Zoom = 90

    $listSheet.Visible = 0
    $excel.Calculation = -4105
    $excel.Calculate()

    $sheetNames = @($dashboard.Name,$profileSheet.Name,$solo.Name,$weeklySheet.Name,$linksSheet.Name,$sourceSheet.Name,$listSheet.Name) -join ', '

    if (Test-Path -LiteralPath $OutputPath) { Remove-Item -LiteralPath $OutputPath -Force }
    $workbook.SaveAs($OutputPath, 51)
    $workbook.Close($true)
    $excel.Quit()

    Write-Output "Created: $OutputPath"
    Write-Output "Judged task rows: $(@($timeline | Where-Object { $_.WorkType -in @('Learn','Hard') -and $_.SourceType -ne 'Self practice' }).Count)"
    Write-Output "Total timeline rows: $($timeline.Count)"
    Write-Output "Total weeks: $totalWeeks"
    Write-Output "Estimated hours: $(($timeline | Measure-Object Hours -Sum).Sum)"
    Write-Output "Contest rows: $(@($timeline | Where-Object { $_.WorkType -eq 'Contest' }).Count) | Upsolve rows: $(@($timeline | Where-Object { $_.WorkType -eq 'Upsolve' }).Count)"
    Write-Output "Last week ends: $($lastWeekTo.ToString('dd/MM/yyyy'))"
    if ($overBudget.Count -gt 0) { Write-Output "OVER-BUDGET WEEKS: $($overBudget -join ', ')" } else { Write-Output "Over-budget weeks: none" }
    Write-Output "Sheets: $sheetNames"
}
finally {
    if ($null -ne $workbook) { try { $workbook.Close($false) } catch {} }
    if ($null -ne $excel) { try { $excel.Quit() } catch {} }
    Release-Com $listSheet
    Release-Com $sourceSheet
    Release-Com $linksSheet
    Release-Com $weeklySheet
    Release-Com $solo
    Release-Com $profileSheet
    Release-Com $dashboard
    Release-Com $workbook
    Release-Com $excel
    [GC]::Collect()
    [GC]::WaitForPendingFinalizers()
}
