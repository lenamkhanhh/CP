# Upsolve queue

Mỗi bài fail hoặc bài AC nhưng chưa thật sự hiểu phải có một entry ngắn.

```text
Problem:
Link:
Contest date:
Failure type: read / model / proof / complexity / code / debug / strategy
Wrong approach:
Correct invariant/model:
Implementation traps:
First AC date:
Retry +7 days:
Retry +21 days:
```

## Upsolve reflection checklist

Đây là checklist phải nhìn khi upsolve bài hard, bài contest fail, hoặc bài AC nhưng có nhiều WA/debug.

### Modeling / thinking

- Mình thiếu observation gì?
- Có model nào đáng nhớ?
- Dấu hiệu nhận biết pattern này là gì?
- Tại sao hướng sai ban đầu sai?
- Nếu gặp trong contest, khi nào nên bỏ hoặc đổi hướng?

### Implementation / execution

- Có mấy cách cài?
- Cách nào nhanh nhất trong contest?
- Cách nào ít bug nhất?
- Khi nào dùng template nặng, khi nào dùng bản đơn giản?
- Bug thường gặp là gì?

## Short note format

Khi không muốn viết dài, dùng format này:

```text
Observation missed:
Reusable model:
Pattern trigger:
Wrong path:
Contest switch point:
Implementation choices:
Fastest safe implementation:
Bug traps:
Retry target:
```

## Priority

1. Bài có hướng nhưng code sai: AC trong 24 giờ.
2. Bài medium thiếu insight: AC trong 72 giờ.
3. Bài thiếu kỹ thuật: học primitive, làm một bài foundation, rồi quay lại.
4. Bài stretch: ghi key transformation; không để nó chiếm cả tuần nếu không nằm trên critical path.

## Debt rule

```text
0-1 high-transfer miss and debt<=2h: keep normal 5h upsolve.
1 high-transfer miss or debt 2-5h: borrow from Learn-support first.
>=2 high-transfer misses or debt>5h: freeze one new Hard next week.
Debt>5h for 2 consecutive weeks: cut Learn-support/judged add; keep contest + key upsolve + 1 Review + 1 Sprint.
```

