# CP workspace map

This folder is the current control area for the ICPC solo training plan.

## Current source of truth

- `ICPC_Solo_Training_Schedule_2026_2027.xlsx`  
  Current workbook. Treat this as the source of truth for the active schedule.

- `scripts/build_solo_training_schedule.ps1`  
  Generator for the solo workbook. Do not hand-edit the workbook as the long-term source; update task bank/generator and regenerate.

- `regional/Tasks/<00..08>/README.md`  
  Regional task bank by topic. These files are the main source for task metadata and submit/editorial links.

## Verification copy

- `ICPC_Solo_Training_Schedule_2026_2027__verify.xlsx`  
  Verification workbook generated from the same script. Use it only to compare/regression-check the main workbook.

## Reports for audit

- `reports/audit-followup-2026-07-01.md`  
  Latest coordination memo. It records current workbook counts, stale claims in the newest GPT audit, and the remaining patch priorities.

- `reports/profile-solved-inventory-2026-07-01.md`  
  Public solved/profile evidence. Use this when deciding which topics are review/reactivation versus genuinely new learning.

- `reports/verified-anchors-patch-2026-07-01.md`  
  Narrow verified patch spec for W9/W11/W15 judged anchors and support-row conversions.

- `reports/current-state-2026-06-27.md`  
  Snapshot report for the current planning pass. Useful context, but the workbook still wins if numbers conflict.

- `reports/deep-research-report-2026-06-27.md`  
  Previous deep-research/correction pass. Useful for reasoning history and contest/task checks; not the current source of truth.

## Historical / superseded material

- `archive/legacy-2026-06/`  
  Older audit prompts, stale source notes, and the previous team-oriented schedule. Keep for provenance; do not use as the active plan unless explicitly comparing history.

## Reference banks

- `regional/`  
  Primary Regional preparation area.

- `Asia/`  
  APAC/Asia stretch bank. Use mostly after Regional, or very selectively before Regional.

- `ICPC_Roadmap_2026/`  
  Older roadmap/PDF source material. Useful as reference, not the active schedule.

- `Editorials/`, `Shortest_GCD_Paths/`  
  Problem-specific notes/editorials.

## Reading order for another GPT/Deep Research pass

1. `ICPC_Solo_Training_Schedule_2026_2027.xlsx`
2. `reports/audit-followup-2026-07-01.md`
3. `reports/profile-solved-inventory-2026-07-01.md`
4. `reports/verified-anchors-patch-2026-07-01.md`
5. `reports/current-state-2026-06-27.md`
6. `reports/deep-research-report-2026-06-27.md`
7. `scripts/build_solo_training_schedule.ps1`
8. `regional/Tasks/<00..08>/README.md`

Important rule: if a report conflicts with the workbook, parse the workbook directly and report the contradiction.
