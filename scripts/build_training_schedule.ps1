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

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$cpRoot = Split-Path -Parent $scriptDir
$taskRoot = Join-Path $cpRoot 'regional\Tasks'
if (-not $OutputPath) {
    $OutputPath = Join-Path $cpRoot 'ICPC_Training_Schedule_2026_2027.xlsx'
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

$plannedWeeks = @{}
function Assign-Week([int]$Week, [string[]]$Names) {
    foreach ($name in $Names) { $plannedWeeks[$name] = $Week }
}

Assign-Week 1 @('Apartments', 'Factory Machines', 'Maximum Subarray Sum II', 'Sum of Four Values')
Assign-Week 2 @('Movie Festival II', 'Array Division', 'Collecting Numbers II', 'Meet in the Middle', 'Traffic Lights')
Assign-Week 3 @('Flight Discount', 'Investigation', 'Coin Collector', 'Road Reparation', 'Necessary Roads', 'Necessary Cities')
Assign-Week 4 @('Range Update Queries', 'Range Updates and Sums', 'Salary Queries', 'Static Range Minimum Queries', 'GSS3', 'ORDERSET')
Assign-Week 5 @('Company Queries II', 'Distance Queries', 'Counting Paths', 'Path Queries', 'Tree Distances II')
Assign-Week 6 @('Projects', 'Removal Game', 'Elevator Rides', 'Counting Tilings', 'Counting Numbers')
Assign-Week 7 @('Counting Divisors', 'Common Divisors', 'Binomial Coefficients', 'Prime Multiples', 'String Matching', 'Finding Borders')
Assign-Week 8 @('Download Speed', 'Police Chase', 'School Dance', 'Distinct Routes', 'Giant Pizza')
Assign-Week 9 @('Path Queries II', 'Fools and Roads', 'QTREE', 'Fixed-Length Paths I', 'Lomsat gelral')
Assign-Week 10 @('Word Combinations', 'Finding Patterns', 'Counting Patterns', 'Pattern Positions', 'Repeating Substring')
Assign-Week 11 @('Point Location Test', 'Line Segment Intersection', 'Point in Polygon', 'Convex Hull', 'Intersection Points')
Assign-Week 12 @('W - Intervals', 'Z - Frog 3', 'Houses and Schools', 'Knuth Division', 'J - Sushi')
Assign-Week 13 @('Tasks and Deadlines', 'Stick Divisions', 'Number Game', 'ICPC 2025 Regional - Divisibility Grid', 'Nim Game I')
Assign-Week 14 @('Planets Queries II', 'Teleporters Path', 'ICPC 2025 Regional - Matrix Multiplication', 'One-Way Streets')
Assign-Week 15 @('The Child and Sequence', 'XOR on Segment', 'Powerful Array', 'ICPC 2021 Regional - K Query', 'Range Queries and Copies')
Assign-Week 16 @('ICPC 2025 Regional - Hamiltonian Path Remix', 'ICPC 2024 Regional - Hash-shashin', 'ICPC 2023 Regional - Area Query')
Assign-Week 18 @('ICPC 2025 National - Extended Fermat Theorem', 'ICPC 2023 National - Infinite Fraction Sequence')
Assign-Week 27 @('Dynamic Connectivity', 'METEORS', 'Wall', 'Seats')
Assign-Week 28 @('Xenia and Tree', 'Kingdom and its Cities', 'COT', 'Race')
Assign-Week 29 @('Aliens', 'Wiring', 'Holiday', 'ICPC 2025 Regional - Finest Final String')
Assign-Week 30 @('F - Convolution', 'Sum of Floor of Linear', 'System of Linear Equations', 'Ivan and Burgers')
Assign-Week 31 @('Distinct Substrings', 'Longest Palindrome', 'Required Substring', 'Robert Hood', 'Ancient Berland Circus')
Assign-Week 35 @('ICPC 2025 Regional - Cake Cutting', 'ICPC 2025 Regional - Impossible Inversion Counting', 'ICPC 2025 Regional - Joint Farm', 'ICPC 2025 Regional - Group Raiding')

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
        $j = $i + 1
        while ($j -lt $lines.Count -and $lines[$j] -notmatch '^- \[ \] \*\*' -and $lines[$j] -notmatch '^## ') {
            if ($lines[$j] -match '^\s*Submit:\s*\[[^\]]+\]\((https?://[^)]+)\)') { $url = $matches[1] }
            if ($lines[$j] -match '^\s*(Key|Focus):\s*(.+)$') { $key = $matches[2] }
            if ($lines[$j] -match '^\s*Why:\s*(.+)$') { $why = $matches[1] }
            $j++
        }

        $owner = if ($ownerMap.ContainsKey($name)) { $ownerMap[$name] } else { $folder }
        $status = if ($owner -ne $folder) { 'Reference' } else { 'Not started' }
        $week = if ($status -ne 'Reference' -and $plannedWeeks.ContainsKey($name)) { $plannedWeeks[$name] } else { '' }
        $description = (($key, $why | Where-Object { $_ }) -join ' | ')
        $tasks.Add([pscustomobject]@{
            Id = $taskId
            Topic = $topic
            Tier = $tier
            Name = $name
            Url = $url
            Status = $status
            Owner = $owner
            Week = $week
            Description = $description
            Source = $path.Substring($cpRoot.Length + 1)
        })
        $taskId++
    }
}

