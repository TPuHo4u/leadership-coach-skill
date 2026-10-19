# DEVLOG — leadership-coach skill

## 2026-10-19 — Claude (Opus 5.5, orchestrating Sonnet/Opus agents in workflows) — Skill built from the course «Лидерство и управление людьми»

### What we built
- A self-contained personal skill `leadership-coach`, sibling of negotiation-coach: SKILL.md (other-side table with
  an upward contract, router with timing-first and precedence rules, shared rules, eight mode contracts) + six
  references distilled from the course — `situational.md`, `feedback-control.md`, `motivation.md`, `development.md`,
  `hiring.md`, `team.md` (27–29 KB each).
- Eight modes: Задача и стиль, Контроль и обратная связь (incl. escalation and the dismissal talk), Мотивация,
  Развитие и коучинг, Подбор, Команда, Здесь и сейчас (fixed 120-word contract), Разбор.
- Dev artifacts in `dev/`: spec with decisions D1–D9; twelve scenarios and eight routing probes with observable
  criteria; RED answers with judged verdicts; GREEN answers per round with READMEs; five review reports and the
  adjudication; package gate `dev/check.sh` (frontmatter, Russian and English locator words, page and timestamp
  patterns, sizes, SKILL.md ≤ 2,500 words).
- Outside the repo, in the course's Codex service folder (`…/Лидерство и управление людьми/skill-dev/`): the seven
  cited course extractions (`research-2026-10-19/`, 700 KB), section-to-source traces (`trace/`) and the uncommitted
  real-name check (`names-check.sh` + list).

### Timing
| Stage | Time |
|---|---|
| Analysis in chat: seven parallel readers mapped the course (≈120 tools) and the integration constraints | 12:20–12:51 |
| Owner's word «делай скилл отдельный и публикуй в приватный репо»; spec, scenarios, gate | 13:00–13:13 |
| Workflow 1: six reference writers (Opus) ∥ twelve RED runs (Sonnet) + RED judge | 13:13–13:24 |
| SKILL.md written against the RED patterns; gate | 13:25–13:33 |
| Round 1: GREEN (12) ∥ fidelity lens + usability lens + judge; fixes | 13:33–13:55 |
| Round 2: GREEN (12 + 5 probes) + fix-verification lens + judge; fixes | 13:55–14:08 |
| Round 3: full GREEN + new lens + judge (one slow agent held the workflow ≈110 min); fixes | 14:08–16:05 |
| Round 4 (targeted) and round 5 (label-rule sweep); fixes; stop decision | 16:05–16:28 |

### Key decisions
- **Separate skill, boundary by reporting line.** Own reports, team and candidates stay here even when they can
  refuse (a raise, leaving); agreement from someone outside the user's line goes to negotiation-coach. A message from
  the user's own manager gets an «upward contract»: the course has no managing-up tool, so a labelled transfer and a
  clarifying reply that accepts no date (live form within 120 words).
- **Corporate mail lens deferred** (D7): Mail Copilot is a separate product (Codex-built, git-pull deploy, guide at
  499,819 of 500,000 bytes); a lens there would be its own distilled copy.
- **Contracts for shape failures, the course's own prohibitions for discipline failures** (writing-skills). RED
  answers were good generic advice in the wrong shape (340–690-word playbooks, several questions, no level or style
  named) plus course violations (causes asked inside the corrective talk, «почему», «Я понимаю…» in a dismissal).
- **Routing**: other side first, then timing (live → 7, past talk → 8), then topic among 1–6; a quoted message goes
  to the mode of its topic; a broken result or agreement goes to mode 2 first.
- **One label rule**: what a person says or asks is the course's signal in speech or text alike; «вывод, не из
  курса» marks only what the course does not give — an interpretation, written-only cues (length, tone, emoji,
  reply time), a tool moved to a new situation.
- **Scoped «почему»**: none inside corrective feedback; in coaching avoid «Почему ты…»; «Почему для тебя это
  важно?» and «Почему именно 4?» are the course's own.
- **No labels about named people** (D6); course worksheets are the user's own notes by role.
- **SKILL.md cap 2,500 words** (D9, raised from the inherited 2,000 after round 1).

### Evidence
- RED (`dev/baseline/README.md`): every scenario misses course-specific criteria; patterns classified shape /
  omission / discipline.
- GREEN (`dev/with-skill/README.md`): round 1 57/60 → round 2 66/70 → round 3 (full set, 12 scenarios + 5 probes)
  69/70 → round 4 targeted 37/38 → round 5 targeted 16/16.
- Review (`dev/review/`): round 1 fidelity — critical 0, important 3 (mode contracts drifting from references,
  composed reconciliations shown as course content), verbatim lists and phrase polarity matched the slides; round 1
  usability — 1 critical (router matched on message format), 9 important; rounds 2–5 — no critical, importants
  narrowing from routing regressions to label placement. Every finding adjudicated in `dev/review/adjudication.md`.
- Gate: `bash dev/check.sh` → `GATE: PASS` (frontmatter 923 chars, SKILL.md 2,497 words, references ≤ 29.5 KB, no
  locator words); uncommitted names check → `NAMES: PASS`.

### Insights — worth remembering
- The course never teaches reading written messages; its signals are speech and behaviour. The workable rule is
  not «text = transfer» but «what a person says or asks reads the same in text; written-only cues are transfers».
- A router that matches on message *format* («quotes a report's message») silently overrides topic rows; topic and
  timing must be decided before format.
- Fix rounds that add rules to a capped SKILL.md shift words rather than behaviour once GREEN is clean; the useful
  stop signal was three rounds without a behavioural defect.
- Subagents in this harness cannot write report files; reports come back as text and are saved by the builder.

### What went wrong
- The inherited 2,000-word cap did not fit eight modes plus routing rules; raised once to 2,500 (D9) and then held,
  which forced trades on every later fix.
- The label rule drifted for four rounds (round-2 «transfers only» contradicted a reference; rounds 3–5 swept the
  remaining places): one scheme introduced late and applied file by file.
- A round-4 fix («names the first control point») contradicted the course's partner-style control for S3/S4 and was
  corrected in round 5.

### Next
- Owner: use it on a real case; tighten phrasing where a mode feels off.
- Offered, not made: a one-line reciprocal exclusion in negotiation-coach («own report or candidate → leadership-coach»).
- Mail lens stays deferred (D7) until the owner wants it in Mail Copilot.
