# ICPC Solo Training Schedule - Review Request

Date: 2026-06-25

Google Sheets:
https://docs.google.com/spreadsheets/d/1caTbo1moZis-YfPBKd-I_cUpVtJew-eeCl3RLxzZh_g/edit?usp=drivesdk

Local workbook:
`CP/ICPC_Solo_Training_Schedule_2026_2027.xlsx`

Generator:
`CP/scripts/build_solo_training_schedule.ps1`

## Goal

Please review whether this ICPC solo training schedule is effective for a Vietnam ICPC lead aiming first for Asia Regional 2026, then Asia/APAC stretch after Regional.

The trainee can go all-in during summer and wants a schedule closer to training camp / winter camp style, not a light weekly syllabus.

Main training objectives:

1. Review old knowledge.
2. Learn new knowledge.
3. Improve thinking and heavy implementation.
4. Code faster and more reliably.

## Current Schedule Shape

The workbook has 40 weeks and ends on 25/04/2027.

Sheets:

- `Dashboard`
- `Profile Basis`
- `Solo Timeline`
- `Weekly Brief`
- `All Links`
- `Sources`
- `Lists`

Important tabs to review:

- `Weekly Brief`: high-level weekly priorities, urgent work, required work, contest/upsolve, done check.
- `Solo Timeline`: full row-level schedule.
- `All Links`: central link index for submit links, contest/upsolve links, editorial/blog links, and GitHub solution notes.

## Weekly Load Rules

### W1-W8: Summer Camp Mode

Target: about 45h/week.

Breakdown:

- 27h Learn/Hard tasks
- 4h Review
- 4h Sprint
- 5h Contest
- 5h Upsolve

Actual hours:

- W1: 44.5h
- W2: 45h
- W3: 44h
- W4: 45h
- W5: 45h
- W6: 45h
- W7: 45h
- W8: 45h

W1-W8 usually has 2-3 Hard tasks per week plus several Learn tasks.

### W9-W19: Regional Build

Target: 35h/week.

Breakdown:

- 17h Learn/Hard tasks
- 4h Review
- 4h Sprint
- 5h Contest
- 5h Upsolve

Actual hours:

- W9-W19: exactly 35h/week.

### W20-W21: Regional Taper

- W20: 22h, only Review + Sprint.
- W21: 10h, only Review + Sprint.
- No fresh hard problem.
- No contest/upsolve.

### W22-W40: Asia/APAC Stretch

This is post-Regional stretch. It should not be judged as required Regional prep.

## Work Type Meaning

- `Review`: self-practice only, no new submit task. Used for notes, template recall, re-solving old mistakes, and re-coding old hard implementations.
- `Learn`: new/core technique or controlled learning task.
- `Hard`: thinking-heavy or implementation-heavy problem meant to raise level.
- `Sprint`: timed implementation practice, not a new problem.
- `Contest`: virtual contest set.
- `Upsolve`: editorial pass and re-implementation of missed contest problems.

## Current Metrics

Whole timeline:

- 40 weeks
- 404 timeline rows
- 1404.5 estimated hours
- Learn: 87 rows
- Hard: 77 rows
- Review: 84 rows
- Sprint: 80 rows
- Contest: 38 rows
- Upsolve: 38 rows

Pre-Regional:

- Learn: 87 rows
- Hard: 30 rows
- Review: 44 rows
- Sprint: 40 rows
- Contest: 19 rows
- Upsolve: 19 rows

Validation already passed:

- No planned rows before 17/07/2026.
- W1-W8 are 44-45h/week.
- W9-W19 are 35h/week.
- W20 is 22h taper.
- W21 is 10h taper.
- No APAC contest/task before Regional.
- `Review` rows are self-practice only.
- `Weekly Brief` has exactly W1-W40.
- `All Links` row count matches `Solo Timeline`.
- No `#REF!` or `#VALUE!`.

## What I Want You To Review

Please evaluate the schedule for:

1. Whether W1-W8 is intense enough for summer camp mode without becoming unrealistic.
2. Whether W9-W19 has enough Regional-focused hard/modeling work.
3. Whether Review/Learn/Hard/Sprint are balanced correctly.
4. Whether contest/upsolve frequency is appropriate.
5. Whether W20-W21 taper is too light, too heavy, or reasonable.
6. Whether the task mix before Regional is too easy, too OI-heavy, too ICPC-heavy, or well-balanced.
7. Whether the number of weekly tasks is enough for a lead who expects to carry hard implementation/modeling.
8. Which weeks look suspicious or badly loaded.
9. Which topics are under-covered before Regional.
10. What minimal changes would improve the schedule without making the workbook complicated.

Please do not recommend adding lots of metadata columns. The current design should stay simple.

Preferred output:

- Verdict score out of 10 for Regional prep.
- Verdict score out of 10 for Asia/APAC stretch.
- 5 strongest points.
- 5 biggest risks.
- Week-by-week red flags only if necessary.
- Concrete patch suggestions.

