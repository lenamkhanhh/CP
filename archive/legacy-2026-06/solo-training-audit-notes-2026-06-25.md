# Audit lịch luyện ICPC solo 2026–2027

Ngày ghi chú: 2026-06-25

Phạm vi đọc:

- `ICPC_Solo_Training_Schedule_2026_2027.xlsx`
- `scripts/build_solo_training_schedule.ps1`
- `regional/Tasks/00..08/README.md`

Mục tiêu thực tế:

- Mục tiêu chính trước mắt là ICPC Asia Regional 2026.
- Sau Regional mới kéo mạnh lên APAC/Asia Championship.
- Người luyện đóng vai trò lead: cần gánh bài khó, modeling nặng, implementation dài, nhưng vẫn phải giữ tốc độ và độ chính xác ở bài medium-hard.
- Không tăng quá 35 giờ/tuần.

## Verdict hiện tại

Lịch hiện tại có khung tốt nhưng nội dung đang lệch mục tiêu.

Nếu xem đây là roadmap luyện thuật toán nặng dài hạn đến APAC thì có thể khoảng 6–7/10. Nhưng nếu xem đúng mục tiêu là tối ưu cho Asia Regional 2026 thì lịch hiện tại chỉ khoảng 4/10.

Điểm mạnh:

- Bắt đầu đúng tuần 20/07/2026.
- Có giới hạn 35h/tuần.
- Có cấu trúc bài lẻ + virtual + upsolve.
- Có ý tưởng spiral qua nhiều topic.
- Source bank khá đa dạng, không phụ thuộc CSES.

Điểm yếu lớn:

- Quá nhiều bài OI/APAC stretch bị kéo vào trước Regional.
- Regional core bị thiếu hoặc bị đẩy quá muộn.
- Expected hours bị đánh thấp, đặc biệt với OI/Gym/UCup hard.
- Taper trước Regional chưa thật sự là taper.
- Implementation sprint và retention thật chưa được tách riêng.

## Cảm giác tổng quan

Lịch này giống lịch của một người rất giỏi, rất ham bài đẹp, nhưng chưa đủ lạnh lùng với mục tiêu Regional.

Nó có nhiều bài hay, nhưng thứ tự và phân loại hiện tại khiến người luyện phải trả quá nhiều giờ cho OI-specific hoặc APAC-style problem trước khi core Regional đủ chắc. Với vai trò lead, thứ cần tối ưu không chỉ là "có đụng bài khó", mà là:

- gặp bài medium-hard phải solve và code rất ổn định;
- bài modeling khó phải có sức nghĩ sâu;
- bài implementation dài phải ít bug;
- contest xong phải upsolve đủ sâu để biến lỗi thành pattern;
- technique cũ phải được giữ bằng re-code/re-solve, không chỉ bằng làm bài mới cùng topic.

## Điều chỉnh triết lý plan

Cấu trúc `25h bài lẻ + 5h virtual + 5h upsolve` đang hơi cứng.

Đề xuất đổi thành cấu trúc tuần linh hoạt hơn trong cùng 35h:

| Block | Giờ/tuần | Mục tiêu |
|---|---:|---|
| Core/Technique | 8–10h | Học hoặc củng cố kỹ thuật chính |
| Regional hard/modeling | 8–10h | Bài khó có transfer cao sang ICPC |
| Implementation sprint | 3–5h | Code lại bài đã biết lời giải, đo bug/speed |
| Virtual contest | 5h | Tập nhịp contest, chọn bài, chịu pressure |
| Upsolve + retention | 6–8h | Sửa lỗ hổng thật, re-solve, ghi pattern |

Tức là mỗi tuần không nên chỉ đếm "bài mới". Bài mới, virtual, upsolve, retention, implementation sprint là các loại luyện khác nhau.

## Rule quan trọng

Mỗi tuần chỉ nên có tối đa 2 "deep pain tasks".

