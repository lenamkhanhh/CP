# ICPC Regional Correction Pass

## Correction summary

Tôi đã đọc lại workbook `ICPC_Solo_Training_Schedule_2026_2027.xlsx` theo đúng hai sheet `Solo Timeline` và `Weekly Brief`, đối chiếu lại toàn bộ các row pre-Regional, rồi vá lại phần audit theo đúng 67 judged rows thật sự đang nằm ở W1-W19. Kết quả lần này sửa bốn lỗi quan trọng của pass trước: bảng judged được dựng lại đúng 67 dòng; Learn-support được tính lại thành **33 rows / 82.0 giờ**, phần chênh **67.0 giờ** so với 149 giờ cũ được chuyển có chủ đích sang debt buffer / recovery thay vì “nhét việc”; replacement không làm tuần nào vượt cap; và ba row overlap trước virtual sạch của `Nanjing 2025` / `Shenyang 2025` đã bị loại khỏi W1-W19. Bốn contest thay `W16-W19` cũng đã được kiểm tra lại trực tiếp trên dashboard UCup/QOJ: cả bốn đều có virtual mode và có tutorial attachment chính thức. citeturn2view0turn2view1turn2view2turn2view3turn3view0turn3view1turn3view2turn5view0

Patch này cố tình giữ triết lý vòng trước: không tăng tổng giờ, không thêm metadata phức tạp, không phá phase camp/build/taper, không hi sinh upsolve chỉ để “đẹp dashboard”. Tôi cũng không dùng lại các mapping bị correction note chỉ ra là lệch topic như `Point Location Test -> Herding Cats` hay `Square Kingdom -> Cyclic Shift`; các replacement mới đều giữ topic bucket hoặc cải thiện bucket đang thiếu. Với các URL replacement, tôi chỉ dùng problem page / contest page có thể submit thật: UCup Hong Kong problem pages hiện `Submit`, Codeforces Gym hiện `Submit Code`/practice và có tutorial PDF, còn `oj.uz` cho `IOI21_dna` hiện rõ `Statement` và `Submit`. citeturn11view0turn11view1turn11view2turn2view7turn11view5turn16view0turn2view6turn9view0

Có một điểm cần nói thẳng: patch tối thiểu này **chưa** kéo CSES pre-Regional xuống mốc lý tưởng 8-10 bài. Lý do không phải bỏ sót, mà vì W1-W4 đang sát cap và các row CSES ở đó chủ yếu là micro-core 1.5h gắn chặt với room của tuần; nếu ép thay thêm ở giai đoạn này thì phải làm một pass thứ hai mang tính tái cấu trúc, không còn là “minimal high-impact edit” nữa. Patch hiện tại ưu tiên ba thứ có tác động lớn hơn: giữ cap đúng, làm sạch benchmark W16-W19, và tăng judged exposure ngoài ICPC/VNOI ở các slot hard muộn hơn.

## Audit judged rows

Viết tắt topic trong bảng: `Impl`, `Graph`, `DS`, `Tree`, `DP`, `Math`, `Str`, `Geo`, `Proof`.

