# Profile solved inventory — 2026-07-01

Purpose: keep a current, non-secret evidence snapshot for training-plan decisions.

No passwords or session tokens are stored in this repo.

## Current interpretation

The training plan should not treat core techniques such as Dinic, matching, HLD, virtual tree, Aho-Corasick, suffix structures, and classic DP optimizations as completely new from zero.

For this profile, many of those topics should be trained as:

- reactivation after a long gap;
- implementation reliability;
- choosing the fastest safe variant in contest;
- stress testing and bug-pattern reduction;
- recognizing when a heavy template is unnecessary.

New learning should focus more on unfamiliar variants, modeling perspectives, edge cases, and high-transfer Regional-hard applications rather than re-reading standard theory only.

## Reflection prompts now stored

The upsolve/modeling prompts are stored in:

- `regional/upsolve/README.md`

The implementation-choice prompts are stored in:

- `regional/templates/README.md`

## Public Codeforces inventory

Source: Codeforces public API `user.status`.

Handles checked:

- `Average2k7`
- `wibulord`

### `Average2k7`

| Metric | Value |
|---|---:|
| Submissions parsed | 218 |
| Unique accepted problems | 123 |
| Distinct contests touched | 49 |
| Gym-like contests touched | 1 |
| Rated accepted submissions counted | 134 |
| Max accepted rating | 3000 |
| Accepted rating >= 1800 | 46 |
| Accepted rating >= 2200 | 20 |
| Accepted rating >= 2400 | 13 |

Top accepted tags:

| Tag | Count |
|---|---:|
| greedy | 63 |
| math | 56 |
| data structures | 37 |
| implementation | 32 |
| constructive algorithms | 28 |
| dp | 24 |
| brute force | 23 |
| binary search | 20 |
| two pointers | 19 |
| number theory | 16 |
| bitmasks | 14 |
| sortings | 14 |

Latest accepted sample:

| Date | Contest | Index | Problem | Rating |
|---|---:|---|---|---:|
| 2026-06-09 | 2233 | F | Shortest GCD Paths | 2800 |
| 2026-06-09 | 2233 | D | Goods on the Shelf | 1900 |
| 2026-06-09 | 2233 | C | Cost of a Bracket Sequence | 1400 |
| 2026-06-09 | 2233 | B | Different Distances | 900 |
| 2026-06-09 | 2233 | A | AI Project Development | 800 |
| 2026-06-07 | 2234 | F | Vessels, Heights and Two Versions (Hard Version) | 1900 |
| 2026-06-07 | 2234 | D | XOR, Expression and Two Binary Numbers | 1500 |
| 2026-06-07 | 2234 | C | Vessels, Heights and Two Versions (Easy Version) | 1200 |

### `wibulord`

| Metric | Value |
|---|---:|
| Submissions parsed | 986 |
| Unique accepted problems | 412 |
| Distinct contests touched | 198 |
| Gym-like contests touched | 8 |
| Rated accepted submissions counted | 483 |
| Max accepted rating | 2700 |
| Accepted rating >= 1800 | 133 |
| Accepted rating >= 2200 | 58 |
| Accepted rating >= 2400 | 16 |

Top accepted tags:

| Tag | Count |
|---|---:|
| greedy | 199 |
| math | 181 |
| dp | 149 |
| implementation | 139 |
| data structures | 118 |
| brute force | 96 |
| constructive algorithms | 91 |
| sortings | 73 |
| strings | 54 |
| binary search | 53 |
| dfs and similar | 50 |
| bitmasks | 44 |

Latest accepted sample:

| Date | Contest | Index | Problem | Rating |
|---|---:|---|---|---:|
| 2024-08-21 | 2001 | D | Longest Max Min Subsequence | 1900 |
| 2024-08-21 | 2001 | C | Guess The Tree | 1500 |
| 2024-08-20 | 2001 | B | Generate Permutation | 800 |
| 2024-08-20 | 2001 | A | Make All Equal | 800 |
| 2024-08-14 | 2000 | H | Ksyusha and the Loaded Set | 2200 |
| 2024-08-14 | 2000 | F | Color Rows and Columns | 1900 |
| 2024-08-13 | 2000 | E | Photoshoot for Gorillas | 1400 |
| 2024-08-13 | 2000 | D | Right Left Wrong | 1200 |

### Codeforces implication

The combined Codeforces evidence is enough to say:

- core CP exposure is not beginner-level;
- greedy/math/DP/DS/implementation are not empty topics;
- there is meaningful hard-problem history, including 2200+ and 2400+ accepted tasks;
- the plan should emphasize reactivation, contest conversion, implementation reliability, and ICPC-style modeling more than basic theory volume.

## Public VNOJ inventory

Source: public VNOJ profile and public submissions page for `khanhss`.

Profile facts observed:

