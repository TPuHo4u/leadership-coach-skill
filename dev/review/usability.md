I could not write the report to `/Users/dmitrijkrasuk/Downloads/Project/leadership-coach-skill/dev/review/usability.md`. The harness refused the Write call with: «Subagents should return findings as text, not write report files». The full report follows, ready for the orchestrator to save at that path.

# Review lens: usability and boundaries — leadership-coach

Date: 2026-10-19. Read-only review. Line numbers are SKILL.md lines (`/Users/dmitrijkrasuk/Downloads/Project/leadership-coach-skill/skills/leadership-coach/SKILL.md`) unless a reference file is named.

## Scope and method

- **What I read.**
  - SKILL.md in full, read the way a loading agent would.
  - Only the reference sections that SKILL.md points to:
    - `situational.md`: all of it.
    - `feedback-control.md`: from the decision tree to «Минимизация рисков».
    - `motivation.md`: the diagnostic talk, «легенда», the self-check, the factors and burnout.
    - `development.md`: roles, mentoring, coach position, GROW, «шапочки», stages.
    - `team.md`: the conflict check, the five vices, the team session, DISC.
    - `hiring.md`: errors, interview structure, the funnel, the decision.
  - From negotiation-coach `SKILL.md`: line 3 (description), lines 17–23 (router) and line 31 (Step 0 gate).
  - `dev/spec.md`, and S1/S12 in `dev/scenarios.md`.
- **No GREEN evidence.** `dev/with-skill/` is empty. Every behaviour claim below is a reading of the instructions, not an observed run.
- **Q2 was run, not argued.** I drafted three mode-7 answers using only reference phrases and counted words with `python3 -I`. Drafts are in `/private/tmp/claude-501/-Users-dmitrijkrasuk/0358512b-b00b-4cef-aa19-69aa11628015/scratchpad/usability/`.
- **Out of scope.** Course fidelity is another lens. Such items are only listed under «Noticed, not filed».

## Findings (most severe first)

