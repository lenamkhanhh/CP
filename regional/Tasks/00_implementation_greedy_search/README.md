# 00 - Implementation, Greedy, Search

Day la topic lay diem. Regional 2025 co bai K rat de va A/D/E de; neu bo qua tang nay de nhay vao Segment Tree Beats/flow kho thi pipeline bi nguoc.

## Coverage

- Sorting, prefix/suffix, two pointers, sliding window, meet-in-the-middle.
- Greedy voi exchange argument va ordered set.
- Binary search answer + predicate.
- Event sweep, local contribution, simulation/casework.
- Debug overflow, indexing, reset nhieu test va stress nho.

## Recommended order

1. Lam toan bo `A`.
2. Lam 5/7 bai `B`, bat buoc co `Meet in the Middle`.
3. Lam `Regional scoring pipeline`.
4. `C` va OI pipeline chi lam khi toc do bai de da on.

## Coverage gate

- [ ] Tu doc den AC mot bai implementation trong 25-35 phut.
- [ ] Viet duoc predicate binary search va chung minh monotonicity.
- [ ] Giai thich duoc exchange argument cua it nhat hai bai greedy.
- [ ] Khong WA vi overflow/reset/indexing trong hai virtual lien tiep.

## Reading

- [VNOI Wiki - Tham lam](https://wiki.vnoi.info/algo/greedy-new)
- [VNOI Wiki - Two pointers](https://wiki.vnoi.info/algo/basic/two-pointers)
- [VNOI Wiki - Tim kiem nhi phan](https://wiki.vnoi.info/algo/basic/binary-search)
- [VNOI Wiki - Sinh test va tu kiem tra code](https://wiki.vnoi.info/algo/skill/sinh-test-new)

## A - Foundation

- [ ] **Apartments**  
  Submit: [CSES 1084](https://cses.fi/problemset/task/1084)  
  Key: sorting + two pointers.

- [ ] **Factory Machines**  
  Submit: [CSES 1620](https://cses.fi/problemset/task/1620)  
  Key: binary search answer, overflow-safe predicate.

- [ ] **Maximum Subarray Sum II**  
  Submit: [CSES 1644](https://cses.fi/problemset/task/1644)  
  Key: prefix sums + sliding ordered minimum.

- [ ] **Sum of Four Values**  
  Submit: [CSES 1642](https://cses.fi/problemset/task/1642)  
  Key: pair sums, ordering indices, complexity accounting.

## B - Regional core

- [ ] **Movie Festival II**  
  Submit: [CSES 1632](https://cses.fi/problemset/task/1632)  
  Key: greedy + multiset; prove latest compatible resource.

- [ ] **Array Division**  
  Submit: [CSES 1085](https://cses.fi/problemset/task/1085)  
  Key: binary search + greedy feasibility.

- [ ] **Collecting Numbers II**  
  Submit: [CSES 2217](https://cses.fi/problemset/task/2217)  
  Key: local contribution after swaps.

- [ ] **Traffic Lights**  
  Submit: [CSES 1163](https://cses.fi/problemset/task/1163)  
  Key: ordered set + multiset bookkeeping.

- [ ] **Nested Ranges Count**  
  Submit: [CSES 2169](https://cses.fi/problemset/task/2169)  
  Key: sorting ties + Fenwick/order statistic.

- [ ] **Sliding Window Cost**  
  Submit: [CSES 1077](https://cses.fi/problemset/task/1077)  
  Key: median maintenance + careful accounting.

- [ ] **Meet in the Middle**  
  Submit: [CSES 1628](https://cses.fi/problemset/task/1628)  
  Key: split enumeration + sorting/two pointers.  
  Why: N khoang 40 la tin hieu quan trong, bank cu chua co mau nay.

## C - Advanced core

- [ ] **Prefix Flip Hard Version**  
  Submit: [Codeforces 1382C2](https://codeforces.com/problemset/problem/1382/C2)  
  Key: lazy simulation of reverse/invert operations.

## D - Regional scoring pipeline

- [ ] **ICPC 2025 Regional - KayTee vs. TeaOne**  
  Submit: [VNOI icpc25_regional_k](https://oj.vnoi.info/problem/icpc25_regional_k)  
  Focus: statement-to-code, validation and casework.  
  Target: 30 phut, toi da 1 WA.

- [ ] **ICPC 2025 Regional - Aquatic Elevator**  
  Submit: [VNOI icpc25_regional_a](https://oj.vnoi.info/problem/icpc25_regional_a)  
  Focus: adhoc optimization, identify the monotone/partition structure before coding.

- [ ] **ICPC 2025 Regional - Electronic Toll Collection**  
  Submit: [VNOI icpc25_regional_e](https://oj.vnoi.info/problem/icpc25_regional_e)  
  Focus: adhoc graph observation; do not force a heavy template too early.

- [ ] **ICPC 2025 Regional - Divisibility Grid**  
  Submit: [VNOI icpc25_regional_d](https://oj.vnoi.info/problem/icpc25_regional_d)  
  Focus: constructive pattern + optimality proof. Day van la bai scoring; cho phep dung brute nho de tim pattern.

## E - Stretch pipeline

- [ ] **Robots**  
  Submit: [OJ.uz IOI13_robots](https://oj.uz/problem/view/IOI13_robots)  
  Key: greedy feasibility + binary search.  
  Why: OI-level nhung transferable; lam full constraints va stress predicate.

<!-- AUTO: aggressive Gym/OJ/QOJ-heavy supplement -->

## E - Gym/OJ.uz/QOJ/Kattis supplement

Cac bai nay thay the phan CSES du thua trong timeline. Generator se cap CSES o muc primitive va uu tien block nay cho lead-level training.

- [ ] **CF Gym 105484A - Hey, Have You Seen My Kangaroo?**  
  Submit: [Gym 105484A](https://codeforces.com/gym/105484/problem/A)  
  Source: Codeforces Gym  
  Contest/source: The 2024 ICPC Asia Nanjing Regional Contest  
  Editorial: [VJudge mirror metadata](https://vjudge.net/contest/671351)  
  Key: grid simulation + periodic process + compression of states.  
  Thinking: 4  
  Implementation: 5  
  Hours: 5  
  Why: Nanjing-style implementation with nontrivial state evolution, much closer to contest work than routine CSES.

- [ ] **CF Gym 105484D - Toe-Tac-Tics**  
  Submit: [Gym 105484D](https://codeforces.com/gym/105484/problem/D)  
  Source: Codeforces Gym  
  Contest/source: The 2024 ICPC Asia Nanjing Regional Contest  
  Editorial: [VJudge mirror metadata](https://vjudge.net/contest/671351)  
  Key: casework game/state reasoning.  
  Thinking: 4  
  Implementation: 4  
  Hours: 5  
  Why: Good constructive/case split drill under standard ICPC statement load.

- [ ] **UCup Nanjing 2025 A - Wow, Its Yesterday Six Times More**  
  Submit: [UCup 2581A](https://contest.ucup.ac/contest/2581/problem/14801?v=1)  
  Source: QOJ / Universal Cup  
  Contest/source: 2025 ICPC Asia Nanjing Regional  
  Editorial: [Contest tutorials](https://contest.ucup.ac/contest/2581?v=1)  
  Key: implementation-heavy grid/process modeling.  
  Thinking: 4  
  Implementation: 5  
  Hours: 5  
  Why: Keeps the kangaroo/Nanjing implementation line but on a newer UCup/Regional set.

- [ ] **UCup Shenyang 2025 D - LED Display Renovation**  
  Submit: [UCup 2641D](https://contest.ucup.ac/contest/2641/problem/14943?v=1)  
  Source: QOJ / Universal Cup  
  Contest/source: 2025 ICPC Asia Shenyang Regional  
  Editorial: [Contest tutorials](https://contest.ucup.ac/contest/2641?v=1)  
  Key: state compression + display/casework implementation.  
  Thinking: 4  
  Implementation: 4  
  Hours: 5  
  Why: Forces clean modeling of many small states and careful bug control.

- [ ] **Kattis WF 2025 - Buggy Rover**  
  Submit: [Kattis buggyrover](https://open.kattis.com/problems/buggyrover)  
  Source: Kattis ICPC  
  Contest/source: ICPC World Finals 2025  
  Editorial: [Kattis WF 2025 source](https://open.kattis.com/problem-sources/ICPC%20World%20Finals%202025)  
  Key: simulation + shortest corrective reasoning.  
  Thinking: 3  
  Implementation: 4  
  Hours: 4  
  Why: World Finals easy/medium style: not hard technique, but punishes sloppy modeling.

- [ ] **Kattis WF 2025 - Delivery Service**  
  Submit: [Kattis deliveryservice](https://open.kattis.com/problems/deliveryservice)  
  Source: Kattis ICPC  
  Contest/source: ICPC World Finals 2025  
  Editorial: [Kattis WF 2025 source](https://open.kattis.com/problem-sources/ICPC%20World%20Finals%202025)  
  Key: implementation + greedy/order modeling.  
  Thinking: 4  
  Implementation: 4  
  Hours: 5  
  Why: Medium WF problem for conversion practice, not a template exercise.

- [ ] **Kattis WF 2024 - Friendly Rivalry**  
  Submit: [Kattis friendlyrivalry](https://open.kattis.com/problems/friendlyrivalry)  
  Source: Kattis ICPC  
  Contest/source: ICPC World Finals 2024  
  Editorial: [Kattis WF 2024 source](https://open.kattis.com/problem-sources/ICPC%20World%20Finals%202024)  
  Key: greedy/modeling with hidden constraints.  
  Thinking: 4  
  Implementation: 3  
  Hours: 4  
  Why: Good scoring problem for reading constraints and avoiding overengineering.

- [ ] **Kattis WF 2024 - Bingo for the Win!**  
  Submit: [Kattis bingoforthewin](https://open.kattis.com/problems/bingoforthewin)  
  Source: Kattis ICPC  
  Contest/source: ICPC World Finals 2024  
  Editorial: [Kattis WF 2024 source](https://open.kattis.com/problem-sources/ICPC%20World%20Finals%202024)  
  Key: probability/accounting implementation.  
  Thinking: 4  
  Implementation: 3  
  Hours: 4  
  Why: A compact WF problem that trains precise formula-to-code conversion.

- [ ] **APIO 2024 - September**  
  Submit: [OJ.uz APIO24_september](https://oj.uz/problem/view/APIO24_september)  
  Source: OI / oj.uz  
  Contest/source: APIO 2024  
  Editorial: [APIO source](https://oj.uz/problems/source/apio2024)  
  Key: implementation pipeline + invariant tracking.  
  Thinking: 4  
  Implementation: 4  
  Hours: 6  
  Why: OI-style statement and subtasks; useful for building long-solve discipline.

- [ ] **APIO 2024 - Magic Show**  
  Submit: [OJ.uz APIO24_show](https://oj.uz/problem/view/APIO24_show)  
  Source: OI / oj.uz  
  Contest/source: APIO 2024  
  Editorial: [APIO source](https://oj.uz/problems/source/apio2024)  
  Key: interactive-style reasoning / careful protocol reading.  
  Thinking: 4  
  Implementation: 4  
  Hours: 6  
  Why: Not a routine algorithm drill; trains statement discipline and edge behavior.

<!-- AUTO: second UCup 2025 supplement -->

## E - UCup 2025 Asia supplement

Them de Asia Regional/EC-Final moi de tang ty trong QOJ/Universal Cup trong timeline.

- [ ] **UCup Chengdu 2025 A - A Lot of Paintings**  
  Submit: [UCup 2567A](https://contest.ucup.ac/contest/2567/problem/14706?v=1)  
  Source: QOJ / Universal Cup  
  Contest/source: 2025 ICPC Asia Chengdu Regional  
  Editorial: [Contest tutorials](https://contest.ucup.ac/contest/2567?v=1)  
  Key: implementation + combinatorial casework.  
  Thinking: 4  
  Implementation: 4  
  Hours: 5  
  Why: Regional opener with richer implementation than a template warmup.

- [ ] **UCup Shanghai 2025 A - Menji, we miss you!**  
  Submit: [UCup 2908A](https://contest.ucup.ac/contest/2908/problem/15314?v=1)  
  Source: QOJ / Universal Cup  
  Contest/source: 2025 ICPC Asia Shanghai Regional  
  Editorial: [Contest tutorials](https://contest.ucup.ac/contest/2908?v=1)  
  Key: implementation/modeling opener.  
  Thinking: 4  
  Implementation: 4  
  Hours: 5  
  Why: Good Asia Regional conversion drill under real statement style.

