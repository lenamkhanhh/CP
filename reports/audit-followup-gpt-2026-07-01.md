# Audit follow-up cho lịch luyện ICPC Regional

## Executive verdict

Sau memo mới, phần **kiến trúc lớn** của lịch không còn là vấn đề chính nữa. Những patch lớn đã đúng hướng: pre-Regional đã có nhiều judged anchors hơn, CSES không còn chiếm tỷ trọng quá cao như bản 27/06, và W16–W19 không nên động vào nữa nếu workbook repo hiện tại đã dùng Chengdu, Nanjing, Shenyang, Shanghai Regional 2025 như anh nói. Vấn đề còn lại bây giờ hẹp hơn và thực dụng hơn: **biến Learn-support thành đầu ra thật, neo Review/Sprint vào target cụ thể, thêm rule nợ upsolve đủ cứng, và cấy thêm rất ít judged anchors đúng chỗ cho flow/matching/low-link/Aho để nâng floor contest và conversion thay vì grind hard mù quáng**. Hướng ưu tiên này cũng hợp với bằng chứng thực nghiệm rằng độ ổn định ở các contest online tần suất cao tương quan đáng kể với thành tích ICPC cao tầng; em coi đó là bối cảnh hỗ trợ, còn việc áp vào lịch này là suy luận của em, không phải rule cứng.

Có một điểm cần nói rõ để tránh audit lại patch đã xong: file `.xlsx` anh upload trong chat này vẫn parse ra **bản cũ 404 rows / 50 Learn-support / Southern W16–W19**, đúng với current-state report ngày 27/06 và correction memo cũ; còn prompt lần này của anh nói repo workbook hiện tại đã ở **377 rows / 19 Learn-support / 73 judged pre-Regional / W16–W19 là bốn Regional 2025**. Vì vậy, em dùng memo mới của anh làm “điểm điều phối”, và chỉ giữ những patch còn đúng dưới cả hai trạng thái: support rows, review/sprint, upsolve debt, judged-anchor density ở W9–W19, và source mix theo skill-gap chứ không theo thương hiệu nguồn.

## Learn-support rows

Bảng dưới đây là patch em khuyên cho **19 Learn-support rows hiện tại**. Em cố tình giữ format đủ ngắn để nhét được vào `Task name`, `Notes`, hoặc `Weekly Brief`, không cần thêm metadata mới. Vì em không truy xuất được workbook repo mới trực tiếp từ GitHub trong môi trường này, em thiết kế theo mô hình **một support row có deliverable rõ cho mỗi tuần W1–W19**; nếu một tuần trong workbook mới đã đổi support row thành judged anchor rồi thì chỉ cần chuyển deliverable này sang `Weekly Brief`, không cần tạo thêm row.

| Week | Current row | Deliverable đề xuất | Loại | Exact output nên ghi |
|---|---|---|---|---|
| W1 | Learn-support | `Core implementation pack` | Template hardening + brute/stress | `fast I/O + sort+two-pointers + binary search checklist + 15 random edge checks` |
| W2 | Learn-support | `Shortest paths hardening` | Read + implement + self-test | `Dijkstra + 0-1 BFS template + parent restore + 20 random sparse-graph checks` |
| W3 | Learn-support | `Fenwick / offline DS pack` | Template hardening + brute/stress | `Fenwick add/sum + range trick note + brute comparer on n<=200` |
| W4 | Learn-support | `Tree basics retention` | Read + implement + self-test | `binary lifting LCA + reroot mini note + 15 random-tree checks` |
| W5 | Learn-support | `Border/string primitives` | Template hardening + brute/stress | `KMP + Z + border extraction + 10 adversarial string cases` |
| W6 | Learn-support | `Math toolkit sanity` | Read + implement + self-test | `modpow/inv/nCr/sieve pack + overflow checklist + 10 sanity identities` |
| W7 | Learn-support | `Geometry primitives` | Template hardening + brute/stress | `orientation/on-segment/intersection/int-safe cross product + 20 random tests` |
| W8 | Learn-support | `Constructive proof notebook` | Pitfall checklist | `3 invariant patterns + fail cases + one-page checklist for constructive tasks` |
| W9 | Learn-support | `Game reduction note` | Canonical judged companion | `state compression note from week’s game task + 5 small-case brute verifiers` |
| W10 | Learn-support | `Dinic + cut extraction` | Read + implement + self-test | `Dinic template + min-cut vertex side reconstruction + 20 random checks` |
| W11 | Learn-support | `Low-link / bridge tree pack` | Read + implement + self-test | `bridges + 2ECC compression + bridge-tree diameter skeleton + 15 random graph checks` |
| W12 | Learn-support | `Segtree-beats pitfall sheet` | Pitfall checklist | `push/pull invariants + when-chmin-safe + 8 killer cases copied into notes` |
| W13 | Learn-support | `Tree DP merge checklist` | Template hardening + brute/stress | `reroot / small-to-large merge note + brute on n<=18` |
| W14 | Learn-support | `Path-query tree pack` | Read + implement + self-test | `HLD path aggregate template + 10 random comparator tests vs O(n)` |
| W15 | Learn-support | `Aho canonical pack` | Canonical judged problem + short note | `Aho template + output-link propagation + one judged canonical + 8 edge cases` |
| W16 | Learn-support | `Xor/counting sanity pack` | Pitfall checklist | `prefix-xor identities + parity traps + 6 hand-derived examples` |
| W17 | Learn-support | `Geometry reliability pack` | Template hardening + brute/stress | `point/segment/polygon primitives re-code + stress harness + eps/int decision rule` |
| W18 | Learn-support | `Matching model note` | Read + implement + self-test | `Kuhn/HK skeleton + when-to-use matching checklist + 10 random bipartite tests` |
| W19 | Learn-support | `Regional stability pack` | Pitfall checklist | `top-5 bug classes + final template smoke test: Dinic / low-link / Aho` |

