# Bao cao hien trang ke hoach luyen ICPC

Ngay chot du lieu: **27/06/2026**  
Pham vi: `CP/` trong repo `D:\Code\Code\AIO\Code`  
Muc dich: cung cap mot ban mo ta tu than, du du lieu va cac diem nghi van de mot GPT khac co the nghien cuu, phan tich sau va de xuat sua lich.

## 1. Cau hoi trung tam can phan tich

Ke hoach hien tai co thuc su toi uu cho mot thi sinh dong vai tro **lead/gánh bai kho** nham muc tieu:

1. Asia Regional 2026 la muc tieu chinh va gan nhat.
2. Sau Regional moi tang cuong APAC/Asia Championship va OI/UCup/WF stretch.
3. Tu 20/07/2026 co the luyen trung binh khoang 5 gio/ngay, mot so ngay 3-7 gio.
4. Bon ket qua can dat dong thoi:
   - on lai kien thuc cu;
   - hoc kien thuc moi;
   - tang kha nang tu duy va cai dat bai nang;
   - code nhanh, it bug va on dinh hon trong contest.

Can danh gia bang **noi dung thuc duoc xep vao timeline**, khong chi dua vao quy mo task bank hoac tong gio tren dashboard.

## 2. Ho so nguoi luyen hien co

Du lieu dang duoc luu trong sheet `Profile Basis`:

| Tai khoan | Chi so hien co | Dau vet |
|---|---:|---|
| Codeforces `Average2k7` | current 1789, max 1790, Expert | 20 rated contests, 123 bai unique, active 09/06/2026 |
| Codeforces `wibulord` | current 1443, max 1516, Specialist | 47 rated contests, 412 bai unique, lich su cu hon |
| Codeforces gop | 533 bai unique | 109 bai rating 1800+, 18 bai 2400+, max solved 3000 |
| VNOJ `khanhss` | current 1412, max 1511, Specialist | 402 bai solved, hang #591 theo points tai thoi diem thu thap |

Danh gia dang duoc generator su dung:

- Khong phai nguoi moi; khong nen ton nhieu thoi gian cho classic co ban.
- Data structures, DP va math co dau vet solved kha.
- Cac khoang trong duoc suy ra tu tag public: flow/min-cut, matching, geometry, FFT/NTT, game/proof.
- Khoang cach lon nhat co the la **contest conversion**: kha nang practice bai rat kho cao hon kha nang chuyen hoa thanh ket qua rated/virtual on dinh.
- Nguoi luyen du kien la lead nen can tu phan tich va code cac bai modeling, implementation dai hoac bai kho cua team.

Gioi han cua du lieu profile:

- Tag solved khong chung minh da nam vung ky thuat.
- Hai tai khoan CF co the trung bai; so `533 unique` la so da tong hop truoc do, can verify lai neu dung de lap mo hinh nang luc.
- Chua co du lieu chi tiet ve toc do solve, WA pattern, ti le AC theo rating, ket qua virtual gan day hay lich su contest ICPC theo team.
- Chua co baseline do duoc cho time-to-first-compile, WA/RE, thoi gian nghi, thoi gian code va ti le upsolve thanh cong.

## 3. Cac quyet dinh da chot voi nguoi luyen

### 3.1 Thoi gian

- Khong xep lich truoc 17/07/2026.
- W1 bat dau thu Hai 20/07/2026.
- W1-W8 la `Summer camp mode`, muc tieu gan 45 gio/tuan.
- W9-W19 la `Regional build`, muc tieu 35 gio/tuan.
- W20, tuan 30/11-06/12, taper 22 gio.
- W21, tuan 07/12-13/12, taper 10 gio; Regional dang duoc gia dinh ngay 10/12/2026.
- W22-W40 la Asia/APAC stretch, ket thuc 25/04/2027.
- Lap ke hoach theo tuan, khong ep deadline tung ngay. Ngay ranh lam nhieu, viec chua xong carry sang tuan sau.

### 3.2 Cach luyen

- Moi tuan xen ke main topic, secondary topic va retention; khong hoc lien tiep 2-4 tuan chi mot chu de.
- Co mot virtual 5 gio o hau het tuan day du.
- Co mot block upsolve 5 gio, gan voi contest tuan truoc.
- `Review` khong duoc lay bai moi tu queue.
- `Learn` la hoc/cung co ky thuat, khong nen la bai deep pain.
- `Hard` la bai moi de tang tu duy hoac implementation.
- `Sprint` la re-code/cai dat khi y tuong da ro, nham toc do va do chinh xac; khong phai hoc bai moi.
- OI/APAC stretch can de chu yeu sau Regional.
- Khong muon them qua nhieu metadata; workbook phai de doc va de theo doi.

