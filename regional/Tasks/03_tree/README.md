# 03 - Tree

Muc tieu: LCA/Euler/HLD phai chac, sau do giai tree + data structure.

## Coverage

- LCA, Euler tour, tree difference, rerooting.
- HLD + segment tree, DSU on tree.
- Centroid decomposition va virtual tree la owner/advanced.

## Recommended order

1. `A`: LCA, Euler, difference, rerooting.
2. `B`: HLD va subtree/path query.
3. K Paths/Awesome MST pipeline.
4. DSU on tree, centroid, virtual tree; OI tasks sau cung.

## Coverage gate

- [ ] Tu code LCA + Euler va HLD khong xem template.
- [ ] AC mot bai rerooting va mot bai tree difference.
- [ ] AC it nhat mot trong DSU on tree/centroid/virtual tree.
- [ ] Race, Magic Tree, Shortcut la stretch, khong chan virtual Regional.

## Reading

- [Robert1003 - Heavy Light Decomposition](https://robert1003.github.io/2020/09/04/heavy-light-decomposition.html)
- [Robert1003 - Centroid Decomposition](https://robert1003.github.io/2020/01/16/centroid-decomposition.html)
- [VNOI Wiki - LCA](https://wiki.vnoi.info/algo/data-structures/lca)
- [VNOI Wiki - Heavy Light Decomposition](https://wiki.vnoi.info/algo/data-structures/heavy-light-decomposition)
- [USACO Guide - Tree DP](https://usaco.guide/gold/dp-trees)
- [Codeforces - DSU on Trees](https://codeforces.com/blog/entry/44351)

## A - Foundation

- [ ] **Company Queries II**  
  Submit: [CSES 1688](https://cses.fi/problemset/task/1688)  
  Key: LCA / binary lifting.  
  Why: Template LCA co ban.

- [ ] **Distance Queries**  
  Submit: [CSES 1135](https://cses.fi/problemset/task/1135)  
  Key: LCA + depth.  
  Why: Path distance dung rat nhieu.

- [ ] **Counting Paths**  
  Submit: [CSES 1136](https://cses.fi/problemset/task/1136)  
  Key: LCA + difference on tree.  
  Why: Trick cong don tren cay rat hay gap.

- [ ] **Path Queries**  
  Submit: [CSES 1138](https://cses.fi/problemset/task/1138)  
  Key: Euler tour + Fenwick/segment tree.  
  Why: Subtree/path value maintenance.

- [ ] **Tree Distances II**  
  Submit: [CSES 1133](https://cses.fi/problemset/task/1133)  
  Key: rerooting DP.  
  Why: Rerooting dang thieu trong bank cu.

## B - Regional core

- [ ] **Path Queries II**  
  Submit: [CSES 2134](https://cses.fi/problemset/task/2134)  
  Key: HLD + segment tree.  
  Why: Core path query template.

- [ ] **Fixed-Length Paths I**  
  Submit: [CSES 2080](https://cses.fi/problemset/task/2080)  
  Key: Tree path counting.  
  Why: Cau noi sang decomposition thinking.

- [ ] **Fixed-Length Paths II**  
  Submit: [CSES 2081](https://cses.fi/problemset/task/2081)  
  Key: Optimized path counting.  
  Why: Kiem soat complexity va implementation.

- [ ] **Lomsat gelral**  
  Submit: [Codeforces 600E](https://codeforces.com/problemset/problem/600/E)  
  Key: DSU on tree.  
  Why: Classic subtree color frequency.

- [ ] **Tree and Queries**  
  Submit: [Codeforces 375D](https://codeforces.com/problemset/problem/375/D)  
  Key: DSU on tree / Mo on tree.  
  Why: Query condition can bookkeeping tot.

- [ ] **Fools and Roads**  
  Submit: [Codeforces 191C](https://codeforces.com/problemset/problem/191/C)  
  Key: Path counting with LCA differences.  
  Why: Core rerun cho tree difference; khong phai stretch.

- [ ] **QTREE**  
  Submit: [SPOJ QTREE](https://www.spoj.com/problems/QTREE/)  
  Key: HLD + segment tree edge weights.  
  Why: Drill implementation HLD.

## C - Advanced core

- [ ] **Xenia and Tree**  
  Submit: [Codeforces 342E](https://codeforces.com/problemset/problem/342/E)  
  Key: centroid decomposition / sqrt rebuild alternative.  
  Why: Bai centroid chuan de lam owner.

- [ ] **Kingdom and its Cities**  
  Submit: [Codeforces 613D](https://codeforces.com/problemset/problem/613/D)  
  Key: virtual tree + tree DP.  
  Why: Virtual tree can it nhat mot bai that, khong chi doc template.

- [ ] **COT**  
  Submit: [SPOJ COT](https://www.spoj.com/problems/COT/)  
  Key: Persistent segment tree + LCA.  
  Why: Chi AC mot lan; Tree la folder owner.

## D - Regional pipeline

- [ ] **ICPC 2022 Regional - K Paths**  
  Submit: [VNOI icpc22_regional_k](https://oj.vnoi.info/problem/icpc22_regional_k)  
  Focus: path counting/modeling.  
  Pipeline: identify whether tree/graph structure can be compressed.

- [ ] **ICPC 2021 Regional - Awesome MST Problem**  
  Submit: [VNOI icpc21_regional_a](https://oj.vnoi.info/problem/icpc21_regional_a)  
  Focus: MST reasoning.  
  Pipeline: prove exchange/cut property before implementation.

## E - Stretch/OI pipeline

- [ ] **Unique Cities**  
  Submit: [OJ.uz JOI19_ho_t5](https://oj.uz/problem/view/JOI19_ho_t5)  
  Focus: tree diameter endpoints + offline + count distinct labels on paths.  
  Pipeline: combine diameter property with sweep over depths; long code.

- [ ] **Meetings 2**  
  Submit: [OJ.uz JOI21_meetings2](https://oj.uz/problem/view/JOI21_meetings2)  
  Focus: centroid decomposition + small-to-large + BIT.  
  Pipeline: heavy tree combine; aggregate answers per subtree size.

- [ ] **Race**  
  Submit: [OJ.uz IOI11_race](https://oj.uz/problem/view/IOI11_race)  
  Focus: weighted tree path, centroid/decomposition thinking.  
  Pipeline: count paths with exact constraint and prune state.

- [ ] **Magic Tree**  
  Submit: [OJ.uz CEOI19_magictree](https://oj.uz/problem/view/CEOI19_magictree)  
  Focus: tree DP with nontrivial transitions.  
  Pipeline: define DP state from tree operations.

- [ ] **Shortcut**  
  Submit: [OJ.uz IOI16_shortcut](https://oj.uz/problem/view/IOI16_shortcut)  
  Focus: tree/path optimization.  
  Pipeline: reduce tree metric, prove candidate structure.

<!-- AUTO: aggressive Gym/OJ/QOJ-heavy supplement -->

## E - Gym/OJ.uz/QOJ/Kattis supplement

Cac bai nay thay the phan CSES du thua trong timeline. Generator se cap CSES o muc primitive va uu tien block nay cho lead-level training.

- [ ] **UCup Nanjing 2025 E - Cyan White Tree**  
  Submit: [UCup 2581E](https://contest.ucup.ac/contest/2581/problem/14805?v=1)  
  Source: QOJ / Universal Cup  
  Contest/source: 2025 ICPC Asia Nanjing Regional  
  Editorial: [Contest tutorials](https://contest.ucup.ac/contest/2581?v=1)  
  Key: tree invariant + dynamic reasoning.  
  Thinking: 5  
  Implementation: 5  
  Hours: 7  
  Why: Asia Regional tree-hard problem, ideal for lead-owner practice.

- [ ] **UCup Hong Kong 2025 I - DFS Order - Extra Stage**  
  Submit: [UCup 3169I](https://contest.ucup.ac/contest/3169/problem/15440?v=1)  
  Source: QOJ / Universal Cup  
  Contest/source: 2025 ICPC Asia Hong Kong Regional  
  Editorial: [Contest tutorials](https://contest.ucup.ac/contest/3169?v=1)  
  Key: DFS order + tree/graph ordering constraints.  
  Thinking: 5  
  Implementation: 4  
  Hours: 6  
  Why: Targets Euler/DFS-order reasoning in a real contest setting.

- [ ] **CF Gym 105484G - Binary Tree**  
  Submit: [Gym 105484G](https://codeforces.com/gym/105484/problem/G)  
  Source: Codeforces Gym  
  Contest/source: The 2024 ICPC Asia Nanjing Regional Contest  
  Editorial: [VJudge mirror metadata](https://vjudge.net/contest/671351)  
  Key: tree structure + DP/greedy over binary tree.  
  Thinking: 5  
  Implementation: 5  
  Hours: 7  
  Why: Nanjing tree problem with heavy reasoning and code.

- [ ] **IOI 2024 - Tree**  
  Submit: [OJ.uz IOI24_tree](https://oj.uz/problem/view/IOI24_tree)  
  Source: OI / oj.uz  
  Contest/source: IOI 2024  
  Editorial: [IOI source](https://oj.uz/problems/source/ioi2024)  
  Key: tree reconstruction / tree DP reasoning.  
  Thinking: 5  
  Implementation: 5  
  Hours: 7  
  Why: Very strong stretch problem for tree owner skill.

- [ ] **IOI 2023 - Beech Tree**  
  Submit: [OJ.uz IOI23_beechtree](https://oj.uz/problem/view/IOI23_beechtree)  
  Source: OI / oj.uz  
  Contest/source: IOI 2023  
  Editorial: [IOI source](https://oj.uz/problems/source/ioi2023)  
  Key: tree hashing / subtree structure.  
  Thinking: 5  
  Implementation: 5  
  Hours: 7  
  Why: Tree-isomorphism flavor that transfers well to hard ICPC tree tasks.

- [ ] **IOI 2020 - Stations**  
  Submit: [OJ.uz IOI20_stations](https://oj.uz/problem/view/IOI20_stations)  
  Source: OI / oj.uz  
  Contest/source: IOI 2020  
  Editorial: [IOI source](https://oj.uz/problems/source/ioi2020)  
  Key: tree labeling + routing proof.  
  Thinking: 5  
  Implementation: 4  
  Hours: 7  
  Why: Proof-heavy tree construction, excellent for invariant practice.

- [ ] **JOISC 2020 - Stray Cat**  
  Submit: [OJ.uz JOI20_stray](https://oj.uz/problem/view/JOI20_stray)  
  Source: OI / oj.uz  
  Contest/source: JOISC 2020  
  Editorial: [JOISC source](https://oj.uz/problems/source/joisc2020)  
  Key: tree/graph movement and state compression.  
  Thinking: 5  
  Implementation: 5  
  Hours: 7  
  Why: JOI-style hard reasoning with implementation bite.

- [ ] **APIO 2021 - Rainforest Jumps**  
  Submit: [OJ.uz APIO21_jumps](https://oj.uz/problem/view/APIO21_jumps)  
  Source: OI / oj.uz  
  Contest/source: APIO 2021  
  Editorial: [APIO source](https://oj.uz/problems/source/apio2021)  
  Key: tree/graph reachability with preprocessing.  
  Thinking: 5  
  Implementation: 5  
  Hours: 7  
  Why: Good bridge between tree preprocessing and graph reachability.

- [ ] **CEOI 2023 - The Ties That Guide Us**  
  Submit: [OJ.uz CEOI23_incursion](https://oj.uz/problem/view/CEOI23_incursion)  
  Source: OI / oj.uz  
  Contest/source: CEOI 2023  
  Editorial: [CEOI source](https://oj.uz/problems/source/ceoi2023)  
  Key: tree construction + invariant proof.  
  Thinking: 5  
  Implementation: 4  
  Hours: 6  
  Why: Tree constructive with a clean proof burden.

- [ ] **Kattis WF 2025 - Herding Cats**  
  Submit: [Kattis herdingcats](https://open.kattis.com/problems/herdingcats)  
  Source: Kattis ICPC  
  Contest/source: ICPC World Finals 2025  
  Editorial: [Kattis WF 2025 source](https://open.kattis.com/problem-sources/ICPC%20World%20Finals%202025)  
  Key: tree/graph modeling from geometry-like statement.  
  Thinking: 4  
  Implementation: 4  
  Hours: 5  
  Why: Medium WF problem that trains translating story to structure.

<!-- AUTO: second UCup 2025 supplement -->

## E - UCup 2025 Asia supplement

Them de Asia Regional/EC-Final moi de tang ty trong QOJ/Universal Cup trong timeline.

- [ ] **UCup EC-Final 2025 J - Tree-mendous Transmission**  
  Submit: [UCup 3295J](https://contest.ucup.ac/contest/3295/problem/16337?v=1)  
  Source: QOJ / Universal Cup  
  Contest/source: 2025 ICPC Asia EC-Final  
  Editorial: [Contest tutorials](https://contest.ucup.ac/contest/3295?v=1)  
  Key: tree transmission / path constraints.  
  Thinking: 5  
  Implementation: 5  
  Hours: 7  
  Why: EC-Final tree problem for post-Regional stretch and owner-level thinking.

- [ ] **UCup Shanghai 2025 M - Yet another 01 problem**  
  Submit: [UCup 2908M](https://contest.ucup.ac/contest/2908/problem/15326?v=1)  
  Source: QOJ / Universal Cup  
  Contest/source: 2025 ICPC Asia Shanghai Regional  
  Editorial: [Contest tutorials](https://contest.ucup.ac/contest/2908?v=1)  
  Key: tree/bit structure or constructive binary invariant.  
  Thinking: 5  
  Implementation: 4  
  Hours: 6  
  Why: Binary-structure Regional hard problem suitable for tree/constructive overlap.