| Week | Current task | Topic | Hours | Keep / Move / Replace | Transfer | Reason |
|---|---|---|---:|---|---|---|
| W1 | Apartments | Impl | 1.5 | Keep | Med | Fast two-pointers warm-up; still useful as speed reset. |
| W1 | Flight Discount | Graph | 1.5 | Keep | High | Canonical one-discount shortest path; strong graph transfer. |
| W1 | Factory Machines | Impl | 1.5 | Keep | Med | Binary-search-on-answer warm-up; cheap but still relevant. |
| W1 | Investigation | Graph | 1.5 | Keep | High | Shortest path + path counting/min-max edges is useful contest glue. |
| W1 | ICPC 2025 Regional - KayTee vs. TeaOne | Impl | 5.5 | Keep | High | Good regional-style implementation/modeling anchor. |
| W1 | Legacy | Graph | 4.0 | Keep | High | Segment-tree graph modeling still valuable for lead-level graph conversion. |
| W1 | Kattis WF 2025 - Buggy Rover | Impl | 4.0 | Keep | High | WF-flavored implementation payload; good stability check. |
| W1 | Delivery Bears | Graph | 4.0 | Keep | High | Flow + binary search modeling remains high-transfer. |
| W1 | Permutations | Proof | 1.5 | Keep | Low | Tiny constructive warm-up; keep only as quick reset. |
| W1 | Gray Code | Proof | 1.5 | Keep | Low | Bit-constructive recall; cheap enough to keep. |
| W2 | ICPC 2025 Regional - Matrix Multiplication | Graph | 5.5 | Keep | High | Regional graph/modeling slot worth keeping. |
| W2 | Range Update Queries | DS | 1.5 | Keep | Med | Cheap BIT difference template; keep as DS speed check. |
| W2 | ICPC 2024 Regional - Locomotive Lane Logistics | Graph | 5.5 | Replace | Med | Graph slot is fine, but matching/flow-specific modeling gap matters more. |
| W2 | Range Updates and Sums | DS | 1.5 | Keep | High | Lazy segtree with assign/add is core Regional DS. |
| W2 | The Child and Sequence | DS | 2.5 | Keep | High | Segment-tree beats-ish behavior; good DS transfer. |
| W2 | Number Game | Proof | 2.5 | Keep | Med | Compact number-theory game warm-up; fine at this cost. |
| W2 | ICPC 2025 Regional - Divisibility Grid | Proof | 2.5 | Keep | Med | Contest-style constructive/proof slot; acceptable cost. |
| W2 | Counting Divisors | Math | 1.5 | Keep | Low | Routine divisor-counting recall; not exciting, but very cheap. |
| W2 | Game On Leaves | Proof | 4.0 | Keep | Med | Tree-game reasoning with short implementation is still useful. |
| W3 | ICPC 2021 Regional - K Query | DS | 5.5 | Keep | High | Strong DS benchmark; keep. |
| W3 | Projects | DP | 1.5 | Keep | High | Weighted interval DP is a canonical Regional pattern. |
| W3 | ICPC 2024 Regional - Inversland | DS | 5.5 | Keep | High | Heavy DS/math mood; good lead exposure. |
| W3 | Removal Game | DP | 1.5 | Keep | Med | Classic interval DP refresher; cheap and safe. |
| W3 | O - Matching | DP | 2.5 | Keep | High | Bitmask DP/matching remains a good foundation slot. |
| W3 | U - Grouping | DP | 2.5 | Keep | High | Subset DP grouping is still a strong advanced-DP anchor. |
| W3 | Common Divisors | Math | 1.5 | Keep | Med | GCD/divisor routine refresher; acceptable at 1.5h. |
| W3 | Tokitsukaze, CSL and Stone Game | Proof | 4.0 | Keep | High | Good proof/game pattern beyond trivial parity. |
| W3 | Chinese Remainder | Math | 1.5 | Keep | Med | Cheap CRT refresh; aligns well with math week. |
| W4 | ICPC 2025 Regional - Hamiltonian Path Remix | DP | 5.5 | Keep | High | High-transfer advanced DP/modeling. |
| W4 | Company Queries II | Tree | 1.5 | Keep | High | LCA/jump-table tree core should stay. |
| W4 | ICPC 2025 Regional - Finest Final String | DP | 5.5 | Keep | High | Late-DP/stringish modeling anchor. |
| W4 | Distance Queries | Tree | 1.5 | Keep | High | Very cheap but core LCA/path template. |
| W4 | Lomsat gelral | Tree | 2.5 | Keep | High | Sack / DS on tree is valuable. |
| W4 | Tree and Queries | Tree | 2.5 | Keep | High | Mo-on-tree / DS-on-tree flavor still good. |
| W4 | Fools and Roads | Tree | 2.5 | Keep | High | Difference on tree / path accumulation is useful glue. |
| W4 | Point Location Test | Geo | 1.5 | Keep | Med | Orientation primitive stays as low-cost geometry kernel. |
| W4 | Square Subsets | Math | 4.0 | Keep | High | Bitmask + number theory modeling remains useful. |
| W5 | ICPC 2022 Regional - K Paths | Tree | 5.5 | Keep | High | Real tree difficulty anchor; keep. |
| W5 | String Matching | Str | 1.5 | Replace | Med | Too shallow as the main pre-Regional strings gate. |
| W5 | ICPC 2021 Regional - Awesome MST Problem | Tree | 5.5 | Keep | High | Good tree/MST modeling; still worth keeping. |
| W5 | Finding Borders | Str | 1.5 | Keep | Med | Prefix-function/Z recall is fine as a cheap string kernel. |
| W5 | Compress Words | Str | 4.0 | Keep | High | Practical string concatenation/hashing modeling. |
| W5 | Line Segment Intersection | Geo | 1.5 | Keep | High | Core integer geometry primitive; keep. |
| W5 | Ivan and Burgers | Math | 4.0 | Keep | High | XOR-basis style math/DS benchmark is worthwhile. |
| W6 | ICPC 2024 Regional - Hash-shashin | Str | 5.5 | Keep | High | Needed late strings/modeling pressure. |
| W6 | ICPC 2025 National - Extended Fermat Theorem | Math | 5.5 | Keep | High | Strong contest math slot. |
| W6 | Nearest vectors | Geo | 4.0 | Keep | High | Angle-sort geometry implementation remains useful. |
| W6 | Polygons | Geo | 4.0 | Keep | High | Robust geometry casework + correctness discipline. |
| W6 | Robert Hood | Geo | 4.0 | Keep | High | Convex hull / rotating-calipers canonical geometry. |
| W7 | ICPC 2023 National - Infinite Fraction Sequence | Math | 5.5 | Keep | High | Strong contest math slot. |
| W7 | ICPC 2023 Regional - Area Query | Geo | 5.5 | Keep | High | Hard geometry/query anchor is worth keeping. |
| W7 | Kattis WF 2024 - Friendly Rivalry | Impl | 4.0 | Keep | High | WF implementation under pressure; good for stability. |
| W8 | UCup Nanjing 2025 M - Many Convex Polygons | Geo | 7.0 | Replace | High but dirty | Good problem, but it contaminates the Nanjing 2025 virtual benchmark. |
| W8 | ICPC 2024 Regional - FizzBuzz | Proof | 5.5 | Keep | High | Good proof/constructive Regional anchor. |
| W9 | ICPC 2023 Regional - Divisive Stone Battle | Proof | 5.5 | Keep | High | Game/proof bucket needs a real hard anchor. |
| W9 | Kattis WF 2024 - Bingo for the Win! | Impl | 4.0 | Keep | High | Strong implementation/combinatorics hybrid. |
| W10 | ICPC 2025 Regional - Aquatic Elevator | Impl | 5.5 | Keep | High | Late-stage implementation/modeling anchor. |
| W11 | ICPC 2024 Regional - Minotaur's Mysterious Maze | Graph | 5.5 | Keep | High | Graph slot remains relevant. |
| W12 | ICPC 2025 Regional - Cake Cutting | DS | 7.0 | Replace | High | Topic is right, but DS bucket needs one non-VNOI hard benchmark. |
| W13 | ICPC 2023 Regional - Kingdom Profit Kerfuffle | DP | 5.5 | Replace | High | DP bucket is too VNOI-heavy without one outside benchmark. |
| W14 | UCup Nanjing 2025 E - Cyan White Tree | Tree | 7.0 | Replace | High but dirty | Good tree task, but it contaminates the Nanjing 2025 virtual benchmark. |
| W15 | ICPC 2023 Regional - Flipping Substrings | Str | 5.5 | Replace | High | Strings late slot should be harder and less VNOI-local. |
| W16 | ICPC 2022 Regional - Median of Xor Sequence | Math | 5.5 | Replace | Med | Math slot can be slightly cheaper while staying deep. |
| W17 | UCup Shenyang 2025 A - Square Kingdom | Geo | 5.0 | Replace | High but dirty | Good geometry task, but it contaminates the Shenyang 2025 virtual benchmark. |
| W17 | CF Gym 105484B - Birthday Gift | Proof | 5.0 | Keep | High | Nice compact proof/game benchmark from regional Gym. |
| W18 | ICPC 2024 Regional - Easy Game | Proof | 5.5 | Replace | Med | Proof/game bucket benefits from a cleaner non-VNOI benchmark. |
| W19 | ICPC 2025 Regional - Electronic Toll Collection | Impl | 5.5 | Keep | High | Final fresh implementation/modeling slot before taper is appropriate. |

