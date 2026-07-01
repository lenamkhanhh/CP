# Verified judged anchors patch - 2026-07-01

Purpose: verify four proposed judged anchors for pre-Regional ICPC training and give a narrow generator/workbook patch spec. This is **not** a full plan re-audit.

Primary goal: improve contest floor, conversion, and implementation reliability before ICPC Asia Regional 2026. Do not turn this into hard-grind or APAC/OI stretch before Regional.

## 1. Anchor verification verdict

| Task | Verified submit/source | Editorial/tutorial | Classification | Realistic hours | Should replace W10/W11/W15/W18 Learn-support? |
|---|---|---|---|---:|---|
| Kattis Minimum Cut | Official Kattis problem page: `https://open.kattis.com/problems/mincut` | No verified public official editorial found. Technique support: `https://cp-algorithms.com/graph/dinic.html` | Regional core | 3.0-3.5h | Not W10. Current generator has min-cut support in **W9** as `Dinic + min-cut certificate`; this maps better to W9. |
| Codeforces 1000E - We Need More Bosses | Official CF problem page: `https://codeforces.com/problemset/problem/1000/E` | Official CF tutorial: `https://codeforces.com/blog/entry/60288` | Regional hard | 4.0-4.5h | Yes, replace W11 `Low-link decomposition stress`. |
| Kattis String Multimatching | Official Kattis problem page: `https://open.kattis.com/problems/stringmultimatching` | No verified public official editorial found. Technique support: `https://cp-algorithms.com/string/aho_corasick.html` | Regional core / implementation reliability anchor | 3.5-4.0h | Yes, replace W15 `Aho-Corasick + suffix toolkit`. |
| UCup Hong Kong 2025 A - Bipartite Graph Matching Problem | Official UCup problem page: `https://contest.ucup.ac/contest/3169/problem/15432?v=1` | Official Hong Kong 2025 analysis attachment: `https://contest.ucup.ac/download.php?id=3169&r=1&type=attachments` | APAC stretch, not Regional-floor patch | 8-10h+ | No. Do not put this in W18 pre-Regional. Keep post-Regional/APAC. |

Conclusion: use **3 strong yes** anchors now: W9 optional min-cut, W11 low-link, W15 Aho/string. Do **not** use UCup Hong Kong A before Regional. If a W18 matching judged anchor is still needed, use a safer fallback such as CF 510E instead of UCup A.

Fallback only if matching must become judged before Regional:

| Week | Task | Submit | Tutorial | Expected hours | Note |
|---|---|---|---|---:|---|
| W18 fallback | Codeforces 510E - Fox And Dinner | `https://codeforces.com/problemset/problem/510/E` | `https://codeforces.com/blog/entry/16173` | 5.0h | Regional-hard flow/modeling. Use only if W18 really needs judged matching exposure. |

## 2. 19 support deliverables mapped to current generator/workbook row names

The current generator stores support rows in `$learnSupportByWeek`, and `Add-PlannedLearnSupportRow` materializes them as manual `Learn` rows. Keep these row names unless the replacement table below says to convert the row to a judged anchor.

| Week | Current row name | Patch spec |
|---|---|---|
| W1 | `Template hygiene: compile-all smoke` | Keep. Compile final kit with `gnu++20`; smoke-test DSU, Dijkstra, Fenwick, segtree; log compile warnings. |
| W2 | `Fenwick + lazy segment tree stress` | Keep. 30 randomized add/assign/query tests vs brute array; record invariant failures. |
| W3 | `Subset DP + submask sanity` | Keep. SOS/submask loops from blank; compare against brute for `n <= 16`, 20 seeds. |
| W4 | `Tree path toolkit hardening` | Keep. LCA + Euler + path-difference helpers; verify on 30 random trees. |
| W5 | `KMP/Z/prefix-function regression` | Keep. Implement KMP/Z from blank; 30 random string comparisons; short KMP vs Z vs hash note. |
| W6 | `CRT + rolling-hash self-test` | Keep. CRT merge stress + double-hash edge cases; document overflow/collision traps. |
| W7 | `Convex hull + XOR basis harness` | Keep. Hull/diameter and xor-basis brute checks on random small inputs. |
| W8 | `Rerooting + invariant notebook` | Keep. Reroot skeleton + 3 constructive tasks rewritten as state/move/invariant/terminal. |
| W9 | `Dinic + min-cut certificate` | Optional convert to judged anchor `Kattis Minimum Cut` for 3.0-3.5h. Remaining time: residual reachability/min-cut certificate note. |
| W10 | `Matching toolkit + random checker` | Keep implementation support. Do not replace with UCup Hong Kong A. Optional fallback only if W18 needs judged matching. |
| W11 | `Low-link decomposition stress` | Convert to judged anchor `CF 1000E - We Need More Bosses` for 4.0-4.5h. Output: AC + bridge-tree diameter note + 5 low-link pitfalls. |
| W12 | `Segment Tree Beats survival kit` | Keep. Beats template + brute comparator + 10 killer cases. |
| W13 | `DP optimization condition sheet` | Keep. D&C/CHT/Knuth condition sheet; one tiny validated recurrence for each applicable method. |
| W14 | `HLD + virtual tree hardening` | Keep. HLD + virtual-tree builders; random path-query and LCA-closure tests. |
| W15 | `Aho-Corasick + suffix toolkit` | Convert to judged anchor `Kattis String Multimatching` for 3.5-4.0h. Remaining time: AC output-link/fail aggregation note. |
| W16 | `NTT + modular convolution checks` | Keep support only. Do not add new hard; preserve late-Regional contest energy. |
| W17 | `Geometry sweep-line sanity pack` | Keep. Event ordering + active-set invariants + degeneracy cases under sanitizer. |
| W18 | `Sprague-Grundy + MITM pack` | Do not use UCup Hong Kong A. Optional fallback only: `CF 510E - Fox And Dinner`, 5.0h, if matching gap remains. |
| W19 | `Regional template freeze + timing drill` | Keep. Final kit smoke test + timed re-code Dinic/HLD/AC from blank. |