$weekSpecs = @(
    @('Phase 0 - Baseline',13,'Implementation + baseline','00 A: Apartments; Factory Machines; Max Subarray II; Sum of Four Values','Southern 2023 virtual','Record score, WA, first AC; freeze basic C++ workflow'),
    @('Phase 1 - Foundation',13,'Greedy, binary search, two pointers, MITM','00 B: Movie Festival II; Array Division; Collecting Numbers II; MITM; Traffic Lights','Southern 2024 virtual','3 easy problems inside 90 minutes'),
    @('Phase 1 - Foundation',13,'Graph shortest path, SCC, MST, low-link','Graph A: Flight Discount; Investigation; Coin Collector; Road Reparation; Necessary Roads/Cities','Graph mashup 5h','Dijkstra/SCC/low-link written without template copy'),
    @('Phase 1 - Foundation',13,'Fenwick, lazy segment tree, sparse table','DS A: range update/sum; salary; RMQ; GSS3; ORDERSET','DS mashup 5h','Lazy assign/add stress passes small brute'),
    @('Phase 1 - Foundation',13,'Tree LCA, Euler, difference, rerooting','Tree A: Company Queries II; Counting Paths; Path Queries; Tree Distances II','Tree mashup 5h','LCA + Euler + rerooting from scratch'),
    @('Phase 1 - Foundation',13,'DP interval, bitmask, profile, digit','DP A: Projects; Removal Game; Elevator Rides; Counting Tilings; Counting Numbers','DP mashup 5h','Write recurrence and complexity before coding'),
    @('Phase 1 - Foundation',14,'Math core + string primitives','Math A + KMP/Z: divisors; nCk; inclusion-exclusion; String Matching; Borders','Southern 2025 virtual','No primitive gap on easy/medium tasks'),
    @('Phase 2 - Regional core',14,'Flow, matching, min-cut, 2-SAT','Download Speed; Police Chase; School Dance; Distinct Routes; Giant Pizza','National 2021 virtual','One AC flow and one min-cut reconstruction'),
    @('Phase 2 - Regional core',14,'HLD, DSU on tree, path counting','Path Queries II; Fools and Roads; QTREE; Fixed-Length Paths I; Lomsat gelral','Tree/DS team mashup','HLD from scratch; one owner advanced tree'),
    @('Phase 2 - Regional core',14,'Aho-Corasick, suffix array/LCP','Word Combinations; Finding/Counting Patterns; Pattern Positions; Repeating Substring','String mashup 5h','One Aho AC and one suffix-array AC'),
    @('Phase 2 - Regional core',14,'Robust geometry + sweep line','Point/segment/polygon; Convex Hull; Intersection Points','Geometry mashup 5h','Integer primitives survive edge-case suite'),
    @('Phase 2 - Regional core',14,'DP optimization','Intervals; Frog 3; Houses and Schools; Knuth Division; Sushi','National 2022 virtual','Explain condition for CHT/D&C/Knuth'),
    @('Phase 2 - Regional core',14,'Proof, constructive, game','Tasks and Deadlines; Stick Divisions; Number Game; Divisibility Grid; Nim I','National 2023 virtual','Two written proofs + brute-small workflow'),
    @('Phase 3 - Southern peak',17,'Graph/modeling integration','Planets Queries II; Teleporters Path; Matrix Multiplication; One-Way Streets','Southern 2023 replay + mashup','5-7 solves; no missed easy problem'),
    @('Phase 3 - Southern peak',17,'DS/offline integration','Child and Sequence; XOR on Segment; Powerful Array; K Query; persistence','Southern 2024 replay + mashup','Two independent coding streams'),
    @('Phase 3 - Southern peak',18,'Mixed Regional pipeline','Hamiltonian Path Remix; Hash-shashin; Area Query','Southern 2025 replay + second virtual','Final solve order; repeated WA list closed'),
    @('Phase 3 - Southern peak',8,'Taper + ICPC Southern','Retry only; templates frozen; sleep and contest logistics','OFFICIAL Southern 17-18/10','Compete; capture post-contest notes only'),
    @('Phase 4 - National sprint',14,'National review + math/modeling','Extended Fermat; Infinite Fraction; upsolve Southern gaps','National 2022 virtual','Southern postmortem converted to tasks'),
    @('Phase 4 - National sprint',16,'Advanced B/C by weakest tags','Flow + DP + strings + geometry from failed virtuals','National 2023 + 2024 virtuals','All medium failures upsolved within 72h'),
    @('Phase 4 - National sprint',8,'Taper + ICPC National','No new template; short retries only','National 2025 virtual; OFFICIAL 08-09/11','Compete; notebook frozen 7 days before'),
    @('Phase 5 - Regional sprint',10,'National day 2 + recovery','National debrief; classify model/technique/code/proof/time','No extra virtual','Regional owner roles locked'),
    @('Phase 5 - Regional sprint',17,'Regional 2021','Virtual + upsolve + two weakest-topic blocks','Regional 2021 virtual','Target 5+; retry failures after 7 days'),
    @('Phase 5 - Regional sprint',18,'Regional 2022-2023','Two full virtuals; no new rare technique','Regional 2022 + 2023','6-8 solves depending on set difficulty'),
    @('Phase 5 - Regional sprint',18,'Regional 2024-2025','Two full virtuals; final templates and solve order','Regional 2024 + 2025','Three virtuals in a row at Regional-ready gate'),
    @('Phase 5 - Regional sprint',8,'Taper + Asia Regional Da Nang','Retry easy/medium only; logistics; sleep','OFFICIAL Regional 10-11/12','Compete; no heavy upsolve this week'),
    @('Phase 6 - APAC build',8,'Regional postmortem + owner selection','Select 2 owner areas/person; build APAC gap list','No virtual','APAC plan based on evidence, not tags'),
    @('Phase 6 - APAC build',15,'Advanced DS/offline','Dynamic Connectivity; METEORS; Wall; Seats','Hard mixed set 1','One owner for rollback/PBS/Beats'),
    @('Phase 6 - APAC build',15,'Advanced tree','Xenia and Tree; Kingdom and its Cities; COT; Race','Hard mixed set 2','Centroid/virtual tree owner gate'),
    @('Phase 6 - APAC build',15,'Advanced DP','Aliens; Wiring; Holiday; Finest Final String','Hard mixed set 3','Optimization proof before implementation'),
    @('Phase 6 - APAC build',15,'Advanced math/linear algebra','Convolution; floor sum; Gaussian; XOR basis','Hard mixed set 4','NTT or linear algebra owner gate'),
    @('Phase 6 - APAC build',15,'Advanced strings/geometry','SAM; Manacher; automaton DP; calipers; circle precision','Hard mixed set 5','One advanced string + geometry AC'),
    @('Phase 6 - APAC build',15,'APAC 2024','Official set under 5h conditions + analysis next day','APAC 2024 virtual','Baseline APAC score and bottleneck tags'),
    @('Phase 6 - APAC build',15,'APAC 2025','Official set under 5h conditions + replay','APAC 2025 virtual','Improve score or solve order vs APAC 2024'),
    @('Phase 6 - APAC build',15,'APAC 2026','Official set under 5h conditions + replay','APAC 2026 virtual','Three APAC data points; final gap list'),
    @('Phase 6 - APAC peak',18,'Mixed APAC hard pipeline','Cake Cutting; Impossible Inversion; Joint Farm; Group Raiding','Two APAC/mixed virtuals','5-7 APAC solves target; no single coder bottleneck'),
    @('Phase 6 - APAC taper',10,'Retry + notebook freeze','Only failed medium tasks and template stress','One light replay','Ready by 28/02; APAC date still TBD in March')
)

