# Template manifest

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

## Implementation choice checklist

Mỗi template quan trọng cần trả lời ngắn các câu này trước khi đưa vào notebook:

- Có mấy cách cài?
- Cách nào nhanh nhất trong contest?
- Cách nào ít bug nhất?
- Khi nào dùng template nặng, khi nào dùng bản đơn giản?
- Bug thường gặp là gì?

Format gợi ý:

```text
Module:
Variants:
Contest-fast version:
Safest version:
Use heavy version when:
Use simple version when:
Bug traps:
Stress/check:
```