Tổng kết audit: **67 rows đúng**, **57 Keep**, **10 Replace**, **0 Move**. Về composition, 67 bài là vẫn ở ngưỡng “đủ lượng”, nhưng chỉ đủ khi Learn-support bị generic được bó lại thành deliverable cụ thể và virtual W16-W19 được làm sạch. Nếu giữ nguyên workbook cũ, composition bị sai vì ba bài UCup 2025 đang làm bẩn benchmark, còn strings/DS/graph hard slot vẫn hơi quá local.

## Replacement patch

Tôi chọn **10 replacement** chứ không đẩy lên 12-15, vì đây là correction pass tối thiểu để generator có thể vá ngay mà không phá trần giờ. Các lựa chọn bên dưới đều dùng URL submit thật; với Hong Kong 2025 tôi dùng analysis PDF chính thức của contest, còn với 2024 Nanjing Gym tôi dùng tutorial PDF chính thức của contest. Analysis Hong Kong cho thấy `H/J` tương đối mềm hơn, còn `G/I` sâu hơn; tutorial Nanjing 2024 đánh dấu `E` là easy và `H` là hard; điều đó giúp gắn replacement vào đúng độ nặng hơn là chỉ nhìn tên nguồn. citeturn22view0turn23view0turn14view0turn15view0turn17view0