### 3.3 Chinh sach nghi va hint dang duoc ky vong

Trao doi truoc day cho thay nguoi luyen thuong nghi doc lap khoang 10-30 phut, neu khong co tien trien thi de bi ket. De xuat cu dang duoc xem la hop ly:

- Core/easy-medium: nghi 30-45 phut; neu dung yen 15-20 phut thi lay hint nho.
- Regional hard: nghi khoang 60 phut; neu chua co model/invariant thi lay hint nho.
- Stretch: 60-90 phut nhung phai co deadline.
- Sau hint can ghi observation bi thieu, pattern moi hay loi recall, va dau hieu nhan biet lan sau.

Chinh sach nay **chua duoc generator enforce** va workbook chua co log thuc te de biet co duoc tuan thu hay khong.

## 4. Cau truc artifact hien tai

### File chinh

- Generator: `CP/scripts/build_solo_training_schedule.ps1`
- Workbook chinh: `CP/ICPC_Solo_Training_Schedule_2026_2027.xlsx`
- Workbook verify: `CP/ICPC_Solo_Training_Schedule_2026_2027__verify.xlsx`
- Task bank: `CP/regional/Tasks/<00..08>/README.md`
- Google Sheets gan nhat: <https://docs.google.com/spreadsheets/d/1caTbo1moZis-YfPBKd-I_cUpVtJew-eeCl3RLxzZh_g/edit?usp=drivesdk>

Nguyen tac bao tri:

- Khong sua tay workbook.
- Sua task bank/generator, sau do regenerate.
- Link moi phai co submit URL that; khong bia URL.
- Workbook verify va workbook chinh hien co cung kich thuoc, cung thoi diem sinh gan nhat 25/06/2026.

### Cac sheet

1. `Dashboard`: tong quan gio, row va topic coverage.
2. `Profile Basis`: evidence tu profile va cac khoang trong duoc suy ra.
3. `Solo Timeline`: source of truth o muc tung row.
4. `Weekly Brief`: mot row moi tuan, ghi uu tien va viec bat buoc.
5. `All Links`: index link submit, contest/upsolve, editorial/blog va cho trong GitHub solution.
6. `Sources`: ban do nguon va file.
7. `Lists`: gia tri phuc vu validation/dropdown.

### File cu can dung can than

- `ICPC_Solo_Training_Audit_Notes.md` la audit cua mot phien ban cu. Nhieu loi no neu da duoc sua: APAC truoc Regional, fresh hard trong taper, cap hard 5.5h, Review lay bai moi.
- `ICPC_Solo_Training_Docs_Source.md` cung da stale o mot so chi tiet, vi du ngay ket thuc cu va cau truc 25h problem pool.
- `ICPC_Solo_Training_Review_Request.md` gan voi phien ban hien tai hon, nhung van khong phan biet ro bai judge that va manual self-practice row.

## 5. Task bank: ba lop so lieu khac nhau

Day la diem de nham quan trong nhat.

### 5.1 Raw bank trong README

Audit truc tiep 9 README tim thay **313 task entries**, tat ca co submit link:

| Nguon theo URL | So task raw |
|---|---:|
| CSES | 95 |
| OJ.uz | 59 |
| QOJ/Universal Cup | 56 |
| VNOI | 31 |
| Codeforces thuong | 24 |
| Kattis | 21 |
| Codeforces Gym | 11 |
| Other | 16 |

Nhu vay raw bank van la **30.4% CSES**. Plan `Gym/OJ.uz/QOJ-heavy` khong xoa toan bo CSES cu; no dung generator de loc mot active subset.

Raw count theo topic:

| Topic | Raw tasks |
|---|---:|
| 00 Implementation/Greedy/Search | 29 |
| 01 Graph/Modeling | 41 |
| 02 Data Structures | 37 |
| 03 Tree | 34 |
| 04 Advanced DP | 38 |
| 05 Math/Counting | 35 |
| 06 Strings | 33 |
| 07 Geometry | 32 |
| 08 Proof/Constructive/Game | 34 |