Deep pain task là bài có expected thật trên 6h, hoặc bài cần nghĩ độc lập 60–90 phút mới bắt đầu có hướng. Nếu một tuần có 3–4 bài kiểu này, lịch sẽ biến thành backlog/kiệt sức thay vì tiến bộ.

Các bài còn lại trong tuần nên phục vụ:

- core technique;
- speed;
- implementation accuracy;
- retention;
- upsolve.

## Về virtual contest

Người luyện chấp nhận virtual bị đụng bài một chút, nên đây không cần là lỗi blocker.

Tuy vậy, vẫn nên phân biệt:

- virtual sạch: dùng để đo performance thật;
- virtual có đụng bài: dùng để luyện nhịp contest, không dùng làm metric nghiêm túc;
- contest đã lặp hoặc đã biết nhiều bài: nên gọi là practice/upsolve set, không nên tự lừa là benchmark.

Vấn đề lớn hơn của virtual hiện tại không chỉ là leakage, mà là:

- APAC virtual xuất hiện trước Regional, trái mục tiêu hiện tại;
- upsolve fixed 5h không đủ nếu contest fail nặng;
- không có cơ chế skip virtual khi upsolve debt quá cao;
- 2 tuần cuối vẫn còn tải hard mới.

Đề xuất:

- Giữ virtual 5h/tuần nếu nó giúp giữ nhịp.
- Cho phép đụng bài một ít, nhưng đánh dấu contest đó là "practice signal", không phải benchmark signal.
- Không dùng APAC virtual trước Regional.
- Nếu còn hơn 2 bài quan trọng chưa upsolve hoặc upsolve debt trên 5h, tuần sau giảm/skip virtual.

## Các vấn đề nghiêm trọng nhất

### 1. Regional core chưa đủ chắc trước khi kéo stretch

Trước Regional có 110 bài unique, nhưng nhiều core quan trọng chưa được ưu tiên đúng:

- flow/matching/min-cut modeling;
- low-link đầy đủ;
- HLD/path query;
- rerooting/tree DP;
- Aho-Corasick/suffix array/SAM;
- geometry hull/sweep/intersection;
- digit/profile DP;
- combinatorics/modular math/floor sum/Mobius mức ICPC.

Trong khi đó, nhiều IOI/APIO/OI-heavy task lại xuất hiện sớm.

### 2. Expected hours bị underestimate có hệ thống

Trong generator, `Get-PlannedHours` cap explicit expected hours ở 5.5h.

Điều này làm sai tải của các bài hard. Một số bài 6–7h trong README bị kéo xuống 5.5h trong workbook. Với bài như `Aliens`, `Holiday`, `Fireworks`, `Seats`, `Game`, `Longest Trip`, `Road Closures`, `September`, 5–5.5h không phản ánh đủ think + code + debug + upsolve.

### 3. OI-specific và APAC stretch đang chiếm quá nhiều chỗ trước Regional

Các bài OI không xấu. Nhưng chúng cần được phân loại rõ:

- high-transfer OI: có thể giữ, nhưng đặt sau core và budget đúng;
- low-transfer OI: nên để post-Regional/APAC;
- interactive/adaptive: không nên schedule như bài batch ICPC bình thường.

### 4. Retention chưa phải retention thật

Workbook có row `Retention`, nhưng các problem rows vẫn unique. Tức retention hiện tại chủ yếu là "bài mới thuộc topic cũ", không phải:

- re-solve bài đã AC;
- re-code known solution;
- spaced recall sau 7/21 ngày;
- stress lại implementation dài;
- đọc bug log và sửa pattern.

### 5. Taper chưa đạt

Tuần Regional bắt đầu 07/12/2026 đúng là không có virtual mới, nhưng vẫn có bài fresh hard. Tuần ngay trước đó cũng còn nhiều bài rất nặng. Đây không phải taper thật.

## Phân loại nên dùng

### Regional core

