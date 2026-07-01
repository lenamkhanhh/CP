# 02 - Data Structures

Muc tieu: segment tree/Fenwick phai thanh phan xa. Sau do moi len persistent, Mo, order statistic va segment tree bien the.

## Coverage

- Fenwick, sparse table, lazy segment tree, order statistic.
- Mo/offline sorting, persistence.
- Segment Tree Beats/Li Chao la advanced core.
- Rollback DSU, divide over time, parallel binary search la owner topic.

## Recommended order

1. `A`, sau do GSS3 va ORDERSET.
2. `B`: pruning/lazy-by-bit/Mo/persistence.
3. K Query trong pipeline.
4. Rollback/PBS, Beats va IOI tasks o cuoi.

## Coverage gate

- [ ] Tu code Fenwick va lazy segment tree assign/add trong 25 phut.
- [ ] Stress combine/lazy tag tren mang nho.
- [ ] AC mot bai sparse table, mot bai order statistic va mot bai persistence.
- [ ] Mot thanh vien owner rollback/PBS; Seats/Game khong phai gate Regional.

## Reading

- [Robert1003 - Fenwick Tree](https://robert1003.github.io/2020/01/27/fenwick-tree.html)
- [VNOI Wiki - Fenwick Tree](https://wiki.vnoi.info/algo/data-structures/fenwick)
- [VNOI Wiki - Segment Tree Part 1](https://wiki.vnoi.info/algo/data-structures/segment-tree-basic.md)
- [VNOI Wiki - Segment Tree Part 2](https://wiki.vnoi.info/algo/data-structures/segment-tree-extend)
- [Robert1003 - Li-Chao Segment Tree](https://robert1003.github.io/2020/02/06/li-chao-segment-tree.html)
- [Robert1003 - Parallel Binary Search](https://robert1003.github.io/2020/02/05/parallel-binary-search.html)
- [Codeforces - Segment Tree Beats](https://codeforces.com/blog/entry/57319)
- [USACO Guide - Persistent Data Structures](https://usaco.guide/adv/persistent)

## A - Foundation

- [ ] **Range Update Queries**  
  Submit: [CSES 1651](https://cses.fi/problemset/task/1651)  
  Key: Fenwick / difference updates.  
  Why: Nen tang cho range update.

- [ ] **Range Updates and Sums**  
  Submit: [CSES 1735](https://cses.fi/problemset/task/1735)  
  Key: Lazy segment tree assign/add.  
  Why: Template bat buoc cho Regional.

- [ ] **Salary Queries**  
  Submit: [CSES 1144](https://cses.fi/problemset/task/1144)  
  Key: Coordinate compression + Fenwick.  
  Why: Dynamic values va count queries.

- [ ] **Sliding Window Median**  
  Submit: [CSES 1076](https://cses.fi/problemset/task/1076)  
  Key: Multiset / order statistic.  
  Why: Duy tri median online.

- [ ] **Sliding Window Cost**  
  Submit: [CSES 1077](https://cses.fi/problemset/task/1077)  
  Key: Median + prefix sums in DS.  
  Why: Cung DS nhung accounting kho hon.

- [ ] **Static Range Minimum Queries**  
  Submit: [CSES 1647](https://cses.fi/problemset/task/1647)  
  Key: sparse table / idempotent query.  
  Why: Bank cu bo sot static RMQ.

- [ ] **GSS3**  
  Submit: [SPOJ GSS3](https://www.spoj.com/problems/GSS3/)  
  Key: segment tree max-subarray with updates.  
  Why: Combine function code-heavy nhung van la core drill.

- [ ] **ORDERSET**  
  Submit: [SPOJ ORDERSET](https://www.spoj.com/problems/ORDERSET/)  
  Key: order statistic tree / Fenwick.  
  Why: K-th va count dynamic la core, khong nen de stretch.

## B - Regional core

- [ ] **The Child and Sequence**  
  Submit: [Codeforces 438D](https://codeforces.com/problemset/problem/438/D)  
  Key: Segment tree with max pruning.  
  Why: Update modulo khong lazy, can prune dung.

- [ ] **XOR on Segment**  
  Submit: [Codeforces 242E](https://codeforces.com/problemset/problem/242/E)  
  Key: Lazy segment tree by bit counts.  
  Why: Lazy propagation nang hon binh thuong.

- [ ] **Powerful Array**  
  Submit: [Codeforces 86D](https://codeforces.com/problemset/problem/86/D)  
  Key: Mo's algorithm.  
  Why: Offline sqrt decomposition classic.

- [ ] **Little Elephant and Array**  
  Submit: [Codeforces 220B](https://codeforces.com/problemset/problem/220/B)  
  Key: Mo's algorithm + frequency condition.  
  Why: Query condition khong phai sum/count don gian.

- [ ] **Range Queries and Copies**  
  Submit: [CSES 1737](https://cses.fi/problemset/task/1737)  
  Key: persistent segment tree / copy-on-write versions.  
  Why: Persistence can mot bai doc lap truoc khi ghep voi tree.

## C - Advanced core

- [ ] **Dynamic Connectivity**  
  Submit: [CSES 2133](https://cses.fi/problemset/task/2133)  
  Key: rollback DSU + segment tree over time.  
  Why: Offline dynamic graph la pattern Regional/APAC rat co gia tri.

- [ ] **METEORS**  
  Submit: [SPOJ METEORS](https://www.spoj.com/problems/METEORS/)  
  Key: parallel binary search + Fenwick.  
  Why: Pipeline offline code dai, nhung technique van nam trong scope.

- [ ] **COT**  
  Submit: [SPOJ COT](https://www.spoj.com/problems/COT/)  
  Key: persistent segment tree on tree paths.  
  Why: Chi AC mot lan; Tree la folder owner cua bai nay.

## D - Regional pipeline

- [ ] **ICPC 2021 Regional - K Query**  
  Submit: [VNOI icpc21_regional_k](https://oj.vnoi.info/problem/icpc21_regional_k)  
  Focus: offline/persistent query thinking.  
  Pipeline: chon truc sap xep, query theo nguong.

- [ ] **ICPC 2024 Regional - Inversland**  
  Submit: [VNOI icpc24_regional_i](https://oj.vnoi.info/problem/icpc24_regional_i)  
  Focus: inversion reasoning, data structure / counting.  
  Why: Bit/Fenwick tree query plus inversion logic on custom currency bounds.

## E - Stretch/OI pipeline

- [ ] **Seats**  
  Submit: [OJ.uz IOI18_seats](https://oj.uz/problem/view/IOI18_seats)  
  Focus: 2D grid boundary invariant + segment tree tracking corner count.  
  Pipeline: long-implementation OI; maintain min+count of perimeter under cell moves.

- [ ] **New Home**  
  Submit: [OJ.uz APIO18_new_home](https://oj.uz/problem/view/APIO18_new_home)  
  Focus: events over time + segment tree on coordinate + parallel binary search.  
  Pipeline: heavy sweep + DS combine; careful event ordering.

- [ ] **ICPC 2025 Regional - Cake Cutting**  
  Submit: [VNOI icpc25_regional_c](https://oj.vnoi.info/problem/icpc25_regional_c)  
  Focus: Segment Tree Beats.  
  Pipeline: doc dieu kien update, thiet ke node invariant, stress test.

- [ ] **ICPC 2025 Regional - Impossible Inversion Counting**  
  Submit: [VNOI icpc25_regional_i](https://oj.vnoi.info/problem/icpc25_regional_i)  
  Focus: DS nang + dieu kien dac biet.  
  Pipeline: tim cach vet su thay doi, cap nhat online.

- [ ] **Wall**  
  Submit: [OJ.uz IOI14_wall](https://oj.uz/problem/view/IOI14_wall)  
  Focus: lazy chmin/chmax range constraints.  
  Pipeline: design lazy tag dung, debug bang test nho.

- [ ] **Game**  
  Submit: [OJ.uz IOI13_game](https://oj.uz/problem/view/IOI13_game)  
  Focus: sparse 2D segment tree / dynamic grid DS.  
  Pipeline: code dai, nhieu lop data structure.

<!-- AUTO: aggressive Gym/OJ/QOJ-heavy supplement -->

## E - Gym/OJ.uz/QOJ/Kattis supplement

Cac bai nay thay the phan CSES du thua trong timeline. Generator se cap CSES o muc primitive va uu tien block nay cho lead-level training.

- [ ] **UCup Nanjing 2025 G - Bucket Bonanza**  
  Submit: [UCup 2581G](https://contest.ucup.ac/contest/2581/problem/14807?v=1)  
  Source: QOJ / Universal Cup  
  Contest/source: 2025 ICPC Asia Nanjing Regional  
  Editorial: [Contest tutorials](https://contest.ucup.ac/contest/2581?v=1)  
  Key: bucket decomposition / DS optimization.  
  Thinking: 5  
  Implementation: 5  
  Hours: 7  
  Why: A real Regional-style DS problem, better than another clean segment tree exercise.

- [ ] **UCup Shenyang 2025 I - Volunteer Simulator**  
  Submit: [UCup 2641I](https://contest.ucup.ac/contest/2641/problem/14948?v=1)  
  Source: QOJ / Universal Cup  
  Contest/source: 2025 ICPC Asia Shenyang Regional  
  Editorial: [Contest tutorials](https://contest.ucup.ac/contest/2641?v=1)  
  Key: event simulation + data structure invariants.  
  Thinking: 4  
  Implementation: 5  
  Hours: 6  
  Why: Long implementation and invariants; good for code stamina.

- [ ] **CF Gym 105484H - Border Jump 2**  
  Submit: [Gym 105484H](https://codeforces.com/gym/105484/problem/H)  
  Source: Codeforces Gym  
  Contest/source: The 2024 ICPC Asia Nanjing Regional Contest  
  Editorial: [VJudge mirror metadata](https://vjudge.net/contest/671351)  
  Key: offline queries / boundary data structure.  
  Thinking: 5  
  Implementation: 5  
  Hours: 7  
  Why: Nanjing hard implementation flavor with DS bookkeeping.

- [ ] **CF Gym 105484K - Strips**  
  Submit: [Gym 105484K](https://codeforces.com/gym/105484/problem/K)  
  Source: Codeforces Gym  
  Contest/source: The 2024 ICPC Asia Nanjing Regional Contest  
  Editorial: [VJudge mirror metadata](https://vjudge.net/contest/671351)  
  Key: interval data structure + greedy maintenance.  
  Thinking: 5  
  Implementation: 5  
  Hours: 7  
  Why: Heavy ICPC implementation, fits DS pipeline better than classic templates.

- [ ] **APIO 2024 - Train**  
  Submit: [OJ.uz APIO24_train](https://oj.uz/problem/view/APIO24_train)  
  Source: OI / oj.uz  
  Contest/source: APIO 2024  
  Editorial: [APIO source](https://oj.uz/problems/source/apio2024)  
  Key: DS over ordered events / graph-state updates.  
  Thinking: 5  
  Implementation: 5  
  Hours: 7  
  Why: Modern APIO long DS problem for stretch after core segment tree.

- [ ] **APIO 2019 - Street Lamps**  
  Submit: [OJ.uz APIO19_street_lamps](https://oj.uz/problem/view/APIO19_street_lamps)  
  Source: OI / oj.uz  
  Contest/source: APIO 2019  
  Editorial: [APIO source](https://oj.uz/problems/source/apio2019)  
  Key: dynamic intervals + offline queries.  
  Thinking: 5  
  Implementation: 5  
  Hours: 7  
  Why: Classic high-quality offline DS problem with enough implementation weight.

- [ ] **CEOI 2024 - Text Editor**  
  Submit: [OJ.uz CEOI24_editor](https://oj.uz/problem/view/CEOI24_editor)  
  Source: OI / oj.uz  
  Contest/source: CEOI 2024  
  Editorial: [CEOI source](https://oj.uz/problems/source/ceoi2024)  
  Key: persistent/editor-like data structure.  
  Thinking: 4  
  Implementation: 5  
  Hours: 6  
  Why: Good long-implementation DS with a practical operation model.

- [ ] **BOI 2024 - Flooding Wall**  
  Submit: [OJ.uz BOI24_wall](https://oj.uz/problem/view/BOI24_wall)  
  Source: OI / oj.uz  
  Contest/source: BOI 2024  
  Editorial: [BOI source](https://oj.uz/problems/source/boi2024)  
  Key: range constraints + maintained structure.  
  Thinking: 5  
  Implementation: 5  
  Hours: 7  
  Why: OI DS task that stresses invariant design and edge cases.

- [ ] **IOI 2022 - Radio Towers**  
  Submit: [OJ.uz IOI22_towers](https://oj.uz/problem/view/IOI22_towers)  
  Source: OI / oj.uz  
  Contest/source: IOI 2022  
  Editorial: [IOI source](https://oj.uz/problems/source/ioi2022)  
  Key: range queries + structural preprocessing.  
  Thinking: 5  
  Implementation: 5  
  Hours: 7  
  Why: Hard query problem with substantial preprocessing design.

- [ ] **Kattis WF 2021 - Mosaic Browsing**  
  Submit: [Kattis mosaicbrowsing](https://open.kattis.com/problems/mosaicbrowsing)  
  Source: Kattis ICPC  
  Contest/source: ICPC World Finals 2021  
  Editorial: [Kattis WF 2021 source](https://open.kattis.com/problem-sources/ICPC%20World%20Finals%202021)  
  Key: 2D query/data-structure modeling.  
  Thinking: 5  
  Implementation: 5  
  Hours: 7  
  Why: WF-style data structure problem with implementation pressure.

<!-- AUTO: second UCup 2025 supplement -->

## E - UCup 2025 Asia supplement

Them de Asia Regional/EC-Final moi de tang ty trong QOJ/Universal Cup trong timeline.

- [ ] **UCup Chengdu 2025 K - K-Coverage**  
  Submit: [UCup 2567K](https://contest.ucup.ac/contest/2567/problem/14716?v=1)  
  Source: QOJ / Universal Cup  
  Contest/source: 2025 ICPC Asia Chengdu Regional  
  Editorial: [Contest tutorials](https://contest.ucup.ac/contest/2567?v=1)  
  Key: interval coverage + data structure.  
  Thinking: 5  
  Implementation: 5  
  Hours: 7  
  Why: Coverage maintenance is a recurring Regional DS pattern.

- [ ] **UCup Shanghai 2025 E - Flowers land 3**  
  Submit: [UCup 2908E](https://contest.ucup.ac/contest/2908/problem/15318?v=1)  
  Source: QOJ / Universal Cup  
  Contest/source: 2025 ICPC Asia Shanghai Regional  
  Editorial: [Contest tutorials](https://contest.ucup.ac/contest/2908?v=1)  
  Key: range/query data structure.  
  Thinking: 5  
  Implementation: 5  
  Hours: 7  
  Why: Data-structure-heavy Asia problem with implementation pressure.

- [ ] **UCup Shanghai 2025 F - Flowers land 4**  
  Submit: [UCup 2908F](https://contest.ucup.ac/contest/2908/problem/15319?v=1)  
  Source: QOJ / Universal Cup  
  Contest/source: 2025 ICPC Asia Shanghai Regional  
  Editorial: [Contest tutorials](https://contest.ucup.ac/contest/2908?v=1)  
  Key: advanced range/query data structure.  
  Thinking: 5  
  Implementation: 5  
  Hours: 7  
  Why: Harder follow-up to force robust DS design, not template reuse.