| Metric | Value |
|---|---:|
| Problems solved shown on profile | 404 |
| Points rank | #577 |
| Total points | 63.68 |
| Rating rank | #3026 |
| Current rating | 1394 |
| Min rating | 1341 |
| Max rating | 1511 |

Public submissions parsed:

| Metric | Value |
|---|---:|
| Public pages parsed | 5 |
| Submissions parsed | 250 |
| AC/PAC unique problems in parsed recent submissions | 37 |

Recent accepted-like sample:

| Code | Problem |
|---|---|
| `vnoicup26_r1_b` | Swap by Sum |
| `vnoicup26_r1_a` | Robot Cleaner 2 |
| `bedao_oi7_e` | Bedao OI Contest 7 - ART SCHOOL |
| `tst25_bai1` | TST 2025 - Bài 1 |
| `vnoicup25_r1_e` | Zero AND Sum |
| `vnoicup25_r1_b` | Biến Đổi Số |
| `vnoicup25_r1_c` | Stonk |
| `bkcc3_g` | Guessing game |
| `bkcc3_d` | Data Normalization |
| `bkcc3_a` | Arcane Crystal Fusion |
| `bkcc3_e` | Efficient Arrangement |
| `bkcc3_h` | Harmonization Module |
| `bkcc3_l` | Lumberjack |
| `bkcc3_j` | Jewels of Illumination |
| `tjalg` | Tìm TPLT mạnh |
| `graph_` | Tìm khớp và cầu (Cơ bản) |
| `fc132_superseq` | Free Contest 132 - SUPERSEQ |
| `fc069_calsum` | Free Contest 69 - CALSUM |
| `vnoicup24_final_e` | Diện Tích Bao Lồi |
| `qbmst` | Cây khung nhỏ nhất (HEAP) |

### VNOJ implication

The VNOJ profile confirms broad Vietnamese OJ exposure and recent contest activity. The rating gap versus Codeforces hard-solve evidence supports the current diagnosis: the main bottleneck is likely contest conversion/floor stability, not raw ability to understand individual hard problems.

## Public LQDOJ inventory

Source: public LQDOJ profile and solved page for `khanhss`.

Profile facts observed:

| Metric | Value |
|---|---:|
| Current rating | 1458 |
| Min rating | 902 |
| Max rating | 1465 |
| Problems solved | 78 |
| Total points | 69253 |
| Rating rank | 1836 |
| Points rank | 941 |
| Contests written | 14 |

Solved page observations:

- Public solved/points breakdown is visible without login.
- It includes multiple high-point LQDOJ Cup tasks around 1800-2400pp.
- It includes a CSES section with solved translated CSES tasks.

High-point sample from visible solved page:

| Problem | Status / score |
|---|---|
| LQDOJ Cup 2024 Round #2 - Truy vấn thay đổi | AC, 100/100, 2400pp |
| LQDOJ Cup 2023 Round 4 - Store | AC, 100/100, 2300pp |
| LQDOJ Cup 2024 Round #1 - Cây truy vấn | TLE, 99/100, 2277pp |
| LQDOJ Cup 2024 Round #4 - Tháp khỉ | AC, 100/100, 2200pp |
| LQDOJ Cup 2024 Round #4 - Biến đổi tối giản | AC, 100/100, 2200pp |
| LQDOJ Cup 2024 Round #2 - Biến đổi dãy ngoặc | AC, 100/100, 2200pp |
| Cây tre trăm đốt | AC, 100/100, 2200pp |

### LQDOJ implication

LQDOJ adds evidence that the profile has solved nontrivial local/Vietnamese tasks and should not spend too much plan budget on basic CSES-style reacquisition. However, because several tasks are local/OI-ish, the training schedule should still prioritize ICPC Regional transfer over local-point maximization.

## CSES / Szkopul / authenticated accounts

Provided accounts:

- CSES: username known, password provided in chat.
- LQDOJ: username known, password provided in chat.
- Szkopul: username known, password provided in chat.

Current status:

- Credentials were not written into any file.
- Credentials were not committed.
- Authenticated scraping has not been run yet, to avoid putting passwords into shell command history or tool-call logs.

Suggested safe next step:

1. Add a small local-only script that reads credentials from environment variables.
2. Add its output files to `.gitignore` if they include private raw exports.
3. Commit only summarized, non-secret aggregate findings.

Example environment variable names:

```text
CSES_USER
CSES_PASS
LQDOJ_USER
LQDOJ_PASS
SZKOPUL_USER
SZKOPUL_PASS
```

## Immediate schedule implication

Given the evidence above and the user's self-report that Dinic, matching, HLD, virtual tree, Aho, suffix structures, and classic DP optimizations are already known:

1. Do not label these topics as "learn from zero".
2. Label them as "reactivate + implement reliably + choose variant".
3. Keep a few judged anchors for proof of recall.
4. Spend upsolve notes on observation/model/pattern triggers.
5. Spend sprint notes on implementation variant choice and bug traps.