Nếu anh muốn link đọc đi kèm ngay trong row hoặc Weekly Brief, em khuyên chỉ dùng vài URL chuẩn và tái sử dụng:

- Aho-Corasick: https://cp-algorithms.com/string/aho_corasick.html
- Edmonds-Karp / max-flow basics: https://cp-algorithms.com/graph/edmonds_karp.html
- Bipartite matching: https://cp-algorithms.com/graph/kuhn_maximum_bipartite_matching.html
- Bridge searching / low-link: https://cp-algorithms.com/graph/bridge-searching.html

Các trang này mô tả trực tiếp các kỹ thuật mà current support rows đang thiếu đầu ra cụ thể.

Điểm quan trọng nhất ở đây là: **support row không nên còn là “đọc + code core technique”**. Nó phải ra được một artifact có thể kiểm tra: template, brute/stress harness, pitfall list, hoặc một canonical judged anchor. Nếu không, support row ăn giờ nhưng không tăng floor được.

## Review và Sprint protocol

Review/Sprint hiện chỉ thực sự hữu ích nếu nó được gắn vào **task solved thật hoặc template thật**, không phải “ôn topic”. Về mặt benchmark, Codeforces ghi rõ virtual contest chỉ hợp lệ khi anh **chưa từng xem bài, chưa đọc tutorial, chưa giải lẻ**; nếu đã xem thì nên chuyển sang archive/practice thay vì coi đó là virtual sạch. Điều này là lý do em khuyên phải gắn nhãn `clean benchmark / practice / replay` ngay trong Weekly Brief.

Protocol ngắn em khuyên giữ lại là:

```text
Target: <task/template>
Mode: review7 | review21 | sprint-short | sprint-long
Memory: recalled | reconstructed
Outline: __ min
First compile: __ min
AC/final: __ min
WA/RE: __
Bug class: __
Stress: Y/N
```

Rule chọn target cũng nên cực ngắn:

| Loại | Rule chọn target |
|---|---|
| Review +7 | Lấy **bài judged AC gần nhất trong 7 ngày** mà có một trong ba dấu hiệu: `WA/RE > 0`, `actual > estimate`, hoặc `phải xem editorial mới chốt model` |
| Review +21 | Lấy **bài hard-transfer nhất trong 3 tuần trước** đã AC nhưng dễ quên invariant, hoặc template đã từng bug nhiều |
| Sprint short 1.5h | Re-code một bài đã biết lời giải, implementation vừa phải, mục tiêu chủ yếu là `outline + compile + pass sample + no silly bug` |
| Sprint long 2.5h | Re-code một implementation dài hơn hoặc một template + stress harness; phải có 15–20 phút brute/stress cuối slot |
| Fallback khi thiếu target | Dùng contest-upsolve bài đã AC gần đây, ưu tiên bài có bug class rõ; nếu vẫn không có thì re-code template `Dinic / low-link / Aho / HLD` |

Em khuyên thêm đúng **một quy tắc gắn target** vào generator/Weekly Brief, không thêm cột mới:

- `Review +7`: mặc định lấy **judged/upsolved row gần nhất** có `WA>0` hoặc `actual>estimate`.
- `Review +21`: lấy **hardest solved row** trong 3 tuần trước thuộc cùng main topic hoặc secondary topic.
- `Sprint short`: lấy bài **đã AC** mà idea rõ nhưng code còn chậm.
- `Sprint long`: lấy **template-heavy artifact** hoặc long implementation từ bài đã AC/upsolved.