Raw bank co mot so ten trung lap giua topic; generator dung `ownerMap` de chi giu mot owner cho cac ten nhu `Sliding Window Cost`, `COT`, `Fancy Fence`, `Divisibility Grid`, `Hamiltonian Path Remix`.

### 5.2 Active filtered bank

Generator dat target theo topic tong cong **207 bai**:

- 00: 18
- 01: 26
- 02: 24
- 03: 24
- 04: 26
- 05: 22
- 06: 20
- 07: 22
- 08: 25

Active bank duoc bao cao co mix:

| Nguon | Active tasks |
|---|---:|
| OJ.uz | 58 |
| QOJ/Universal Cup | 56 |
| ICPC/VNOI | 27 |
| Kattis ICPC | 21 |
| CSES | 18 |
| Codeforces | 14 |
| Codeforces Gym | 11 |
| Other | 2 |

CSES active ratio la 8.7%, dung muc tieu duoi 10-15%. Tuy nhien day moi la **pool duoc giu**, khong phai lich thuc te.

### 5.3 Tasks thuc su nam trong timeline

Workbook hien co:

- 404 rows tong cong.
- 164 rows co `Work type = Learn/Hard`.
- Trong 164 rows do, chi **114 rows la bai judge that**.
- **50 rows la `Learn support: read + implement core technique`**, source `Self practice`, khong co submit link.
- Chi 114/207 active tasks duoc xep vao 40 tuan; 93 active tasks con lai khong xuat hien trong timeline.

Vi vay KPI `Planned problem rows = 248` tren Dashboard de gay hieu nham. So 248 la `Learn + Hard + Review = 87 + 77 + 84`; Review khong phai problem row, va 50 Learn rows cung khong phai bai judge.

## 6. Timeline hien tai

### 6.1 Tong the

| Work type | Rows | Gio |
|---|---:|---:|
| Learn | 87 | 237.5 |
| Hard | 77 | 451.0 |
| Review | 84 | 176.0 |
| Sprint | 80 | 160.0 |
| Contest | 38 | 190.0 |
| Upsolve | 38 | 190.0 |
| **Tong** | **404** | **1404.5** |

Phan ra theo ban chat:

| Ban chat row | Rows | Gio |
|---|---:|---:|
| Bai judge that | 114 | 539.5 |
| Learn support tu hoc | 50 | 149.0 |
| Review | 84 | 176.0 |
| Sprint | 80 | 160.0 |
| Contest | 38 | 190.0 |
| Upsolve | 38 | 190.0 |

### 6.2 W1-W8: Summer camp mode

Actual hours: `44.5, 45, 44, 45, 45, 45, 45, 45`.

Mau tuan muc tieu:

- 27h Learn/Hard.
- 4h Review.
- 4h Sprint.
- 5h virtual.
- 5h upsolve.
- Thuong 2 Hard/tuan; W7 co 3 Hard.

Topic spiral va contest:

| Week | Main | Secondary | Virtual |
|---|---|---|---|
| W1 | Implementation | Graph | Southern 2021 |
| W2 | Graph | Data Structures | Southern 2022 |
| W3 | Data Structures | DP | Southern 2023 |
| W4 | DP | Tree | Southern 2024 |
| W5 | Tree | Strings | Southern 2025 |
| W6 | Strings | Math | National 2021 |
| W7 | Math | Geometry | National 2022 |
| W8 | Geometry | Proof/Constructive/Game | National 2023 |

Day la block nang nhu training camp. Rui ro can GPT danh gia: 45 gio lich thuan co the bien thanh 55-60 gio that neu hard estimate, upsolve debt va debug bi underestimate.

### 6.3 W9-W19: Regional build

- Moi tuan dung 35h.
- 17h Learn/Hard, 4h Review, 4h Sprint, 5h Contest, 5h Upsolve.
- W9 va W17 co 2 Hard; cac tuan con lai thuong 1 Hard.
- W9-W10 dung National 2024-2025.
- W11-W15 dung Regional 2021-2025.
- W16-W19 quay lai Southern 2021-2024, tuc la **lap contest da dung o W1-W4**. Day la practice/replay, khong phai benchmark sach.

### 6.4 W20-W21: taper

- W20: 22h, 6 Review + 2 Sprint rows; khong bai moi, contest hay upsolve.
- W21: 10h, 2 Review + 2 Sprint rows; khong bai moi, contest hay upsolve.
- Fresh Hard va APAC da duoc loai khoi taper.

