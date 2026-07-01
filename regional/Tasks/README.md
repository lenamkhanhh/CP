# Regional Tasks

Folder nay la problem bank de on ICPC Asia Regional.

## Ket qua audit

Bank cu phu tot cac topic kho, nhung bi lech ve bai tach top va thieu implementation/greedy. Ban hien tai duoc sua theo 5 tang:

- `A - Foundation`: primitive/template bat buoc.
- `B - Regional core`: bai transfer truc tiep sang contest.
- `C - Advanced core`: ky thuat nang nhung van trong scope Regional.
- `D - Regional scoring pipeline`: bai contest that nen giai duoc sau A/B.
- `E - Stretch pipeline`: bai tach top/OI, khong dung de chan tien do Regional.

Khong can lam het moi checkbox. Muc tieu la vuot `Coverage gate` cua tung folder.

## Thu tu nen lam

### Pass 1 - Lay diem va primitive

1. `00_implementation_greedy_search`
2. Muc `A` cua `01_graph_modeling`
3. Muc `A` cua `02_data_structures`
4. Muc `A` cua `03_tree`
5. Muc `A` cua `04_dp_advanced`
6. Muc `A` cua `05_math_counting`, `06_strings`, `07_geometry`

### Pass 2 - Regional core

1. Muc `B` cua graph, data structures, tree, DP.
2. Muc `B` cua math, strings, geometry.
3. Greedy/proof/game core.
4. `Regional scoring pipeline` cua moi topic.

### Pass 3 - Bai tach top

1. Muc `C` theo vai tro tung thanh vien.
2. `Stretch pipeline`.
3. OI-level chi lam neu da vuot gate Regional core.

Neu dang gap de Regional that, uu tien:

1. Implementation/greedy/search.
2. Graph/modeling.
3. Data structures.
4. Tree.
5. DP.

## Regional-ready gate

Khong co danh sach nao dam bao cover moi de. Dung cac gate sau de biet pipeline da du de danh Regional:

- [ ] Vuot `Coverage gate` cua topic 00-08; cac muc ghi `owner` chi can mot thanh vien.
- [ ] Ba virtual Regional lien tiep giai duoc it nhat 5 bai, va khong bo sot bai de vi thieu primitive.
- [ ] Moi bai fail duoc tag: `model`, `technique`, `implementation`, `proof` hoac `time management`.
- [ ] Sau upsolve 7 ngay, giai lai bai fail ma khong xem note/code cu.
- [ ] Team co template da stress cho graph, DS, tree, strings, geometry va math co ban.

## Cach dung pipeline tasks

Pipeline tasks khong phai bai dau tien cua topic. Thu tu bat buoc:

1. Doc `Reading` de refresh ky thuat.
2. Hoan thanh gate `A`.
3. Lam 2-4 bai `B`.
4. Lam `scoring pipeline`, set timer 90-180 phut/bai.
5. Chi sau do moi lam `stretch pipeline`, set timer 2-4 gio/bai.
6. Neu fail, khong doc full loi giai ngay. Viet lai:
   - Model minh da nghi.
   - Vi sao model sai/thieu.
   - Ky thuat dung la gi.
   - Template nao can bo sung.

## Vietnam Regional virtuals

Lam cac contest nay dung 5 gio. Sau contest, dem bai fail ve folder topic tuong ung de upsolve.

- [ ] [VNOI ICPC 2021 Regional](https://oj.vnoi.info/contest/icpc21_regional_m)
- [ ] [VNOI ICPC 2022 Regional](https://oj.vnoi.info/contest/icpc22_regional)
- [ ] [VNOI ICPC 2023 Regional](https://oj.vnoi.info/contest/icpc23_regional)
- [ ] [VNOI ICPC 2024 Regional](https://oj.vnoi.info/contest/icpc24_regional)
- [ ] [VNOI ICPC 2025 Regional](https://oj.vnoi.info/contest/icpc25_regional)

## Topic index

- [00 - Implementation, Greedy, Search](00_implementation_greedy_search/README.md)
- [01 - Graph and Modeling](01_graph_modeling/README.md)
- [02 - Data Structures](02_data_structures/README.md)
- [03 - Tree](03_tree/README.md)
- [04 - Advanced DP](04_dp_advanced/README.md)
- [05 - Math and Counting](05_math_counting/README.md)
- [06 - Strings](06_strings/README.md)
- [07 - Geometry](07_geometry/README.md)
- [08 - Proof, Constructive, Game](08_proof_constructive_game/README.md)

## Coverage matrix

| Topic | Must cover truoc Regional | Advanced/owner |
|---|---|---|
| Implementation | sorting, prefix, two pointers, greedy, binary search, simulation | meet-in-the-middle, local contribution, heavy casework |
| Graph | shortest path, SCC, low-link, MST, 2-SAT, flow/matching | block-cut tree, functional graph, bitset DAG, min-cost flow |
| Data structures | Fenwick, lazy segment tree, sparse table, order statistic | persistent, Beats, Mo, rollback/PBS |
| Tree | LCA, Euler, rerooting, HLD, path difference | DSU on tree, centroid, virtual tree |
| DP | interval, bitmask, digit, profile, tree/rerooting | CHT, D&C, Knuth, WQS |
| Math | modular, CRT, combinatorics, sieve, divisor counting, inclusion-exclusion | Mobius/phi, floor sum, NTT, Gaussian/XOR basis |
| Strings | KMP/Z/hash, trie/Aho, suffix array/LCP | suffix automaton, Manacher/automaton DP |
| Geometry | orientation, intersection, polygon, hull | sweep line, rotating calipers, circle/precision |
| Proof/game | exchange argument, invariant, necessary/sufficient | SG, tree game, hard constructive |

## Duplicate rule

Mot so bai co nhieu tag nen xuat hien o hai folder, vi du `Hamiltonian Path Remix`, `Group Raiding`, `Fancy Fence`. Chi can AC mot lan; o folder con lai chi viet note theo goc nhin cua topic do.

| Problem | Folder owner |
|---|---|
| Sliding Window Cost | `00_implementation_greedy_search` |
| Prefix Flip Hard Version | `00_implementation_greedy_search` |
| COT | `03_tree` |
| Finest Final String | `04_dp_advanced` |
| Hamiltonian Path Remix | `04_dp_advanced` |
| Group Raiding | `05_math_counting` |
| Fancy Fence | `07_geometry` |
| Divisibility Grid | `08_proof_constructive_game` |

## Upsolve rule

Voi moi bai fail, tao note trong `../upsolve/`:

```text
Problem:
Link:
Status: idea missing / implementation bug / not enough template
Key idea:
What to learn:
Retry date:
```
