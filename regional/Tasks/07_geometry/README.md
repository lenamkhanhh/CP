# 07 - Geometry

Muc tieu: primitive hinh hoc so nguyen phai dang tin. Geometry rat de WA vi dau, collinear case va precision.

## Coverage

- Orientation, segment intersection, polygon area/containment.
- Convex hull, closest pair, sweep line.
- Rotating calipers, circle/precision la advanced.

## Recommended order

1. `A`: integer primitives va boundary cases.
2. `B`: hull, closest pair, sweep line.
3. Area Query/Hamiltonian Path Remix.
4. Circle, rotating calipers, hybrid/OI tasks.

## Coverage gate

- [ ] Primitive integer dung voi collinear, duplicate point va overflow.
- [ ] AC hull + point-in-polygon + mot bai sweep line.
- [ ] Co checklist EPS/long double khi buoc phai dung floating point.
- [ ] Rectangles/Broken Line la stretch OI, khong phai gate Regional.

## Reading

- [VNOI Wiki - Hình học tính toán phần 1](https://wiki.vnoi.info/algo/geometry/basic-geometry-1)
- [VNOI Wiki - Hình học tính toán phần 2: Giao điểm](https://wiki.vnoi.info/algo/geometry/basic-geometry-2)
- [VNOI Wiki - Hình học tính toán phần 3: Đa giác](https://wiki.vnoi.info/algo/geometry/basic-geometry-3)
- [VNOI Wiki - Thuật toán đường quét](https://wiki.vnoi.info/algo/geometry/sweep-line)
- [VNOI Wiki - Bao lồi](https://wiki.vnoi.info/translate/wcipeg/Convex-Hull)
- [Robert1003 - Sweep Line and Segment Trees](https://robert1003.github.io/2020/02/10/sweep-line-and-segment-tree.html)

## A - Foundation

- [ ] **Point Location Test**  
  Submit: [CSES 2189](https://cses.fi/problemset/task/2189)  
  Key: Orientation / cross product.  
  Why: Primitive cua moi bai geometry.

- [ ] **Line Segment Intersection**  
  Submit: [CSES 2190](https://cses.fi/problemset/task/2190)  
  Key: Orientation + bounding boxes.  
  Why: Bat buoc xu ly collinear.

- [ ] **Polygon Area**  
  Submit: [CSES 2191](https://cses.fi/problemset/task/2191)  
  Key: Shoelace formula.  
  Why: Baseline polygon computation.

- [ ] **Point in Polygon**  
  Submit: [CSES 2192](https://cses.fi/problemset/task/2192)  
  Key: Ray casting / winding.  
  Why: Boundary cases de sai.

- [ ] **Polygon Lattice Points**  
  Submit: [CSES 2193](https://cses.fi/problemset/task/2193)  
  Key: Pick theorem + gcd edges.  
  Why: Geometry + number theory.

## B - Regional core

- [ ] **Minimum Euclidean Distance**  
  Submit: [CSES 2194](https://cses.fi/problemset/task/2194)  
  Key: Closest pair divide and conquer.  
  Why: Geometry algorithm nghiem tuc dau tien.

- [ ] **Convex Hull**  
  Submit: [CSES 2195](https://cses.fi/problemset/task/2195)  
  Key: Monotonic chain.  
  Why: Hull template phai exact.

- [ ] **Intersection Points**  
  Submit: [CSES 1740](https://cses.fi/problemset/task/1740)  
  Key: Sweep line / coordinate compression.  
  Why: Code-heavy intersection counting.

- [ ] **Area of Rectangles**  
  Submit: [CSES 1741](https://cses.fi/problemset/task/1741)  
  Key: Sweep line + segment tree.  
  Why: Geometry + DS combo Regional.

## C - Advanced core

- [ ] **Nearest vectors**  
  Submit: [Codeforces 598C](https://codeforces.com/problemset/problem/598/C)  
  Key: Angle sorting.  
  Why: Floating/angle handling.

- [ ] **Polygons**  
  Submit: [Codeforces 166B](https://codeforces.com/problemset/problem/166/B)  
  Key: Convex polygon containment.  
  Why: Strict vs non-strict containment reasoning.

- [ ] **Volatile Kite**  
  Submit: [Codeforces 772B](https://codeforces.com/problemset/problem/772/B)  
  Key: Point-line distance / polygon geometry.  
  Why: Precision va formula discipline.

- [ ] **Robert Hood**  
  Submit: [Kattis roberthood](https://open.kattis.com/problems/roberthood)  
  Key: rotating calipers / diameter of convex hull.  
  Why: Hoan thien hull pipeline bang mot bai calipers that.

- [ ] **Ancient Berland Circus**  
  Submit: [Codeforces 1C](https://codeforces.com/problemset/problem/1/C)  
  Key: circumcircle, angle gcd and floating precision.  
  Why: Circle/precision coverage dang thieu.

## D - Regional pipeline

- [ ] **ICPC 2023 Regional - Area Query**  
  Submit: [VNOI icpc23_regional_a](https://oj.vnoi.info/problem/icpc23_regional_a)  
  Focus: geometry/query modeling.  
  Pipeline: turn geometric condition into maintainable formula.

- [ ] **ICPC 2025 Regional - Hamiltonian Path Remix**  
  Submit: [VNOI icpc25_regional_h](https://oj.vnoi.info/problem/icpc25_regional_h)  
  Focus: geometry + non-crossing DP.  
  Pipeline: prove non-crossing structure, avoid wrong greedy.

## E - Stretch/OI pipeline

- [ ] **Fancy Fence**  
  Submit: [OJ.uz CEOI20_fancyfence](https://oj.uz/problem/view/CEOI20_fancyfence)  
  Focus: geometry/counting.  
  Pipeline: derive the formula and handle numeric cases.

- [ ] **Rectangles**  
  Submit: [OJ.uz IOI19_rect](https://oj.uz/problem/view/IOI19_rect)  
  Focus: rectangle/grid structure.  
  Pipeline: count geometric objects from local constraints.

- [ ] **Broken Line**  
  Submit: [OJ.uz IOI19_line](https://oj.uz/problem/view/IOI19_line)  
  Focus: constructive geometry/interface thinking.  
  Pipeline: reason about shape reconstruction, not brute force.

<!-- AUTO: aggressive Gym/OJ/QOJ-heavy supplement -->

## E - Gym/OJ.uz/QOJ/Kattis supplement

Cac bai nay thay the phan CSES du thua trong timeline. Generator se cap CSES o muc primitive va uu tien block nay cho lead-level training.

- [ ] **UCup Nanjing 2025 M - Many Convex Polygons**  
  Submit: [UCup 2581M](https://contest.ucup.ac/contest/2581/problem/14813?v=1)  
  Source: QOJ / Universal Cup  
  Contest/source: 2025 ICPC Asia Nanjing Regional  
  Editorial: [Contest tutorials](https://contest.ucup.ac/contest/2581?v=1)  
  Key: convex polygons + geometry counting.  
  Thinking: 5  
  Implementation: 5  
  Hours: 7  
  Why: Directly targets hard geometry/proof, a known weak area.

- [ ] **UCup Shenyang 2025 A - Square Kingdom**  
  Submit: [UCup 2641A](https://contest.ucup.ac/contest/2641/problem/14940?v=1)  
  Source: QOJ / Universal Cup  
  Contest/source: 2025 ICPC Asia Shenyang Regional  
  Editorial: [Contest tutorials](https://contest.ucup.ac/contest/2641?v=1)  
  Key: grid geometry / square structure.  
  Thinking: 4  
  Implementation: 4  
  Hours: 5  
  Why: Asia Regional geometry-flavored modeling, useful before APAC.

- [ ] **UCup Shenyang 2025 K - Relay Jump**  
  Submit: [UCup 2641K](https://contest.ucup.ac/contest/2641/problem/14950?v=1)  
  Source: QOJ / Universal Cup  
  Contest/source: 2025 ICPC Asia Shenyang Regional  
  Editorial: [Contest tutorials](https://contest.ucup.ac/contest/2641?v=1)  
  Key: geometry/graph reachability.  
  Thinking: 5  
  Implementation: 4  
  Hours: 6  
  Why: Combines geometric constraints with graph thinking.

- [ ] **UCup Hong Kong 2025 G - Watering System**  
  Submit: [UCup 3169G](https://contest.ucup.ac/contest/3169/problem/15438?v=1)  
  Source: QOJ / Universal Cup  
  Contest/source: 2025 ICPC Asia Hong Kong Regional  
  Editorial: [Contest tutorials](https://contest.ucup.ac/contest/3169?v=1)  
  Key: geometric coverage / sweep modeling.  
  Thinking: 5  
  Implementation: 5  
  Hours: 7  
  Why: Coverage-style geometry from a modern Regional.

- [ ] **Kattis WF 2025 - Lava Moat**  
  Submit: [Kattis lavamoat](https://open.kattis.com/problems/lavamoat)  
  Source: Kattis ICPC  
  Contest/source: ICPC World Finals 2025  
  Editorial: [Kattis WF 2025 source](https://open.kattis.com/problem-sources/ICPC%20World%20Finals%202025)  
  Key: computational geometry / shortest path around obstacles.  
  Thinking: 5  
  Implementation: 5  
  Hours: 7  
  Why: Hard WF geometry, exactly the kind of stretch missing from CSES.

- [ ] **Kattis WF 2024 - Billboards**  
  Submit: [Kattis billboards](https://open.kattis.com/problems/billboards)  
  Source: Kattis ICPC  
  Contest/source: ICPC World Finals 2024  
  Editorial: [Kattis WF 2024 source](https://open.kattis.com/problem-sources/ICPC%20World%20Finals%202024)  
  Key: geometry + optimization.  
  Thinking: 5  
  Implementation: 4  
  Hours: 6  
  Why: Medium/hard WF geometry conversion task.

- [ ] **Kattis WF 2025 - Bride of Pipe Stream**  
  Submit: [Kattis brideofpipestream](https://open.kattis.com/problems/brideofpipestream)  
  Source: Kattis ICPC  
  Contest/source: ICPC World Finals 2025  
  Editorial: [Kattis WF 2025 source](https://open.kattis.com/problem-sources/ICPC%20World%20Finals%202025)  
  Key: geometry/flow-like continuous model.  
  Thinking: 4  
  Implementation: 4  
  Hours: 5  
  Why: WF problem with unusual modeling; good for broadening geometry instincts.

- [ ] **APIO 2018 - Circle Selection**  
  Submit: [OJ.uz APIO18_circle_selection](https://oj.uz/problem/view/APIO18_circle_selection)  
  Source: OI / oj.uz  
  Contest/source: APIO 2018  
  Editorial: [APIO source](https://oj.uz/problems/source/apio2018)  
  Key: circles + sweep/spatial data structure.  
  Thinking: 5  
  Implementation: 5  
  Hours: 7  
  Why: Strong geometry+DS task with serious implementation.

- [ ] **IOI 2019 - Rectangles**  
  Submit: [OJ.uz IOI19_rect](https://oj.uz/problem/view/IOI19_rect)  
  Source: OI / oj.uz  
  Contest/source: IOI 2019  
  Editorial: [IOI source](https://oj.uz/problems/source/ioi2019)  
  Key: 2D rectangles + monotonic structure.  
  Thinking: 5  
  Implementation: 5  
  Hours: 7  
  Why: Excellent 2D geometry/DS hybrid for hard problem stamina.

- [ ] **BOI 2024 - Cutting a Rectangle**  
  Submit: [OJ.uz BOI24_rectangle](https://oj.uz/problem/view/BOI24_rectangle)  
  Source: OI / oj.uz  
  Contest/source: BOI 2024  
  Editorial: [BOI source](https://oj.uz/problems/source/boi2024)  
  Key: rectangle geometry + DP/optimization.  
  Thinking: 5  
  Implementation: 5  
  Hours: 7  
  Why: Modern OI geometry-ish task with proof and implementation.

<!-- AUTO: second UCup 2025 supplement -->

## E - UCup 2025 Asia supplement

Them de Asia Regional/EC-Final moi de tang ty trong QOJ/Universal Cup trong timeline.

- [ ] **UCup Chengdu 2025 I - Inside Triangle**  
  Submit: [UCup 2567I](https://contest.ucup.ac/contest/2567/problem/14714?v=1)  
  Source: QOJ / Universal Cup  
  Contest/source: 2025 ICPC Asia Chengdu Regional  
  Editorial: [Contest tutorials](https://contest.ucup.ac/contest/2567?v=1)  
  Key: point-in-triangle / geometry counting.  
  Thinking: 4  
  Implementation: 4  
  Hours: 5  
  Why: Direct geometry problem from Asia Regional, good before harder polygon tasks.

- [ ] **UCup Shanghai 2025 J - Round screws**  
  Submit: [UCup 2908J](https://contest.ucup.ac/contest/2908/problem/15322?v=1)  
  Source: QOJ / Universal Cup  
  Contest/source: 2025 ICPC Asia Shanghai Regional  
  Editorial: [Contest tutorials](https://contest.ucup.ac/contest/2908?v=1)  
  Key: circle/geometry modeling.  
  Thinking: 5  
  Implementation: 5  
  Hours: 7  
  Why: Circle geometry with contest implementation pressure.

- [ ] **UCup EC-Final 2025 A - Outstanding Outlines**  
  Submit: [UCup 3295A](https://contest.ucup.ac/contest/3295/problem/16328?v=1)  
  Source: QOJ / Universal Cup  
  Contest/source: 2025 ICPC Asia EC-Final  
  Editorial: [Contest tutorials](https://contest.ucup.ac/contest/3295?v=1)  
  Key: geometry outlines / sweep or polygon reasoning.  
  Thinking: 5  
  Implementation: 5  
  Hours: 7  
  Why: EC-Final geometry-flavored task for Asia stretch.