Các kỹ thuật cần chắc trước Regional:

- greedy, binary search answer, prefix/sweep/interval;
- shortest path, SCC, bridges/articulation, MST;
- Dinic, bipartite matching, min-cut modeling cơ bản;
- Fenwick/segment tree/lazy/sparse table;
- DSU, offline query, rollback mức ICPC;
- LCA, HLD, rerooting, tree DP;
- bitmask/profile/digit/interval/tree DP;
- KMP/Z, trie, Aho-Corasick, suffix array/LCP, Manacher;
- orientation, polygon, convex hull, closest pair, line sweep.

### Regional hard

Nên là trọng tâm của lead:

- graph modeling hard;
- flow/min-cut/matching modeling dài;
- DS/offline query nhiều lớp;
- constructive/proof hard kiểu ICPC;
- geometry implementation dài;
- DP optimization có transfer rõ;
- Vietnam ICPC / Kattis ICPC / Codeforces Gym / QOJ Asia-style.

### APAC/Asia stretch

Chỉ kéo mạnh sau Regional, hoặc trước Regional tối đa 0–1 bài/tuần nếu core đã ổn:

- Aliens;
- Holiday;
- Fireworks;
- Wiring;
- Race;
- Connecting Supertrees;
- Cyberland;
- hard UCup/APAC-style problems.

### OI-specific, transfer thấp

Nên để post-Regional hoặc dùng rất có chủ đích:

- Seats;
- Werewolf;
- New Home;
- Constellation 3;
- Game;
- Meetings2;
- Longest Trip;
- Road Closures;
- September;
- Rectangles;
- Fireworks nếu mục tiêu trước mắt là Regional.

## Các bài/tuần cần xử lý cụ thể

| Week | Task | Topic | Rủi ro | Hướng xử lý |
|---:|---|---|---|---|
| W1 | ICPC 2025 Regional K/A/E | Implementation | Đụng Regional 2025 virtual sau này | Chấp nhận nếu coi virtual đó là practice, không phải benchmark |
| W2 | IOI 2013 Robots | Implementation | Quá sớm, 5.5h thấp | Dời W8–W12, budget 7–9h |
| W2 | Commuter Pass | Graph | Transfer tốt nhưng hơi sớm | Dời sau shortest path/low-link core |
| W3 | One-Way Streets | Graph | Trước bridge/low-link nền | Dời sau bài bridge/articulation core |
| W4 | IOI 2018 Seats | DS | IOI hard, transfer thấp | Move post-Regional |
| W6 | IOI 2018 Werewolf | Graph | Heavy OI/Kruskal tree/persistent | Move post-Regional |
| W7 | New Home | DS | PBS/segment tree OI-specific | Move post-Regional |
| W8 | Constellation 3 | DS/DP | OI-specific, context nặng | Move post-Regional |
| W10 | UCup Nanjing 2025 A | Implementation | Interactive problem, không phải batch | Remove khỏi normal schedule hoặc tag Interactive |
| W10 | CF Gym 105484D Toe-Tac-Tics | Constructive | Official hard, 5h thấp | Giữ làm Regional hard nhưng budget 7–10h |
| W11 | Cake Cutting | DS | Segment Tree Beats + có thể leak contest | Giữ nếu cần DS hard, nhưng không tính virtual sau là benchmark |
| W12 | IOI 2016 Aliens | DP | APAC/OI stretch, 5.5h sai nặng | Move post-Regional hoặc late stretch 12–18h |
| W13 | Fireworks/Game/Unique Cities/Candies | Mixed OI | Một tuần dồn quá nhiều OI | Split mạnh, đa số post-Regional |
| W14 | Meetings2/Palindromic/Wiring/Race | Tree/String/DP | Quá nhiều OI trong một tuần | Giữ tối đa 1 bài transfer cao |
| W17 | Holiday/Rectangles | DP/Geometry | IOI/APIO stretch | Move post-Regional |
| W18 | APAC 2026 virtual | Contest | APAC trước Regional | Thay bằng Regional-style/Gym/Kattis |
| W19 | IOI 2023 Longest Trip | Graph | Interactive/adaptive, transfer ICPC thấp | Remove khỏi pre-Regional |
| W20 | Road Closures/September/Toy Train Tracks | Mixed | Quá hard sát Regional | Move post-Regional hoặc dời sớm hơn |
| W21 | Border Jump 2 | Hard | Fresh hard trong tuần Regional | Remove khỏi taper |
| W21 | Play It by Ear | Constructive | Fresh medium-hard trong tuần Regional | Remove khỏi taper |

