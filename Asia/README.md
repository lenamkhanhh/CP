# Asia / APAC Prep

Folder nay la mot pipeline duy nhat cho giai doan Asia Regional hard -> APAC.

Day la coverage index, khong phai thu tu bat buoc phai quet het 15 folder. Lich va benchmark chinh nam o [`../README.md`](../README.md).

No da duoc gop lai theo 15 chu de trong roadmap. Moi folder co:

- `Reading`: blog/wiki de doc lai truoc khi lam.
- `Tasks`: bai submit duoc tren VNOI/OJ.uz/CSES/AtCoder/CF/SPOJ.
- Mot so topic co `APAC extra tasks`: bai dai hon, dung de luyen pipeline doc de -> model -> prove -> code -> debug.

## Official APAC sets

Cac link nay de doc problemset/analysis chinh thuc. Mot so bo khong co online judge submit public, nen dung de virtual/doc editorial.

- [APAC 2026 resources](https://apac.icpc.global/championship/2026/resources/)
- [APAC 2026 problemset](https://apac.icpc.global/assets/championship/2026/problemset.pdf)
- [APAC 2026 analysis](https://apac.icpc.global/assets/championship/2026/problemset-analysis.pdf)
- [APAC 2025 problemset](https://fileserv.icpc.jp/championship2025/problemset.pdf)
- [APAC 2025 analysis](https://fileserv.icpc.jp/championship2025/problem-analysis.pdf)
- [APAC 2024 problemset](https://fileserv.icpc.jp/championship2024/tasks.pdf)
- [APAC 2024 analysis](https://fileserv.icpc.jp/championship2024/analysis.pdf)

## Topic order

1. [Implementation, greedy, binary search](01_implementation_greedy_binary_search/README.md)
2. [Graph basics](02_graph_basics/README.md)
3. [Fenwick, segment tree, DSU](03_fenwick_segmenttree_dsu/README.md)
4. [DP core](04_dp_core/README.md)
5. [Math core](05_math_core/README.md)
6. [Tree advanced](06_tree_advanced/README.md)
7. [Strings](07_strings/README.md)
8. [Geometry](08_geometry/README.md)
9. [Flow, matching, min-cut](09_flow_matching_mincut/README.md)
10. [Advanced data structures](10_advanced_data_structures/README.md)
11. [Offline and sqrt](11_offline_sqrt/README.md)
12. [FFT, NTT, bitset](12_fft_ntt_bitset/README.md)
13. [Linear algebra](13_linear_algebra/README.md)
14. [Game, constructive, proof](14_game_constructive_proof/README.md)
15. [Interactive and communication](15_interactive_communication/README.md)

## Priority theo thoi diem

### Truoc Asia Regional

- Bat buoc: 01, 02, 03, 04, 06, 09, 14.
- Hoc theo lo hong: 05, 07, 08, 10, 11.
- Chi hoc neu contest/problem bank chi ra nhu cau: 12, 13, 15.

### Sau Regional, truoc APAC

- Day 12 (FFT/NTT/bitset) va 13 (linear algebra) len uu tien cao.
- 15 (interactive/communication) hoc theo official APAC sets.
- Dung official scoreboard de phan biet bai likely-scoring va bai one-team; khong danh nhieu tuan vao bai cuc han.

## Mixed practice

Dung folder nay khi muon luyen contest tong hop hoac bai dai co nhieu ky thuat cung luc:

- [Mixed contests and hard tasks](99_mixed_contests_hard_tasks/README.md)

## How to train

For each task:

1. Spend 20-40 minutes only modeling and proving.
2. Write expected complexity before coding.
3. Code only after the invariant/state is clear.
4. If stuck, write a note in `upsolve/` before reading editorial.

Moi topic chi duoc xem la xong khi co 2 core AC, 1 mixed AC va 1 lan retry khong nhin loi giai.

Upsolve note format:

```text
Problem:
Link:
Topic:
Failed because:
Correct model:
Key invariant:
Implementation traps:
Retry date:
```
