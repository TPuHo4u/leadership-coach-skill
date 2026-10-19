# leadership-coach: label rule across all seven files (round 5)

**Verdict:** the claim "the rule holds in every file" is false. Round 4 fixed the four lines it named (feedback-control.md:225, motivation.md:32, hiring.md:5, team.md:18). At least 10 other places still label a course signal or a course rule as «вывод, не из курса», and in most of them the only reason is that the text was written. Round 4 also added «names the first control point» to mode 1, which brings back the B2 failure and clashes with the course's partner-style control points. Findings: 0 critical, 2 important, 5 minor. I edited nothing.

**Gate:** `bash /Users/dmitrijkrasuk/Downloads/Project/leadership-coach-skill/dev/check.sh` exited 0 with `frontmatter ok: name=leadership-coach, 923 chars`, `SKILL.md words: 2499` and `GATE: PASS`. That leaves 1 word under the 2,500 cap, so every SKILL.md fix has to trade words.

## Counts

I counted with `python3 -I` regexes, then classified each hit by hand.
- **Label:** «вывод, не из курса», including labels split across two lines.
- **Bare label:** «(не из курса)» without «вывод».
- **Course tag:** «курс» or «(course)» used as a source tag.
- **Medium:** sentences about writing, messages, mail, chat, drafts or tone of text.

| File | Label | Bare label | Course tag | Medium |
|---|---|---|---|---|
| SKILL.md | 6 (23–24, 65, 95, 126, 141, 157) | 0 | 0 | 5 real (24, 33, 63–66, 123); the regex also hit lines 3, 20–21, 51, 57, 84 |
| situational.md | 13 (87, 90–94, 118, 131, 133, 138, 186, 208, 222) | 0 | 14 lines (70, 81–89, 91, 96, 205, 206) | 7 (77, 87, 89, 96, 105, 214, 218) |
| feedback-control.md | 12 (51, 88–89, 115, 120, 183, 185, 226, 247, 278, 281, 285, 308) | 1 (147) | 4 (25, 50, 88, 178) | 11 (50, 88, 123, 167, 176, 183, 185–186, 225, 285, 294) |
| motivation.md | 3 (30, 32, 213) | 0 | 6 (30, 84, 116, 146, 168, 211) | 4 (32, 61, 69, 213) |
| development.md | 6 (24, 29, 42, 94, 110, 199) | 0 | 0 | 4 (28, 42, 93, 109) |
| hiring.md | 18 (5, 21, 52, 56, 79, 84, 99, 105, 118, 127, 149, 151, 173, 198, 200, 208, 209, 243) | 5 (5, 158, 202, 212, 231) | 1 (242) | 2 (5, 27) |
| team.md | 3 (18, 59, 162) | 0 | 6 (16, 51, 102, 150, 152, 156) | 6 (18, 102, 150, 152, 156, 162) |

There are 61 labels in total.

**Consistent with the rule:**
- **SKILL.md:** 23–24, 65, 126, 141, 157.
- **situational.md:** 87, 91, 92, 93, 94, 118, 131, 133, 138, 186, 208, 222, 218; course rows 81–89.
- **feedback-control.md:** 115, 120, 185–186, 247, 278, 281, 308.
- **feedback-control.md:225–226:** «no answer» is a reply-time cue. It is not the live silence at :199, which is a course signal.
- **motivation.md:** 30, 32.
- **development.md:** 24, 94, 199. Line 94 labels an interpretation; «by mail» there is incidental, not the reason for the label.
- **hiring.md:** all 18 labels and the rows at 21–27.
- **team.md:** 59, and the course tags at 150, 152 and 156.

**Inconsistent:** the lines listed under findings 1, 3 and 4.

## Findings

**1. Important: the round-4 fix missed most cases. The label still marks course signals and course rules, often only because the text is written.**

*Labelled as not from the course, although the course gives it:*
- **feedback-control.md:285** «Signals in a draft (вывод, не из курса): «руководство решило», «я тебя понимаю», «наверное, ты сейчас чувствуешь…», small talk first, apologies». Each item is one of the course's own dismissal rules:
  - :267 principle 2 (do not hide behind higher management);
  - :269 «Я вас понимаю!»;
  - :273 do not guess feelings;
  - :276 step 1, no preliminaries;
  - :265 «Не извиняйтесь».
  
  SKILL.md:114–115 states these rules as the course's own. **Wrong answer:** the user pastes a dismissal draft that starts «Руководство решило… Я тебя понимаю». The model writes «сигнал (вывод, не из курса): прячется за руководство». That presents a course rule as the coach's opinion, the J-S10 failure.