Như vậy Review dùng để kéo retention; Sprint dùng để kéo compile speed và bug-rate. Cả hai không được đếm lẫn vào “solve mới”.

## Upsolve debt và deload protocol

Fixed 5h upsolve **đủ** khi contest tuần trước chỉ còn tối đa **một bài transfer cao** chưa chốt, và tổng debt thực tế còn khoảng 2 giờ hoặc thấp hơn. Khi đã vượt ngưỡng đó, giữ 5h cố định là quá cơ học: anh sẽ cứ nhét bài mới vào lịch trong khi contest conversion chưa được trả nợ.

Rule tối thiểu em khuyên đưa thẳng vào `Weekly Brief` là:

```text
Upsolve debt rule
- 0–1 high-transfer unsolved, debt <= 2h: keep normal 5h upsolve.
- 1 high-transfer unsolved, debt 2–5h: borrow 2–3h from this week's Learn-support first.
- >=2 high-transfer unsolved OR debt > 5h: freeze one new Hard row next week.
- If debt still > 5h for 2 consecutive weeks: cut one more new Learn-support/judged add, keep contest + key upsolve + 1 Review + 1 Sprint.
```

Và rule deload ngắn:

```text
Deload trigger
- actual_hours >= 1.2 * planned_hours for 2 weeks, OR
- 2 consecutive weeks with freeze-worthy upsolve debt, OR
- clear fatigue / low focus / contest collapse.

When triggered
- keep contest,
- keep high-transfer upsolve,
- keep 1 Review and 1 Sprint,
- cut Learn-support first,
- then cut the lowest-transfer new Hard row.
```

Lý do em vẫn muốn rule này tồn tại dù anh không muốn “grind hard vô tội vạ” là vì UCup/QOJ chính thức cũng xác nhận format 5 giờ với 10–15 bài, nhưng đồng thời họ nói rõ có thể có **interactive, multiple-run, output-only**; nghĩa là chỉ nhìn “đã có contest/upsolve 5h” chưa đủ để nói lịch đang giúp floor. Anh cần một cơ chế đơn giản để dừng bơm bài mới khi chất lượng virtual/upsolve rơi.

## Audit W9–W19 và judged anchors

Trong bản workbook upload hiện tại, W9–W19 vẫn cho thấy pattern khá rõ: nhiều tuần chỉ có **một judged anchor** và phần còn lại là support chung chung. Đây đúng là dạng lịch dễ tăng “giờ planned” nhưng chưa chắc tăng conversion. Current-state report và correction memo cũ cũng đã chỉ ra việc support rows và judged density từng bị đếm sai hoặc trình bày sai.

Bảng này tập trung vào patch còn relevant. Cột `Current judged anchors` em liệt kê theo workbook upload đang nhìn thấy; nếu repo workbook mới của anh đã chèn thêm bài judged ở đúng tuần đó thì chỉ cần coi hàng đó là “đã resolved”.

| Week | Current judged anchors | Support row | Risk | Suggested action |
|---|---|---|---|---|
| W9 | `Divisive Stone Battle`; `Bingo for the Win!` | generic | Density không tệ, nhưng support chưa tạo artifact graph/game rõ | Không cần thêm judged mới nếu repo mới đã ổn; chỉ thay support thành `game reduction note + brute` |
| W10 | `Aquatic Elevator` | generic | Tuần graph-adjacent nhưng thiếu flow/min-cut anchor cụ thể | Đổi 1 support row thành `Minimum Cut` hoặc ít nhất `Dinic + cut extraction` |
| W11 | `Minotaur's Mysterious Maze` | generic | Tuần graph chính nhưng thiếu low-link / bridge-tree judged exposure | Ưu tiên đổi 1 support row thành `CF 1000E` |
| W12 | `Cake Cutting` | generic | Bài chính nặng DS rồi; nếu support vẫn mơ hồ thì retention rất kém | Không thêm hard vô tội vạ; support phải thành `Segtree-beats pitfall sheet` |
| W13 | `Kingdom Profit Kerfuffle` | generic | Chỉ một anchor, tree/DP merge dễ mơ hồ | Nếu repo mới vẫn chỉ có 1 anchor thì support chuyển sang `reroot/tree-DP hardening` |
| W14 | `Cyan White Tree` | generic | One-shot hard tree có thể ăn hết tuần mà không tăng floor | Không nhất thiết thêm judged mới; support phải là `HLD/path-query pack` |
| W15 | `Flipping Substrings` | generic | Strings week thiếu canonical judged cho multi-pattern / automaton | Đổi 1 support row thành `String Multimatching` |
| W16 | `Median of Xor Sequence` | generic | Tuần math tốt rồi; rủi ro là contaminate contest sạch nếu lấy nhầm nguồn | Giữ contest hiện tại, không động; support chỉ làm `xor/counting sanity` |
| W17 | `Square Kingdom`; `Birthday Gift` | generic | Density ổn hơn phần còn lại | Không cần thêm judged nếu repo mới còn 2 anchors; chỉ làm geometry stress/reliability |
| W18 | `Easy Game` | generic | Proof/game tuần này dễ trượt sang “đọc cho biết”, thiếu graph floor | Nếu matching vẫn chỉ nằm ở support thì đổi 1 support row thành matching judged anchor |
| W19 | `Electronic Toll Collection` | generic | Tuần cuối full-load trước taper nên ưu tiên ổn định, không nên support mơ hồ | Dùng support cho `regional stability pack`; không thêm hard mới trừ khi matching/flow vẫn còn lỗ hổng lớn |