Diem can phan tich: W20 danh 18h cho Review co the qua nhieu neu no chi la doc notes/template, nhung hop ly neu bao gom re-solve va re-code bai cu. Ten row hien tai chua chi dinh cu the bai nao can re-solve.

### 6.5 W22-W40: Asia/APAC stretch

- 19 tuan, 629h.
- 47 bai judge that, 287h.
- 38 Review rows = 76h.
- 38 Sprint rows = 76h.
- 19 Contest = 95h.
- 19 Upsolve = 95h.
- Khong con Learn; moi bai judge deu label Hard.
- Moi tuan co 2-3 Hard, thuong 31-35h.

Nguon 47 bai post-Regional:

- QOJ/Universal Cup: 31.
- Kattis ICPC: 8.
- Codeforces Gym: 5.
- ICPC/VNOI: 2.
- OJ.uz: 1.

Virtual sau Regional chi co ba set `APAC 2024`, `APAC 2025`, `APAC 2026`, lap vong 19 tuan. Day nen duoc hieu la **placeholder/replay cycle**, khong phai 19 contest khac nhau. Neu da biet bai sau lan dau, cac lan sau chi do re-solve/strategy, khong do contest performance sach.

## 7. Noi dung truoc Regional

### 7.1 Khoi luong that

W1-W19:

- 231 rows, 743.5h.
- 67 bai judge that, 252.5h.
- 50 Learn support tu hoc, 149h.
- 38 Review rows, 76h.
- 38 Sprint rows, 76h.
- 19 contests, 95h.
- 19 upsolve rows, 95h.

Tinh ca taper W20-W21: 775.5h.

Nhu vay, con so `117 Learn/Hard rows pre-Regional` dung ve schema nhung chi co **67 bai submit that**.

### 7.2 Topic coverage cua 67 bai judge

| Topic | Bai judge truoc Regional |
|---|---:|
| Implementation/Greedy/Search | 8 |
| Graph/Modeling | 7 |
| Data Structures | 6 |
| Tree | 8 |
| Advanced DP | 7 |
| Math/Counting | 8 |
| Strings | 5 |
| Geometry | 8 |
| Proof/Constructive/Game | 10 |

Tat ca 9 topic xuat hien truoc W8. Tuy nhien `Graph 7`, `DS 6`, `Strings 5` co the mong cho lead neu 50 Learn support khong duoc bien thanh bai cu the va co gate ro rang.

### 7.3 Source mix cua 67 bai judge truoc Regional

| Source | Count | Ti le |
|---|---:|---:|
| ICPC/VNOI | 24 | 35.8% |
| CSES | 18 | 26.9% |
| Codeforces | 14 | 20.9% |
| Kattis ICPC | 5 | 7.5% |
| QOJ/Universal Cup | 3 | 4.5% |
| Other | 2 | 3.0% |
| Codeforces Gym | 1 | 1.5% |
| OJ.uz | 0 | 0% |

Day la nghich ly lon nhat so voi yeu cau `Gym/OJ.uz/QOJ-heavy`: active bank rat nang nguon nay, nhung **pre-Regional timeline lai khong nang nguon nay**. Dieu nay co the la dung neu co chu dich de uu tien ICPC/VNOI va core, hoac co the la loi selection/scheduling lam task bank moi khong phat huy tac dung.

### 7.4 Difficulty proxy truoc Regional

Trong 117 Learn/Hard rows, ke ca 50 manual Learn support:

- Thinking/Implementation `(3,4)`: 51 rows, chu yeu manual support.
- `(4,4)`: 34.
- `(4,2)`: 10.
- `(2,2)`: 9.
- `(4,3)`: 6.
- `(3,3)`: 4.
- `(5,5)`: 3.

Thinking/Implementation chi la heuristic 1-5, khong phai rating chuan. Generator mac dinh OJ.uz thanh 5/5 va dua tren tier/keyword neu README khong khai bao ro; do do khong nen dung cac score nay nhu ground truth.

## 8. Cac work type thuc su co y nghia gi

### Review

- La self-practice, khong co submit link.
- Thuong 2 row/tuan, tong 4h.
- Y tuong: recall template/pattern/bug, re-solve nhe, re-code bai cu.
- Van de: row con chung chung, khong tu dong gan bai cu AC/WA cu the theo +7/+21.

