# Regional Prep

Muc tieu: on toi ICPC Asia Regional truoc, sau do moi day tiep len APAC. Regional can vua lay diem nhanh o bai vua, vua co kha nang pha 2-4 bai tach top.

Lich dieu phoi va benchmark hien tai nam o [`../README.md`](../README.md). Folder nay la problem bank va noi luu notes/templates/virtuals, khong phai checklist bat buoc phai lam het.

## Moc 2026

- Mien Nam: 17-18/10/2026.
- National: 08-09/11/2026.
- Asia Regional Da Nang: 10-11/12/2026.

Tu 13/06/2026 con 18 tuan toi Mien Nam va gan 26 tuan toi Regional. Vi vay:

- truoc Mien Nam, uu tien toc do va P0;
- sau Mien Nam, dung khoang 3 tuan day National;
- sau National, moi day manh P1/P2 cho Regional.

## Thu tu uu tien

### 1. Implementation, greedy va search

- Sorting, prefix/suffix, two pointers, sliding window.
- Greedy exchange argument, binary search answer.
- Meet-in-the-middle, simulation, local contribution.
- Stress test, overflow, indexing va reset nhieu test.

Day la tang lay diem. Phai on truoc khi lao vao graph/DS kho.

### 2. Graph va modeling

- SCC, bridge/articulation, biconnected components.
- MST/Kruskal/DSU, shortest path variants: Dijkstra, 0-1 BFS, multi-source, state graph.
- Flow/matching: Dinic, bipartite matching, min-cut modeling.
- Dynamic/offline graph: DSU rollback, divide-and-conquer over time.

Day la nhom quan trong nhat vi Regional rat hay giau bai sau mot mo hinh graph.

### 3. Data structures

- Fenwick, segment tree lazy phai code rat chac.
- Persistent segment tree, merge sort tree, Li Chao tree.
- Segment tree beats muc co ban.
- Sparse table, monotonic stack/queue, ordered set.

Regional hay khong dung template thuan, ma bat minh bien doi bai ve query/update dung cau truc.

### 4. Tree

- DFS order, subtree query, LCA, binary lifting.
- Tree DP, rerooting DP.
- Heavy-light decomposition.
- DSU on tree, virtual tree.

Tree + data structure la combo phai co truoc khi vao de Regional cu.

### 5. DP nang

- Interval DP, tree DP, bitmask DP, digit DP.
- DP on DAG/state graph.
- Divide-and-conquer optimization, convex hull trick co ban.
- Profile DP neu gap grid/trang thai nho.

Can tap trung vao cach rut trang thai va toi uu transition, khong chi hoc cong thuc.

### 6. Math va combinatorics

- Modular arithmetic, inverse, combinatorics precompute.
- Sieve, factorization, gcd/lcm, CRT co ban.
- Inclusion-exclusion, counting by complement.
- Linear basis XOR, Gaussian elimination mod 2/mod p.
- NTT/FFT co ban cho convolution.

Regional thuong co it nhat 1 bai math/counting tach top.

### 7. Strings

- KMP, Z-function, rolling hash double.
- Trie, Aho-Corasick.
- Suffix array, suffix automaton.

Khong can hoc tat ca qua sau ngay dau, nhung suffix array/automaton nen co template va biet khi nao dung.

### 8. Geometry

- Point/vector, orientation, cross/dot.
- Segment intersection, polygon area, point in polygon.
- Convex hull, rotating calipers.
- Sweep line co ban.

Geometry o Regional khong xuat hien moi contest, nhung khi xuat hien thuong la bai rat dang diem neu team co nguoi chac.

### 9. Proof, constructive, game

- Greedy exchange argument.
- Invariant/parity.
- Sprague-Grundy co ban, minimax tren tree/DAG.
- Constructive voi dieu kien can-du.

Day la nhom khong co template thay the. Moi tuan nen co it nhat 1-2 bai proof-heavy.

## Lich luyen de cu

1. Vietnam Regional 2021
2. Vietnam Regional 2022
3. Vietnam Regional 2023
4. Vietnam Regional 2024
5. Vietnam Regional 2025

Moi bo de:

- Lan 1: virtual 5 gio, khong doc editorial.
- Lan 2: upsolve trong 3-5 ngay.
- Lan 3: ghi lai moi bai fail vao `upsolve/` theo format: `idea`, `missing topic`, `bug`, `template needed`.

## Khong hoc theo kieu quet het folder

Thu tu dung:

1. Chay virtual de tim lo hong.
2. Chon topic tuong ung.
3. Lam 1-2 bai foundation neu template yeu.
4. Lam 2 bai Regional core va 1 pipeline task.
5. Quay lai contest/retry.

Neu da vuot gate cua topic thi bo qua bai classic trung lap, chuyen sang mixed contest.

## Cac folder

- [`Tasks/`](Tasks/README.md): task bank A/B/C + Regional/stretch pipeline theo tung topic.
- `notes/`: ghi chu ly thuyet va insight.
- `templates/`: code C++ da test.
- `virtuals/`: log virtual contest, scoreboard, phan cong team.
- `upsolve/`: loi giai va bai da fail can code lai.