Về judged-anchor density, nếu chỉ có thời gian soát một lần thì em sẽ **đọc lại W10, W11, W15, W18 trước**. Đây là bốn tuần mà việc đổi 2–4h support thành một judged anchor thật thường cho tác động lớn nhất lên conversion, mà vẫn không đẩy lịch sang OI/APAC grind.

## Các judged-anchor changes đáng làm

Em chỉ đề xuất **4 thay đổi**, không nhiều hơn. Cả bốn đều nhắm đúng vùng còn thiếu judged exposure trước Regional: min-cut, low-link decomposition, Aho-canonical, matching. Chúng cũng tăng nhẹ mix Kattis/QOJ/CF mà không cần làm một round “anti-CSES” mới.

### Bảng thay đổi

| Week | Current row dùng làm budget | Replacement task | Topic | Submit URL | Editorial/tutorial URL | Expected hours | Vì sao đáng làm |
|---|---|---|---|---|---|---:|---|
| W10 | 1 support row 3–4h | `Minimum Cut` | flow / min-cut extraction | `https://open.kattis.com/problems/mincut` | `https://cp-algorithms.com/graph/edmonds_karp.html` | 3.0 | Biến flow từ “đọc template” thành judged anchor thật; rất tốt cho floor vì concept rõ, implementation ngắn, dễ stress |
| W11 | 1 support row 4h | `Codeforces 1000E - We Need More Bosses` | low-link / bridge-tree | `https://codeforces.com/problemset/problem/1000/E` | `https://codeforces.com/blog/entry/60288` | 4.5 | Bổ sung graph decomposition judged exposure đúng kiểu Regional-hard nhưng chưa quá APAC/OI |
| W15 | 1 support row 4h | `String Multimatching` | Aho-Corasick canonical | `https://open.kattis.com/problems/stringmultimatching` | `https://cp-algorithms.com/string/aho_corasick.html` | 4.0 | Tăng implementation reliability cho strings hơn nhiều so với đọc Aho/SAM mơ hồ |
| W18 | 1 support row 4–5h | `UCup Hong Kong 2025 A - Bipartite Graph Matching Problem` | matching / modeling | `https://contest.ucup.ac/contest/3169/problem/15432?v=1` | `https://cp-algorithms.com/graph/kuhn_maximum_bipartite_matching.html` | 4.5–5.0 | Vá đúng gap matching trước Regional; tăng lead-readiness mà không cần đẩy giờ tổng |

Bốn submit pages trên đều là problem pages công khai; riêng `1000E` còn có tutorial public ngay trên Codeforces blog, còn hai bài Kattis hiển thị rõ source contest và submit page; UCup Hong Kong A có submit page công khai nhưng em **không verify được public editorial riêng cho bài này**, nên em chỉ gắn tutorial kỹ thuật tổng quát của matching.

### Nhận định về source mix

Với số liệu anh đưa cho workbook mới, **CSES 10/73 pre-Regional là chấp nhận được** nếu cả 10 bài đó được giữ như canonical early anchors để ôn template, speed và pattern cơ bản. 10/73 chỉ còn khoảng 13.7%; như vậy CSES không còn là “nguồn chính” nữa. Em sẽ **không làm thêm một round rút CSES chỉ vì optics**. Đổi thêm chỉ nên xảy ra nếu một row CSES đang chèn đúng chỗ của một skill-gap Regional còn thiếu judged anchor thật.