### Learn

- Co hai loai dang bi gop cung label:
  1. bai judge moi, core/foundation;
  2. manual `Learn support: read + implement core technique`, khong submit link.
- Dieu nay lam count bai bi phong dai va kho kiem tra hoc gi cu the.

### Hard

- Tier D/E, Thinking/Implementation cao, hoac expected hours >=5.
- Explicit `Hours:` trong README duoc ton trong; tier E mac dinh 7h.
- Pre-Regional cap dong de tranh qua nhieu Hard; post-Regional khong cap tuong tu.

### Sprint

- Moi tuan thuong co:
  - short 1.5h: re-code khi y tuong da ro;
  - long 2.5h: implementation + stress/brute check.
- Muc tieu dung: speed, first compile, bug class, reliability.
- Van de: chua gan bai/template cu the, chua co cot/log metric de do tien bo. Nguoi dung khong muon workbook phinh metadata, nen co the can quy uoc ghi trong Notes/GitHub thay vi them cot.

### Contest va Upsolve

- Contest 5h strict, khong editorial trong contest.
- Upsolve 5h cho contest truoc; W1 upsolve chinh Southern 2021 vi chua co contest truoc.
- Fixed 5h upsolve co the khong du neu virtual fail nang.
- Chua co debt rule tu dong: vi du neu con >2 bai quan trong chua upsolve thi giam bai moi/skip virtual.

## 9. Diem manh hien tai

1. Timeline bat dau dung sau ky thi va co phase ro.
2. Da chuyen tu topic-major dai ngay sang weekly spiral.
3. Bon muc tieu Review/Learn/Hard/Sprint da duoc tach ve y nghia.
4. Co virtual va upsolve deu dan truoc Regional.
5. Taper W20-W21 da sach: khong fresh Hard, contest hay APAC.
6. Khong ep toan bo 207 bai den 2028; timeline cap W40.
7. Source bank active da da dang, CSES chi 8.7% o pool.
8. Workbook co `Weekly Brief` va `All Links`, de dung hon mot README dai.
9. 9 topic deu duoc cham toi som.
10. Generator la single source de regenerate, tranh sua Excel bang tay.

## 10. Rui ro va bat cap can GPT xem ky

1. **Dashboard phong dai problem count.** `248 planned problem rows` khong phai 248 bai; chi 114 bai judge that trong ca timeline.
2. **Pre-Regional khong Gym/OJ/QOJ-heavy.** CSES chiem 26.9% bai judge, OJ.uz 0, QOJ 3, Gym 1.
3. **50 Learn support rows qua chung chung.** Chung chiem 149h truoc Regional ma khong co syllabus/link/dau ra cu the.
4. **Review/Sprint cung chung chung.** Neu khong gan bai cu, de tick xong nhung khong tao retention hay speed evidence.
5. **45h planned co the qua tai thuc.** Hard, debugging va upsolve debt co the lam actual hours vuot xa.
6. **W16-W19 lap Southern set.** Khong the coi nhu benchmark sach.
7. **Post-Regional APAC lap 3 set 19 tuan.** Can thay bang contest bank rong hon hoac label ro replay.
8. **Post-Regional moi bai deu Hard.** Khong co Learn/core bridge; co nguy co grind va backlog.
9. **Chi 114/207 active tasks duoc schedule.** Can biet 93 bai bi bo co phai bai tot hon mot so bai dang co khong.
10. **Selection uu tien source truoc tier.** `Get-SourceRank` xep QOJ, Gym, OJ.uz, Kattis truoc; trong folder, viec nay co the chon bai source dep nhung prerequisite/order khong toi uu.
11. **Difficulty score la heuristic.** Nguon va keyword co the lam bai de bi danh gia cao hoac bai kho bi danh gia thap.
12. **Khong co adaptive feedback loop.** Lich khong tu dieu chinh theo AC rate, WA, upsolve debt, contest score hay chu de dang yeu.
13. **Fixed weekly hours khong phan anh recovery.** Khong co deload trong 8 tuan camp ngoai taper cuoi.
14. **Team training chua duoc model.** Hien la solo; sau nay khi co team can contest communication, role ownership va code review, nhung chua can lam phuc tap bay gio.
15. **Regional date la assumption.** Can verify lich thi chinh thuc khi ban to chuc cong bo.

## 11. Cac cau hoi GPT can tra loi

