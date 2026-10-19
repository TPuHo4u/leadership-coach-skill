# Round 2 check of leadership-coach: fixes verified, regressions found

**Verdict:** 31 findings are fixed. 10 are partly fixed, 1 was declined (fidelity F20) and nothing was dropped silently. The gate passes. The rewrite introduced 5 important regressions and 14 minor issues. None is critical. All locations are re-cited against the current files; the round-1 line numbers are stale.

Two things moved while I was reviewing. The earlier GREEN answers are now at `/Users/dmitrijkrasuk/Downloads/Project/leadership-coach-skill/dev/with-skill/round1/S*.md`. The builder's adjudication is at `/Users/dmitrijkrasuk/Downloads/Project/leadership-coach-skill/dev/review/adjudication.md`. I did not edit anything.

## Gate (Q5)

`bash /Users/dmitrijkrasuk/Downloads/Project/leadership-coach-skill/dev/check.sh` gives exit 0:
- `frontmatter ok: name=leadership-coach, 982 chars`
- `SKILL.md words: 2399`
- `GATE: PASS`

- **Locator words:** none in SKILL.md or the references.
- **Real names:** only course content, which F20 declined:
  - `references/motivation.md:94` and `:114`: Герчиков, Герцберг, Басс, Ричи-Мартин, Herzberg.
  - `references/hiring.md:243`: Рузвельт, Черчилль, Гитлер.
- **Colleague names:** none in the skill. «Петя» appears only in `dev/scenarios.md`.
- **Name checking:** the gate has no name check. The spec relies on a separate check before each commit.

## Fidelity findings: status

| # | Status | Evidence (current file:line) |
|---|---|---|
| F1 | fixed | SKILL.md:77–80. S2 now includes steps and a check before start; S3 is split out. Agrees with situational.md:157–161. |
| F2 | fixed | SKILL.md:116–119. The five steps are in course order. |
| F3 | fixed, with a regression | Labelled in feedback-control.md:281 and :308–311. SKILL.md:103–104 and :196 are reworded. But SKILL.md:104 says «понимаю» only about the situation; see M1. |
| F4 | fixed | SKILL.md:62–64 |
| F5 | partly | Fixed in development.md:24 and :114. SKILL.md:127–128 carries the rule without the label; see M2. |
| F6 | partly | hiring.md:52 is labelled. hiring.md:231 still says «derived from the course's scale»; see M13. |
| F7 | fixed | situational.md:117 |
| F8 | fixed | situational.md:154 now agrees with :220 |
| F9 | fixed | SKILL.md:141–143 matches hiring.md:121–123 |
| F10 | fixed, but in conflict | SKILL.md:173–174. Clashes with :172; see I4. |
| F11 | fixed | SKILL.md:113 |
| F12 | fixed | SKILL.md:114 and motivation.md:90. New scope problem; see M8. |
| F13 | fixed | SKILL.md:155 |
| F14 | fixed | development.md:193 |
| F15 | fixed | feedback-control.md:278 |
| F16 | fixed | situational.md:173 |
| F17 | fixed | motivation.md:92 |
| F18 | partly | motivation.md:22 is fixed. SKILL.md:118 «(end with them)» hardens it again; see M3. |
| F19 | fixed | motivation.md:30 |
| F20 | not fixed (declined) | motivation.md:94, :114; hiring.md:243 |
| F21 | partly | Fixed: «Regularly» at team.md:122, and the legend has no time figure. Unchanged: team.md:16 «неделю не могут договориться» still tagged (course); development.md:251 «1–3 areas»; motivation.md:140 «„Выгорающий“» with :146 «Signals (course)». No slide text has «выгорающий»; only hiring-b «выгорела?» and m1-workbook «профессиональное выгорание». |
| F22 | fixed | situational.md:79, :95 |

## Usability findings: status

| # | Status | Evidence |
|---|---|---|
| U1 | fixed, with regressions | SKILL.md:29, :33. The quoted-message rule now overrides mode 7 (I1) and sends replies to mode 3, which has nowhere to put a reply (I3). |
| U2 | fixed | SKILL.md:55–56, :90–91; feedback-control.md:123 |
| U3 | fixed | SKILL.md:39 |
| U4 | partly | The contract is at SKILL.md:21–25. Step (4) offers negotiation-coach but never says to load it only when the user asks. See M6. |
| U5 | partly | Scope and «(если это так)» added at SKILL.md:173–175, but they conflict with :172 (I4). |
| U6 | fixed | SKILL.md:164. There is still no slot for the check; see M4. |
| U7 | fixed | SKILL.md:172–175 |
| U8 | partly | SKILL.md:17 and the triggers at :3 are in. «оффер» and «кандидат просит больше» are missing. README and spec still use the old test; see M10. |
| U9 | fixed | SKILL.md:42–43 |
| U10 | fixed, with a regression | SKILL.md:42. The proposed clause «mode 8 only when the user asks to analyse» was dropped; see I1. |
| U11 | fixed | SKILL.md:62–64 |
| U12 | fixed | SKILL.md:83, :173 |
| U13 | fixed | SKILL.md:55 |
| U14 | fixed | SKILL.md:59–61 |
| U15 | fixed | SKILL.md:103–104 (M1 remains) |
| U16 | partly | SKILL.md:3; 982 of 1,024 characters used |
| U17 | fixed | SKILL.md:141–143 |
| U18 | fixed | SKILL.md:155–156 |
| U19 | fixed | SKILL.md:44 |
| U20 | fixed | SKILL.md:52–53 |