| Original week | Old task | Old topic | Old hours | New task | New topic | New hours | Keep topic coverage? | Action | Submit URL | Editorial URL | Why better |
|---|---|---|---:|---|---|---:|---|---|---|---|---|
| W2 | ICPC 2024 Regional - Locomotive Lane Logistics | Graph and Modeling | 5.5 | UCup Hong Kong 2025 A - Bipartite Graph Matching Problem | Graph/modeling | 5.0 | Yes | Move from post-Regional W29 | `https://contest.ucup.ac/contest/3169/problem/15432?v=1` | `https://contest.ucup.ac/download.php?id=3169&r=1&type=attachments` | Adds explicit bipartite/matching modeling without increasing week load. |
| W5 | String Matching | Strings | 1.5 | IOI 2021 - Mutating DNA | Strings | 5.0 | Yes | Move from post-Regional W33 | `https://oj.uz/problem/view/IOI21_dna` | `No verified public editorial found` | Converts a shallow KMP slot into the only pre-Regional OJ.uz anchor, with much better string-state modeling. |
| W8 | UCup Nanjing 2025 M - Many Convex Polygons | Geometry | 7.0 | UCup Hong Kong 2025 G - Watering System | Geometry | 7.0 | Yes | Move from post-Regional W26 | `https://contest.ucup.ac/contest/3169/problem/15438?v=1` | `https://contest.ucup.ac/download.php?id=3169&r=1&type=attachments` | Removes Nanjing-2025 overlap while preserving one hard geometry/modeling anchor. |
| W12 | ICPC 2025 Regional - Cake Cutting | Data Structures | 7.0 | CF Gym 105484H - Border Jump 2 | Data Structures | 7.0 | Yes | Move from post-Regional W39 | `https://codeforces.com/gym/105484/problem/H` | `https://codeforces.com/gym/105484/attachments/download/28236/tutorial-sketch-zh.pdf` | Keeps a 7h hard slot but diversifies DS beyond VNOI. |
| W13 | ICPC 2023 Regional - Kingdom Profit Kerfuffle | Advanced DP | 5.5 | CF Gym 105484E - Left Shifting 3 | Advanced DP | 7.0 | Yes | Move from post-Regional W30 | `https://codeforces.com/gym/105484/problem/E` | `https://codeforces.com/gym/105484/attachments/download/28236/tutorial-sketch-zh.pdf` | Adds one non-VNOI DP benchmark with official tutorial and clean problem page. |
| W14 | UCup Nanjing 2025 E - Cyan White Tree | Tree | 7.0 | UCup Hong Kong 2025 I - DFS Order - Extra Stage | Tree | 6.0 | Yes | Move from post-Regional W22 | `https://contest.ucup.ac/contest/3169/problem/15440?v=1` | `https://contest.ucup.ac/download.php?id=3169&r=1&type=attachments` | Eliminates Nanjing overlap and keeps a hard tree-combinatorics slot. |
| W15 | ICPC 2023 Regional - Flipping Substrings | Strings | 5.5 | UCup Hong Kong 2025 H - Longest Common Prefix | Strings | 7.0 | Yes | Move from post-Regional W23 | `https://contest.ucup.ac/contest/3169/problem/15439?v=1` | `https://contest.ucup.ac/download.php?id=3169&r=1&type=attachments` | Raises the ceiling of the late strings bucket with official analysis support. |
| W16 | ICPC 2022 Regional - Median of Xor Sequence | Math and Counting | 5.5 | Kattis WF 2025 - Score Values | Math/counting | 5.0 | Yes | Move from post-Regional W40 | `https://open.kattis.com/problems/scorevalues` | `No verified public editorial found` | Slightly cheaper mathematically, better fit for late Regional build. |
| W17 | UCup Shenyang 2025 A - Square Kingdom | Geometry | 5.0 | Kattis WF 2024 - Billboards | Geometry | 6.0 | Yes | Move from post-Regional W35 | `https://open.kattis.com/problems/billboards` | `No verified public editorial found` | Removes Shenyang overlap and preserves a hard geometry implementation slot. |
| W18 | ICPC 2024 Regional - Easy Game | Proof, Constructive, Game | 5.5 | CF Gym 105484D - Toe-Tac-Tics | Proof/game | 5.0 | Yes | Replace with new verified task | `https://codeforces.com/gym/105484/problem/D` | `https://codeforces.com/gym/105484/attachments/download/28236/tutorial-sketch-zh.pdf` | Cleaner combinatorial-game benchmark than another VNOI-local proof slot. |

Sau patch này, **topic count giữ nguyên hoàn toàn**: `Impl 8, Graph 7, DS 6, Tree 8, DP 7, Math 8, Str 5, Geo 8, Proof 10`. Điểm quan trọng là transfer theo topic không bị thủng vì mọi replacement đều **giữ cùng bucket**. Tôi cố ý **không** dùng các mapping bị correction note đánh dấu lệch coverage như `Square Kingdom -> Cyclic Shift` hay `Point Location Test -> Herding Cats`.

Source mix trước / sau patch:

| Source | Before | After |
|---|---:|---:|
| ICPC / VNOI | 24 | 18 |
| CSES | 18 | 17 |
| Codeforces | 14 | 14 |
| Kattis ICPC | 5 | 7 |
| QOJ / Universal Cup | 3 | 4 |
| Codeforces Gym | 1 | 4 |
| OI / oj.uz | 0 | 1 |
| Other judge | 2 | 2 |