Hay nghien cuu va phan tich theo thu tu sau:

1. Danh gia lich nay theo muc tieu Asia Regional 2026, khong danh dong voi WF/APAC.
2. Cham diem `/10` cho:
   - Regional readiness;
   - lead hard-problem growth;
   - implementation speed/reliability;
   - sustainability;
   - post-Regional APAC stretch.
3. 67 bai judge + 50 Learn support + 19 virtual truoc Regional co du hay khong?
4. 45h/tuan trong 8 tuan co kha thi voi profile nay khong? Nen co deload hay cap actual debt the nao?
5. Source mix pre-Regional co hop ly khong? Nen tang Gym/QOJ/OJ.uz den muc nao ma khong bien lich thanh OI grind?
6. Topic nao dang thieu bai judge cu the, dac biet graph, DS, strings, flow/matching, geometry, FFT/NTT va game/proof?
7. 50 Learn support rows nen duoc bien thanh deliverable nao de van simple: template checklist, mot bai canonical, hay mini-set?
8. Review va Sprint nen gan bai cu theo quy tac nao ma khong them nhieu cot?
9. Contest bank W1-W19 nen thay doi ra sao de tranh lap set va van dung cap do?
10. Fixed 5h upsolve co hop ly khong? Can rule skip/reduce bai moi khi debt tang nhu the nao?
11. Taper 22h + 10h co hop ly khong, va W20 nen lam cu the gi?
12. Sau Regional, co nen 19 tuan lien tuc 2-3 Hard + APAC replay khong? De xuat phase hoa lai.
13. Chi ra cac thay doi **toi thieu nhung tac dong lon**, khong de xuat them mot he thong metadata cong kenh.
14. Neu de xuat thay bai, can dua link submit that va uu tien QOJ/UCup, CF Gym, Kattis ICPC, OJ.uz, VNOI/ICPC.

## 12. Dinh dang output mong muon tu GPT

1. Executive verdict ngan.
2. Bang score theo 5 tieu chi.
3. 5 diem manh thuc su.
4. 5-10 rui ro lon nhat, xep theo muc do.
5. Audit rieng W1-W8, W9-W19, W20-W21, W22-W40.
6. Audit source mix va topic coverage truoc Regional.
7. Patch plan toi thieu cho generator/workbook.
8. Neu can thay task, dua danh sach cu the co submit link va ly do.
9. Neu dua claim ve cach top WF/OG CP train, phai co nguon primary/link va tach ro fact voi suy luan.
10. Khong de xuat them nhieu metadata column; uu tien sua noi dung row, selection va weekly rules.

## 13. Lenh tai tao va verification hien tai

Regenerate:

```powershell
powershell -ExecutionPolicy Bypass -File CP\scripts\build_solo_training_schedule.ps1
powershell -ExecutionPolicy Bypass -File CP\scripts\build_solo_training_schedule.ps1 -OutputPath CP\ICPC_Solo_Training_Schedule_2026_2027__verify.xlsx
```

Checks da doi chieu tren workbook hien tai:

- 7 sheets dung ten.
- 404 timeline rows.
- 40 weeks, tu 20/07/2026 den 25/04/2027.
- W1-W8 khong vuot 45h.
- W9-W19 dung 35h.
- W20 = 22h; W21 = 10h.
- Khong co APAC task/contest truoc Regional theo label hien tai.
- Khong co `#REF!` hoac `#VALUE!` da duoc bao cao o lan generate gan nhat.
- `Weekly Brief` co 40 data rows.
- `All Links` co cung 404 data rows voi `Solo Timeline`.

## 14. Ket luan tam thoi, truoc khi GPT nghien cuu

Khung lich hien tai da tot hon ro ret so voi phien ban cu: phase dung, spiral dung, taper dung, va bon muc tieu da co cho trong lich. Tuy nhien noi dung thuc te chua hoan toan khop voi nhan `Gym/OJ.uz/QOJ-heavy` va dashboard dang lam mo ranh gioi giua bai judge, self-study, review va sprint.

Cau hoi khong con la "lich co nhieu bai hay khong". Cau hoi dung la: **67 bai judge, 50 block hoc ky thuat, 19 virtual va 19 upsolve truoc Regional co tao ra kha nang solve nhanh, code dai it bug va ganh bai Regional hay khong; neu khong, can thay toi thieu nhung row nao?**