## Answers to the attacking questions

**1. Can precedence and the table disagree? Yes.**
- **S11 itself.** «Разбери мой разговор. Сотрудник сорвал срок…» fits the mode 8 row (SKILL.md:40). Precedence at :42 says «a broken result → mode 2 first».
- **A live broken agreement.** «Я на встрече, он говорит: «Ну не успел, бывает»» fits row :39 (mode 7). The rules at :29 and :42 both send it to mode 2, which means 400–600 words while the user is still in the meeting.
- **A refusal or lost interest.** «Сотрудник: «Не хочу больше вести этот проект»» fits row :33 (a refusal, mode 1) and row :35 (lost interest, mode 3). No precedence rule decides between them; see M5.
- **The «other side» table** (S12 message) has the same problem; see I5.

**2. Does anything still invite accepting or negotiating the manager's deadline?** Nothing invites it directly. Three gaps remain (M6):
- Step (3) does not forbid an opening acceptance. The earlier GREEN S12 began «Принял задачу».
- The support identified in step (2) has nowhere to go, because step (3) allows only SMART questions.
- The «когда» question reopens a date the manager has already named.

A live upward message can also land in mode 7 and get directive replies aimed at the boss (M12).

**3. Does mode 7 fit 120 words for an excuse from an experienced employee?**
- **Word count: yes.** My drafts came to 85 words (`/private/tmp/claude-501/-Users-dmitrijkrasuk/0358512b-b00b-4cef-aa19-69aa11628015/scratchpad/fixverify/m7-senior.txt`) and 66 words (`/private/tmp/claude-501/-Users-dmitrijkrasuk/0358512b-b00b-4cef-aa19-69aa11628015/scratchpad/fixverify/m7-dismissal.txt`).
- **The scope: no legal way to state it.** It only fits as a condition on a label, which :172 forbids, or by dropping the directive reply, which S10 C3 requires. See I4.
- **Defect in my own draft:** it attaches «(если это так)» to «Организуй свою работу», which states no fact. That is not a skill defect and not evidence of fit.

**4. Did any fix put words in the course's mouth?** Yes, all minor:
- M1: SKILL.md:104
- M2: SKILL.md:127–128
- M3: SKILL.md:118
- M13: hiring.md:231
- «Выгорающий» kept with «Signals (course)» (F21)

**5. Gate and names:** see the Gate section above.

## Findings, most severe first