- **feedback-control.md:88–89** «in writing, «всё в порядке» with no file or link (вывод, не из курса)». It is the same signal as :72 «всё хорошо, всё по плану» with nothing shown, and as «по плану» with no artefact at :88. **Wrong answer:** for a chat message «всё в порядке, идём по плану», the model labels the course's «увидеть, а не спросить» signal as a transfer.
- **feedback-control.md:50–51** «A written «в среду пришли половину» is the directive template (вывод, не из курса)». This is the course's own non-partner example at :34–36 and its «Не делать: dictate the day and the volume» at :53.
- **feedback-control.md:183** «Signals in mail (вывод, не из курса)». Two of its items are course content: «file not attached» is the course's missing artefact (:72, :85), and «items missing» is the course's fact phrase «вижу только [M] из них» (:167), itself a mail case. Only «a date passed silently», a reply-time cue, is a real transfer.
- **development.md:28–29** «A written «не знаю, что выбрать, подскажите» or a list of risks without a decision — «вывод, не из курса»». This is the course's coach case at :15–16 («утонул в анализе рисков», cannot choose the best option). situational.md:84 tags the same reading as «курс». **Wrong answer:** two references disagree on the same chat message, and the model labels the coach-role signal as not from the course.
- **development.md:42** «A written «где / как сделать» question due today — «вывод, не из курса»: answer». This combines the course's «когда коучинг не применим» cases 1–2 (:36–37) and its pseudo-coaching example (:40).
- **development.md:109–110** «In his draft reply: a ready answer, an evaluation («хорошее решение»), advice packed into a question — «вывод, не из курса»». These are the course's coaching rules: no advice, no evaluation (:98–104), and leading questions banned. SKILL.md:73 and :146–147 state them as the course's.
- **motivation.md:213** «comparisons with colleagues in chat» labelled «вывод, не из курса». But :168 tags «comparison with a colleague … or with the market» as «Signals (course)», and :211 says the course names it. **Wrong answer:** for «Петрову за то же платят больше» written in chat, the model labels a course demotivation signal (несправедливость) as not from the course.
- **team.md:162** «its only written signals are the three marked «курс». Any other reading of a message is «вывод, не из курса»». This is the medium-based rule that B1 removed everywhere else. The DISC signals at :150–156 are things people say («есть моё мнение и неверное», «цифры — фигня, это не взлетит», «какие грибы? в какой лес?»), so under SKILL.md:64–65 they are course signals in text as well. Mode 6 point 4 does make DISC a labelled hint, but a hypothesis label is not the not-from-course label. **Wrong answer:** «синий (C) — вывод, не из курса» for a phrase the course itself gives as a blue signal. Round 4 dismissed this line; I disagree, for that reason.

*A course tool presented as a reading:*
- **situational.md:90** «ни да ни нет → перепроверить гипотезу» is tagged «вывод, не из курса». But :188 (§9) and SKILL.md:93–94 present «перепроверить гипотезу» for «neither accepts nor refuses» as the course's own tool. Only the mapping of «постараюсь» and «посмотрим» onto that case is an interpretation. The row needs the split that row :91 got. **Wrong answer** in mode 7: «Что происходит (гипотеза): задача не принята — вывод, не из курса».

*Fix:* attach the label to the reading only, as :91 and team.md:18 already do. Every fix here is in a reference, so it costs no SKILL.md words.