Điều này có nghĩa là patch **không giải quyết triệt để CSES-heavy**, nhưng nó **gần gấp đôi** lượng judged exposure từ cụm `Kattis + QOJ + Gym + oj.uz` từ **9 lên 16** mà vẫn giữ weekly cap nguyên vẹn. Đây là mức “sửa ít nhưng tác động lớn”; nếu muốn ép CSES xuống hẳn 8-10 thì phải làm thêm một pass riêng cho W1-W4 micro-core.

## Learn-support plan

Tôi bỏ hẳn kiểu row chung `Learn support: read + implement core technique`. Correction pass mới dùng **33 rows / 82.0 giờ**, phần còn lại **67.0 giờ** từ 149 giờ cũ được chuyển thành `Debt buffer / recovery`. W4 và W5 cố ý không có Learn-support vì judged patch đã chạm sát cap; đây là lựa chọn có chủ đích, không phải bỏ sót. Tôi cũng **không dùng optional submit row** trong pass này để tránh hai lỗi mà correction note đã cấm: đụng trùng judged task hiện có, hoặc dính contest future benchmark. Vì vậy cột `Optional submit URL` đều để trống theo chủ đích.

| Week | Topic | Deliverable | Exact output | Hours | Reading URL | Optional submit URL |
|---|---|---|---|---:|---|---|
| W1 | Template hygiene | Type 3 - Template hardening | Compile-all smoke: fast I/O, custom hash, floordiv/ceildiv, DSU, Dijkstra under `-O2 -std=gnu++20`; patch compile failures immediately. | 0.5 | — | — |
| W2 | Fenwick + lazy segtree API | Type 3 - Template hardening | Run 30 randomized update/query tests for BIT-diff and lazy add/assign; keep one short note of invariant failures. | 0.5 | — | — |
| W3 | Subset DP sanity | Type 3 - Template hardening | Rebuild SOS/submask iteration snippets and verify against brute for `n ≤ 16` on 20 seeds. | 1.0 | — | — |
| W6 | Geometry integer primitives | Type 1 - Read + implement + self-test | Implement orientation, on-segment, line intersection, area2; stress with 10k random integer cases vs brute predicates. | 2.0 | `https://cp-algorithms.com/geometry/basic-geometry.html` | — |
| W6 | Segment intersection kernel | Type 3 - Template hardening | Add closed-segment intersection and collinear-overlap branch tests; save 12 edge cases in local snippet file. | 1.5 | `https://cp-algorithms.com/geometry/check-segments-intersection.html` | — |
| W7 | Dinic + min-cut extraction | Type 1 - Read + implement + self-test | Implement Dinic, residual-edge checker, reachable-side min-cut extraction; 20 random graph cross-checks vs brute maxflow for `n ≤ 8`. | 3.0 | `https://cp-algorithms.com/graph/dinic.html` | — |
| W7 | DSU rollback | Type 1 - Read + implement + self-test | Implement DSU rollback with stack snapshots; verify 100 random offline add/remove connectivity traces. | 2.5 | `https://cp-algorithms.com/data_structures/deleting_in_log_n.html` | — |
| W7 | Cut / bridge notebook | Type 3 - Template hardening | One-page note with `tin/low` invariants, bridge conditions, articulation conditions, plus 8 hand-made counterexamples. | 2.5 | `https://cp-algorithms.com/graph/bridge-searching.html` | — |
| W8 | Suffix automaton core | Type 1 - Read + implement + self-test | Implement SAM + occurrence propagation + `firstpos`; test on 50 random strings vs `O(n^2)` distinct-substring brute. | 3.0 | `https://cp-algorithms.com/string/suffix-automaton.html` | — |
| W8 | Aho-Corasick skeleton | Type 1 - Read + implement + self-test | Build AC automaton with exit links and match counts; verify on 30 random dictionary/query sets against brute. | 2.0 | `https://cp-algorithms.com/string/aho_corasick.html` | — |
| W8 | FFT / NTT harness | Type 3 - Template hardening | Implement iterative NTT + convolution wrapper; compare 25 random convolutions vs `O(n^2)` brute and store one verified template. | 4.0 | `https://cp-algorithms.com/algebra/fft.html` | — |
| W9 | Low-link decomposition | Type 1 - Read + implement + self-test | Implement bridges + articulation points + bridge-tree builder; validate on random sparse graphs with brute bridge removal. | 3.0 | `https://cp-algorithms.com/graph/bridge-searching.html` | — |
| W9 | 2-SAT package | Type 3 - Template hardening | Implement SCC-based 2-SAT template and test 50 random formulas vs brute for `n ≤ 18`. | 2.5 | `https://cp-algorithms.com/graph/2SAT.html` | — |
| W10 | Min-cost flow skeleton | Type 1 - Read + implement + self-test | Implement potentials + shortest augmenting path min-cost flow; verify on 20 random tiny bipartite instances vs brute assignment. | 3.5 | `https://cp-algorithms.com/graph/min_cost_flow.html` | — |
| W10 | Matching witness notebook | Type 3 - Template hardening | Write Hall-deficiency checklist and a 6-case note on when to switch Kuhn / Hopcroft-Karp / flow. | 3.0 | `https://cp-algorithms.com/graph/kuhn_maximum_bipartite_matching.html` | — |
| W11 | Rerooting DP | Type 1 - Read + implement + self-test | Implement generic rerooting skeleton (`down/up` arrays) and verify subtree-aggregate examples on 30 random trees. | 2.5 | — | — |
| W11 | HLD path toolkit | Type 3 - Template hardening | Rebuild HLD + segtree path-query wrapper; stress against `O(n)` path brute on 50 random trees. | 3.0 | `https://cp-algorithms.com/graph/hld.html` | — |
| W12 | Parallel binary search | Type 1 - Read + implement + self-test | Implement offline PBS skeleton with event application / rollback hooks and verify on 20 random monotone-query toy datasets. | 2.5 | — | — |
| W12 | Persistent segtree lite | Type 3 - Template hardening | Build point-update persistent segtree with `kth/order-stat` API; compare against sorted-vector brute on 30 random tests. | 2.5 | `https://cp-algorithms.com/data_structures/segment_tree.html` | — |
| W13 | Digit DP product states | Type 1 - Read + implement + self-test | Implement digit-DP template with `tight/started/state` compression; solve 3 toy variants and save transitions note. | 2.5 | — | — |
| W13 | Divide-and-conquer DP | Type 3 - Template hardening | Template D&C DP with opt-range assertions; validate on random quadrangle-inequality toy costs. | 3.0 | `https://cp-algorithms.com/dynamic_programming/divide-and-conquer-dp.html` | — |
| W14 | Virtual tree skeleton | Type 1 - Read + implement + self-test | Implement Euler tour order + virtual-tree builder from marked nodes; verify 50 random sets against naive LCA closure. | 3.0 | — | — |
| W14 | Centroid / distance toolkit | Type 3 - Template hardening | Rebuild centroid-decomposition scaffolding and one distance-update/query micro-template; test on 30 random trees. | 3.0 | — | — |
| W15 | Aho + fail-tree aggregation | Type 1 - Read + implement + self-test | Extend AC with fail-tree dfs aggregation and multi-pattern frequency accumulation; test vs brute on 20 random cases. | 3.0 | `https://cp-algorithms.com/string/aho_corasick.html` | — |
| W15 | Suffix array + LCP | Type 3 - Template hardening | Rebuild SA + Kasai + RMQ wrapper; compare substring-order answers against brute on 25 random strings. | 2.5 | `https://cp-algorithms.com/string/suffix-array.html` | — |
| W16 | NTT extras | Type 1 - Read + implement + self-test | Add inverse NTT, polynomial inverse placeholder, and modulus wrapper note; verify 15 extra random coefficient tests. | 3.0 | `https://cp-algorithms.com/algebra/fft.html` | — |
| W16 | XOR basis with witness | Type 3 - Template hardening | Implement xor-basis insertion, max/min xor and witness reconstruction; stress on 40 random arrays against brute. | 2.5 | — | — |
| W17 | Angle-sort pack | Type 1 - Read + implement + self-test | Rebuild polar-angle comparator, half-plane split, rotating-pointer helper; confirm on 15 hand-made degeneracy cases. | 2.0 | `https://cp-algorithms.com/geometry/basic-geometry.html` | — |
| W17 | Geometry regression rerun | Type 3 - Template hardening | Re-run all earlier geometry primitives under sanitizers and save the final “do not touch before taper” version. | 1.5 | — | — |
| W18 | Sprague-Grundy notebook | Type 1 - Read + implement + self-test | Implement SG on DAG + mex cache; verify on 20 random DAG games against brute game-state recursion. | 2.5 | `https://cp-algorithms.com/game_theory/sprague-grundy-nim.html` | — |
| W18 | Meet-in-the-middle pack | Type 3 - Template hardening | Build split-enumerate / prune / dedupe helpers and benchmark on 3 toy tasks; record cutoff heuristics. | 3.0 | — | — |
| W19 | Template freeze | Type 3 - Template hardening | Compile the final contest bundle: graph, DS, tree, string, geometry, math, game; zero compile warnings allowed. | 2.5 | — | — |
| W19 | First-compile timing drill | Type 3 - Template hardening | Time three re-codes from blank file: Dinic, HLD, AC automaton; log outline time, first compile, final pass. | 3.0 | — | — |