**I1 — important — SKILL.md:29 and :42 against :39–40.**
- **Wrong behaviour:** the topic rules (the quoted-message rule and precedence) are stated without exceptions, so they override the timing rows. S11 can get a mode-2 plan instead of a debrief table. A broken agreement quoted in the middle of a meeting gets a 400–600-word answer.
- **Evidence:** :29 «A quoted message goes to the mode of its topic»; :42 «a broken result or agreement → mode 2 first»; :39–40 are the timing rows; scenarios S10 and S11.
- **Fix:** add «Timing is decided first: live → 7, a past talk to analyse → 8 (using the topic's reference); the quoted-message rule and precedence pick among 1–6».

**I2 — merged into I1** (same root cause). Numbering continues at I3.

**I3 — important — SKILL.md:107–120 (mode 3).**
- **Wrong behaviour:** U1 now sends quoted messages to mode 3, but mode 3 has no part for a reply to the employee. Under «nothing else» (:51), R1 «Я выгорел, думаю уходить. Что ответить?» and R3 «Поднимите на 30%, иначе уйду» get no reply text. The old route through mode 1 had one.
- **Evidence:** the mode 3 parts are 1–4, with no «Текст сотруднику»; probes R1 P2 and R3 need one.
- **Fix:** add «5. Ответ сотруднику (when a message is quoted): invite a one-to-one, no promise, no figure».

**I4 — important — SKILL.md:172 against :173–174, and :83–84.**
- **Wrong behaviour:** «labelled by its intent, not by a condition» rules out the only way to carry the scope «only for lost management context…». That term is not defined in SKILL.md. situational.md:185 defines it as «не берёт задачи, торгуется, уходит от ответственности», which the excuse itself shows, so the scope either always applies or blocks every directive reply.
- **Result:** in S10 the model either drops every directive reply (C3 fails) or gives one with no scope.
- **Fix:** define the term in SKILL.md and add «give a directive reply only when the message shows it (open refusal or bargaining, a new person or a new team); otherwise перепроверить гипотезу, and «Не делать: распоряжение»».

**I5 — important — SKILL.md:18 against :19.**
- **Wrong behaviour:** S12 «Мой руководитель написал… пятница нереально» fits both rows. Picking :18 produces one line plus an offer, and the SMART clarification reply is lost.
- **Fix:** add «A message from one's own manager → the upward contract; row 18 only when the user asks how to get resources or dates».

**M1 — minor — SKILL.md:104.**
- **Wrong behaviour:** ««понимаю» only about the situation» bans the course's own table answer «Я понимаю вашу позицию».
- **Evidence:** feedback-control.md:305 and :308–310 say «situation or the position».
- **Fix:** «about the situation or the position, never the person's feelings».

**M2 — minor — SKILL.md:127–128.**
- **Problem:** «with D2 only single coaching questions after instruction» has no label in SKILL.md, though development.md:24 marks it «вывод, не из курса».
- **Fix:** add «(вывод, не из курса)».

**M3 — minor — SKILL.md:118.**
- **Problem:** «(end with them)» turns the course's «например» into an instruction again; motivation.md:22 has the softened wording.
- **Fix:** «(the course suggests ending with them)».

**M4 — minor — SKILL.md:55 against :164.**
- **Problem:** the hypotheses rule requires a signal plus a way to check it, but the mode 7 contract has only a signal and says «nothing else». One of the two rules gets broken.
- **Fix:** at :55 add «in mode 7 the signal alone; a reply can serve as the check».

**M5 — minor — SKILL.md:33 against :35.**
- **Problem:** «не хочу вести этот проект» fits both rows and nothing decides between them.
- **Fix:** «refusing one task → 1; losing interest in the work in general → 3».

**M6 — minor — SKILL.md:21–25.**
- **Problem:** nothing forbids «Принял задачу»; the support from step (2) has no place in step (3); «когда» reopens Friday; step (4) does not say whether to load negotiation-coach.
- **Fix:** «(3) no acceptance and no date; ask for support as a ресурсы question; (4) load negotiation-coach only when the user asks».

**M7 — minor — SKILL.md:42 against :51.**
- **Problem:** «motivation comes after» has no place under «nothing else».
- **Fix:** «motivation is a later conversation, named in the agreement line».

**M8 — minor — SKILL.md:114.**
- **Problem:** «test with the «легенда»» makes the legend general, but motivation.md:65 limits it to the first test sent to the whole team. A single disengaged senior would get a «Коллеги…» text.
- **Fix:** «a test (with the «легенда» when it is the team's first)».

**M9 — minor — SKILL.md:54.**
- **Problem:** «about 400–600» for modes 5 and 8 is tight. GREEN S8 (about 880 words) and S11 (about 1,000) met every criterion. C2 in S8 is likely to suffer.
- **Fix:** modes 5 and 8 «about 600–800».

**M10 — minor — the boundary test was not updated everywhere.**
- **Problem:** README.md and spec.md («Boundary with negotiation-coach») still use the «can say нет» test that U8 replaced. A reader assumes a report who refuses belongs to negotiation-coach.
- **Fix:** «own report or candidate → this skill, even when they can refuse».

**M11 — minor — SKILL.md:105 and :175.**
- **Problem:** it is not said where «(если это так)» goes. Placed inside the ready phrase in «», the user may read it aloud.
- **Fix:** «after the closing quote mark».

**M12 — minor — SKILL.md:39 against :19.**
- **Problem:** «руководитель сейчас на встрече говорит: к пятнице» goes to mode 7, whose replies include «распоряжение», now aimed at the boss.
- **Fix:** «the «Who is on the other side» table is decided before the modes».

**M13 — minor — hiring.md:231.**
- **Problem:** «derived from the course's scale (квалификация is the easiest to change…)» restates the star reading that :52 now labels, as if it were the course's own.
- **Fix:** «derived from the labelled reading of the stars».

**M14 — minor — overlap with negotiation-coach.**
- **Problem:** negotiation-coach's description fires on «ультиматум, торг, что ответить» and «конфликт с коллегой», and has no reciprocal exclusion. «зам» is not a leadership-coach trigger, so R3 and R5 may load negotiation-coach first.
- **Fix:** add «зам» and «что ответить сотруднику» to leadership-coach (about 40 characters are left). When the owner authorises it, add «Not for one's own report or candidate» to negotiation-coach.

## Noticed, not filed

- **SKILL.md:24 «сколько / критерии».** «критерии» is not in the course SMART list, but the course's S1/S2 rows contain «критерии качества» (m1-workbook:152, :164).
- **SKILL.md:83 sends an open refusal to «перепроверить гипотезу».** situational.md:187 limits that to «neither accepts nor refuses». Harmless: the course's own answer to «Я не хочу» is also a confirmation question.
- **«by role» inside the worksheet line** (SKILL.md:60, situational.md:213). This is skill policy (D6), not a course claim, and it does no harm.
- **The «(не из курса)» label at SKILL.md:144** differs from «вывод, не из курса» used elsewhere. Cosmetic.
- **A manager's deadline combined with a team conflict** gets neither a combined shape nor a precedence rule. This is covered by the fixes for I5 and M12.
- **Content lost from the previous version:** I found none that a GREEN answer relied on. Every course element cited in the round-1 Q4 table is still in SKILL.md.