Ngược lại, QOJ/Gym/Kattis/VNOI hiện giờ nên tăng **rất nhẹ và có mục đích**. UCup/QOJ hữu ích vì là nguồn contest chất lượng cao, nhưng chính rule của Universal Cup cũng nói rõ hệ thống có thể có interactive, multiple-run, output-only; vì thế không nên “đẩy số UCup cho đẹp dashboard” mà phải chọn đúng bài transfer cao. Codeforces Gym/regular có virtual mode và contest tutorials rất tiện cho benchmark/practice; Kattis cho submit archive sạch và source contest rõ; VNOI vẫn quan trọng vì sát môi trường Việt Nam.

## Patch plan tối thiểu

Nếu chỉ có **2–3 giờ** để sửa một pass và đẩy cho Codex làm tiếp, em sẽ sửa theo thứ tự này:

### Workbook rows

Đầu tiên, đổi toàn bộ 19 Learn-support rows từ text chung chung sang deliverables cụ thể như bảng trên. Đây là patch rẻ nhất nhưng lợi lớn nhất, vì nó làm support row trở thành thứ có thể hoàn thành hoặc fail rõ ràng.

Sau đó, chỉ convert **4 support rows** ở W10, W11, W15, W18 thành judged anchors như bảng replacement. Không động vào tổng giờ tuần; tiền giờ lấy ngay từ support budget cùng tuần.

Cuối cùng, thêm nhãn vào các contest rows:

- `Benchmark: Clean`
- `Benchmark: Practice`
- `Benchmark: Replay`

Chỉ cần nhét vào `Notes`, không cần cột mới.

### Weekly Brief

Chèn bốn block text ngắn cho từng tuần:

```text
Support deliverable: <one concrete artifact>
Review +7 target: <task/template>
Review +21 target: <task/template>
Sprint targets: short=<...>, long=<...>
Debt rule: normal | borrow-support | freeze-hard
Benchmark label: clean | practice | replay
```

Chừng đó là đủ để tuần nào cũng có “mục tiêu vận hành”, chứ không chỉ có danh sách giờ.

### Generator

Em chưa truy xuất trực tiếp được `build_solo_training_schedule.ps1` ở repo trong môi trường này, nên em chỉ đề xuất patch ở mức cấu trúc không phụ thuộc implementation:

- thêm một per-week map cho `support deliverable`;
- thêm map cho `review7_target`, `review21_target`, `sprint_short_target`, `sprint_long_target`;
- cho phép một support row được materialize thành judged anchor ở vài tuần chỉ định;
- đổ các chuỗi này vào `Task name` hoặc `Notes` của `Solo Timeline`, đồng thời mirror sang `Weekly Brief`;
- không thêm cột.

### Task bank

Chỉ thêm task bank entries nếu bốn replacement trên **chưa có** trong repo. Nếu đã có trong bank hoặc đã nằm ở post-Regional stretch của repo hiện tại, action phải là **move earlier / pull earlier** chứ không duplicate row.

### Những gì không nên sửa nữa

Không sửa lại W16–W19 contests nếu workbook repo hiện tại của anh đã là Chengdu, Nanjing, Shenyang, Shanghai Regional 2025.

Không làm thêm round “giảm CSES” nữa nếu pre-Reg thực sự đã xuống còn 10 canonical anchors.

Không tăng cap giờ tuần.

Không thêm dashboard / metadata / scorecard mới.

Không biến W19 thành tuần học kỹ thuật mới nặng; tuần đó nên nghiêng về ổn định, kiểm bug và contest floor.

Không redesign W22–W40 trong pass này; patch hiện tại nên phục vụ đúng ba ưu tiên anh nói: **nâng floor contest, tăng conversion/implementation reliability, rồi mới nâng ceiling hard modeling**.

## Source notes

- Empirical CP/ICPC-performance context: https://arxiv.org/abs/2505.04143
- Codeforces virtual/archive context and problem pages used during audit: https://codeforces.com/problemset/problem/1000/E, https://codeforces.com/blog/entry/60288, https://codeforces.com/gym/105484/problem/H
- Universal Cup platform/format context: https://contest.ucup.ac/
- Kattis submit/problem pages: https://open.kattis.com/problems/mincut, https://open.kattis.com/problems/stringmultimatching, https://open.kattis.com/
- UCup judged anchor page: https://contest.ucup.ac/contest/3169/problem/15432?v=1
- Technique references: https://cp-algorithms.com/string/aho_corasick.html, https://cp-algorithms.com/graph/edmonds_karp.html, https://cp-algorithms.com/graph/kuhn_maximum_bipartite_matching.html, https://cp-algorithms.com/graph/bridge-searching.html
- VNOI judge context: https://oj.vnoi.info/