$weekRows = [System.Collections.Generic.List[object[]]]::new()
$startDate = Get-Date '2026-06-22'
for ($w = 1; $w -le $weekSpecs.Count; $w++) {
    $start = $startDate.AddDays(7 * ($w - 1))
    $end = $start.AddDays(6)
    $spec = $weekSpecs[$w - 1]
    $weekRows.Add(@($w, $start, $end, $spec[0], $spec[1], $spec[2], $spec[3], $spec[4], $spec[5], 'Not started', '', '', ''))
}

$virtualSpecs = @(
    @(1,'Southern 2023','Southern','https://oj.vnoi.info/contest/icpc23_mn'),
    @(2,'Southern 2024','Southern','https://oj.vnoi.info/contest/icpc24_mn'),
    @(7,'Southern 2025','Southern','https://oj.vnoi.info/contest/icpc25_mn'),
    @(8,'National 2021','National','https://oj.vnoi.info/contest/icpc21_national'),
    @(12,'National 2022','National','https://oj.vnoi.info/contest/icpc22_national'),
    @(13,'National 2023','National','https://oj.vnoi.info/contest/icpc23_national'),
    @(14,'Southern 2023 replay','Southern','https://oj.vnoi.info/contest/icpc23_mn'),
    @(15,'Southern 2024 replay','Southern','https://oj.vnoi.info/contest/icpc24_mn'),
    @(16,'Southern 2025 replay','Southern','https://oj.vnoi.info/contest/icpc25_mn'),
    @(17,'OFFICIAL Southern','Official',''),
    @(18,'National 2022 replay','National','https://oj.vnoi.info/contest/icpc22_national'),
    @(19,'National 2023','National','https://oj.vnoi.info/contest/icpc23_national'),
    @(19,'National 2024','National','https://oj.vnoi.info/contest/icpc24_national'),
    @(20,'National 2025','National','https://oj.vnoi.info/contest/icpc25_national'),
    @(20,'OFFICIAL National','Official',''),
    @(22,'Regional 2021','Regional','https://oj.vnoi.info/contest/icpc21_regional_m'),
    @(23,'Regional 2022','Regional','https://oj.vnoi.info/contest/icpc22_regional'),
    @(23,'Regional 2023','Regional','https://oj.vnoi.info/contest/icpc23_regional'),
    @(24,'Regional 2024','Regional','https://oj.vnoi.info/contest/icpc24_regional'),
    @(24,'Regional 2025','Regional','https://oj.vnoi.info/contest/icpc25_regional'),
    @(25,'OFFICIAL Asia Regional Da Nang','Official',''),
    @(32,'APAC 2024','APAC','https://fileserv.icpc.jp/championship2024/tasks.pdf'),
    @(33,'APAC 2025','APAC','https://fileserv.icpc.jp/championship2025/problemset.pdf'),
    @(34,'APAC 2026','APAC','https://apac.icpc.global/assets/championship/2026/problemset.pdf'),
    @(35,'APAC mixed/replay 1','APAC',''),
    @(35,'APAC mixed/replay 2','APAC','')
)

$topicRows = @(
    @('00 - Implementation, Greedy, Search','P0','09/08/2026','Sorting, prefix, two pointers, greedy, binary search, simulation','MITM, local contribution, casework','3 easy tasks inside 90 minutes; no overflow/reset/indexing error'),
    @('01 - Graph and Modeling','P0/P1','20/09/2026','Shortest path, SCC, low-link, MST, 2-SAT, flow/matching','Block-cut tree, functional graph, bitset DAG, min-cost flow','Dijkstra/SCC/low-link/Dinic from scratch; one modeling pipeline AC'),
    @('02 - Data Structures','P0/P2','20/09/2026','Fenwick, lazy segment tree, sparse table, order statistic','Persistent, Beats, Mo, rollback/PBS','Lazy assign/add from scratch; persistence AC; owner rollback/PBS'),
    @('03 - Tree','P0/P1','20/09/2026','LCA, Euler, rerooting, HLD, path difference','DSU on tree, centroid, virtual tree','LCA/Euler/HLD from scratch; reroot AC; one advanced owner'),
    @('04 - Advanced DP','P0/P1','20/09/2026','Interval, bitmask, digit, profile, tree DP','CHT, D&C, Knuth, WQS','One AC per core type; explain optimization conditions'),
    @('05 - Math and Counting','P0/P2','07/11/2026','Modular, CRT, combinatorics, sieve, inclusion-exclusion','Mobius/phi, floor sum, NTT, Gaussian/XOR basis','Formula derived and brute checked; one advanced owner'),
    @('06 - Strings','P0/P1','20/09/2026','KMP/Z/hash, trie/Aho, suffix array/LCP','Suffix automaton, Manacher, automaton DP','KMP/Z/hash from scratch; Aho AC; suffix-array AC'),
    @('07 - Geometry','P1','07/11/2026','Orientation, intersection, polygon, hull, sweep','Calipers, circle, precision','Integer primitives pass edge cases; hull + sweep AC'),
    @('08 - Proof, Constructive, Game','P1','07/11/2026','Exchange argument, invariant, necessary/sufficient','SG, tree game, hard constructive','Two written greedy proofs; brute-small-to-proof workflow')
)

