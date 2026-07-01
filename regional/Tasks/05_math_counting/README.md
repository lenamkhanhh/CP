# 05 - Math and Counting

Muc tieu: bien rang buoc dem thanh cong thuc, precompute, factorization, linear algebra hoac convolution.

## Coverage

- Modular arithmetic/CRT, combinatorics, sieve/factorization, divisor counting.
- Inclusion-exclusion, harmonic grouping, phi/Mobius.
- Matrix exponentiation and floor-sum style recursion.
- NTT, Gaussian elimination, XOR basis la owner/advanced.

## Recommended order

1. `A`: modular/combinatorics/divisors.
2. `B`: inclusion-exclusion, harmonic grouping, multiplicative functions.
3. Regional/National pipeline.
4. NTT, Gaussian, XOR basis va hybrid OI o cuoi.

## Coverage gate

- [ ] Tu viet factorial/inverse, sieve SPF va factorization an toan.
- [ ] AC mot bai inclusion-exclusion va mot bai Mobius/phi.
- [ ] Tu derive cong thuc, test brute nho truoc khi code.
- [ ] NTT/linear algebra co mot thanh vien owner; khong bat buoc ca doi.

## Reading

- [VNOI Wiki - Modulo cơ bản](https://wiki.vnoi.info/algo/math/modulo)
- [VNOI Wiki - Nghịch đảo modulo](https://wiki.vnoi.info/algo/math/modular-inverse)
- [VNOI Wiki - Tính tổ hợp nCk](https://wiki.vnoi.info/algo/algebra/nCk)
- [VNOI Wiki - Số các ước và tổng các ước](https://wiki.vnoi.info/algo/math/divisors)
- [VNOI Wiki - Bao hàm loại trừ](https://wiki.vnoi.info/algo/algebra/pie)
- [VNOI Wiki - Nhân nhanh đa thức FFT](https://wiki.vnoi.info/algo/trick/FFT)
- [USACO Guide - FFT](https://usaco.guide/adv/fft)
- [USACO Guide - Inclusion-Exclusion](https://usaco.guide/plat/PIE?lang=cpp)
- [VNOI Wiki - Ham nhan tinh, phi va Mobius](https://wiki.vnoi.info/algo/math/multiplicative-function)
- [VNOI Wiki - Dinh ly thang du Trung Hoa](https://wiki.vnoi.info/algo/math/crt)

## A - Foundation

- [ ] **Counting Divisors**  
  Submit: [CSES 1713](https://cses.fi/problemset/task/1713)  
  Key: Sieve / divisor count.  
  Why: Warm-up cho factor precompute.

- [ ] **Common Divisors**  
  Submit: [CSES 1081](https://cses.fi/problemset/task/1081)  
  Key: Frequency over multiples.  
  Why: Counting by divisors, hay gap trong gcd tasks.

- [ ] **Binomial Coefficients**  
  Submit: [CSES 1079](https://cses.fi/problemset/task/1079)  
  Key: Factorials + modular inverse.  
  Why: Template combinatorics bat buoc.

- [ ] **Christmas Party**  
  Submit: [CSES 1717](https://cses.fi/problemset/task/1717)  
  Key: Derangements.  
  Why: Recurrence dem co ban.

- [ ] **Prime Multiples**  
  Submit: [CSES 2185](https://cses.fi/problemset/task/2185)  
  Key: inclusion-exclusion with overflow control.  
  Why: Gate inclusion-exclusion ro rang.

- [ ] **Chinese Remainder**  
  Submit: [Kattis chineseremainder](https://open.kattis.com/problems/chineseremainder)  
  Key: extended Euclid + CRT merge.  
  Why: CRT co bai submit rieng thay vi chi nam trong checklist.

## B - Regional core

- [ ] **Divisor Analysis**  
  Submit: [CSES 2182](https://cses.fi/problemset/task/2182)  
  Key: Multiplicative functions.  
  Why: Can derive formula can than.

- [ ] **Sum of Divisors**  
  Submit: [CSES 1082](https://cses.fi/problemset/task/1082)  
  Key: Harmonic grouping.  
  Why: Toi uu sqrt/harmonic Regional hay dung.

- [ ] **Bracket Sequences II**  
  Submit: [CSES 2187](https://cses.fi/problemset/task/2187)  
  Key: Catalan/counting with prefix constraint.  
  Why: Counting + dieu kien hop le.

- [ ] **R - Walk**  
  Submit: [AtCoder DP R](https://atcoder.jp/contests/dp/tasks/dp_r)  
  Key: Matrix exponentiation.  
  Why: Counting walks voi fast exponentiation.

- [ ] **Counting Coprime Pairs**  
  Submit: [CSES 2417](https://cses.fi/problemset/task/2417)  
  Key: Mobius inversion / divisor frequency.  
  Why: Bai gate cho Mobius, lap dung lo hong bank cu.

- [ ] **Counting Necklaces**  
  Submit: [CSES 2209](https://cses.fi/problemset/task/2209)  
  Key: Burnside lemma + modular arithmetic.  
  Why: Them mot mau counting theo symmetry.

## C - Advanced core

- [ ] **F - Convolution**  
  Submit: [AtCoder ACL F](https://atcoder.jp/contests/practice2/tasks/practice2_f)  
  Key: NTT/convolution.  
  Why: Owner task; khong can lam truoc Regional core.

- [ ] **Sum of Floor of Linear**  
  Submit: [Library Checker](https://judge.yosupo.jp/problem/sum_of_floor_of_linear)  
  Key: Euclidean recursion / floor sum.  
  Why: Ky thuat so hoc ngan nhung de nhan ra trong statement la.

- [ ] **System of Linear Equations**  
  Submit: [CSES 3154](https://cses.fi/problemset/task/3154)  
  Key: Gaussian elimination.  
  Why: Linear algebra template.

- [ ] **Square Subsets**  
  Submit: [Codeforces 895C](https://codeforces.com/problemset/problem/895/C)  
  Key: Prime parity vectors + mask DP.  
  Why: Counting bang vector parity.

- [ ] **Ivan and Burgers**  
  Submit: [Codeforces 1100F](https://codeforces.com/problemset/problem/1100/F)  
  Key: XOR linear basis / offline queries.  
  Why: Stretch cho bitwise linear algebra.

## D - Regional/National pipeline

- [ ] **ICPC 2025 National - Extended Fermat Theorem**  
  Submit: [VNOI icpc25_national_e](https://oj.vnoi.info/problem/icpc25_national_e)  
  Focus: modular arithmetic / number theory.  
  Pipeline: prove formula before coding.

- [ ] **ICPC 2023 National - Infinite Fraction Sequence**  
  Submit: [VNOI icpc23_national_i](https://oj.vnoi.info/problem/icpc23_national_i)  
  Focus: sequence math / recurrence reasoning.  
  Pipeline: detect structure, reduce infinite object to finite state.

- [ ] **ICPC 2022 Regional - Median of Xor Sequence**  
  Submit: [VNOI icpc22_regional_m](https://oj.vnoi.info/problem/icpc22_regional_m)  
  Focus: xor/math counting.  
  Pipeline: translate median condition into bitwise/counting structure.

## E - Stretch/OI pipeline

- [ ] **ICPC 2025 Regional - Group Raiding**  
  Submit: [VNOI icpc25_regional_g](https://oj.vnoi.info/problem/icpc25_regional_g)  
  Focus: number theory + game theory.  
  Pipeline: brute small cases, find invariant/pattern, then prove.

- [ ] **Fancy Fence**  
  Submit: [OJ.uz CEOI20_fancyfence](https://oj.uz/problem/view/CEOI20_fancyfence)  
  Focus: geometry/counting hybrid.  
  Pipeline: derive formula from structure, not from implementation.

<!-- AUTO: aggressive Gym/OJ/QOJ-heavy supplement -->

## E - Gym/OJ.uz/QOJ/Kattis supplement

Cac bai nay thay the phan CSES du thua trong timeline. Generator se cap CSES o muc primitive va uu tien block nay cho lead-level training.

- [ ] **UCup Shenyang 2025 H - Cute Young Diagram Counting**  
  Submit: [UCup 2641H](https://contest.ucup.ac/contest/2641/problem/14947?v=1)  
  Source: QOJ / Universal Cup  
  Contest/source: 2025 ICPC Asia Shenyang Regional  
  Editorial: [Contest tutorials](https://contest.ucup.ac/contest/2641?v=1)  
  Key: Young diagram combinatorics / counting proof.  
  Thinking: 5  
  Implementation: 4  
  Hours: 7  
  Why: Exactly the kind of math-counting task that rewards proof skill and code discipline.

- [ ] **UCup Nanjing 2025 I - Chi Fan**  
  Submit: [UCup 2581I](https://contest.ucup.ac/contest/2581/problem/14809?v=1)  
  Source: QOJ / Universal Cup  
  Contest/source: 2025 ICPC Asia Nanjing Regional  
  Editorial: [Contest tutorials](https://contest.ucup.ac/contest/2581?v=1)  
  Key: counting/modeling with hidden invariant.  
  Thinking: 5  
  Implementation: 4  
  Hours: 6  
  Why: Asia Regional math-style problem; good for lead problem selection.

- [ ] **UCup Nanjing 2025 K - Xiangqi**  
  Submit: [UCup 2581K](https://contest.ucup.ac/contest/2581/problem/14811?v=1)  
  Source: QOJ / Universal Cup  
  Contest/source: 2025 ICPC Asia Nanjing Regional  
  Editorial: [Contest tutorials](https://contest.ucup.ac/contest/2581?v=1)  
  Key: game board combinatorics / state counting.  
  Thinking: 5  
  Implementation: 5  
  Hours: 7  
  Why: Board-game counting problem with implementation and proof pressure.

- [ ] **CF Gym 105484L - P xor Q = R**  
  Submit: [Gym 105484L](https://codeforces.com/gym/105484/problem/L)  
  Source: Codeforces Gym  
  Contest/source: The 2024 ICPC Asia Nanjing Regional Contest  
  Editorial: [VJudge mirror metadata](https://vjudge.net/contest/671351)  
  Key: bitwise algebra + counting.  
  Thinking: 5  
  Implementation: 4  
  Hours: 6  
  Why: Nanjing math/bit task, good for XOR-basis adjacent thinking.

- [ ] **Kattis WF 2025 - Blackboard Game**  
  Submit: [Kattis blackboardgame](https://open.kattis.com/problems/blackboardgame)  
  Source: Kattis ICPC  
  Contest/source: ICPC World Finals 2025  
  Editorial: [Kattis WF 2025 source](https://open.kattis.com/problem-sources/ICPC%20World%20Finals%202025)  
  Key: game/math invariant.  
  Thinking: 5  
  Implementation: 3  
  Hours: 7  
  Why: WF hard math/game problem; high thinking density.

- [ ] **Kattis WF 2025 - Score Values**  
  Submit: [Kattis scorevalues](https://open.kattis.com/problems/scorevalues)  
  Source: Kattis ICPC  
  Contest/source: ICPC World Finals 2025  
  Editorial: [Kattis WF 2025 source](https://open.kattis.com/problem-sources/ICPC%20World%20Finals%202025)  
  Key: number theory/counting model.  
  Thinking: 4  
  Implementation: 3  
  Hours: 5  
  Why: Medium WF math problem for contest conversion.

- [ ] **Kattis WF 2025 - A-Skew-ed Reasoning**  
  Submit: [Kattis askewedreasoning](https://open.kattis.com/problems/askewedreasoning)  
  Source: Kattis ICPC  
  Contest/source: ICPC World Finals 2025  
  Editorial: [Kattis WF 2025 source](https://open.kattis.com/problem-sources/ICPC%20World%20Finals%202025)  
  Key: geometry/algebra reasoning.  
  Thinking: 5  
  Implementation: 4  
  Hours: 7  
  Why: Hard WF reasoning problem that sits between math and geometry.

- [ ] **IOI 2020 - Carnival Tickets**  
  Submit: [OJ.uz IOI20_tickets](https://oj.uz/problem/view/IOI20_tickets)  
  Source: OI / oj.uz  
  Contest/source: IOI 2020  
  Editorial: [IOI source](https://oj.uz/problems/source/ioi2020)  
  Key: optimization + counting/exchange proof.  
  Thinking: 5  
  Implementation: 5  
  Hours: 7  
  Why: Good proof-heavy optimization with clean scoring subtasks.

- [ ] **BOI 2024 - Multiplication**  
  Submit: [OJ.uz BOI24_multiplication](https://oj.uz/problem/view/BOI24_multiplication)  
  Source: OI / oj.uz  
  Contest/source: BOI 2024  
  Editorial: [BOI source](https://oj.uz/problems/source/boi2024)  
  Key: number theory / multiplication structure.  
  Thinking: 5  
  Implementation: 4  
  Hours: 6  
  Why: OI number-theory task with more depth than routine sieve.

- [ ] **CEOI 2024 - COVID Tests**  
  Submit: [OJ.uz CEOI24_covid](https://oj.uz/problem/view/CEOI24_covid)  
  Source: OI / oj.uz  
  Contest/source: CEOI 2024  
  Editorial: [CEOI source](https://oj.uz/problems/source/ceoi2024)  
  Key: probabilistic/group testing reasoning.  
  Thinking: 5  
  Implementation: 4  
  Hours: 6  
  Why: Good math-modeling problem with implementation manageable enough for ICPC transfer.

<!-- AUTO: second UCup 2025 supplement -->

## E - UCup 2025 Asia supplement

Them de Asia Regional/EC-Final moi de tang ty trong QOJ/Universal Cup trong timeline.

- [ ] **UCup Chengdu 2025 G - GCD of Subsets**  
  Submit: [UCup 2567G](https://contest.ucup.ac/contest/2567/problem/14712?v=1)  
  Source: QOJ / Universal Cup  
  Contest/source: 2025 ICPC Asia Chengdu Regional  
  Editorial: [Contest tutorials](https://contest.ucup.ac/contest/2567?v=1)  
  Key: gcd lattice + subset counting.  
  Thinking: 5  
  Implementation: 4  
  Hours: 6  
  Why: Direct math/counting problem with number-theory structure.

- [ ] **UCup Shanghai 2025 D - Not a subset sum**  
  Submit: [UCup 2908D](https://contest.ucup.ac/contest/2908/problem/15317?v=1)  
  Source: QOJ / Universal Cup  
  Contest/source: 2025 ICPC Asia Shanghai Regional  
  Editorial: [Contest tutorials](https://contest.ucup.ac/contest/2908?v=1)  
  Key: subset-sum theorem / constructive counting.  
  Thinking: 5  
  Implementation: 4  
  Hours: 6  
  Why: Excellent proof-heavy math problem for lead training.

- [ ] **UCup EC-Final 2025 G - Revolver Roulette**  
  Submit: [UCup 3295G](https://contest.ucup.ac/contest/3295/problem/16334?v=1)  
  Source: QOJ / Universal Cup  
  Contest/source: 2025 ICPC Asia EC-Final  
  Editorial: [Contest tutorials](https://contest.ucup.ac/contest/3295?v=1)  
  Key: probability / expected value modeling.  
  Thinking: 5  
  Implementation: 3  
  Hours: 6  
  Why: Hard contest math with implementation small but reasoning dense.