## 3. Review/Sprint note template for Excel Notes

Current generator already has Review +7/+21 and Sprint rows. Replace long notes with this short Excel-friendly template:

```text
Target=<task/template> | Mode=+7/+21/sprintS/sprintL | Outline=__m | Compile=__m | AC=__m | WA/RE=__ | Bug=__ | Stress=Y/N
```

Target selection rule:

```text
Review +7: recent AC/near-AC with WA, overrun, or editorial dependency.
Review +21: highest-transfer task from 3 weeks ago; reconstruct invariant before code.
Sprint short: known AC/template, blank-file re-code, no new solve.
Sprint long: known long implementation + 20-30m brute/stress.
```

## 4. Upsolve debt rule text for Weekly Brief

Paste this exact block into Weekly Brief notes:

```text
Upsolve debt:
0-1 high-transfer miss and debt<=2h: keep normal 5h upsolve.
1 high-transfer miss or debt 2-5h: borrow from Learn-support first.
>=2 high-transfer misses or debt>5h: freeze one new Hard next week.
Debt>5h for 2 consecutive weeks: cut Learn-support/judged add; keep contest + key upsolve + 1 Review + 1 Sprint.
```

## 5. Optional judged anchor replacements/additions

Apply only these. Do not propose extra tasks unless one of these becomes unavailable.

| Week | Row to replace | Task name | Submit/source link | Editorial/tutorial | Expected hours | Decision |
|---|---|---|---|---|---:|---|
| W9 | `Dinic + min-cut certificate` | `Kattis Minimum Cut` | `https://open.kattis.com/problems/mincut` | `https://cp-algorithms.com/graph/dinic.html` | 3.0-3.5h | Recommended if judged min-cut exposure is desired. It should replace W9, not W10. |
| W11 | `Low-link decomposition stress` | `Codeforces 1000E - We Need More Bosses` | `https://codeforces.com/problemset/problem/1000/E` | `https://codeforces.com/blog/entry/60288` | 4.0-4.5h | Recommended. |
| W15 | `Aho-Corasick + suffix toolkit` | `Kattis String Multimatching` | `https://open.kattis.com/problems/stringmultimatching` | `https://cp-algorithms.com/string/aho_corasick.html` | 3.5-4.0h | Recommended. |
| W18 | `Sprague-Grundy + MITM pack` | `UCup Hong Kong 2025 A - Bipartite Graph Matching Problem` | `https://contest.ucup.ac/contest/3169/problem/15432?v=1` | `https://contest.ucup.ac/download.php?id=3169&r=1&type=attachments` | 8-10h+ | Not recommended pre-Regional. Keep as post-Regional/APAC stretch. |
| W18 fallback only | `Sprague-Grundy + MITM pack` | `Codeforces 510E - Fox And Dinner` | `https://codeforces.com/problemset/problem/510/E` | `https://codeforces.com/blog/entry/16173` | 5.0h | Use only if a judged matching anchor is still required before Regional. |

## 6. Minimal generator/workbook patch instructions

1. In `scripts/build_solo_training_schedule.ps1`, keep the existing `$learnSupportByWeek` structure.
2. Do not add columns.
3. Update Review/Sprint `Why` notes to use the short template above.
4. Add the Weekly Brief debt rule text.
5. For judged conversions, either:
   - add these tasks into the correct task bank and force them into W9/W11/W15 by queue/order rules; or
   - special-case the support row conversion in generator for W9/W11/W15.
6. Do not place UCup Hong Kong 2025 A before Regional.
7. If W18 matching judged anchor is required, use CF 510E as fallback and reduce/cut W18 support time to keep weekly cap unchanged.

## 7. Final decision

Recommended patch for Codex:

- Replace W11 support with `CF 1000E - We Need More Bosses`.
- Replace W15 support with `Kattis String Multimatching`.
- Optionally replace W9 support with `Kattis Minimum Cut` if judged min-cut exposure is still missing.
- Do **not** replace W18 with UCup Hong Kong A.
- Keep W18 support as-is, unless matching gap remains; then use CF 510E fallback.

This serves the short-term target: raise contest floor, improve conversion and implementation reliability, and avoid pre-Regional hard-grind.