$excel = $null
$workbook = $null
try {
    $excel = New-Object -ComObject Excel.Application
    $excel.Visible = $false
    $excel.DisplayAlerts = $false
    $excel.ScreenUpdating = $false
    $workbook = $excel.Workbooks.Add()

    while ($workbook.Worksheets.Count -gt 1) {
        $workbook.Worksheets.Item($workbook.Worksheets.Count).Delete()
    }

    $dashboard = $workbook.Worksheets.Item(1)
    $dashboard.Name = 'Dashboard'
    $weekly = $workbook.Worksheets.Add($null, $workbook.Worksheets.Item($workbook.Worksheets.Count))
    $weekly.Name = 'Weekly Plan'
    $taskSheet = $workbook.Worksheets.Add($null, $workbook.Worksheets.Item($workbook.Worksheets.Count))
    $taskSheet.Name = 'Task Bank'
    $gateSheet = $workbook.Worksheets.Add($null, $workbook.Worksheets.Item($workbook.Worksheets.Count))
    $gateSheet.Name = 'Topic Gates'
    $virtualSheet = $workbook.Worksheets.Add($null, $workbook.Worksheets.Item($workbook.Worksheets.Count))
    $virtualSheet.Name = 'Virtual Log'
    $rhythmSheet = $workbook.Worksheets.Add($null, $workbook.Worksheets.Item($workbook.Worksheets.Count))
    $rhythmSheet.Name = 'Weekly Rhythm'
    $sourceSheet = $workbook.Worksheets.Add($null, $workbook.Worksheets.Item($workbook.Worksheets.Count))
    $sourceSheet.Name = 'Sources'
    $listSheet = $workbook.Worksheets.Add($null, $workbook.Worksheets.Item($workbook.Worksheets.Count))
    $listSheet.Name = 'Lists'

    $navy = Get-Color 28 47 65
    $teal = Get-Color 22 112 107
    $orange = Get-Color 224 122 57
    $green = Get-Color 53 134 83
    $red = Get-Color 194 65 65
    $gold = Get-Color 214 164 55
    $white = Get-Color 255 255 255
    $light = Get-Color 242 246 247
    $border = Get-Color 205 215 218
    $muted = Get-Color 93 110 116

    foreach ($sheet in @($dashboard,$weekly,$taskSheet,$gateSheet,$virtualSheet,$rhythmSheet,$sourceSheet,$listSheet)) {
        $sheet.Cells.Font.Name = 'Aptos'
        $sheet.Cells.Font.Size = 10
    }

    # Lists and named ranges.
    Write-Rows $listSheet 1 1 @(
        @('Task Status','Week Status','Failure Tag','Virtual Status'),
        @('Not started','Not started','Model','Planned'),
        @('Learning','In progress','Technique','Done'),
        @('Solving','Done','Implementation','Upsolving'),
        @('AC','Blocked','Proof','Skipped'),
        @('Retry','Skipped','Time management',''),
        @('Skip','','Reading','',''),
        @('Reference','','','','')
    )
    $workbook.Names.Add('TaskStatusList','=Lists!$A$2:$A$8') | Out-Null
    $workbook.Names.Add('WeekStatusList','=Lists!$B$2:$B$6') | Out-Null
    $workbook.Names.Add('FailureTagList','=Lists!$C$2:$C$7') | Out-Null
    $workbook.Names.Add('VirtualStatusList','=Lists!$D$2:$D$5') | Out-Null

    # Task Bank.
    $taskHeaders = @('ID','Topic','Tier','Task','Submit','Status','Owner folder','Planned week','Start date','AC date','Minutes','WA','Retry +7','Retry +21','Key / Focus','Notes','Source file')
    Write-Rows $taskSheet 1 1 @(,$taskHeaders)
    $taskData = [System.Collections.Generic.List[object[]]]::new()
    foreach ($task in $tasks) {
        $taskData.Add(@($task.Id,$task.Topic,$task.Tier,$task.Name,'Submit',$task.Status,$task.Owner,$task.Week,'','','','','','',$task.Description,'',$task.Source))
    }
    Write-Rows $taskSheet 2 1 $taskData
    $taskLastRow = $tasks.Count + 1
    Set-Header $taskSheet.Range("A1:Q1") $navy $white
    $taskSheet.Rows.Item(1).RowHeight = 32
    for ($row = 2; $row -le $taskLastRow; $row++) {
        $task = $tasks[$row - 2]
        if ($task.Url) {
            $taskSheet.Hyperlinks.Add($taskSheet.Cells($row,5), $task.Url, $null, 'Open submit judge', 'Submit') | Out-Null
        }
        $taskSheet.Cells($row,13).Formula = "=IF(J$row=`"`",`"`",J$row+7)"
        $taskSheet.Cells($row,14).Formula = "=IF(J$row=`"`",`"`",J$row+21)"
        if ($task.Status -eq 'Reference') {
            $taskSheet.Range("A$row:Q$row").Font.Color = $muted
            $taskSheet.Range("A$row:Q$row").Interior.Color = Get-Color 247 247 247
        }
    }
    $taskSheet.Range("I2:J$taskLastRow").NumberFormat = 'dd/mm/yyyy'
    $taskSheet.Range("M2:N$taskLastRow").NumberFormat = 'dd/mm/yyyy'
    Add-ListValidation $taskSheet.Range("F2:F$taskLastRow") '=TaskStatusList'
    Add-Table $taskSheet $taskSheet.Range("A1:Q$taskLastRow") 'TaskBankTable' 'TableStyleMedium2' | Out-Null
    $taskSheet.Columns.Item('A').ColumnWidth = 7
    $taskSheet.Columns.Item('B').ColumnWidth = 31
    $taskSheet.Columns.Item('C').ColumnWidth = 22
    $taskSheet.Columns.Item('D').ColumnWidth = 40
    $taskSheet.Columns.Item('E').ColumnWidth = 10
    $taskSheet.Columns.Item('F').ColumnWidth = 15
    $taskSheet.Columns.Item('G').ColumnWidth = 34
    $taskSheet.Columns.Item('H').ColumnWidth = 13
    $taskSheet.Columns.Item('I:N').ColumnWidth = 12
    $taskSheet.Columns.Item('O').ColumnWidth = 54
    $taskSheet.Columns.Item('P').ColumnWidth = 36
    $taskSheet.Columns.Item('Q').ColumnWidth = 44
    $taskSheet.Range("B2:Q$taskLastRow").WrapText = $true
    $taskSheet.Range("A2:N$taskLastRow").VerticalAlignment = -4160
    $taskSheet.Range("F2:F$taskLastRow").FormatConditions.Delete()
    $fc = $taskSheet.Range("F2:F$taskLastRow").FormatConditions.Add(1,3,'="AC"')
    $fc.Interior.Color = Get-Color 216 239 220
    $fc.Font.Color = $green
    $fc = $taskSheet.Range("F2:F$taskLastRow").FormatConditions.Add(1,3,'="Retry"')
    $fc.Interior.Color = Get-Color 255 238 204
    $fc.Font.Color = Get-Color 145 92 15
    Freeze-At $excel $taskSheet 1 4

    # Weekly plan.
    $weekHeaders = @('Week','From','To','Phase','Planned hrs','Focus','Assigned tasks / rule','Virtual / Contest','Output / Gate','Status','Actual hrs','Task completion','Notes')
    Write-Rows $weekly 1 1 @(,$weekHeaders)
    Write-Rows $weekly 2 1 $weekRows
    $weekLastRow = $weekRows.Count + 1
    Set-Header $weekly.Range("A1:M1") $navy $white
    $weekly.Rows.Item(1).RowHeight = 34
    $weekly.Range("B2:C$weekLastRow").NumberFormat = 'dd/mm/yyyy'
    $weekly.Range("L2:L$weekLastRow").NumberFormat = '0%'
    for ($row = 2; $row -le $weekLastRow; $row++) {
        $weekly.Cells($row,12).Formula = "=IF(COUNTIF('Task Bank'!`$H:`$H,A$row)=0,`"`",COUNTIFS('Task Bank'!`$H:`$H,A$row,'Task Bank'!`$F:`$F,`"AC`")/COUNTIF('Task Bank'!`$H:`$H,A$row))"
        $phase = [string]$weekly.Cells($row,4).Value2
        if ($phase -match 'Peak|Sprint') { $weekly.Range("A$row:M$row").Interior.Color = Get-Color 255 248 232 }
        if ($phase -match 'taper|Taper') { $weekly.Range("A$row:M$row").Interior.Color = Get-Color 242 247 250 }
    }
    Add-ListValidation $weekly.Range("J2:J$weekLastRow") '=WeekStatusList'
    Add-Table $weekly $weekly.Range("A1:M$weekLastRow") 'WeeklyPlanTable' 'TableStyleMedium4' | Out-Null
    $weekly.Columns.Item('A').ColumnWidth = 8
    $weekly.Columns.Item('B:C').ColumnWidth = 12
    $weekly.Columns.Item('D').ColumnWidth = 27
    $weekly.Columns.Item('E').ColumnWidth = 12
    $weekly.Columns.Item('F').ColumnWidth = 31
    $weekly.Columns.Item('G').ColumnWidth = 55
    $weekly.Columns.Item('H').ColumnWidth = 36
    $weekly.Columns.Item('I').ColumnWidth = 46
    $weekly.Columns.Item('J').ColumnWidth = 14
    $weekly.Columns.Item('K:L').ColumnWidth = 13
    $weekly.Columns.Item('M').ColumnWidth = 40
    $weekly.Range("D2:M$weekLastRow").WrapText = $true
    $weekly.Range("A2:M$weekLastRow").VerticalAlignment = -4160
    $weekly.Range("L2:L$weekLastRow").FormatConditions.AddDatabar() | Out-Null
    Freeze-At $excel $weekly 1 5

    # Topic gates.
    $gateHeaders = @('Topic','Priority','Deadline','Regional core','Advanced / Owner','Coverage gate','Gate status','AC / Tasks','Progress','Notes')
    Write-Rows $gateSheet 1 1 @(,$gateHeaders)
    $gateData = [System.Collections.Generic.List[object[]]]::new()
    foreach ($topic in $topicRows) { $gateData.Add(@($topic[0],$topic[1],$topic[2],$topic[3],$topic[4],$topic[5],'Not started','','','')) }
    Write-Rows $gateSheet 2 1 $gateData
    $gateLastRow = $topicRows.Count + 1
    Set-Header $gateSheet.Range("A1:J1") $teal $white
    for ($row = 2; $row -le $gateLastRow; $row++) {
        $gateSheet.Cells($row,8).Formula = "=COUNTIFS('Task Bank'!`$B:`$B,A$row,'Task Bank'!`$F:`$F,`"AC`")&`" / `"&COUNTIFS('Task Bank'!`$B:`$B,A$row,'Task Bank'!`$F:`$F,`"<>Reference`")"
        $gateSheet.Cells($row,9).Formula = "=IFERROR(COUNTIFS('Task Bank'!`$B:`$B,A$row,'Task Bank'!`$F:`$F,`"AC`")/COUNTIFS('Task Bank'!`$B:`$B,A$row,'Task Bank'!`$F:`$F,`"<>Reference`"),0)"
    }
    Add-ListValidation $gateSheet.Range("G2:G$gateLastRow") '=WeekStatusList'
    Add-Table $gateSheet $gateSheet.Range("A1:J$gateLastRow") 'TopicGatesTable' 'TableStyleMedium4' | Out-Null
    $gateSheet.Range("I2:I$gateLastRow").NumberFormat = '0%'
    $gateSheet.Range("I2:I$gateLastRow").FormatConditions.AddDatabar() | Out-Null
    $gateSheet.Columns.Item('A').ColumnWidth = 34
    $gateSheet.Columns.Item('B:C').ColumnWidth = 13
    $gateSheet.Columns.Item('D:E').ColumnWidth = 45
    $gateSheet.Columns.Item('F').ColumnWidth = 52
    $gateSheet.Columns.Item('G:I').ColumnWidth = 14
    $gateSheet.Columns.Item('J').ColumnWidth = 38
    $gateSheet.Range("A2:J$gateLastRow").WrapText = $true
    $gateSheet.Range("A2:J$gateLastRow").VerticalAlignment = -4160
    Freeze-At $excel $gateSheet 1 1

    # Virtual log.
    $virtualHeaders = @('Week','Planned date','Contest','Level','Open','Status','Solved','Penalty','First AC (min)','WA','Easy missed','Main failure','Upsolve due','Retry due','Notes')
    Write-Rows $virtualSheet 1 1 @(,$virtualHeaders)
    $virtualData = [System.Collections.Generic.List[object[]]]::new()
    foreach ($v in $virtualSpecs) {
        $date = $startDate.AddDays(7 * ([int]$v[0] - 1) + 5)
        if ($v[1] -eq 'OFFICIAL Southern') { $date = Get-Date '2026-10-17' }
        if ($v[1] -eq 'OFFICIAL National') { $date = Get-Date '2026-11-08' }
        if ($v[1] -eq 'OFFICIAL Asia Regional Da Nang') { $date = Get-Date '2026-12-10' }
        $virtualData.Add(@($v[0],$date,$v[1],$v[2],'Open','Planned','','','','','','','','',''))
    }
    Write-Rows $virtualSheet 2 1 $virtualData
    $virtualLastRow = $virtualData.Count + 1
    Set-Header $virtualSheet.Range("A1:O1") $orange $white
    for ($row = 2; $row -le $virtualLastRow; $row++) {
        $url = $virtualSpecs[$row - 2][3]
        if ($url) { $virtualSheet.Hyperlinks.Add($virtualSheet.Cells($row,5),$url,$null,'Open contest/problem set','Open') | Out-Null }
        $virtualSheet.Cells($row,13).Formula = "=IF(B$row=`"`",`"`",B$row+3)"
        $virtualSheet.Cells($row,14).Formula = "=IF(B$row=`"`",`"`",B$row+7)"
    }
    Add-ListValidation $virtualSheet.Range("F2:F$virtualLastRow") '=VirtualStatusList'
    Add-ListValidation $virtualSheet.Range("L2:L$virtualLastRow") '=FailureTagList'
    Add-Table $virtualSheet $virtualSheet.Range("A1:O$virtualLastRow") 'VirtualLogTable' 'TableStyleMedium9' | Out-Null
    $virtualSheet.Range("B2:B$virtualLastRow").NumberFormat = 'dd/mm/yyyy'
    $virtualSheet.Range("M2:N$virtualLastRow").NumberFormat = 'dd/mm/yyyy'
    $virtualSheet.Columns.Item('A').ColumnWidth = 8
    $virtualSheet.Columns.Item('B').ColumnWidth = 13
    $virtualSheet.Columns.Item('C').ColumnWidth = 35
    $virtualSheet.Columns.Item('D:F').ColumnWidth = 13
    $virtualSheet.Columns.Item('G:J').ColumnWidth = 13
    $virtualSheet.Columns.Item('K:L').ColumnWidth = 18
    $virtualSheet.Columns.Item('M:N').ColumnWidth = 13
    $virtualSheet.Columns.Item('O').ColumnWidth = 45
    $virtualSheet.Range("C2:O$virtualLastRow").WrapText = $true
    Freeze-At $excel $virtualSheet 1 3

    # Weekly rhythm.
    $rhythmSheet.Range('A1:F1').Merge()
    $rhythmSheet.Range('A1').Value2 = 'WEEKLY RHYTHM - EDIT TIMES TO MATCH YOUR CLASS SCHEDULE'
    Set-Header $rhythmSheet.Range('A1:F1') $navy $white
    $rhythmSheet.Range('A1:F1').Font.Size = 16
    $rhythmSheet.Rows.Item(1).RowHeight = 34
    Write-Rows $rhythmSheet 3 1 @(
        @('Mode','Session','Duration','Content','Required output','When'),
        @('Regular 13h','1 - Team virtual','5h','Full contest, one computer, no editorial','Score + WA + first AC + missed easy','Weekend'),
        @('Regular 13h','2 - Team upsolve','2.5h','Reconstruct model and code failed medium tasks','Upsolve note + retry date','Next day'),
        @('Regular 13h','3 - Topic block A','2h','Foundation/core tasks from weekly focus','2 AC or one deep failure note','Weekday'),
        @('Regular 13h','4 - Topic block B','2h','Core/owner task or code-heavy pipeline','1 AC / implementation checkpoint','Weekday'),
        @('Regular 13h','5 - Template/retry','1.5h','Stress template and retry +7/+21','Template passes brute','Short weekday'),
        @('Peak 17-18h','1-2 - Team virtuals','10h','Two full contest sets','Compare solve order and bottlenecks','Weekend + one evening'),
        @('Peak 17-18h','3 - Upsolve','3h','Only scoring failures first','Medium failures closed in 72h','Next day'),
        @('Peak 17-18h','4-5 - Retry/template','4-5h','No broad new tags','Stable notebook and two code streams','Weekdays'),
        @('Taper 8-10h','1 - Light replay','3h','Easy/medium problems only','Confidence and clean code','Early week'),
        @('Taper 8-10h','2 - Template check','2h','Compile/stress notebook','No unverified template','Early week'),
        @('Taper 8-10h','3 - Rest/logistics','3-5h','Sleep, travel, contest setup','Ready to compete','Before event')
    )
    Set-Header $rhythmSheet.Range('A3:F3') $teal $white
    Add-Table $rhythmSheet $rhythmSheet.Range('A3:F15') 'RhythmTable' 'TableStyleMedium4' | Out-Null
    $rhythmSheet.Columns.Item('A:B').ColumnWidth = 20
    $rhythmSheet.Columns.Item('C').ColumnWidth = 12
    $rhythmSheet.Columns.Item('D:E').ColumnWidth = 48
    $rhythmSheet.Columns.Item('F').ColumnWidth = 22
    $rhythmSheet.Range('A4:F15').WrapText = $true
    $rhythmSheet.Range('A4:F15').VerticalAlignment = -4160
    Write-Rows $rhythmSheet 18 1 @(
        @('Rule','Meaning'),
        @('Do not tick the whole bank','Pass topic gates; select tasks from failures and owner roles.'),
        @('Failed problem','Tag model / technique / implementation / proof / time management.'),
        @('Retry','Retry after 7 days and 21 days without old notes/code.'),
        @('Template','Only add after AC or stress against brute.'),
        @('Regional-ready','3 consecutive Regional virtuals with 5+ solves and no missed easy due to primitive gaps.')
    )
    Set-Header $rhythmSheet.Range('A18:B18') $orange $white
    Add-Table $rhythmSheet $rhythmSheet.Range('A18:B23') 'RulesTable' 'TableStyleMedium9' | Out-Null

    # Sources.
    $sourceSheet.Range('A1:D1').Merge()
    $sourceSheet.Range('A1').Value2 = 'SOURCES AND FILE MAP'
    Set-Header $sourceSheet.Range('A1:D1') $navy $white
    $sourceRows = @(
        @('Name','Type','Location / URL','Use'),
        @('CP Control Board','Local','CP\README.md','Phases, milestones, weekly load'),
        @('Regional Tasks','Local','CP\regional\Tasks\README.md','A/B/C/D/E pipeline and gates'),
        @('Mixed contests','Local','CP\Asia\99_mixed_contests_hard_tasks\README.md','Southern/National/Regional/APAC sets'),
        @('OLP-ICPC Vietnam 2026','Official','https://www.olp.vn/tin-t%E1%BB%A9c/olympic-icpc/th%C3%B4ng-b%C3%A1o','Published 2026 event dates'),
        @('VNOI Judge','Judge','https://oj.vnoi.info/','Submit Vietnam ICPC sets'),
        @('APAC 2024','Official PDF','https://fileserv.icpc.jp/championship2024/tasks.pdf','Virtual problem set'),
        @('APAC 2025','Official PDF','https://fileserv.icpc.jp/championship2025/problemset.pdf','Virtual problem set'),
        @('APAC 2026','Official PDF','https://apac.icpc.global/assets/championship/2026/problemset.pdf','Virtual problem set')
    )
    Write-Rows $sourceSheet 3 1 $sourceRows
    Set-Header $sourceSheet.Range('A3:D3') $teal $white
    Add-Table $sourceSheet $sourceSheet.Range('A3:D11') 'SourcesTable' 'TableStyleMedium4' | Out-Null
    for ($row = 7; $row -le 11; $row++) {
        $url = [string]$sourceSheet.Cells($row,3).Value2
        if ($url -match '^https?://') { $sourceSheet.Hyperlinks.Add($sourceSheet.Cells($row,3),$url,$null,'Open source',$url) | Out-Null }
    }
    $sourceSheet.Columns.Item('A').ColumnWidth = 29
    $sourceSheet.Columns.Item('B').ColumnWidth = 15
    $sourceSheet.Columns.Item('C').ColumnWidth = 72
    $sourceSheet.Columns.Item('D').ColumnWidth = 42
    $sourceSheet.Range('A4:D11').WrapText = $true

    # Dashboard, written last so formulas can reference all tables.
    $dashboard.Range('A1:J2').Merge()
    $dashboard.Range('A1').Value2 = 'ICPC 2026-2027 TRAINING CONTROL BOARD'
    $dashboard.Range('A1').Interior.Color = $navy
    $dashboard.Range('A1').Font.Color = $white
    $dashboard.Range('A1').Font.Bold = $true
    $dashboard.Range('A1').Font.Size = 22
    $dashboard.Range('A1').HorizontalAlignment = -4108
    $dashboard.Range('A1').VerticalAlignment = -4108
    $dashboard.Rows.Item('1:2').RowHeight = 28
    $dashboard.Range('A3:J3').Merge()
    $dashboard.Range('A3').Value2 = 'From 21/06/2026 to APAC preparation cutoff 28/02/2027 | Default load: 12-15h/week'
    $dashboard.Range('A3').Font.Color = $muted
    $dashboard.Range('A3').HorizontalAlignment = -4108

    Write-Rows $dashboard 5 1 @(
        @('MILESTONE','DATE','DAYS LEFT','TRAINING TARGET','STATUS'),
        @('ICPC Southern',(Get-Date '2026-10-17'),'','5-7 solves; no easy miss','Upcoming'),
        @('ICPC National',(Get-Date '2026-11-08'),'','Owner roles + stable B/C','Upcoming'),
        @('Asia Regional Da Nang',(Get-Date '2026-12-10'),'','3 virtuals at 5+ solves','Upcoming'),
        @('APAC Tokyo',(Get-Date '2027-03-01'),'','5-7 solves on APAC old sets','Month placeholder')
    )
    Set-Header $dashboard.Range('A5:E5') $orange $white
    $milestoneDates = @((Get-Date '2026-10-17'), (Get-Date '2026-11-08'), (Get-Date '2026-12-10'), (Get-Date '2027-03-01'))
    for ($i = 0; $i -lt $milestoneDates.Count; $i++) {
        $dashboard.Cells(6 + $i, 2).Value2 = $milestoneDates[$i].ToOADate()
    }
    $dashboard.Range('B6:B9').NumberFormat = 'dd/mm/yyyy'
    for ($row = 6; $row -le 9; $row++) { $dashboard.Cells($row,3).Formula = "=MAX(0,B$row-TODAY())" }
    Set-Borders $dashboard.Range('A5:E9') $border
    $dashboard.Columns.Item('A').ColumnWidth = 32
    $dashboard.Columns.Item('B:C').ColumnWidth = 14
    $dashboard.Columns.Item('D').ColumnWidth = 37
    $dashboard.Columns.Item('E').ColumnWidth = 18
    $dashboard.Range('A6:E9').WrapText = $true

    Write-Rows $dashboard 5 7 @(
        @('KPI','VALUE'),
        @('Task AC',''),
        @('Unique task entries',''),
        @('Retry due',''),
        @('Virtuals done',''),
        @('Average solved',''),
        @('Actual hours','')
    )
    Set-Header $dashboard.Range('G5:H5') $teal $white
    $dashboard.Range('G6:G11').Font.Bold = $true
    $dashboard.Range('H6').Formula = '=COUNTIF(''Task Bank''!$F:$F,"AC")'
    $dashboard.Range('H7').Formula = '=COUNTA(''Task Bank''!$A:$A)-1-COUNTIF(''Task Bank''!$F:$F,"Reference")'
    $dashboard.Range('H8').Formula = '=COUNTIFS(''Task Bank''!$F:$F,"Retry",''Task Bank''!$M:$M,"<="&TODAY())'
    $dashboard.Range('H9').Formula = '=COUNTIF(''Virtual Log''!$F:$F,"Done")'
    $dashboard.Range('H10').Formula = '=IFERROR(AVERAGEIF(''Virtual Log''!$F:$F,"Done",''Virtual Log''!$G:$G),0)'
    $dashboard.Range('H11').Formula = '=SUM(''Weekly Plan''!$K:$K)'
    Set-Borders $dashboard.Range('G5:H11') $border
    $dashboard.Columns.Item('G').ColumnWidth = 23
    $dashboard.Columns.Item('H').ColumnWidth = 15

    Write-Rows $dashboard 13 1 @(
        @('TOPIC PROGRESS','PRIORITY','AC / TASKS','PROGRESS'),
        @('','','',''),@('','','',''),@('','','',''),@('','','',''),@('','','',''),@('','','',''),@('','','',''),@('','','',''),@('','','','')
    )
    Set-Header $dashboard.Range('A13:D13') $navy $white
    for ($i = 0; $i -lt 9; $i++) {
        $row = 14 + $i
        $gateRow = 2 + $i
        $dashboard.Cells($row,1).Formula = "='Topic Gates'!A$gateRow"
        $dashboard.Cells($row,2).Formula = "='Topic Gates'!B$gateRow"
        $dashboard.Cells($row,3).Formula = "='Topic Gates'!H$gateRow"
        $dashboard.Cells($row,4).Formula = "='Topic Gates'!I$gateRow"
    }
    $dashboard.Range('D14:D22').NumberFormat = '0%'
    $dashboard.Range('D14:D22').FormatConditions.AddDatabar() | Out-Null
    Set-Borders $dashboard.Range('A13:D22') $border
    $dashboard.Columns.Item('D').ColumnWidth = 14

    $dashboard.Range('F13:J13').Merge()
    $dashboard.Range('F13').Value2 = 'HOW TO USE THIS FILE'
    Set-Header $dashboard.Range('F13:J13') $orange $white
    $instructions = @(
        '1. Open Weekly Plan and follow only the current week.',
        '2. In Task Bank, update Status, AC date, WA and notes.',
        '3. Log every 5-hour contest in Virtual Log.',
        '4. Retry failed tasks after 7 and 21 days.',
        '5. Do not solve all 184 entries; pass Topic Gates.',
        '6. APAC date is a March placeholder until exact date is published.'
    )
    $dashboard.Range('F14:J19').Merge()
    $dashboard.Range('F14').Value2 = ($instructions -join "`n")
    $dashboard.Range('F14').WrapText = $true
    $dashboard.Range('F14').VerticalAlignment = -4160
    $dashboard.Range('F14').HorizontalAlignment = -4131
    $dashboard.Rows.Item('14:19').RowHeight = 27
    Set-Borders $dashboard.Range('F13:J19') $border

    $dashboard.Range('F21:J21').Merge()
    $dashboard.Range('F21').Value2 = 'CURRENT DEFINITION OF READY'
    Set-Header $dashboard.Range('F21:J21') $teal $white
    $dashboard.Range('F22:J25').Merge()
    $dashboard.Range('F22').Value2 = "Regional: pass topic gates, then score 5+ on three consecutive Regional virtuals without missing easy tasks because of primitive gaps.`nAPAC: owner coverage, two coding streams, and trend toward 5-7 solves on APAC old sets."
    $dashboard.Range('F22').WrapText = $true
    $dashboard.Range('F22').VerticalAlignment = -4160
    $dashboard.Rows.Item('22:25').RowHeight = 26
    Set-Borders $dashboard.Range('F21:J25') $border

    $dashboard.Range('A27:J27').Merge()
    $dashboard.Range('A27').Value2 = 'Start here: Weekly Plan -> Task Bank -> Virtual Log -> Topic Gates'
    $dashboard.Range('A27').Interior.Color = Get-Color 230 239 240
    $dashboard.Range('A27').Font.Color = $navy
    $dashboard.Range('A27').Font.Bold = $true
    $dashboard.Range('A27').HorizontalAlignment = -4108
    $dashboard.Rows.Item(27).RowHeight = 30
    $dashboard.Columns.Item('F').ColumnWidth = 14
    $dashboard.Columns.Item('I:J').ColumnWidth = 14
    $dashboard.PageSetup.PrintArea = '$A$1:$J$27'
    $dashboard.PageSetup.Orientation = 2
    $dashboard.PageSetup.Zoom = $false
    $dashboard.PageSetup.FitToPagesWide = 1
    $dashboard.PageSetup.FitToPagesTall = 1
    $dashboard.PageSetup.LeftMargin = $excel.InchesToPoints(0.25)
    $dashboard.PageSetup.RightMargin = $excel.InchesToPoints(0.25)
    $dashboard.PageSetup.TopMargin = $excel.InchesToPoints(0.3)
    $dashboard.PageSetup.BottomMargin = $excel.InchesToPoints(0.3)
    $dashboard.Activate()
    $excel.ActiveWindow.DisplayGridlines = $false
    $excel.ActiveWindow.Zoom = 90

    $listSheet.Visible = 0
    $excel.Calculation = -4105
    $excel.Calculate()
    if (Test-Path -LiteralPath $OutputPath) { Remove-Item -LiteralPath $OutputPath -Force }
    $workbook.SaveAs($OutputPath, 51)
    $workbook.Close($true)
    $excel.Quit()
    Write-Output "Created: $OutputPath"
    Write-Output "Tasks: $($tasks.Count)"
    Write-Output "Weeks: $($weekRows.Count)"
    Write-Output "Virtual rows: $($virtualData.Count)"
}
finally {
    if ($null -ne $workbook) {
        try { $workbook.Close($false) } catch {}
    }
    if ($null -ne $excel) {
        try { $excel.Quit() } catch {}
    }
    Release-Com $listSheet
    Release-Com $sourceSheet
    Release-Com $rhythmSheet
    Release-Com $virtualSheet
    Release-Com $gateSheet
    Release-Com $taskSheet
    Release-Com $weekly
    Release-Com $dashboard
    Release-Com $workbook
    Release-Com $excel
    [GC]::Collect()
    [GC]::WaitForPendingFinalizers()
}
