# 06 - Strings

Muc tieu: KMP/Z/hash truoc, sau do moi len suffix array, suffix automaton va Aho-Corasick.

## Coverage

- KMP/Z/hash, trie and Aho-Corasick.
- Suffix array + LCP, suffix automaton.
- Palindrome/Manacher and automaton DP.

## Recommended order

1. `A`: KMP/Z/hash/rotation.
2. `B`: bat buoc dung Aho va suffix array theo ghi chu.
3. Regional pipeline.
4. Suffix automaton, Manacher/automaton DP va OI palindrome.

## Coverage gate

- [ ] Tu code prefix function, Z va double hash.
- [ ] AC mot bai Aho-Corasick va mot bai suffix array + LCP.
- [ ] AC mot bai SAM hoac Manacher.
- [ ] Neu dung hash trong contest, co double hash/verification va stress.

## Reading

- [VNOI Wiki - Tổng quan xử lý xâu](https://wiki.vnoi.info/algo/string/basic)
- [VNOI Wiki - KMP](https://wiki.vnoi.info/algo/string/kmp)
- [VNOI Wiki - Hash](https://wiki.vnoi.info/algo/string/hash)
- [VNOI Wiki - Aho-Corasick](https://wiki.vnoi.info/algo/string/aho-corasick)
- [VNOI Wiki - Suffix Array](https://wiki.vnoi.info/algo/string/suffix-array)
- [VNOI Wiki - Suffix Automaton](https://wiki.vnoi.info/algo/string/suffix-automaton)
- [VNOI Wiki - Manacher](https://wiki.vnoi.info/algo/string/manacher)

## A - Foundation

- [ ] **String Matching**  
  Submit: [CSES 1753](https://cses.fi/problemset/task/1753)  
  Key: KMP/Z/hash.  
  Why: Exact matching baseline.

- [ ] **Finding Borders**  
  Submit: [CSES 1732](https://cses.fi/problemset/task/1732)  
  Key: Prefix-function / Z.  
  Why: Border logic hay xuat hien.

- [ ] **Finding Periods**  
  Submit: [CSES 1733](https://cses.fi/problemset/task/1733)  
  Key: Prefix-function / Z.  
  Why: Periodicity proof.

- [ ] **Minimal Rotation**  
  Submit: [CSES 1110](https://cses.fi/problemset/task/1110)  
  Key: Booth / suffix comparison.  
  Why: Lexicographic reasoning.

## B - Regional core

- [ ] **Word Combinations**  
  Submit: [CSES 1731](https://cses.fi/problemset/task/1731)  
  Key: Trie + DP.  
  Why: Dictionary matching voi DP.

- [ ] **Finding Patterns**  
  Submit: [CSES 2102](https://cses.fi/problemset/task/2102)  
  Key: Aho-Corasick.  
  Why: Bai nay phai dung Aho trong pipeline, khong doi sang suffix array.

- [ ] **Counting Patterns**  
  Submit: [CSES 2103](https://cses.fi/problemset/task/2103)  
  Key: Aho-Corasick counts.  
  Why: Them aggregation occurrence.

- [ ] **Pattern Positions**  
  Submit: [CSES 2104](https://cses.fi/problemset/task/2104)  
  Key: suffix array + LCP/search.  
  Why: Bai nay phai dung suffix array de tach ro coverage.

## C - Advanced core

- [ ] **Distinct Substrings**  
  Submit: [CSES 2105](https://cses.fi/problemset/task/2105)  
  Key: suffix automaton.  
  Why: Lam bang SAM de dam bao da code structure nay.

- [ ] **Repeating Substring**  
  Submit: [CSES 2106](https://cses.fi/problemset/task/2106)  
  Key: Suffix array + LCP.  
  Why: Classic LCP use.

- [ ] **String Functions**  
  Submit: [CSES 2107](https://cses.fi/problemset/task/2107)  
  Key: Z + prefix function.  
  Why: Theory + implementation check.

- [ ] **Compress Words**  
  Submit: [Codeforces 1200E](https://codeforces.com/problemset/problem/1200/E)  
  Key: KMP/Z rolling overlap.  
  Why: String construction code-heavy.

- [ ] **Longest Palindrome**  
  Submit: [CSES 1111](https://cses.fi/problemset/task/1111)  
  Key: Manacher.  
  Why: Palindrome primitive dang thieu.

- [ ] **Required Substring**  
  Submit: [CSES 1112](https://cses.fi/problemset/task/1112)  
  Key: KMP automaton + DP.  
  Why: Pattern automaton ket hop counting DP.

- [ ] **Substring Order II**  
  Submit: [CSES 2109](https://cses.fi/problemset/task/2109)  
  Key: suffix automaton/array + occurrence multiplicity.  
  Why: Query lexicographic kho hon distinct-substring baseline.

## D - Regional pipeline

- [ ] **ICPC 2024 Regional - Hash-shashin**  
  Submit: [VNOI icpc24_regional_h](https://oj.vnoi.info/problem/icpc24_regional_h)  
  Focus: hashing/string structure.  
  Pipeline: define collision-safe checks and edge cases.

- [ ] **ICPC 2023 Regional - Flipping Substrings**  
  Submit: [VNOI icpc23_regional_f](https://oj.vnoi.info/problem/icpc23_regional_f)  
  Focus: substring transformations.  
  Pipeline: model operation effects before choosing DS/string tool.

- [ ] **ICPC 2025 Regional - Finest Final String**  
  Submit: [VNOI icpc25_regional_f](https://oj.vnoi.info/problem/icpc25_regional_f)  
  Focus: string + DP optimization.  
  Pipeline: combine string insight with DP state.

- [ ] **JOIOJI**  
  Submit: [OJ.uz JOI14_joioji](https://oj.uz/problem/view/JOI14_joioji)  
  Focus: prefix differences / string counting.  
  Pipeline: turn string balance into vector equality.

## E - Stretch/OI pipeline

- [ ] **Palindromic Partitions**  
  Submit: [OJ.uz CEOI17_palindromic](https://oj.uz/problem/view/CEOI17_palindromic)  
  Focus: palindrome/string partitioning.  
  Pipeline: palindromic structure + efficient comparison.

<!-- AUTO: aggressive Gym/OJ/QOJ-heavy supplement -->

## E - Gym/OJ.uz/QOJ/Kattis supplement

Cac bai nay thay the phan CSES du thua trong timeline. Generator se cap CSES o muc primitive va uu tien block nay cho lead-level training.

- [ ] **UCup Hong Kong 2025 H - Longest Common Prefix**  
  Submit: [UCup 3169H](https://contest.ucup.ac/contest/3169/problem/15439?v=1)  
  Source: QOJ / Universal Cup  
  Contest/source: 2025 ICPC Asia Hong Kong Regional  
  Editorial: [Contest tutorials](https://contest.ucup.ac/contest/3169?v=1)  
  Key: LCP/string data structure.  
  Thinking: 5  
  Implementation: 5  
  Hours: 7  
  Why: Fresh Asia Regional string problem with direct submit page.

- [ ] **UCup Hong Kong 2025 K - Cyclic Shift**  
  Submit: [UCup 3169K](https://contest.ucup.ac/contest/3169/problem/15442?v=1)  
  Source: QOJ / Universal Cup  
  Contest/source: 2025 ICPC Asia Hong Kong Regional  
  Editorial: [Contest tutorials](https://contest.ucup.ac/contest/3169?v=1)  
  Key: cyclic string matching / hashing.  
  Thinking: 4  
  Implementation: 4  
  Hours: 5  
  Why: Contest string modeling beyond KMP/Z warmup.

- [ ] **UCup Hong Kong 2025 L - Cyclic Shift II**  
  Submit: [UCup 3169L](https://contest.ucup.ac/contest/3169/problem/15443?v=1)  
  Source: QOJ / Universal Cup  
  Contest/source: 2025 ICPC Asia Hong Kong Regional  
  Editorial: [Contest tutorials](https://contest.ucup.ac/contest/3169?v=1)  
  Key: advanced cyclic matching / automaton or hashing.  
  Thinking: 5  
  Implementation: 5  
  Hours: 7  
  Why: Harder follow-up for string owner practice.

- [ ] **UCup Nanjing 2025 H - Pen Pineapple Apple Pen**  
  Submit: [UCup 2581H](https://contest.ucup.ac/contest/2581/problem/14808?v=1)  
  Source: QOJ / Universal Cup  
  Contest/source: 2025 ICPC Asia Nanjing Regional  
  Editorial: [Contest tutorials](https://contest.ucup.ac/contest/2581?v=1)  
  Key: string parsing / automaton-flavored modeling.  
  Thinking: 5  
  Implementation: 4  
  Hours: 6  
  Why: Good statement-to-string-model drill from a modern Regional set.

- [ ] **CF Gym 105484J - Social Media**  
  Submit: [Gym 105484J](https://codeforces.com/gym/105484/problem/J)  
  Source: Codeforces Gym  
  Contest/source: The 2024 ICPC Asia Nanjing Regional Contest  
  Editorial: [VJudge mirror metadata](https://vjudge.net/contest/671351)  
  Key: string/social graph parsing and constraints.  
  Thinking: 5  
  Implementation: 5  
  Hours: 7  
  Why: Nanjing mixed string/modeling task with long implementation.

- [ ] **IOI 2024 - Hieroglyphs**  
  Submit: [OJ.uz IOI24_hieroglyphs](https://oj.uz/problem/view/IOI24_hieroglyphs)  
  Source: OI / oj.uz  
  Contest/source: IOI 2024  
  Editorial: [IOI source](https://oj.uz/problems/source/ioi2024)  
  Key: sequence/string matching with structure.  
  Thinking: 5  
  Implementation: 5  
  Hours: 7  
  Why: High-quality OI sequence/string problem for hard reasoning.

- [ ] **IOI 2021 - Mutating DNA**  
  Submit: [OJ.uz IOI21_dna](https://oj.uz/problem/view/IOI21_dna)  
  Source: OI / oj.uz  
  Contest/source: IOI 2021  
  Editorial: [IOI source](https://oj.uz/problems/source/ioi2021)  
  Key: string queries + prefix accounting.  
  Thinking: 4  
  Implementation: 4  
  Hours: 5  
  Why: Good bridge from prefix/string basics to query-heavy strings.

- [ ] **APIO 2014 - Palindromes**  
  Submit: [OJ.uz APIO14_palindrome](https://oj.uz/problem/view/APIO14_palindrome)  
  Source: OI / oj.uz  
  Contest/source: APIO 2014  
  Editorial: [APIO source](https://oj.uz/problems/source/apio2014)  
  Key: palindrome structure + suffix/prefix reasoning.  
  Thinking: 5  
  Implementation: 5  
  Hours: 7  
  Why: Strong string structure problem; not just Manacher template.

- [ ] **Kattis WF 2020 - Gene Folding**  
  Submit: [Kattis genefolding](https://open.kattis.com/problems/genefolding)  
  Source: Kattis ICPC  
  Contest/source: ICPC World Finals 2020  
  Editorial: [Kattis WF 2020 source](https://open.kattis.com/problem-sources/ICPC%20World%20Finals%202020)  
  Key: string DP/compression.  
  Thinking: 5  
  Implementation: 4  
  Hours: 6  
  Why: WF string-DP task with nontrivial modeling.

- [ ] **Kattis WF 2023 - A Recurring Problem**  
  Submit: [Kattis arecurringproblem](https://open.kattis.com/problems/arecurringproblem)  
  Source: Kattis ICPC  
  Contest/source: ICPC World Finals 2023  
  Editorial: [Kattis WF 2023 source](https://open.kattis.com/problem-sources/ICPC%20World%20Finals%202023)  
  Key: periodicity / recurrence over strings or sequences.  
  Thinking: 5  
  Implementation: 4  
  Hours: 7  
  Why: Good WF hard reasoning around recurrence/periodicity.

<!-- AUTO: second UCup 2025 supplement -->

## E - UCup 2025 Asia supplement

Them de Asia Regional/EC-Final moi de tang ty trong QOJ/Universal Cup trong timeline.

- [ ] **UCup Chengdu 2025 J - Judging Papers**  
  Submit: [UCup 2567J](https://contest.ucup.ac/contest/2567/problem/14715?v=1)  
  Source: QOJ / Universal Cup  
  Contest/source: 2025 ICPC Asia Chengdu Regional  
  Editorial: [Contest tutorials](https://contest.ucup.ac/contest/2567?v=1)  
  Key: string/text comparison + hashing/parsing.  
  Thinking: 4  
  Implementation: 4  
  Hours: 5  
  Why: Real contest string parsing problem, better than another pure Z/KMP drill.

- [ ] **UCup EC-Final 2025 I - Redundancy Refrain**  
  Submit: [UCup 3295I](https://contest.ucup.ac/contest/3295/problem/16336?v=1)  
  Source: QOJ / Universal Cup  
  Contest/source: 2025 ICPC Asia EC-Final  
  Editorial: [Contest tutorials](https://contest.ucup.ac/contest/3295?v=1)  
  Key: string redundancy / automaton or suffix reasoning.  
  Thinking: 5  
  Implementation: 5  
  Hours: 7  
  Why: High-level string reasoning from EC-Final.

- [ ] **UCup EC-Final 2025 L - Logical Resonance**  
  Submit: [UCup 3295L](https://contest.ucup.ac/contest/3295/problem/16339?v=1)  
  Source: QOJ / Universal Cup  
  Contest/source: 2025 ICPC Asia EC-Final  
  Editorial: [Contest tutorials](https://contest.ucup.ac/contest/3295?v=1)  
  Key: logic/string pattern constraints.  
  Thinking: 5  
  Implementation: 4  
  Hours: 6  
  Why: Useful for string plus proof crossover.