Tổng Learn-support mới: **33 rows / 82.0 giờ**. Chênh lệch so với 149 giờ cũ là **67.0 giờ**, và phần đó được chuyển thành `Debt buffer / recovery` ở bảng tuần bên dưới.

## Weekly reconciliation

Bảng dưới đây là output quan trọng nhất của correction pass. Tôi đã áp replacement + Learn-support mới + Review/Sprint/Contest/Upsolve hiện có vào từng tuần, rồi cân lại đúng cap. Không tuần nào vượt trần. Các tuần thấp-judge hơn cap không phải “thiếu việc”; phần dư được ghi thẳng vào `Debt buffer / recovery` để xử lý upsolve debt, actual overrun, hoặc mệt đột xuất.

| Week | Judge hours | Learn-support | Review | Sprint | Contest | Upsolve | Debt buffer / recovery | Total | Cap | Pass? |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---|
| W1 | 26.5 | 0.5 | 4.0 | 4.0 | 5.0 | 5.0 | 0.0 | 45.0 | 45 | Yes |
| W2 | 26.5 | 0.5 | 4.0 | 4.0 | 5.0 | 5.0 | 0.0 | 45.0 | 45 | Yes |
| W3 | 26.0 | 1.0 | 4.0 | 4.0 | 5.0 | 5.0 | 0.0 | 45.0 | 45 | Yes |
| W4 | 27.0 | 0.0 | 4.0 | 4.0 | 5.0 | 5.0 | 0.0 | 45.0 | 45 | Yes |
| W5 | 27.0 | 0.0 | 4.0 | 4.0 | 5.0 | 5.0 | 0.0 | 45.0 | 45 | Yes |
| W6 | 23.0 | 3.5 | 4.0 | 4.0 | 5.0 | 5.0 | 0.5 | 45.0 | 45 | Yes |
| W7 | 15.0 | 8.0 | 4.0 | 4.0 | 5.0 | 5.0 | 4.0 | 45.0 | 45 | Yes |
| W8 | 12.5 | 9.0 | 4.0 | 4.0 | 5.0 | 5.0 | 5.5 | 45.0 | 45 | Yes |
| W9 | 9.5 | 5.5 | 4.0 | 4.0 | 5.0 | 5.0 | 2.0 | 35.0 | 35 | Yes |
| W10 | 5.5 | 6.5 | 4.0 | 4.0 | 5.0 | 5.0 | 5.0 | 35.0 | 35 | Yes |
| W11 | 5.5 | 5.5 | 4.0 | 4.0 | 5.0 | 5.0 | 6.0 | 35.0 | 35 | Yes |
| W12 | 7.0 | 5.0 | 4.0 | 4.0 | 5.0 | 5.0 | 5.0 | 35.0 | 35 | Yes |
| W13 | 7.0 | 5.5 | 4.0 | 4.0 | 5.0 | 5.0 | 4.5 | 35.0 | 35 | Yes |
| W14 | 6.0 | 6.0 | 4.0 | 4.0 | 5.0 | 5.0 | 5.0 | 35.0 | 35 | Yes |
| W15 | 7.0 | 5.5 | 4.0 | 4.0 | 5.0 | 5.0 | 4.5 | 35.0 | 35 | Yes |
| W16 | 5.0 | 5.5 | 4.0 | 4.0 | 5.0 | 5.0 | 6.5 | 35.0 | 35 | Yes |
| W17 | 11.0 | 3.5 | 4.0 | 4.0 | 5.0 | 5.0 | 2.5 | 35.0 | 35 | Yes |
| W18 | 5.0 | 5.5 | 4.0 | 4.0 | 5.0 | 5.0 | 6.5 | 35.0 | 35 | Yes |
| W19 | 5.5 | 5.5 | 4.0 | 4.0 | 5.0 | 5.0 | 6.0 | 35.0 | 35 | Yes |
| W20 | 0.0 | 0.0 | 18.0 | 4.0 | 0.0 | 0.0 | 0.0 | 22.0 | 22 | Yes |
| W21 | 0.0 | 0.0 | 6.0 | 4.0 | 0.0 | 0.0 | 0.0 | 10.0 | 10 | Yes |

