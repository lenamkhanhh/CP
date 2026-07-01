# Template Manifest

Template chỉ được đánh dấu `ready` khi đã AC hoặc qua stress test.

| Module | Owner | Status | Last test |
|---|---|---|---|
| Core/debug/random generator |  | missing |  |
| Fenwick + order statistic |  | missing |  |
| Lazy segment tree |  | missing |  |
| DSU + rollback DSU |  | missing |  |
| SCC/bridge/articulation |  | missing |  |
| Dijkstra/0-1 BFS |  | missing |  |
| Dinic + min-cut extraction |  | missing |  |
| LCA/HLD |  | missing |  |
| KMP/Z/hash/Aho |  | missing |  |
| Suffix array |  | missing |  |
| Geometry integer primitives |  | missing |  |
| FFT/NTT |  | missing |  |

## Quality gate

- Có test rỗng/nhỏ nhất và test cực trị.
- Không phụ thuộc global state chưa reset.
- Biết rõ indexing, overflow và memory bound.
- Có một bài submit làm bằng template đó.
- Với DS phức tạp, có brute generator để stress.