### F1 — critical — SKILL.md:25: the first router row matches on message format, not topic
- **Defect.** «quotes a report's message or request» is listed first. Rows 26–27 match on topic, and no rule says topic beats format. Quoting a report's message is the most common input (spec Goal: «reading and answering a report's message»).
- **Failure scenario.** This is likely given the row order, not observed.
  - «Сотрудник написал: "Я выгорел, думаю уходить". Что ответить?» → row 25 → mode 1. The agent gives a D-level, a style, a task text and control points. `motivation.md` is never loaded.
  - «Сотрудник пишет: "Не успел, сдам в понедельник"» after a missed deadline → mode 1 (§9 excuses) instead of the mode-2 tree.
- **Evidence.** SKILL.md:25–27. `motivation.md:7–11` names «просел, asks for a raise, hints at leaving» as triggers for the diagnostic talk. `feedback-control.md:93–96` says the tree comes first after a deadline.
- **Fix.** Row 1 → «a task to set, hand over or delegate, or a report's reply to such a task». Add: «A quoted message goes to the mode of its topic.»

### F2 — important — SKILL.md:42–43 contradicts SKILL.md:73–74 and `feedback-control.md:123`
- **Defect.** The general rule says every cause comes with «one way to check it in conversation». Mode 2 says to verify «before the talk, never inside it». The reference's tree then says «name what to verify in conversation». The skill's own common-mistakes row (:170) lists «Causes asked inside the talk».
- **Failure scenario.** The user does not know why a deadline was missed. The agent follows :42 and suggests asking «Что помешало?» inside the corrective talk. That is a «почему» in disguise, the very error the corrective algorithm forbids.
- **Evidence.** SKILL.md:42–43, 73–74, 170. `feedback-control.md:95–96` (analysis before the conversation), :123, :175–176 (error 1: the question «Почему?»).
- **Fix.** Mode 2: «the cause check is done before the talk (data, people, «Что делали? С кем решали вопрос?»), never inside the corrective talk». Change `feedback-control.md:123` to «verify before the talk».

### F3 — important — SKILL.md:31: «срочно» sends to mode 7 anything that merely sounds urgent
- **Failure scenario.**
  - «Срочно: завтра выходит новичок, надо поставить ему задачу» → mode 7. The user gets a 120-word contract with intents such as «распоряжение» instead of the mode-1 task text with S1, SMART and a check before start.
  - The exact Q5 message also contains «срочно» (see Q5).
- **Evidence.** SKILL.md:31 vs :25 and :57–66.
- **Fix.** Drop «срочно». Mode 7 = «the other person is in the conversation right now (он сейчас сказал…, мы на встрече)».

### F4 — important — SKILL.md:18–19: the boundary rows have no output shape and no handoff mechanism
- **Defect.**
  - :40 requires «the mode's parts in order and nothing else», but the upward row belongs to no mode.
  - «negotiation-coach; say so in one line» and «Deadline or scope → negotiation-coach» do not say whether the agent loads negotiation-coach (Skill tool) or stops.
- **Failure scenario.** Either the user gets a one-line «это не сюда» and no reply text. Or the agent improvises and drafts a reply that offers alternative dates, which is the mistake :173 lists.
- **Evidence.** SKILL.md:18–19, 40, 173. negotiation-coach SKILL.md:31–34: its own gate would classify a manager's deadline as власть иерархии unless «давай обсудим» is allowed, so the handoff is coherent once it is explicit.
- **Fix.** Give the upward row a fixed contract:
  1. One line: no course tool for managing up.
  2. A labelled transfer of at most three lines.
  3. A reply to the manager that only asks SMART questions and names no date.
  4. One line: «Срок и объём — переговоры: подготовлю через negotiation-coach, если нужно». Load negotiation-coach only when the user asks to move the deadline.

### F5 — important — SKILL.md:140–152: mode 7 has no room for §9's scope or the «only if true» caveat
- **Defect.** Mode 7 says «nothing else», which also rules out the one closing question. §9 restricts the directive answers to lost managerial context, a new employee or a new team (`situational.md:209`). The dismissal answers state facts that may only be said «when they are already true» (`feedback-control.md:309`). Neither caveat fits the contract.
- **Failure scenario.**
  - A senior D4 says «Я не успею» in a one-to-one. The agent hands the user «Организуй свою работу, чтобы успеть» (`situational.md:200`).
  - «Я плохо себя чувствую» → the health-capacity phrase (`situational.md:198`), used live with no context.
  - In a dismissal talk the user is given «Все процедуры соблюдены» (`feedback-control.md:301`) or «Все уровни согласованы» as a ready line, though it may be false.
- **Evidence.** SKILL.md:140–152, :67 («scoped as there» exists only in mode 1). `situational.md:209`, `feedback-control.md:309`.
- **Fix.**
  - In mode 7, the directive excuse answers apply only when the user has said the context is lost, the person is new, or the team is new. Otherwise use «перепроверить гипотезу».
  - A ready phrase that asserts a fact gets «(если это так)».

### F6 — important — SKILL.md:143: «Что происходит» invites a bare D-level or type stated as fact
- **Defect.** A single course-term sentence with no signal and no check, under «nothing else», breaks the hypothesis rule at :42.
- **Failure scenario.** «Что происходит: сотрудник в D2, перехват власти» is said about a named report as fact.
- **Evidence.** SKILL.md:42–44 vs :140–143.
- **Fix.** «Что происходит (гипотеза): <термин> — сигнал «<цитата>»».

### F7 — important — SKILL.md:151–152: the mode-7 intent list covers only directive and corrective moves
- **Defect.**
  - The list has no intents for live coaching («А ещё?», a GROW question), the motivation talk («Чем я могу помочь, чтобы балл вырос?») or an interview.
  - It also lacks the manipulation algorithm's steps 3–4: repeat the message without new details, offer a business step.
- **Failure scenario.**
  - In a live burnout one-to-one the agent picks «вопрос о последствиях», a corrective move.
  - A dismissal threat answer gets mislabelled «ответ на отговорку».
- **Evidence.** SKILL.md:151–152. `feedback-control.md:292–295` (algorithm), :297–305 (table). `development.md` GROW frames. `motivation.md:43`.
- **Fix.** Mark the list as examples, or add «повторить решение», «деловой шаг», «вопрос коуча», «вопрос о факторе / балле».

### F8 — important — SKILL.md:3 and :17–18: the boundary is «can say нет», which also covers own reports and candidates
- **Defect.** The spec's test is the power relation (spec D1, «Boundary»). SKILL.md says «someone who can say «нет»» / «someone who can refuse». A report asking for a raise or threatening to leave, retention, or a candidate's offer all fit both skills. LC's description has no pay or leaving triggers, while negotiation-coach has «ультиматум, торг, что ответить».
- **Failure scenario.** «Сотрудник: "поднимите зарплату на 30%, иначе уйду". Что ответить?» → negotiation-coach fires and runs НАОС and concession logic on a report's pay. LC mode 3 (no money first, the diagnostic talk, `motivation.md:31`) never loads.
- **Evidence.** SKILL.md:3, 17–18, 27. negotiation-coach SKILL.md:3. spec.md «Boundary with negotiation-coach». `hiring.md:247–250` has no offer negotiation.
- **Fix.**
  - Phrase the test as the reporting line: «own report or candidate — this skill even when they can refuse».
  - Add triggers: «просит повышения / прибавки», «грозит уйти», «получил оффер», «уволить», «кандидат просит больше».
  - Outside this repo: the reciprocal one-line exclusion in negotiation-coach that the spec already offers.

### F9 — important — SKILL.md:30 and :131–132: no route for a conflict where the user is a party
- **Defect.** Mode 6 assumes the manager is a mediator.
- **Failure scenario.** «У меня конфликт с моим замом: спорит со мной на планёрках при команде» → mode 6. The user gets «медиатор, not судья» and «организуй договорённость между сторонами» while being one of the sides. Alternatively negotiation-coach «Конфликт» (its :21, «colleague / manager / team») fires and frames the user's own report as a negotiation counterpart.
- **Evidence.** SKILL.md:30, 131–133. `team.md:20–26`. negotiation-coach SKILL.md:21.
- **Fix.** Add a row: «conflict between the user and their own report → mode 2 when a standard or agreement is broken, else mode 3/4 by cause; mode 6 only when the user is not a party».

### F10 — important — SKILL.md:25–32: no precedence when two rows fit
- **Failure scenario.**
  - «После отказа в повышении стал работать спустя рукава, сорвал два срока» matches rows 26 and 27. Mode 3 starts a motivation diagnostic and skips feedback on the breaches. The reference says «he owns his own motivation; do not start persuading» (`feedback-control.md:118–119`).
  - «Вчера договорились на пятницу, сегодня пятница — ничего нет» matches rows 26 and 32. Mode 8 produces a debrief table, while the user needs rung 2.
- **Evidence.** SKILL.md:26–27, 32, 80–82, 160.
- **Fix.** Add a precedence line: «a broken result or agreement → mode 2 first (the tree decides; motivation follows); mode 8 only when the user asks to analyse the past talk».

### F11 — minor — SKILL.md:1137 bytes? No — see F11 below
*(placeholder removed; numbering continues)*

### F11 — minor — SKILL.md:47–49: the values-«почему» exemption can be stretched
- **Failure scenario.** Inside corrective feedback: «Почему для тебя этот срок оказался не важен?» passes as a «values question».
- **Evidence.** SKILL.md:47–49. `development.md:205–206` scopes the exemption to the GROW goal. `motivation.md:44` scopes «Почему именно 4?» to the motivation talk.
- **Fix.** «Allowed only in the GROW «Цель» block and the motivation talk; no «почему» of any kind inside corrective feedback.»

### F12 — minor — SKILL.md:67 and :151: «перепроверить гипотезу» collides with «hypothesis» used for D-levels (:42, :59)
- **Failure scenario.** An agent reading only SKILL.md in mode 7 takes the intent as «re-check the level». It offers diagnostic questions instead of «Задача за тобой, договорились?».
- **Evidence.** `situational.md:187–191`.
- **Fix.** Gloss it: «перепроверить гипотезу (закрепить, что задача принята)».

### F13 — minor — SKILL.md:42 omits «style» from the hypotheses list, while :19 asks for the manager's style
- **Failure scenario.** «Твой руководитель работает в S4 и тебя бросил» is stated as fact about a named person. This is the failure S12 C4 tests (scenarios.md:168).
- **Fix.** Add «style» to :42.

### F14 — minor — SKILL.md:46 vs the references' written worksheets about individuals
- **Defect.** «No labels kept» binds the agent only. The references tell the manager to write named-person diagnoses:
  - the self-check of four factors for three reports (`motivation.md:78–79`);
  - the map «rows = people» with a level per cell (`situational.md:213`);
  - the factor table (`motivation.md:52`).
- **Second defect.** The spec's necessity row allows «a file the user names when asking to save». :46 says «never save», so a «сохрани это» from the user has no defined answer.
- **Fix.** One line: course worksheets are the manager's working notes, by role, levels per task; the motivation table only with the employee's permission. On «сохрани», save the plan and agreements, not a judgement.

### F15 — minor — SKILL.md:86–87 and :172 vs `feedback-control.md:302`: two instructions that cannot both be followed
- **Defect.**
  - «name the emotion or situation, not the decision» can be read as «don't mention the decision». The algorithm actually repeats it («Решение остаётся», :293).
  - :172 marks «Я понимаю, что тебе тяжело» as a mistake. The reference's ready answer to an appeal to pity is «Я понимаю сложность ситуации».
- **Fix.** «Признать эмоцию или ситуацию, решение не менять и повторить без новых деталей»; say «Я понимаю» only about the situation, never about the person (the reference's own safe reading, :307–308).

### F16 — minor — SKILL.md:3: the description fires on negotiation-coach territory and misses common phrasings
- **Failure scenario.** «Как выбить у руководителя бюджет на найм в мою команду?» → «моя команда» / hiring fire → LC loads → a one-line hand-off (:18).
- **Missing phrasings:** «подчинённая / сотрудница», «джун / новичок», «не справляется / косячит / саботирует», «уволить» (verb), «ИПР», «токсичный», «команда не тянет», «что ответить сотруднику».
- **Fix.** Add these triggers. Extend «Not for» with «asking one's own manager for resources, headcount or dates».

### F17 — minor — SKILL.md:121–122: «per profile line one STAR or PARLA question» conflicts with «the funnel for motivation»
- **Failure scenario.** The motivation line of the profile gets a STAR question.
- **Evidence.** `hiring.md:113–116` (motivation → воронка; course does not map STAR to motivation).
- **Fix.** «Qualification and values lines: STAR/PARLA; motivation: the funnel.»

### F18 — minor — SKILL.md:135: English «five dysfunctions» and «индикаторы» drift from the course terms
- **Defect.** The course terms are «Пять пороков команды» (`team.md:86`) and the step «Заземлить» (`team.md:114`).
- **Failure scenario.** Russian answers say «пять дисфункций», against :10 («in the course's vocabulary»).
- **Fix.** Use the Russian course terms in SKILL.md.

### F19 — minor — SKILL.md:33: the «unclear» question asks only about timing
- **Failure scenario.** «Помоги с сотрудником» gets «Разговор ещё впереди…» while the unknown is the topic.
- **Fix.** Unclear topic → «Что именно произошло?»; unclear timing → the timing question.

### F20 — minor — «First check» lines (:57, :71, :91, :104, :119, :128) read as questions for the user
- **Failure scenario.** Mode 1 lists three checks. The agent asks three questions, or stops to ask instead of drafting. This goes against :41 and the spec («a draft with labelled hypotheses beats a second question»).
- **Fix.** «First check (from the message; anything missing → a labelled assumption; at most one question, at the end).»

## Attacking questions

### Q1 — five boundary messages

| # | Message | What the text selects | Right? |
|---|---|---|---|
| 1 | Own report vs peer: «Смежная команда опять не прислала данные, из-за этого мой аналитик сорвал отчёт. Что сказать ему и что их лиду?» | LC row 17 + row 26 → mode 2; the peer part hits row 18 | Partly. Mode 2 should take the «внешние причины» branch → сориентировать (`feedback-control.md:104–110`). The router assumes one other side, so the agent may run corrective feedback on the report or drop the peer part. A split rule is needed. |
| 2 | Live vs preparation: «Срочно: завтра у меня разговор с сотрудником, который грубит на встречах» | Row 31 «срочно» → mode 7 (F3) | No. This is preparation → mode 2 (or a conflict with the user as a party, F9). |
| 3 | Debrief vs new talk: «Вчера поговорил с сотрудником о сроках, договорились на пятницу, сегодня пятница — пусто. Что делать?» | Rows 26 and 32 both fit; no precedence (F10) | Should be mode 2, rung 2 with «Что будем делать, если договорённость будет нарушена вновь?». Mode 8 would hand over a debrief table nobody asked for. |
| 4 | Motivation vs feedback: «Сотрудник прислал: "Я выгорел, не вижу смысла"» | Row 25 (quoted message) → mode 1 (F1); negotiation-coach is not triggered | No. Should be mode 3 (burnout, all eight factors, `motivation.md:140–150`). |
| 5 | Team conflict vs one person's breach vs own manager: «Два моих разработчика ругаются, один две недели не делает ревью второму; мой руководитель требует закрыть это к пятнице» | Row 30 → mode 6; row 19 for the manager's deadline | Mode 6 is right: its first check («есть ли одинаково понимаемая договорённость») covers the breach. The manager's deadline should be one labelled line handing it to negotiation-coach. With no output shape for the upward row (F4), the agent may write a reply to the manager inside the mode-6 answer. |

Extra cross-skill case: «Сотрудник: поднимите зарплату или уйду. Что ответить?» → negotiation-coach is more likely than LC (F8). Wrong.

### Q2 — can mode 7 fit 120 words with only reference phrases?

- **Word budget: yes.** Executed counts:
  - Appeal to pity in a dismissal talk: 69 words. Phrases from `feedback-control.md:302`, :293 adapted to «ты», :295.
  - Threat in a dismissal talk: 64 words. Phrases from :293, :299, :295.
  - Excuse «Я не успею»: 46 words. Phrases from `situational.md:200`, :190–191.
- **Labels: no.** The table answers and the algorithm's steps 3–4 have no matching intent in :151–152, so they get mislabelled «ответ на отговорку» (F7).
- **Caveats: no.** The «только если это так» caveat (`feedback-control.md:309`) and the §9 scope (`situational.md:209`) cannot fit, because «Не делать» holds one item and «nothing else» rules out a question (F5).

### Q3 — written diagnosis or a D-level/DISC type stated as fact?

Yes, three paths.
1. Mode 7 «Что происходит» has no room for a signal or a check, so a D-level or «перехват власти» comes out as fact (F6).
2. The upward row asks for the manager's style, but style is missing from the hypotheses list at :42 (F13).
3. The references tell the manager to keep written per-person worksheets (`motivation.md:78–79`, :52; `situational.md:213`). :46 scopes «No labels kept» to the agent only, and an explicit «сохрани» is unresolved (F14).

For DISC I found no path: SKILL.md:136 and `team.md:144`/:164 both hold the «hint, never a label» line.

### Q4 — does every reference name in SKILL.md exist under that name?

| SKILL.md | Reference | Status |
|---|---|---|
| :67 «reference §9» | `situational.md:181` «9. Директивные инструменты» | exact |
| :79 five answers to the consequences question | `feedback-control.md:188` | exact |
| :115 «переодевание шапочек» | `development.md:188` | exact |
| :96 «легенда» | `motivation.md:63` | exact |
| :97 the five steps of the diagnostic talk | `motivation.md:16–21` | exact |
| :99 table «фактор \| что вкладывает \| оценка \| решения» | `motivation.md:52` | exact (longer column names) |
| :93–95 eight factors | `motivation.md:98` | exact |
| :73 tree branches | `feedback-control.md:93` | exact |
| :75 positive feedback: facts → unique ability → impact | `feedback-control.md:127–135` | exact |
| :80 escalation ladder | `feedback-control.md:232` | exact |
| :84–87 dismissal principles, five steps, manipulation | `feedback-control.md:255`, :290 | exact |
| :109–110 mentoring five steps | `development.md:44` | exact |
| :112–114 «свои советы себе посоветуй», silence, «А ещё?», зона контроля, «посмотри на план моими глазами» | `development.md:106`, :101, Решения frames, :142, :182 | exact |
| :115 the development stage | `development.md:218` | exact |
| :63 SMART курса, «продать задачу» | `situational.md:147`, :154 | exact |
| :120–124 К–М–Ц; контакт → основная часть → завершение; STAR/PARLA/funnel; «квалификацию доучим…»; interview errors | `hiring.md:40/65`, :93–95, :129/160/177, :231, :7 | exact |
| :131–133 people or processes; медиатор/судья; «управленческая импотенция» | `team.md:7–14`, :20, :26 | exact |
| :135 «five dysfunctions» | `team.md:86` «Пять пороков команды» | drifted (F18) |
| :135–136 замер → индикаторы → последствия → план | `team.md:113–116`, step 2 «Заземлить» | drifted (F18) |
| :151 «перепроверить гипотезу» | `situational.md:187` | exists; meaning collides (F12) |

Nothing is missing outright.

### Q5 — «Мой руководитель пишет: срочно нужно X к пятнице»

Trace:
1. Skill selection: the LC description (:3, «read a task or message from their own manager») selects LC.
2. Row :19 fires, but row :31 also fires on «срочно».
3. :40 requires «the mode's parts», and the upward row has no mode and no budget.
4. :18–19 do not say whether to load negotiation-coach.

Most likely behaviour: the agent says there is no course tool, labels a style and level transfer, and writes a reply to the manager with SMART questions. Because nothing caps that reply, it may add alternative dates or a «давай обсудим» pitch, which is the in-house negotiation that :173 lists as a mistake. Less likely: it applies the mode-7 contract with directive intents aimed at the boss. negotiation-coach's own gate (its :31–34) would classify the deadline as власть иерархии unless «давай обсудим» is allowed, so the handoff is coherent once the mechanism is written down (F3, F4).

## Noticed, not filed

- SKILL.md:63 groups S2/S3 under one SMART, while `situational.md:117/145` has S3 asking the employee for SMART. Course fidelity, other lens.
- Label strings differ: «(не из курса)» at :123 vs «вывод, не из курса» elsewhere. Cosmetic.
- Mode 1 and mode 4 output contains questions to the employee (understanding check, GROW). This does not break «at most one question», which is about questions to the user.
- The `team.md` DISC «Задача: / Not:» lists effectively assign work by colour. That is course content, held by :136. Fidelity/ethics, other lens.
- The D2 «coaching questions for trust» exception (`development.md:27–29`) could be stretched into full GROW for a D2. The reference's safe reading already constrains it.

## Tally

Critical 1 (F1), important 9 (F2–F10), minor 10 (F11–F20).