Đọc đúng theo bảng này thì kết luận về workload là: **45h/tuần chỉ còn hợp lý khi W6-W19 thật sự coi phần buffer là buffer**, không phải “invisible backlog”. Workbook cũ biểu diễn 149h generic Learn-support làm cho lịch nhìn như đủ chặt nhưng thực ra che mất room cần thiết cho debt / overrun; correction pass này bóc phần đó ra, nên số học mới sạch.

## Contest benchmark verification

Dashboard UCup/QOJ của bốn contest đều có `Virtual Contest` và tutorial attachment chính thức. Tutorials cũng cho thấy ladder độ khó đủ rộng để dùng làm virtual 5 giờ trước Regional: Chengdu ghi rõ `Easy: G,J` lên tới `Hard: E,F`; Nanjing có thứ tự kỳ vọng `C < K < FGIM < BEHJ < AL < D`; Shenyang chia rõ easy / medium-easy / medium / medium-hard / hard; Shanghai cho thứ tự kỳ vọng `D < GH < BIJ < AE < KLM < CF`. Tôi cũng kiểm tra text của tutorial PDF và **không thấy từ khóa interactive/交互** trong bốn set 2025 này; vì vậy rủi ro interactive/output-only được coi là thấp theo kiểm tra văn bản, dù không phải chứng minh tuyệt đối bằng tay từng statement. citeturn3view0turn4view0turn3view1turn4view1turn3view2turn4view2turn5view0turn24view0turn24view1turn24view2turn24view3turn24view4turn24view5turn24view6turn24view7

