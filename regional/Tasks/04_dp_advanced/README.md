# 04 - Advanced DP

Muc tieu: nhin duoc state, rut transition, roi moi toi uu. Khong hoc cong thuc roi bo qua proof.

## Coverage

- Interval, bitmask/subset, profile, digit, tree/rerooting DP.
- Expected value DP va DP + data structure.
- CHT, divide-and-conquer, Knuth, monotone queue, WQS la advanced.

## Recommended order

1. Viet recurrence va complexity cho toan bo `A`.
2. `B`: bitmask, digit, expected, rerooting.
3. Hamiltonian Path Remix/Finest Final String.
4. Moi hoc toi uu DP; Aliens/Wiring/Holiday la stretch.

## Coverage gate

- [ ] AC mot bai moi loai: interval, bitmask, profile, digit.
- [ ] Tu derive recurrence truoc khi doc optimization.
- [ ] AC it nhat mot bai D&C/Knuth/CHT va giai thich dieu kien dung.
- [ ] WQS/Aliens trick la owner topic, khong bat buoc ca doi.

## Reading

- [Robert1003 - Divide and Conquer DP](https://robert1003.github.io/2020/02/25/dp-opt-divide-and-conquer.html)
- [Robert1003 - Convex Hull Optimization](https://robert1003.github.io/2020/02/17/dp-opt-convex-hull-trick.html)
- [Robert1003 - Monotone Queue Optimization](https://robert1003.github.io/2020/02/16/dp-opt-monotone-queue.html)
- [Robert1003 - WQS Binary Search Optimization](https://robert1003.github.io/2020/02/26/dp-opt-wqs-binary-search.html)
- [Robert1003 - Knuth Optimization](https://robert1003.github.io/2020/02/29/dp-opt-knuth.html)
- [Robert1003 - SOS DP](https://robert1003.github.io/2020/10/05/dp-sum-over-subset.html)
- [VNOI Wiki - Quy hoạch động chia để trị](https://wiki.vnoi.info/algo/dp/dpdnc)
- [VNOI Wiki - Kĩ thuật bao lồi trong QHĐ](https://wiki.vnoi.info/algo/dp/cht)
- [USACO Guide - Bitmask DP](https://usaco.guide/gold/dp-bitmasks)

## A - Foundation

- [ ] **Projects**  
  Submit: [CSES 1140](https://cses.fi/problemset/task/1140)  
  Key: Weighted interval DP.  
  Why: Sort + binary search + DP classic.

- [ ] **Removal Game**  
  Submit: [CSES 1097](https://cses.fi/problemset/task/1097)  
  Key: Interval/game DP.  
  Why: Nen tang minimax DP.

- [ ] **Elevator Rides**  
  Submit: [CSES 1653](https://cses.fi/problemset/task/1653)  
  Key: Bitmask DP with pair state.  
  Why: Small-mask optimization pattern.

- [ ] **Counting Tilings**  
  Submit: [CSES 2181](https://cses.fi/problemset/task/2181)  
  Key: Profile DP.  
  Why: Regional grid-state staple.

- [ ] **Counting Numbers**  
  Submit: [CSES 2220](https://cses.fi/problemset/task/2220)  
  Key: digit DP with tight/leading/previous state.  
  Why: Digit DP dang thieu hoan toan trong bank cu.

## B - Regional core

- [ ] **Hamiltonian Flights**  
  Submit: [CSES 1690](https://cses.fi/problemset/task/1690)  
  Key: Bitmask graph DP.  
  Why: Path counting under mask constraints.

- [ ] **Increasing Subsequence II**  
  Submit: [CSES 1748](https://cses.fi/problemset/task/1748)  
  Key: Fenwick DP.  
  Why: DP + data structure.

- [ ] **O - Matching**  
  Submit: [AtCoder DP O](https://atcoder.jp/contests/dp/tasks/dp_o)  
  Key: Bitmask DP.  
  Why: Clean nontrivial state transition.

- [ ] **U - Grouping**  
  Submit: [AtCoder DP U](https://atcoder.jp/contests/dp/tasks/dp_u)  
  Key: Subset DP.  
  Why: Code-heavy subset enumeration.

- [ ] **V - Subtree**  
  Submit: [AtCoder DP V](https://atcoder.jp/contests/dp/tasks/dp_v)  
  Key: Rerooting DP.  
  Why: Tree DP pattern bat buoc.

- [ ] **J - Sushi**  
  Submit: [AtCoder DP J](https://atcoder.jp/contests/dp/tasks/dp_j)  
  Key: expected value DP and state compression.  
  Why: Expected DP hay bi bo qua nhung van co the ra Regional.

## C - Advanced core

- [ ] **W - Intervals**  
  Submit: [AtCoder DP W](https://atcoder.jp/contests/dp/tasks/dp_w)  
  Key: DP + lazy segment tree.  
  Why: Regional style: transition can DS.

- [ ] **Z - Frog 3**  
  Submit: [AtCoder DP Z](https://atcoder.jp/contests/dp/tasks/dp_z)  
  Key: Convex hull trick.  
  Why: Baseline CHT optimization.

- [ ] **Y - Grid 2**  
  Submit: [AtCoder DP Y](https://atcoder.jp/contests/dp/tasks/dp_y)  
  Key: Combinatorics + sorted DP.  
  Why: Counting paths with forbidden cells.

- [ ] **Houses and Schools**  
  Submit: [CSES 2087](https://cses.fi/problemset/task/2087)  
  Key: divide-and-conquer DP optimization.  
  Why: Bai submit that cho D&C, khong chi doc blog.

- [ ] **Knuth Division**  
  Submit: [CSES 2088](https://cses.fi/problemset/task/2088)  
  Key: Knuth optimization.  
  Why: Bat buoc viet va kiem tra opt interval.

## D - Regional pipeline

- [ ] **ICPC 2025 Regional - Hamiltonian Path Remix**  
  Submit: [VNOI icpc25_regional_h](https://oj.vnoi.info/problem/icpc25_regional_h)  
  Focus: range DP + geometry/non-crossing insight.  
  Pipeline: proof truoc de tranh greedy sai.

- [ ] **ICPC 2025 Regional - Finest Final String**  
  Submit: [VNOI icpc25_regional_f](https://oj.vnoi.info/problem/icpc25_regional_f)  
  Focus: hard DP optimization with DS.  
  Pipeline: tim transition chuan truoc, sau do moi toi uu.

- [ ] **ICPC 2023 Regional - Kingdom Profit Kerfuffle**  
  Submit: [VNOI icpc23_regional_k](https://oj.vnoi.info/problem/icpc23_regional_k)  
  Focus: graph/DP/modeling.  
  Why: Modeling dynamic programming states on trees/graphs for profit optimization.

## E - Stretch/OI pipeline

- [ ] **Constellation 3**  
  Submit: [OJ.uz JOI20_constellation3](https://oj.uz/problem/view/JOI20_constellation3)  
  Focus: DSU merge by height + segment tree + DP over stack structure.  
  Pipeline: combine DP with DS-on-merge; long implementation OI.

- [ ] **Aliens**  
  Submit: [OJ.uz IOI16_aliens](https://oj.uz/problem/view/IOI16_aliens)  
  Focus: DP optimization / Aliens trick.  
  Pipeline: parametric DP, prove monotonicity.

- [ ] **Fireworks**  
  Submit: [OJ.uz APIO16_fireworks](https://oj.uz/problem/view/APIO16_fireworks)  
  Focus: slope trick / convex piecewise DP on tree.  
  Pipeline: maintain convex cost function bottom-up, merge slopes.

- [ ] **Candies**  
  Submit: [OJ.uz JOI18_candies](https://oj.uz/problem/view/JOI18_candies)  
  Focus: slope trick / greedy priority-queue DP.  
  Pipeline: long-implementation OI; build the exchange structure then code carefully.

- [ ] **Wiring**  
  Submit: [OJ.uz IOI17_wiring](https://oj.uz/problem/view/IOI17_wiring)  
  Focus: sorted DP with optimization.  
  Pipeline: derive recurrence from groups, then optimize.

- [ ] **Holiday**  
  Submit: [OJ.uz IOI14_holiday](https://oj.uz/problem/view/IOI14_holiday)  
  Focus: DP + data structure / divide structure.  
  Pipeline: choose state and data structure together.

<!-- AUTO: aggressive Gym/OJ/QOJ-heavy supplement -->

## E - Gym/OJ.uz/QOJ/Kattis supplement

Cac bai nay thay the phan CSES du thua trong timeline. Generator se cap CSES o muc primitive va uu tien block nay cho lead-level training.

- [ ] **UCup Shenyang 2025 E - Play It by Ear**  
  Submit: [UCup 2641E](https://contest.ucup.ac/contest/2641/problem/14944?v=1)  
  Source: QOJ / Universal Cup  
  Contest/source: 2025 ICPC Asia Shenyang Regional  
  Editorial: [Contest tutorials](https://contest.ucup.ac/contest/2641?v=1)  
  Key: sequence DP / state compression.  
  Thinking: 5  
  Implementation: 4  
  Hours: 6  
  Why: Regional DP in a fresh Asia set; better than isolated classic DP.

- [ ] **UCup Nanjing 2025 C - Distributing Candies**  
  Submit: [UCup 2581C](https://contest.ucup.ac/contest/2581/problem/14803?v=1)  
  Source: QOJ / Universal Cup  
  Contest/source: 2025 ICPC Asia Nanjing Regional  
  Editorial: [Contest tutorials](https://contest.ucup.ac/contest/2581?v=1)  
  Key: counting DP + constraints transformation.  
  Thinking: 4  
  Implementation: 4  
  Hours: 5  
  Why: Contest DP with enough modeling to avoid rote recurrence.

- [ ] **CF Gym 105484E - Left Shifting 3**  
  Submit: [Gym 105484E](https://codeforces.com/gym/105484/problem/E)  
  Source: Codeforces Gym  
  Contest/source: The 2024 ICPC Asia Nanjing Regional Contest  
  Editorial: [VJudge mirror metadata](https://vjudge.net/contest/671351)  
  Key: bit/sequence DP with transitions.  
  Thinking: 5  
  Implementation: 5  
  Hours: 7  
  Why: Nanjing problem, good for DP plus implementation stamina.

- [ ] **APIO 2023 - Sequence**  
  Submit: [OJ.uz APIO23_sequence](https://oj.uz/problem/view/APIO23_sequence)  
  Source: OI / oj.uz  
  Contest/source: APIO 2023  
  Editorial: [APIO source](https://oj.uz/problems/source/apio2023)  
  Key: optimized DP over sequence.  
  Thinking: 5  
  Implementation: 5  
  Hours: 7  
  Why: APIO-grade DP optimization practice, close to hard ICPC owner work.

- [ ] **APIO 2014 - Split the Sequence**  
  Submit: [OJ.uz APIO14_sequence](https://oj.uz/problem/view/APIO14_sequence)  
  Source: OI / oj.uz  
  Contest/source: APIO 2014  
  Editorial: [APIO source](https://oj.uz/problems/source/apio2014)  
  Key: DP optimization / divide-conquer or convexity.  
  Thinking: 5  
  Implementation: 5  
  Hours: 7  
  Why: Canonical high-quality DP optimization task, but still hard enough.

- [ ] **APIO 2015 - Bali Sculptures**  
  Submit: [OJ.uz APIO15_sculpture](https://oj.uz/problem/view/APIO15_sculpture)  
  Source: OI / oj.uz  
  Contest/source: APIO 2015  
  Editorial: [APIO source](https://oj.uz/problems/source/apio2015)  
  Key: bitwise DP + feasibility.  
  Thinking: 5  
  Implementation: 4  
  Hours: 6  
  Why: Strong thinking DP problem with proof of feasibility check.

- [ ] **IOI 2020 - Packing Biscuits**  
  Submit: [OJ.uz IOI20_biscuits](https://oj.uz/problem/view/IOI20_biscuits)  
  Source: OI / oj.uz  
  Contest/source: IOI 2020  
  Editorial: [IOI source](https://oj.uz/problems/source/ioi2020)  
  Key: digit/counting DP.  
  Thinking: 5  
  Implementation: 4  
  Hours: 6  
  Why: Compact but deep counting DP; useful for math-DP overlap.

- [ ] **IOI 2022 - Digital Circuit**  
  Submit: [OJ.uz IOI22_circuit](https://oj.uz/problem/view/IOI22_circuit)  
  Source: OI / oj.uz  
  Contest/source: IOI 2022  
  Editorial: [IOI source](https://oj.uz/problems/source/ioi2022)  
  Key: tree DP + dynamic updates.  
  Thinking: 5  
  Implementation: 5  
  Hours: 7  
  Why: Heavy DP/DS hybrid, excellent stretch for owner level.

- [ ] **Kattis WF 2022 - Quartets**  
  Submit: [Kattis quartets](https://open.kattis.com/problems/quartets)  
  Source: Kattis ICPC  
  Contest/source: ICPC World Finals 2022  
  Editorial: [Kattis WF 2022 source](https://open.kattis.com/problem-sources/ICPC%20World%20Finals%202022)  
  Key: combinatorial DP / state counting.  
  Thinking: 5  
  Implementation: 4  
  Hours: 7  
  Why: WF hard DP/counting task, useful after core DP is stable.

- [ ] **Kattis WF 2022 - Compression**  
  Submit: [Kattis compression2](https://open.kattis.com/problems/compression2)  
  Source: Kattis ICPC  
  Contest/source: ICPC World Finals 2022  
  Editorial: [Kattis WF 2022 source](https://open.kattis.com/problem-sources/ICPC%20World%20Finals%202022)  
  Key: string/interval DP compression.  
  Thinking: 4  
  Implementation: 4  
  Hours: 5  
  Why: Good WF DP problem with modeling rather than known template.

<!-- AUTO: second UCup 2025 supplement -->

## E - UCup 2025 Asia supplement

Them de Asia Regional/EC-Final moi de tang ty trong QOJ/Universal Cup trong timeline.

- [ ] **UCup Chengdu 2025 H - Heuristic Knapsack**  
  Submit: [UCup 2567H](https://contest.ucup.ac/contest/2567/problem/14713?v=1)  
  Source: QOJ / Universal Cup  
  Contest/source: 2025 ICPC Asia Chengdu Regional  
  Editorial: [Contest tutorials](https://contest.ucup.ac/contest/2567?v=1)  
  Key: knapsack variant + proof of optimization.  
  Thinking: 5  
  Implementation: 4  
  Hours: 6  
  Why: DP/knapsack problem from Asia Regional that is not a beginner knapsack.

- [ ] **UCup Shanghai 2025 C - Singularity**  
  Submit: [UCup 2908C](https://contest.ucup.ac/contest/2908/problem/15316?v=1)  
  Source: QOJ / Universal Cup  
  Contest/source: 2025 ICPC Asia Shanghai Regional  
  Editorial: [Contest tutorials](https://contest.ucup.ac/contest/2908?v=1)  
  Key: state DP / recurrence modeling.  
  Thinking: 5  
  Implementation: 4  
  Hours: 6  
  Why: Good hard DP modeling from a recent Regional.

- [ ] **UCup EC-Final 2025 C - Potential Peak**  
  Submit: [UCup 3295C](https://contest.ucup.ac/contest/3295/problem/16330?v=1)  
  Source: QOJ / Universal Cup  
  Contest/source: 2025 ICPC Asia EC-Final  
  Editorial: [Contest tutorials](https://contest.ucup.ac/contest/3295?v=1)  
  Key: optimization DP / monotonic reasoning.  
  Thinking: 5  
  Implementation: 5  
  Hours: 7  
  Why: EC-Final DP-style optimization for Asia stretch.