**2. Important: the round-4 clause «It names the first control point» (SKILL.md:89) contradicts the course and brings B2 back.**
- **Against S3 and S4:** the clause applies to every «Текст сотруднику». But the course's S3 «просит наметить вехи контроля» (situational.md:118, :160 «milestones agreed together»). Partner control means asking «Когда тебе будет удобно?», and the course's own bad example is «в среду придёшь ко мне…» (feedback-control.md:30–36). S4 control is «по результату + мониторинг», with no intermediate point (feedback-control.md:20). **Wrong answer:** delegating a report to a D3, the model writes «Первая точка контроля — в среду, пришли половину». That is the course's non-partner example.
- **Against the open-refusal sentence (:94–96):** that text «asks what changed, without selling the task», yet :89 still requires a control point and «С чего начнёшь?», and part 4 «Точки контроля» stays mandatory. **Wrong answer** (probe R6): «Что изменилось? … Первая точка — пятница. С чего начнёшь?». This treats the task as accepted, exactly the B2 failure. The GREEN pass of R6 ran before this clause was added (adjudication.md round 4, J-S1), so R6 needs to run again.
- **Fix:** «It names the first control point (S1/S2; S3 asks for it; S4 none), except for an open refusal».

**3. Minor: team.md:18 justifies its label with a false claim.** It says «the course does not list them», but «the boss in copy» is a course distrust indicator (:102) and «a KPI under threat» is course step 3 (:14). The label on the reading «→ steps 1–3» can stay; fix the parenthetical. Otherwise a model may label a course indicator as not from the course and miss the distrust reading.

**4. Minor: the label vocabulary is not the same across files.**
- hiring.md:5 defines a third label, «(не из курса)», which SKILL.md does not have.
- hiring.md:231 gives the decision rule «квалификацию доучим…» the bare label «(не из курса)», while SKILL.md:156–157 labels it «вывод, не из курса».
- feedback-control.md:147 uses the bare label for a reading (the praise sandwich) that, under the SKILL.md rule, needs «вывод».

**5. Minor: the framings of the rule do not cover the same classes.** The rule has three classes: written-only cues, an interpretation the course does not state, and a tool moved to a new situation.
- **SKILL.md:65–66:** the umbrella «readings the course does not give» is followed by a dash list of only two classes, which reads as exhaustive. It leaves out interpretation, which is the class round 4 asked to add (its wrong answer 2).
- **situational.md:77**, the lead-in: names only written-only cues. On its own it does not justify the labels on rows 90 and 93–94.
- **situational.md:96**, the closing line: «interpretation or written-only cues». It leaves out the tool-transfer class.
- **hiring.md:5:** tool transfer and written-only cues under an umbrella, but no interpretation class.
- **These agree:** feedback-control.md:225, motivation.md:32, team.md:18's phrasing, situational.md:218.

**6. Minor: «never inventing a date, number or fact» (:60) collides with required slots.** These slots all need a date:
- S1/S2 SMART «когда, сколько» (:87);
- the mandatory first control point;
- mode 2 part 4;
- the course reply «Ваш последний день — [дата]» (feedback-control.md:301).

When the case gives no date, the only options are an invented date, a banned placeholder, or a «labelled assumption» (:57), which is an invented date under a label. The skill does not say which to use. The course's own numbers («через 10 минут», 1–10, 40/60, «раз в год», 80%) are not invented and do not conflict.

**7. Minor: the open-refusal label (:95) also covers a course behaviour.** «Asks what changed» overlaps with the course's S3 behaviour «спрашивает о причинах падения мотивации» (situational.md:118). Only the combination with no task-selling is the builder's own.

## Noticed, not filed
- **Old wording (:89):** «ends with an open understanding check» also applies to S3/S4, while the course says S3 gets no preliminary check (feedback-control.md:22). Not filed: this wording predates round 4 and I found no answer that goes wrong because of it.
- **Earlier notes:** the «(§9)» pointer at situational.md:90 and hiring.md:5's missing «emoji» are already noted earlier or have no effect on answers.

Files read, none edited:
- /Users/dmitrijkrasuk/Downloads/Project/leadership-coach-skill/skills/leadership-coach/SKILL.md
- /Users/dmitrijkrasuk/Downloads/Project/leadership-coach-skill/skills/leadership-coach/references/ (all six files)
- /Users/dmitrijkrasuk/Downloads/Project/leadership-coach-skill/dev/review/round4-seams.md
- /Users/dmitrijkrasuk/Downloads/Project/leadership-coach-skill/dev/review/adjudication.md
- /Users/dmitrijkrasuk/Downloads/Project/leadership-coach-skill/dev/check.sh
