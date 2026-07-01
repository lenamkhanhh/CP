# 01 - Graph and Modeling

Regional graph thuong kho o buoc model. Khong chi can template, ma phai nhin ra graph nao, can compress hay them state nao.

## Coverage

- Shortest path co state, SCC condensation, DAG DP.
- Low-link: bridge, articulation point, biconnected component.
- MST/DSU, functional graph, Euler tour/path.
- 2-SAT, matching, max flow/min cut; min-cost flow la owner topic.

## Recommended order

1. `A`: shortest path, SCC, MST, low-link.
2. `B`: 2-SAT, Euler, functional graph, flow/matching.
3. `D - Regional scoring pipeline`.
4. Block-cut tree, min-cost flow va cac bai OI o cuoi.

## Coverage gate

- [ ] Tu code Dijkstra, SCC, low-link va Dinic khong chep template.
- [ ] AC it nhat mot bai MST, mot bai functional graph va mot bai min-cut reconstruction.
- [ ] Voi bai model, viet nodes/edges/state va complexity truoc khi code.
- [ ] Block-cut tree/min-cost flow co it nhat mot thanh vien lam owner; khong bat buoc ca doi.

## Reading

- [VNOI Wiki - Đường đi ngắn nhất, Dijkstra](https://wiki.vnoi.info/algo/graph-theory/shortest-path)
- [VNOI Wiki - Bài toán 2-SAT](https://wiki.vnoi.info/algo/graph-theory/2-SAT)
- [VNOI Wiki - Bài toán luồng cực đại](https://wiki.vnoi.info/algo/graph-theory/flow)
- [VNOI Wiki - Cặp ghép cực đại](https://wiki.vnoi.info/algo/graph-theory/max-matching)
- [Robert1003 - Graph and Segment Trees](https://robert1003.github.io/2020/02/14/graphs-and-segment-tree.html)
- [VNOI Wiki - Đường đi / chu trình Euler](https://wiki.vnoi.info/algo/graph-theory/euler-cycle.md)

## A - Foundation

- [ ] **Flight Discount**  
  Submit: [CSES 1195](https://cses.fi/problemset/task/1195)  
  Key: Dijkstra with state / edge split.  
  Why: Shortest path co mot thao tac dac biet.

- [ ] **Investigation**  
  Submit: [CSES 1202](https://cses.fi/problemset/task/1202)  
  Key: Dijkstra + count/min/max edges.  
  Why: Re-laxation co nhieu thong tin, de sai tie.

- [ ] **Coin Collector**  
  Submit: [CSES 1686](https://cses.fi/problemset/task/1686)  
  Key: SCC condensation + DAG DP.  
  Why: Mau Regional rat hay gap: compress truoc, DP sau.

- [ ] **Giant Pizza**  
  Submit: [CSES 1684](https://cses.fi/problemset/task/1684)  
  Key: 2-SAT, implication graph, SCC.  
  Why: Bat buoc biet khi gap rang buoc either/or.

- [ ] **Road Reparation**  
  Submit: [CSES 1675](https://cses.fi/problemset/task/1675)  
  Key: Kruskal + DSU, MST cut property.  
  Why: MST la lo hong lon cua bank cu.

- [ ] **Necessary Roads**  
  Submit: [CSES 2076](https://cses.fi/problemset/task/2076)  
  Key: bridges / low-link.  
  Why: Primitive bat buoc truoc block-cut tree.

- [ ] **Necessary Cities**  
  Submit: [CSES 2077](https://cses.fi/problemset/task/2077)  
  Key: articulation points / low-link.  
  Why: Root case va low-link condition rat de sai.

## B - Regional core

- [ ] **Download Speed**  
  Submit: [CSES 1694](https://cses.fi/problemset/task/1694)  
  Key: Dinic max flow.  
  Why: Flow template baseline.

- [ ] **Police Chase**  
  Submit: [CSES 1695](https://cses.fi/problemset/task/1695)  
  Key: Max flow + min cut extraction.  
  Why: Khong chi tinh maxflow, con phai reconstruct cut.

- [ ] **School Dance**  
  Submit: [CSES 1696](https://cses.fi/problemset/task/1696)  
  Key: Bipartite matching / max flow.  
  Why: Assignment modeling co ban.

- [ ] **Distinct Routes**  
  Submit: [CSES 1711](https://cses.fi/problemset/task/1711)  
  Key: Max flow + path decomposition.  
  Why: Code nang hon plain maxflow.

- [ ] **Mail Delivery**  
  Submit: [CSES 1691](https://cses.fi/problemset/task/1691)  
  Key: Euler cycle.  
  Why: Constructive graph output.

- [ ] **Teleporters Path**  
  Submit: [CSES 1693](https://cses.fi/problemset/task/1693)  
  Key: Directed Euler path.  
  Why: Dieu kien dau/cuoi va output de sai.

- [ ] **Planets Queries II**  
  Submit: [CSES 1160](https://cses.fi/problemset/task/1160)  
  Key: functional graph, cycle/tree decomposition, binary lifting.  
  Why: Functional graph xuat hien duoi nhieu lop statement.

## C - Advanced core

- [ ] **Legacy**  
  Submit: [Codeforces 786B](https://codeforces.com/problemset/problem/786/B)  
  Key: Segment-tree graph + Dijkstra.  
  Why: Modeling nang, code dai, van trong scope Regional.

- [ ] **Delivery Bears**  
  Submit: [Codeforces 653D](https://codeforces.com/problemset/problem/653/D)  
  Key: Max flow + binary search answer.  
  Why: Flow predicate + toi uu dap an.

- [ ] **Task Assignment**  
  Submit: [CSES 2129](https://cses.fi/problemset/task/2129)  
  Key: min-cost flow / Hungarian.  
  Why: Bai owner de hoan thien assignment modeling; mot trong hai cach la du.

- [ ] **Tourists**  
  Submit: [Codeforces 487E](https://codeforces.com/problemset/problem/487/E)  
  Key: vertex-biconnected components + block-cut tree + data structure.  
  Why: Block-cut tree can mot bai owner that; khong phai gate ca doi.

- [ ] **Reachable Nodes**  
  Submit: [CSES 2138](https://cses.fi/problemset/task/2138)  
  Key: topological DP + dynamic bitset.  
  Why: Them bitset optimization tren DAG ma khong day no thanh topic rieng.

## D - Regional pipeline

- [ ] **ICPC 2025 Regional - Matrix Multiplication**  
  Submit: [VNOI icpc25_regional_m](https://oj.vnoi.info/problem/icpc25_regional_m)  
  Focus: graph modeling tu statement la.  
  Pipeline: bien bai ve do thi truoc khi code.

- [ ] **Commuter Pass**  
  Submit: [OJ.uz JOI18_commuter_pass](https://oj.uz/problem/view/JOI18_commuter_pass)  
  Focus: shortest paths + structure of shortest path DAG.  
  Pipeline: chay nhieu Dijkstra, tach duong di mien phi.

- [ ] **One-Way Streets**  
  Submit: [OJ.uz CEOI17_oneway](https://oj.uz/problem/view/CEOI17_oneway)  
  Focus: bridges, components, edge orientation.  
  Pipeline: graph reduction + case proof.

- [ ] **ICPC 2024 Regional - Locomotive Lane Logistics**  
  Submit: [VNOI icpc24_regional_l](https://oj.vnoi.info/problem/icpc24_regional_l)  
  Focus: graph/logistics modeling.  
  Why: Flow/matching logic combined with routing constraints.

- [ ] **ICPC 2024 Regional - Minotaur's Mysterious Maze**  
  Submit: [VNOI icpc24_regional_m](https://oj.vnoi.info/problem/icpc24_regional_m)  
  Focus: state graph, maze modeling, optimization.  
  Why: State space expansion and shortest paths.

## E - Stretch/OI pipeline

- [ ] **Werewolf**  
  Submit: [OJ.uz IOI18_werewolf](https://oj.uz/problem/view/IOI18_werewolf)  
  Focus: two Kruskal reconstruction trees + offline + merge-sort/persistent tree.  
  Pipeline: combine reachability under min/max edge + 2D query; long implementation.

- [ ] **ICPC 2025 Regional - Joint Farm**  
  Submit: [VNOI icpc25_regional_j](https://oj.vnoi.info/problem/icpc25_regional_j)  
  Focus: hard flow modeling.  
  Pipeline: doc de dai, tim mang luong, chung minh capacity/cut.

- [ ] **Crocodile's Underground City**  
  Submit: [OJ.uz IOI11_crocodile](https://oj.uz/problem/view/IOI11_crocodile)  
  Focus: multi-source shortest path variant.  
  Pipeline: sua Dijkstra theo state/topology khong hien nhien.

<!-- AUTO: aggressive Gym/OJ/QOJ-heavy supplement -->

## E - Gym/OJ.uz/QOJ/Kattis supplement

Cac bai nay thay the phan CSES du thua trong timeline. Generator se cap CSES o muc primitive va uu tien block nay cho lead-level training.

- [ ] **UCup Nanjing 2025 F - Bitwise And Path**  
  Submit: [UCup 2581F](https://contest.ucup.ac/contest/2581/problem/14806?v=1)  
  Source: QOJ / Universal Cup  
  Contest/source: 2025 ICPC Asia Nanjing Regional  
  Editorial: [Contest tutorials](https://contest.ucup.ac/contest/2581?v=1)  
  Key: graph paths + bitwise constraints.  
  Thinking: 5  
  Implementation: 4  
  Hours: 6  
  Why: Regional-hard graph modeling where the graph property is not directly shortest path.

- [ ] **UCup Nanjing 2025 J - Trajan Algorithm**  
  Submit: [UCup 2581J](https://contest.ucup.ac/contest/2581/problem/14810?v=1)  
  Source: QOJ / Universal Cup  
  Contest/source: 2025 ICPC Asia Nanjing Regional  
  Editorial: [Contest tutorials](https://contest.ucup.ac/contest/2581?v=1)  
  Key: SCC/lowlink modeling beyond template Tarjan.  
  Thinking: 5  
  Implementation: 4  
  Hours: 6  
  Why: Directly targets graph-theory reasoning around SCC/lowlink, not just implementation.

- [ ] **UCup Hong Kong 2025 A - Bipartite Graph Matching Problem**  
  Submit: [UCup 3169A](https://contest.ucup.ac/contest/3169/problem/15432?v=1)  
  Source: QOJ / Universal Cup  
  Contest/source: 2025 ICPC Asia Hong Kong Regional  
  Editorial: [Contest tutorials](https://contest.ucup.ac/contest/3169?v=1)  
  Key: matching model + proof of construction.  
  Thinking: 4  
  Implementation: 4  
  Hours: 5  
  Why: Matching appears often as a modeling layer; this is Asia Regional style.

- [ ] **UCup Hong Kong 2025 E - Bipartite Graph Weighting Problem**  
  Submit: [UCup 3169E](https://contest.ucup.ac/contest/3169/problem/15436?v=1)  
  Source: QOJ / Universal Cup  
  Contest/source: 2025 ICPC Asia Hong Kong Regional  
  Editorial: [Contest tutorials](https://contest.ucup.ac/contest/3169?v=1)  
  Key: weighted bipartite graph modeling.  
  Thinking: 5  
  Implementation: 5  
  Hours: 7  
  Why: Harder matching/weighting transfer than standard Kuhn/Dinic drills.

- [ ] **UCup Hong Kong 2025 F - Find the Circuit**  
  Submit: [UCup 3169F](https://contest.ucup.ac/contest/3169/problem/15437?v=1)  
  Source: QOJ / Universal Cup  
  Contest/source: 2025 ICPC Asia Hong Kong Regional  
  Editorial: [Contest tutorials](https://contest.ucup.ac/contest/3169?v=1)  
  Key: cycle/circuit existence and construction.  
  Thinking: 5  
  Implementation: 4  
  Hours: 6  
  Why: Good for graph proof + construction under ICPC constraints.

- [ ] **IOI 2020 - Connecting Supertrees**  
  Submit: [OJ.uz IOI20_supertrees](https://oj.uz/problem/view/IOI20_supertrees)  
  Source: OI / oj.uz  
  Contest/source: IOI 2020  
  Editorial: [IOI source](https://oj.uz/problems/source/ioi2020)  
  Key: graph construction from pairwise constraints.  
  Thinking: 5  
  Implementation: 4  
  Hours: 7  
  Why: Excellent modeling/proof problem for turning conditions into a graph object.

- [ ] **IOI 2023 - Longest Trip**  
  Submit: [OJ.uz IOI23_longesttrip](https://oj.uz/problem/view/IOI23_longesttrip)  
  Source: OI / oj.uz  
  Contest/source: IOI 2023  
  Editorial: [IOI source](https://oj.uz/problems/source/ioi2023)  
  Key: graph exploration + adaptive strategy.  
  Thinking: 5  
  Implementation: 5  
  Hours: 7  
  Why: Hard graph reasoning with nonstandard access pattern.

- [ ] **APIO 2023 - Cyberland**  
  Submit: [OJ.uz APIO23_cyberland](https://oj.uz/problem/view/APIO23_cyberland)  
  Source: OI / oj.uz  
  Contest/source: APIO 2023  
  Editorial: [APIO source](https://oj.uz/problems/source/apio2023)  
  Key: shortest path with transformed state.  
  Thinking: 5  
  Implementation: 4  
  Hours: 7  
  Why: APIO graph state modeling, useful for Regional hard graph transfer.

- [ ] **APIO 2021 - Road Closures**  
  Submit: [OJ.uz APIO21_roads](https://oj.uz/problem/view/APIO21_roads)  
  Source: OI / oj.uz  
  Contest/source: APIO 2021  
  Editorial: [APIO source](https://oj.uz/problems/source/apio2021)  
  Key: graph optimization + cut/structure reasoning.  
  Thinking: 5  
  Implementation: 5  
  Hours: 7  
  Why: Forces structural graph thinking beyond running a template.

- [ ] **Kattis WF 2022 - Toy Train Tracks**  
  Submit: [Kattis toytraintracks](https://open.kattis.com/problems/toytraintracks)  
  Source: Kattis ICPC  
  Contest/source: ICPC World Finals 2022  
  Editorial: [Kattis WF 2022 source](https://open.kattis.com/problem-sources/ICPC%20World%20Finals%202022)  
  Key: graph constraints + reconstruction.  
  Thinking: 5  
  Implementation: 4  
  Hours: 7  
  Why: World Finals graph modeling with long statement and careful invariant.

<!-- AUTO: second UCup 2025 supplement -->

## E - UCup 2025 Asia supplement

Them de Asia Regional/EC-Final moi de tang ty trong QOJ/Universal Cup trong timeline.

- [ ] **UCup Chengdu 2025 E - Escaping from Trap**  
  Submit: [UCup 2567E](https://contest.ucup.ac/contest/2567/problem/14710?v=1)  
  Source: QOJ / Universal Cup  
  Contest/source: 2025 ICPC Asia Chengdu Regional  
  Editorial: [Contest tutorials](https://contest.ucup.ac/contest/2567?v=1)  
  Key: graph reachability + state modeling.  
  Thinking: 5  
  Implementation: 4  
  Hours: 6  
  Why: Modern Regional graph problem with non-obvious state construction.

- [ ] **UCup Chengdu 2025 F - Following Arrows**  
  Submit: [UCup 2567F](https://contest.ucup.ac/contest/2567/problem/14711?v=1)  
  Source: QOJ / Universal Cup  
  Contest/source: 2025 ICPC Asia Chengdu Regional  
  Editorial: [Contest tutorials](https://contest.ucup.ac/contest/2567?v=1)  
  Key: functional graph / directed process.  
  Thinking: 5  
  Implementation: 4  
  Hours: 6  
  Why: Functional-graph reasoning in contest form, stronger than isolated cycle template.

- [ ] **UCup EC-Final 2025 E - Efficient Express**  
  Submit: [UCup 3295E](https://contest.ucup.ac/contest/3295/problem/16332?v=1)  
  Source: QOJ / Universal Cup  
  Contest/source: 2025 ICPC Asia EC-Final  
  Editorial: [Contest tutorials](https://contest.ucup.ac/contest/3295?v=1)  
  Key: graph/shortest-path modeling.  
  Thinking: 5  
  Implementation: 5  
  Hours: 7  
  Why: EC-Final style graph modeling for post-core stretch.

- [ ] **UCup Shanghai 2025 I - AGI**  
  Submit: [UCup 2908I](https://contest.ucup.ac/contest/2908/problem/15321?v=1)  
  Source: QOJ / Universal Cup  
  Contest/source: 2025 ICPC Asia Shanghai Regional  
  Editorial: [Contest tutorials](https://contest.ucup.ac/contest/2908?v=1)  
  Key: graph/search modeling under hidden structure.  
  Thinking: 5  
  Implementation: 5  
  Hours: 7  
  Why: Hard Asia set problem for modeling and pruning instincts.