## Timeline sửa đề xuất trước Regional

### W1–W4: rebuild core + speed

Mục tiêu:

- lấy lại nhịp contest;
- củng cố graph/DS/DP/greedy nền;
- luyện code sạch;
- không đâm nhiều OI hard.

Quota tuần:

- 8–10h core technique;
- 6–8h Regional medium-hard;
- 3–5h implementation sprint;
- 5h virtual;
- 6–8h upsolve/retention.

### W5–W10: mở rộng technique + Regional hard

Mục tiêu:

- flow/matching/min-cut;
- HLD/tree DP/reroot;
- offline DS/PBS/rollback;
- suffix/Aho;
- geometry sweep/hull;
- DP optimization có transfer.

Mỗi tuần chỉ nên có 1–2 deep pain tasks.

### W11–W16: peak hard modeling

Mục tiêu:

- luyện lead thật;
- nhiều bài Regional hard/modeling;
- đưa UCup/Gym/QOJ hard có chọn lọc;
- OI/APAC stretch tối đa 1 bài/tuần.

Không nên dồn 3–4 bài IOI trong một tuần.

### W17–W18/W19: simulation + patch weakness

Mục tiêu:

- nhìn bug log;
- nhìn upsolve debt;
- patch topic yếu;
- không học quá nhiều topic hoàn toàn mới.

### W20–W21: taper thật

W20:

- 22–28h;
- không virtual mới nếu còn backlog;
- 2–3 bài medium Regional hoặc upsolve cũ;
- 2 sprint ngắn;
- review template/stress tests.

W21:

- 8–12h;
- không virtual;
- không bài hard mới;
- re-solve/re-code bài đã biết;
- template sanity, notes, nghỉ.

## Implementation sprint

Đây là phần lịch hiện tại thiếu nhất.

Không nên đánh đồng WPM với coding speed. Cần luyện "đưa thuật toán đã rõ thành AC code trong thời gian dự đoán được".

Mỗi tuần nên có 2 sprint:

1. Sprint ngắn 30–45 phút:
   - bài đã biết lời giải;
   - mục tiêu là code nhanh, compile sạch.

2. Sprint dài 60–75 phút:
   - implementation dài/dễ bug;
   - có stress test nếu được.

Sau mỗi sprint ghi:

- time-to-first-compile;
- số WA/RE;
- bug class: index, overflow, reset state, lazy propagation, graph direction, EPS, multi-test, invariant sai;
- có cần template/helper mới không.

## Hint policy

Rule hiện tại khá hợp lý, giữ lại:

- Bài core: nghĩ 30–45 phút, đứng 15–20 phút thì lấy hint nhỏ.
- Bài Regional hard: nghĩ 60 phút, nếu chưa có invariant/model thì lấy hint nhỏ.
- Bài stretch: nghĩ 60–90 phút, nhưng phải có deadline.

Sau khi dùng hint, bắt buộc ghi:

- mình thiếu observation gì;
- đây là pattern mới hay lỗi recall;
- lần sau dấu hiệu nhận biết là gì.

Nếu không ghi, hint chỉ giúp AC bài đó, không tăng skill bền.

## Generator patch plan

### 1. Bỏ cap 5.5h

Không nên cap explicit `ExpectedHours` bằng 5.5. Expected hours phải là p75 realistic gồm:

- thinking;
- coding;
- debugging;
- upsolve/editorial digestion.

### 2. Không chấm Thinking/Implementation bằng title heuristic cho bài quan trọng

Heuristic hiện tại dễ sai:

- match keyword quá rộng;
- mọi `oj.uz` bị ép T5/I5;
- bài interactive có thể bị coi như batch;
- bài easy trong UCup/Gym có thể bị tag thành hard chỉ vì source.

### 3. Thêm metadata bắt buộc

Mỗi task nên có:

- `Goal`: Regional core / Regional hard / APAC stretch / OI-specific;
- `Transfer`: high / medium / low;
- `Format`: batch / interactive / output-only;
- `ContestSetId`;
- `Prereq`;
- `ExpectedHours`;
- `SprintEligible`;
- `VettedSource`.

### 4. Selection theo goal + prerequisite

Không nên chọn bài chỉ theo source rank.

Ưu tiên thứ tự:

1. prerequisite của topic;
2. Regional core;
3. Regional hard;
4. stretch có kiểm soát;
5. source diversity.

### 5. Retention phải là re-solve/re-code thật

Thêm row retention kiểu:

- re-solve bài đã AC sau +7/+21 ngày;
- re-code known solution;
- stress lại bài implementation dài;
- review bug log.

### 6. Virtual planner có mức độ tin cậy

Không bắt buộc virtual phải sạch tuyệt đối, nhưng nên thêm label:

- `BenchmarkVirtual`;
- `PracticeVirtual`;
- `RepeatPractice`.

APAC virtual không nên nằm trước Regional.

### 7. Taper rule hard-coded

Generator nên enforce:

- W20 cap 22–28h;
- W21 cap 8–12h;
- W21 không fresh hard;
- W21 không virtual;
- W20/W21 không OI/APAC stretch mới.

## Task bank patch plan

### Move post-Regional hoặc retag OI-specific

- Seats
- Werewolf
- New Home
- Constellation 3
- Aliens
- Fireworks
- Game
- Meetings2
- Holiday
- Rectangles
- Longest Trip
- Road Closures
- September

### Retag interactive / non-batch

- UCup Nanjing 2025 A - Wow, Its Yesterday Six Times More
- CF Gym 105484G - Binary Tree

### Retag estimate thấp hơn

- CF Gym 105484E - Left Shifting 3
- CF Gym 105484J - Social Media
- CF Gym 105484B - Birthday Gift
- CF Gym 105484K - Strips
- UCup Nanjing 2025 C - Distributing Candies
- UCup Shenyang 2025 I - Volunteer Simulator
- UCup Chengdu 2025 J - Judging Papers
- UCup Chengdu 2025 A

### Keep nhưng dời hoặc re-estimate

- Robots: W8–W12, 7–9h.
- Commuter Pass: sau graph core.
- One-Way Streets: sau low-link core.
- Wall: Regional hard DS, 5–7h.
- Race: tree Regional hard, 6–8h.
- Wiring: DP hard/stretch, 6–9h.
- Connecting Supertrees: modeling hữu ích, nhưng không 5.5h và không sát taper.

## Kết luận

Không nên vứt lịch hiện tại. Nên giữ khung 35h, virtual, upsolve, spiral topic và source diversity.

Nhưng cần sửa mạnh ba thứ:

1. phân loại lại task theo mục tiêu Regional;
2. đổi weekly budget từ "nhiều bài mới" sang "core + hard modeling + sprint + upsolve + retention";
3. sửa generator để không under-estimate và không kéo OI/APAC stretch lên quá sớm.

Ưu tiên sửa sớm:

1. thêm metadata `Goal/Transfer/Format/ExpectedHours`;
2. bỏ cap 5.5h;
3. move OI-specific khỏi pre-Regional;
4. restore Regional core bị omit;
5. thêm implementation sprint và retention thật.

