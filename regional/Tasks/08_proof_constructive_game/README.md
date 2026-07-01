# 08 - Proof, Constructive, Game

Muc tieu: luyen invariant, parity, exchange argument va game states. Nhom nay khong co template thay the.

## Coverage

- Greedy exchange argument, necessary/sufficient condition.
- Invariant/parity, constructive output, brute-small-to-proof.
- Win/lose DP, Nim/SG; game theory chi la mot nhanh cua folder.

## Recommended order

1. Greedy proof va constructive `A`.
2. Invariant + basic game `B`.
3. Regional scoring pipeline.
4. SG/tree game/hard constructive va Group Raiding o cuoi.

## Coverage gate

- [ ] Viet duoc exchange argument cho hai bai greedy.
- [ ] Voi constructive, liet ke dieu kien can va du truoc khi code.
- [ ] Dung brute nho de tim/pha invariant, sau do moi proof.
- [ ] Biet Nim va SG co ban; khong danh qua nhieu thoi gian vao game hiem.

## Reading

- [VNOI Wiki - Nghệ thuật giải bài](https://wiki.vnoi.info/translate/topcoder/How-to-Find-a-Solution)
- [VNOI Wiki - Những cách tiếp cận bài toán](https://wiki.vnoi.info/translate/topcoder/Planning-an-Approach-to-a-Topcoder-Problem-Part-1)
- [VNOI Wiki - Tham lam](https://wiki.vnoi.info/algo/greedy-new)
- [VNOI Wiki - Trò chơi Nim & Sprague-Grundy](https://wiki.vnoi.info/algo/math/game-theory.md)
- [VNOI Wiki - Kỹ thuật sinh test và tự kiểm tra code](https://wiki.vnoi.info/algo/skill/sinh-test-new)
- [USACO Guide - Game Theory](https://usaco.guide/adv/game-theory)
- [Codeforces - Tips on Constructive Algorithms](https://codeforces.com/blog/entry/80317)
- [VNOI Magazine - ICPC Regional Vietnam 2025 commentary](https://oj.vnoi.info/post/1325-vnoi-magazine-2025-cmt-1/modern)

## A - Foundation

- [ ] **Permutations**  
  Submit: [CSES 1070](https://cses.fi/problemset/task/1070)  
  Key: Constructive parity.  
  Why: Nho nhung tap dieu kien can-du.

- [ ] **Gray Code**  
  Submit: [CSES 2205](https://cses.fi/problemset/task/2205)  
  Key: Constructive recursion / bit trick.  
  Why: Construction co proof gon.

- [ ] **Tasks and Deadlines**  
  Submit: [CSES 1630](https://cses.fi/problemset/task/1630)  
  Key: greedy exchange argument.  
  Why: Bat buoc proof sorting order, dung hon Josephus/Hanoi cho muc tieu Regional.

- [ ] **Stick Divisions**  
  Submit: [CSES 1161](https://cses.fi/problemset/task/1161)  
  Key: Huffman-style greedy + exchange proof.  
  Why: Greedy structure va proof co the transfer.

## B - Regional core

- [ ] **Stick Game**  
  Submit: [CSES 1729](https://cses.fi/problemset/task/1729)  
  Key: Impartial DP game.  
  Why: Baseline winning/losing states.

- [ ] **Nim Game I**  
  Submit: [CSES 1730](https://cses.fi/problemset/task/1730)  
  Key: XOR invariant.  
  Why: Bat buoc biet.

- [ ] **Nim Game II**  
  Submit: [CSES 1098](https://cses.fi/problemset/task/1098)  
  Key: Sprague-Grundy variant.  
  Why: Kiem tra xem xor reasoning co transfer khong.

- [ ] **Stair Game**  
  Submit: [CSES 1099](https://cses.fi/problemset/task/1099)  
  Key: Game invariant / xor on odd piles.  
  Why: State compression khong hien nhien.

- [ ] **Grundy's Game**  
  Submit: [CSES 2207](https://cses.fi/problemset/task/2207)  
  Key: SG values.  
  Why: Classic Grundy precompute.

- [ ] **Number Game**  
  Submit: [Codeforces 1370C](https://codeforces.com/problemset/problem/1370/C)  
  Key: number-theory case proof, necessary/sufficient conditions.  
  Why: Code ngan nhung proof khong tu dong.

- [ ] **ICPC 2025 Regional - Divisibility Grid**  
  Submit: [VNOI icpc25_regional_d](https://oj.vnoi.info/problem/icpc25_regional_d)  
  Key: constructive pattern + optimality proof.  
  Why: Chi AC mot lan; day la bai scoring owner chung voi topic 00.

## C - Advanced core

- [ ] **Game On Leaves**  
  Submit: [Codeforces 1363C](https://codeforces.com/problemset/problem/1363/C)  
  Key: Game on tree, degree/parity.  
  Why: Regional-style proof, code rat ngan.

- [ ] **Tokitsukaze, CSL and Stone Game**  
  Submit: [Codeforces 1191D](https://codeforces.com/problemset/problem/1191/D)  
  Key: Invariant + parity + invalid states.  
  Why: Case analysis sac.

- [ ] **Prefix Flip Hard Version**  
  Submit: [Codeforces 1382C2](https://codeforces.com/problemset/problem/1382/C2)  
  Key: Constructive transformation.  
  Why: Output construction voi invariant.

## D - Regional pipeline

- [ ] **ICPC 2024 Regional - FizzBuzz**  
  Submit: [VNOI icpc24_regional_f](https://oj.vnoi.info/problem/icpc24_regional_f)  
  Focus: constructive/ad-hoc reasoning.  
  Pipeline: pin down necessary and sufficient conditions.

- [ ] **ICPC 2023 Regional - Divisive Stone Battle**  
  Submit: [VNOI icpc23_regional_d](https://oj.vnoi.info/problem/icpc23_regional_d)  
  Focus: game/stone process.  
  Pipeline: state reduction and win/lose proof.

- [ ] **ICPC 2024 Regional - Easy Game**  
  Submit: [VNOI icpc24_regional_e](https://oj.vnoi.info/problem/icpc24_regional_e)  
  Focus: game/ad-hoc proof.  
  Pipeline: small cases first, then invariant.

## E - Stretch/OI pipeline

- [ ] **ICPC 2025 Regional - Group Raiding**  
  Submit: [VNOI icpc25_regional_g](https://oj.vnoi.info/problem/icpc25_regional_g)  
  Focus: number theory + game.  
  Pipeline: generate small cases, hypothesize invariant, prove.

- [ ] **Kangaroo**  
  Submit: [OJ.uz CEOI16_kangaroo](https://oj.uz/problem/view/CEOI16_kangaroo)  
  Focus: constructive/DP reasoning.  
  Pipeline: model movement constraints and prove transition.

<!-- AUTO: aggressive Gym/OJ/QOJ-heavy supplement -->

## E - Gym/OJ.uz/QOJ/Kattis supplement

Cac bai nay thay the phan CSES du thua trong timeline. Generator se cap CSES o muc primitive va uu tien block nay cho lead-level training.

- [ ] **UCup Nanjing 2025 L - Regional Champion**  
  Submit: [UCup 2581L](https://contest.ucup.ac/contest/2581/problem/14812?v=1)  
  Source: QOJ / Universal Cup  
  Contest/source: 2025 ICPC Asia Nanjing Regional  
  Editorial: [Contest tutorials](https://contest.ucup.ac/contest/2581?v=1)  
  Key: proof-heavy constructive / ranking invariant.  
  Thinking: 5  
  Implementation: 4  
  Hours: 7  
  Why: Very relevant to Asia Regional high-end constructive thinking.

- [ ] **UCup Nanjing 2025 B - What, More Kangaroos?**  
  Submit: [UCup 2581B](https://contest.ucup.ac/contest/2581/problem/14802?v=1)  
  Source: QOJ / Universal Cup  
  Contest/source: 2025 ICPC Asia Nanjing Regional  
  Editorial: [Contest tutorials](https://contest.ucup.ac/contest/2581?v=1)  
  Key: constructive movement / invariant.  
  Thinking: 5  
  Implementation: 5  
  Hours: 7  
  Why: Nanjing-style constructive with nontrivial proof and implementation.

- [ ] **UCup Hong Kong 2025 J - Re: Becoming the Programming Champion**  
  Submit: [UCup 3169J](https://contest.ucup.ac/contest/3169/problem/15441?v=1)  
  Source: QOJ / Universal Cup  
  Contest/source: 2025 ICPC Asia Hong Kong Regional  
  Editorial: [Contest tutorials](https://contest.ucup.ac/contest/3169?v=1)  
  Key: constructive / contest meta invariant.  
  Thinking: 5  
  Implementation: 4  
  Hours: 6  
  Why: Proof-heavy problem from an Asia Regional set; good for lead intuition.

- [ ] **UCup Shenyang 2025 M - The End?**  
  Submit: [UCup 2641M](https://contest.ucup.ac/contest/2641/problem/14952?v=1)  
  Source: QOJ / Universal Cup  
  Contest/source: 2025 ICPC Asia Shenyang Regional  
  Editorial: [Contest tutorials](https://contest.ucup.ac/contest/2641?v=1)  
  Key: hard constructive / invariant.  
  Thinking: 5  
  Implementation: 5  
  Hours: 7  
  Why: Late-letter Regional problem for stretch after core gates.

- [ ] **CF Gym 105484M - Ordainer of Inexorable Judgment**  
  Submit: [Gym 105484M](https://codeforces.com/gym/105484/problem/M)  
  Source: Codeforces Gym  
  Contest/source: The 2024 ICPC Asia Nanjing Regional Contest  
  Editorial: [VJudge mirror metadata](https://vjudge.net/contest/671351)  
  Key: proof-heavy constructive / adversarial logic.  
  Thinking: 5  
  Implementation: 5  
  Hours: 7  
  Why: Nanjing last-letter task: exactly the kind of pressure problem a lead should sample.

- [ ] **CF Gym 105484B - Birthday Gift**  
  Submit: [Gym 105484B](https://codeforces.com/gym/105484/problem/B)  
  Source: Codeforces Gym  
  Contest/source: The 2024 ICPC Asia Nanjing Regional Contest  
  Editorial: [VJudge mirror metadata](https://vjudge.net/contest/671351)  
  Key: constructive / greedy proof.  
  Thinking: 4  
  Implementation: 4  
  Hours: 5  
  Why: Shorter Nanjing constructive to train proof-to-code conversion.

- [ ] **CF Gym 105484C - Topology**  
  Submit: [Gym 105484C](https://codeforces.com/gym/105484/problem/C)  
  Source: Codeforces Gym  
  Contest/source: The 2024 ICPC Asia Nanjing Regional Contest  
  Editorial: [VJudge mirror metadata](https://vjudge.net/contest/671351)  
  Key: topological/constructive reasoning.  
  Thinking: 5  
  Implementation: 4  
  Hours: 6  
  Why: Good cross-over between graph proof and constructive output.

- [ ] **Kattis WF 2023 - Tilting Tiles**  
  Submit: [Kattis tiltingtiles](https://open.kattis.com/problems/tiltingtiles)  
  Source: Kattis ICPC  
  Contest/source: ICPC World Finals 2023  
  Editorial: [Kattis WF 2023 source](https://open.kattis.com/problem-sources/ICPC%20World%20Finals%202023)  
  Key: puzzle constructive / invariant.  
  Thinking: 5  
  Implementation: 5  
  Hours: 7  
  Why: Hard WF constructive game-like task, useful for APAC stretch.

- [ ] **Kattis WF 2024 - Kindergarten**  
  Submit: [Kattis kindergarten2](https://open.kattis.com/problems/kindergarten2)  
  Source: Kattis ICPC  
  Contest/source: ICPC World Finals 2024  
  Editorial: [Kattis WF 2024 source](https://open.kattis.com/problem-sources/ICPC%20World%20Finals%202024)  
  Key: constructive arrangement / proof.  
  Thinking: 5  
  Implementation: 4  
  Hours: 7  
  Why: WF hard constructive problem with strong proof burden.

- [ ] **APIO 2022 - Game**  
  Submit: [OJ.uz APIO22_game](https://oj.uz/problem/view/APIO22_game)  
  Source: OI / oj.uz  
  Contest/source: APIO 2022  
  Editorial: [APIO source](https://oj.uz/problems/source/apio2022)  
  Key: game/interactive-style invariant.  
  Thinking: 5  
  Implementation: 5  
  Hours: 7  
  Why: APIO game problem for advanced proof and strategy design.

<!-- AUTO: second UCup 2025 supplement -->

## E - UCup 2025 Asia supplement

Them de Asia Regional/EC-Final moi de tang ty trong QOJ/Universal Cup trong timeline.

- [ ] **UCup Chengdu 2025 C - Crossing River**  
  Submit: [UCup 2567C](https://contest.ucup.ac/contest/2567/problem/14708?v=1)  
  Source: QOJ / Universal Cup  
  Contest/source: 2025 ICPC Asia Chengdu Regional  
  Editorial: [Contest tutorials](https://contest.ucup.ac/contest/2567?v=1)  
  Key: constructive scheduling / invariant.  
  Thinking: 5  
  Implementation: 4  
  Hours: 6  
  Why: Classic-sounding but Regional-hard constructive planning problem.

- [ ] **UCup Shanghai 2025 K - Yet another mailbox problem**  
  Submit: [UCup 2908K](https://contest.ucup.ac/contest/2908/problem/15323?v=1)  
  Source: QOJ / Universal Cup  
  Contest/source: 2025 ICPC Asia Shanghai Regional  
  Editorial: [Contest tutorials](https://contest.ucup.ac/contest/2908?v=1)  
  Key: constructive / adversarial invariant.  
  Thinking: 5  
  Implementation: 4  
  Hours: 6  
  Why: Late-letter constructive from a modern Asia Regional.

- [ ] **UCup Shanghai 2025 L - No more regrets**  
  Submit: [UCup 2908L](https://contest.ucup.ac/contest/2908/problem/15324?v=1)  
  Source: QOJ / Universal Cup  
  Contest/source: 2025 ICPC Asia Shanghai Regional  
  Editorial: [Contest tutorials](https://contest.ucup.ac/contest/2908?v=1)  
  Key: greedy proof / exchange invariant.  
  Thinking: 5  
  Implementation: 4  
  Hours: 6  
  Why: Good for proof pipeline and contest decision-making.

- [ ] **UCup EC-Final 2025 D - Strategic Stones**  
  Submit: [UCup 3295D](https://contest.ucup.ac/contest/3295/problem/16331?v=1)  
  Source: QOJ / Universal Cup  
  Contest/source: 2025 ICPC Asia EC-Final  
  Editorial: [Contest tutorials](https://contest.ucup.ac/contest/3295?v=1)  
  Key: game/strategy invariant.  
  Thinking: 5  
  Implementation: 4  
  Hours: 7  
  Why: EC-Final game-style reasoning for APAC preparation.

- [ ] **UCup EC-Final 2025 K - Magically Marked Matching Master**  
  Submit: [UCup 3295K](https://contest.ucup.ac/contest/3295/problem/16338?v=1)  
  Source: QOJ / Universal Cup  
  Contest/source: 2025 ICPC Asia EC-Final  
  Editorial: [Contest tutorials](https://contest.ucup.ac/contest/3295?v=1)  
  Key: matching + constructive proof.  
  Thinking: 5  
  Implementation: 5  
  Hours: 7  
  Why: Combines matching and proof-heavy construction, ideal lead stretch.

