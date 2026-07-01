# Audit follow-up memo — 2026-07-01

Purpose: coordination note between Codex and GPT/Deep Research passes.

This memo records what remains valid from the latest GPT audit, what is stale, and what the next patch pass should actually target.

## Source of truth

Current workbook:

- `../ICPC_Solo_Training_Schedule_2026_2027.xlsx`

Rule:

- If any report/audit conflicts with the workbook, parse the workbook directly and report the contradiction.
- Do not re-apply patches that are already reflected in the workbook.

## Current workbook facts, re-parsed on 2026-07-01

Sheet `Solo Timeline`:

| Metric | Value |
|---|---:|
| Timeline data rows | 377 |
| Learn rows | 51 |
| Hard rows | 86 |
| Review rows | 84 |
| Sprint rows | 80 |
| Contest rows | 38 |
| Upsolve rows | 38 |
| Learn + Hard rows | 137 |
| Judged tasks with submit link | 118 |
| Manual/self-practice Learn-support rows | 19 |
| Pre-Regional judged tasks, W1-W19 | 73 |
| Pre-Regional judged hours, W1-W19 | 322.5 |

Pre-Regional judged source mix:

| Source | Count |
|---|---:|
| ICPC / VNOI | 26 |
| Codeforces | 15 |
| CSES | 10 |
| QOJ / Universal Cup | 9 |
| Kattis ICPC | 5 |
| Other judge | 4 |
| Codeforces Gym | 3 |
| OI / oj.uz | 1 |

Pre-Regional judged topic mix:

| Topic | Count |
|---|---:|
| 01 - Graph and Modeling | 11 |
| 06 - Strings | 9 |
| 05 - Math and Counting | 9 |
| 04 - Advanced DP | 8 |
| 03 - Tree | 8 |
| 00 - Implementation, Greedy, Search | 7 |
| 02 - Data Structures | 7 |
| 07 - Geometry | 7 |
| 08 - Proof, Constructive, Game | 7 |

W16-W19 contests currently in workbook:

| Week | Contest row |
|---:|---|
| W16 | Chengdu Regional 2025 (virtual 5h) |
| W17 | Nanjing Regional 2025 (virtual 5h) |
| W18 | Shenyang Regional 2025 (virtual 5h) |
| W19 | Shanghai Regional 2025 (virtual 5h) |

## What the latest GPT audit got right

The latest audit is directionally useful on these points:

1. The schedule is not lacking volume; the main risk is composition and conversion.
2. The plan should prioritize contest floor and implementation reliability before adding more hard problems.
3. Review/Sprint rows are philosophically correct but need concrete targets.
4. Learn-support rows need real deliverables, not vague self-study labels.
5. W1-W8 at ~45h/week is only sustainable if adaptive debt/deload rules are actually followed.
6. Fixed 5h upsolve is a reasonable default, but not sufficient when contest debt grows.
7. Post-Regional APAC block should eventually be phase-structured, not just APAC replay forever.

## Stale or incorrect claims in the latest GPT audit

Do not use these claims without rechecking:

| Stale claim | Current workbook reality |
|---|---|
| Workbook has 404 timeline rows | Workbook currently has 377 timeline rows |
| Pre-Regional has 67 judged tasks | Current W1-W19 has 73 judged tasks |
| There are 50 Learn-support rows | Current workbook has 19 manual/self-practice Learn-support rows |
| W16-W19 still replay Southern 2021-2024 | W16-W19 already use Chengdu/Nanjing/Shenyang/Shanghai 2025 |
| Main urgent patch is to replace W16-W19 contests | Already done in current workbook |
| Current source mix is 24 ICPC/VNOI, 18 CSES, 14 CF, 3 QOJ, 1 Gym, 0 OJ.uz | Current parse: 26 ICPC/VNOI, 15 CF, 10 CSES, 9 QOJ, 5 Kattis, 3 Gym, 1 OJ.uz |

The stale claims likely come from an older workbook/report snapshot.

## Patch plan still relevant

### 1. Make Learn-support rows concrete

Current manual Learn-support rows are much fewer than the stale audit claimed, but they still need clearer deliverables.

Each support row should end with at least one of:

- a canonical judged anchor;
- a template implementation;
- a brute/stress harness;
- a short pitfall checklist.

Suggested row note format:

```text
Deliverable: <template/problem/harness> | Checks: <stress/brute/examples> | Pitfalls: <3-7 bullets>
```

Priority support rows to harden:

- Fenwick + lazy segment tree stress
- Subset DP + submask sanity
- Tree path toolkit hardening
- KMP/Z/prefix-function regression
- Dinic + min-cut certificate
- Matching toolkit + random checker
- Low-link decomposition stress
- Segment Tree Beats survival kit
- HLD + virtual tree hardening
- Aho-Corasick + suffix toolkit
- NTT + modular convolution checks
- Geometry sweep-line sanity pack
- Sprague-Grundy + MITM pack

### 2. Make Review/Sprint measurable

Review/Sprint rows should not remain generic checkboxes.

Minimal format to put in row `Notes` or `Weekly Brief`:

```text
Target: <task/template> | Source week: W__ | Outline: __ min | First compile: __ min | AC/final: __ min | WA/RE: __ | Bug class: __ | Stress: Y/N
```

Rules:

- Review +7: pick one high-transfer miss/bug/model issue from the previous week.
- Review +21: pick one previously AC task that should still be reconstructible.
- Sprint short: blank-file re-code of a known solution.
- Sprint long: re-code + brute/stress + adversarial tests.
- If no task fits, fallback to a fragile template: Dinic, HLD, DSU rollback, suffix/Aho, segment tree beats, geometry primitives.

### 3. Add adaptive upsolve/debt rule

Keep the default 5h upsolve, but add a rule for when it is not enough.

Suggested rule:

- If 1 high-transfer contest problem remains unresolved: take time from the next Learn-support block.
- If 2+ high-transfer contest problems remain unresolved: freeze one fresh Hard row next week.
- If upsolve debt exceeds 5h, or a Hard task overruns by more than 2h: cut new Learn/support first, then one fresh Hard if needed.
- If actual workload exceeds planned workload for two consecutive weeks: keep contest + upsolve + minimum 1 Review + 1 Sprint; reduce new Learn/Hard.

### 4. Audit W9-W19 for judged anchor density

The main live question is no longer "are W16-W19 clean?" They are.

The live question is:

- Does W9-W19 have enough concrete judged anchors for Regional lead growth?
- Are flow/matching/min-cut, DS hard, strings, geometry, and game/proof represented by actual judged tasks, not only support rows?

Potential action:

- Convert 2-4 support hours in selected W9-W19 weeks into one judged anchor when the week is otherwise too generic.
- Do not increase total weekly cap.
- Do not add hard tasks blindly; use existing support time as the budget.

### 5. Keep CSES as canonical, not primary

Current pre-Regional CSES count is 10, lower than the stale audit claimed.

This is acceptable if CSES rows are used as:

- quick canonical anchors;
- sprint/re-code material;
- template sanity checks.

Do not expand CSES as the main judged source.

### 6. Post-Regional APAC block needs a later pass

W22-W40 is less urgent than the pre-Regional schedule.

Later, phase it into:

1. APAC core bridge;
2. APAC hard technique blocks;
3. APAC simulation/contest blocks;
4. replay/retention cycles.

Avoid treating repeated APAC 2024/2025/2026 cycles as clean benchmark performance.

## Suggested next patch pass

If there is only one 2-3 hour patch window, do this:

1. Add concrete deliverables to all 19 Learn-support rows.
2. Add Review/Sprint target format to Weekly Brief / Notes.
3. Add upsolve debt and adaptive deload rule to Weekly Brief.
4. Re-audit W9-W19 and identify 3-5 weeks where a support row should become a judged anchor.
5. Only then consider swapping individual tasks.

## Prompt note for future GPT passes

Use this note when asking another GPT to continue:

```text
The previous audit contains stale workbook claims. Current workbook facts are in `reports/audit-followup-2026-07-01.md`. Do not re-apply W16-W19 benchmark replacement; current W16-W19 already use Chengdu/Nanjing/Shenyang/Shanghai 2025. Focus on Learn-support deliverables, Review/Sprint measurability, adaptive upsolve debt, and W9-W19 judged anchor density.
```