| Week | Contest | Contest URL | Tutorial URL | Submit available? | Overlap with W1-W15 | Interactive/output-only risk | Clean benchmark? |
|---|---|---|---|---|---|---|---|
| W16 | Chengdu Regional 2025 | `https://contest.ucup.ac/contest/2567` | `https://contest.ucup.ac/download.php?id=2567&r=1&type=attachments` | Yes | None | No obvious interactive/output-only in tutorial text | Yes |
| W17 | Nanjing Regional 2025 | `https://contest.ucup.ac/contest/2581` | `https://contest.ucup.ac/download.php?id=2581&r=2&type=attachments` | Yes | None **after replacing** `Many Convex Polygons`, `Cyan White Tree` | No obvious interactive/output-only in tutorial text | Yes |
| W18 | Shenyang Regional 2025 | `https://contest.ucup.ac/contest/2641` | `https://contest.ucup.ac/download.php?id=2641&r=2&type=attachments` | Yes | None **after replacing** `Square Kingdom` | No obvious interactive/output-only in tutorial text | Yes |
| W19 | Shanghai Regional 2025 | `https://contest.ucup.ac/contest/2908` | `https://contest.ucup.ac/download.php?id=2908&r=1&type=attachments` | Yes | None | No obvious interactive/output-only in tutorial text | Yes |

Kết luận của phần contest này là rõ: **W16-W19 nên đổi sang Chengdu / Nanjing / Shenyang / Shanghai 2025**. Đây là thay đổi nhỏ nhưng rất đáng giá, vì nó biến bốn tuần cuối build từ replay bẩn thành benchmark sạch thật sự. citeturn2view0turn2view1turn2view2turn2view3turn3view0turn3view1turn3view2turn5view0

## Protocol final

### Review and Sprint notes

```text
Target: <task/template> | Outline: __ min | First compile: __ min | AC/final: __ min | WA/RE: __ | Bug class: __ | Stress: Y/N
```

### Adaptive deload

- Trigger nếu **một** trong bốn điều kiện xảy ra: actual hours tuần > planned hours + 3h; upsolve debt > 5h; một Hard mới overrun > 2h so với estimate; hoặc fatigue/bận đột xuất làm mất ít nhất 2 session.
- Khi trigger: **giữ nguyên contest**, **giữ high-transfer upsolve**, **giữ tối thiểu 1 Review + 1 Sprint**.
- Cắt theo thứ tự:  
  `Learn-support mới -> một Hard mới -> các row buffer khác`
- Không cắt upsolve quan trọng chỉ để ép total hours đẹp trên sheet.

### Upsolve debt

- Nếu còn **1 bài high-transfer** chưa model/AC: lấy giờ trực tiếp từ Learn-support tuần kế.  
- Nếu còn **từ 2 bài high-transfer** chưa model/AC: **freeze Hard mới 1 tuần**.  
- Nếu debt > **5h**: giảm ít nhất **1 judged task mới** ở tuần kế tiếp, hoặc dời một replacement muộn hơn, chứ không dồn debt xuống taper.

Ba protocol này không cần thêm cột mới; chỉ cần generator ghi mẫu text ngắn vào `Weekly Brief` và row `Notes`.

## Patch checklist

1. Trong task bank / generator, thay đúng **10 judged rows** theo replacement table ở trên; giữ nguyên các row Keep.
2. Với các task có `Action = Move from post-Regional Wxx`, **xóa slot cũ sau Regional** ở các tuần: **W22, W23, W26, W29, W30, W33, W35, W39, W40** để tránh duplicate exact task name.
3. Đổi contest W16-W19 thành đúng bốn set: **Chengdu 2025, Nanjing 2025, Shenyang 2025, Shanghai 2025**.
4. Xóa toàn bộ generic row `Learn support: read + implement core technique` trong W1-W19, thay bằng **33 rows / 82.0h** đúng như bảng Learn-support plan.
5. Ghi phần chênh **67.0h** từ Learn-support cũ sang `Debt buffer / recovery`, không lấp lại bằng task mới.
6. Chèn protocol `Review/Sprint notes`, `Adaptive deload`, `Upsolve debt` vào `Weekly Brief` / `Notes` theo đúng format ngắn ở mục trên.
7. Regenerate workbook; sau đó verify lại bốn điều:  
   `67 judged rows pre-Regional`, `0 duplicate exact task name`, `W1-W8 <= 45h`, `W9-W19 <= 35h`, `W20 = 22h`, `W21 = 10h`.
8. Spot-check cuối cùng sau regenerate:  
   không còn `Many Convex Polygons`, `Cyan White Tree`, `Square Kingdom` trước khi virtual set tương ứng diễn ra; và không còn generic Learn-support placeholder ở W1-W19.