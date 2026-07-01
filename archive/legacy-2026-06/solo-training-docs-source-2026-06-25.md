# ICPC Solo Training Plan 2026-2027

Generated: 25/06/2026

## Goal

Train for ICPC Asia Regional first, then use the remaining stretch block for APAC/Asia-level hard practice.

The plan is designed for a solo lead role: prioritize hard modeling, proof, long implementation, and contest conversion. CSES is kept only as primitive/template warm-up.

## Current Schedule

- No planned training before 17/07/2026.
- Week 1 starts on 20/07/2026.
- Normal week: about 35 hours.
- Weekly structure:
  - 25h problem pool.
  - 5h virtual contest.
  - 5h upsolve.
- Regional week starting 07/12/2026 is a light taper week.
- The generated workbook ends on 30/05/2027, so work after Regional is Asia/APAC stretch.

## Workbook

- Main workbook: `CP/ICPC_Solo_Training_Schedule_2026_2027.xlsx`
- Verify workbook: `CP/ICPC_Solo_Training_Schedule_2026_2027__verify.xlsx`
- Generator script: `CP/scripts/build_solo_training_schedule.ps1`

Regenerate with:

```powershell
powershell -ExecutionPolicy Bypass -File CP\scripts\build_solo_training_schedule.ps1
```

## Problem Bank Mix

The active generated timeline has 207 unique problem rows.

| Source | Count |
|---|---:|
| QOJ / Universal Cup | 56 |
| OJ.uz | 58 |
| Kattis ICPC | 21 |
| ICPC / VNOI | 27 |
| Codeforces Gym | 11 |
| Codeforces | 14 |
| CSES | 18 |
| Other judge | 2 |

CSES ratio: 18 / 207 = 8.7%.

## Topic Coverage

| Topic | Problems | First week | Pre-Regional | Thinking >= 4 | Implementation >= 4 |
|---|---:|---:|---:|---:|---:|
| Implementation, Greedy, Search | 18 | 1 | 15 | 16 | 14 |
| Graph and Modeling | 26 | 1 | 22 | 24 | 24 |
| Data Structures | 24 | 2 | 13 | 21 | 21 |
| Tree | 24 | 4 | 10 | 20 | 19 |
| Advanced DP | 26 | 3 | 13 | 24 | 22 |
| Math and Counting | 22 | 6 | 9 | 22 | 16 |
| Strings | 20 | 5 | 10 | 19 | 18 |
| Geometry | 22 | 7 | 8 | 22 | 20 |
| Proof, Constructive, Game | 25 | 3 | 10 | 25 | 21 |

Pre-Regional total: 110 problems.

## How To Use

Use the `Solo Timeline` sheet as the source of truth.

For each week:

1. Do rows in order if possible.
2. If a problem exceeds one serious session, mark it as `Upsolve` or `Retry` instead of burning the whole week.
3. Keep contest rows strict: 5 hours, no editorial during contest.
4. Upsolve the previous contest before starting too many new hard tasks.
5. Put solution links and notes in the `Notes` column or in the GitHub solutions repository.

## Interpretation Of Metadata

- `Source type`: where the problem comes from.
- `Contest/source`: original contest or archive.
- `Thinking`: 1-5 rating for idea/proof/modeling pressure.
- `Implementation`: 1-5 rating for code length and bug risk.
- `Expected hours`: planning estimate, not a hard deadline.
- `Editorial/blog`: official source page, tutorial, or source archive when available.
- `Why this problem`: why it is in the pipeline.

## Quality Checks Passed

- 207 unique problem rows.
- No duplicate exact task names in workbook.
- No missing submit links.
- No missing technique/source/thinking/implementation/editorial/why metadata.
- No normal week exceeds 35 hours.
- Regional taper week is 11 hours.
- No `#REF!` or `#VALUE!` formulas.
- All 9 topics appear before week 8.

