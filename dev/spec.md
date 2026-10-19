# leadership-coach — design spec (2026-10-19)

Owner: Dmitry. Owner's word 2026-10-19: «делай скилл отдельный и публикуй в приватный репо» (after the analysis in
chat recommended a separate skill next to negotiation-coach). The owner skipped further questions, so the design
calls below are the builder's, marked «call». Execution follows superpowers:writing-skills (RED baseline → GREEN
skill → REFACTOR); no separate plan document, as for negotiation-coach.

## Goal

A self-contained personal skill that applies the Sber Mini-MBA course «Лидерство и управление людьми» to the
owner's real work with their own people: reading and answering a report's message, setting and handing over tasks,
control and feedback, motivation, development and coaching, hard conversations up to dismissal, hiring, team
conflicts and team diagnosis, live help in a conversation, and a debrief afterwards. Works in Claude Code and
Codex from `~/.agents/skills`; the same package can be uploaded to claude.ai.

## Decisions

| # | Decision | Consequence |
|---|---|---|
| D1 | Separate skill, sibling of negotiation-coach (owner) | NC stays a one-course skill; the boundary is the power relation (below) |
| D2 | Self-contained: course knowledge lives in `references/`; no runtime dependence on the course folder (call, as NC) | larger references; works on any device |
| D3 | Answers never cite locators: slides, webinars, lecturer, timestamps, decks, transcripts (call, as NC) | fidelity is checked once at build time; traces stay outside the repo |
| D4 | Course models and vocabulary only. Where the course is silent, say so and offer the nearest course tool; a transfer of a course tool to a new situation is labelled «вывод, не из курса» (call) | honest about gaps (written messages, managing up, peers) |
| D5 | One skill, eight modes, one trigger description (call) | one knowledge base; shared mode template keeps SKILL.md in budget |
| D6 | No persistent state and no labels about named people: a diagnosis is per person × task, lives in the answer, and is never saved as a judgement about a named person; people are referred to by role (call) | nothing to maintain; no store of judgements about colleagues |
| D7 | Corporate mail lens is out of scope here; a Mail Copilot feature, if wanted, is a separate distilled copy built and reviewed in that product (call, from the analysis) | no cross-product coupling |
| D8 | Published to a private GitHub repo `TPuHo4u/leadership-coach-skill` (owner) | `gh repo create --private`, first commit pushed |
| D9 | SKILL.md cap raised from the inherited 2,000 to 2,500 words after review round 1 (call) | eight modes plus routing precedence and the upward contract measured 2,399 words; knowledge stays in references; the skill loads only on leadership topics |

Necessity row (persistent state): omitted. Cost of omitting = the user retells the situation or pastes the earlier
sheet. Cheapest alternative = a file the user names when asking to save. Measurement that would justify a store:
the owner asks for it twice.

## Boundary with negotiation-coach

The test is the reporting line, not the topic (revised after review round 1). The owner's own reports, team and
candidates — this skill, even when they can refuse (a raise, leaving): the owner has authority (diagnosis, style,
task, control, feedback, escalation). Agreement needed from someone outside the owner's line — a peer, an adjacent
team, a contractor, or the owner's own manager on resources, scope or dates — negotiation-coach. A task or message
from the owner's own manager gets the upward contract: a labelled transfer of the course's nearest tools (the style
the manager seems to use, the support to ask for) and a clarifying reply that accepts no date; the deadline itself
goes to negotiation-coach. Exam preparation has its own trainer; legal grounds and HR procedure are out of scope.

## Budgets

- SKILL.md ≤ 2,500 words (gate; D9). One shared template per mode: *first check → output parts in order →
  reference to load*, plus router with precedence, the upward contract and shared rules (the RED failure patterns
  live in `dev/baseline/README.md`; a «Common mistakes» table was dropped from SKILL.md after round 3 because its
  rows duplicated the shape rule and the mode 2 contract).
- Each reference ≤ 30,000 bytes (gate), target about 26 KB. Prose in English with Russian course terms; all phrases
  meant to be said or sent are in Russian (house convention).
- Frontmatter ≤ 1,024 characters; description starts with «Use when», third person, triggers only.

## Modes (provisional; final contracts are written after RED)

| Mode | Typical input | Core of the output | Reference |
|---|---|---|---|
| 1 Задача и стиль | a report's message or request; a task to set or hand over | D-level for this person × task as a hypothesis with signals and one check; style S1–S4; task statement for that style (SMART of the course, «продать задачу», control points); open questions to check understanding | `situational.md` |
| 2 Контроль и обратная связь | a missed deadline, a result to praise, a repeated breach, a dismissal | cause analysis before the talk (справился / внешние / не смог / не хотел); positive or corrective feedback with phrases; the escalation rung and its rules; dismissal talk | `feedback-control.md` |
| 3 Мотивация | lost interest, burnout, a request for a raise, team motivation | how to determine motivation; diagnostic conversation plan; hygiene vs motivating factors; next steps | `motivation.md` |
| 4 Развитие и коучинг | a development request, «реши за меня», a coaching session to prepare | role by level (наставник / коуч / ментор); mentoring steps or a GROW plan with questions; coach behaviour and ineffective questions | `development.md` |
| 5 Подбор | a vacancy, an interview to prepare, candidates to decide on | К-М-Ц profile; interview structure; STAR / PARLA questions and the funnel; decision logic | `hiring.md` |
| 6 Команда | a conflict between team members, team diagnosis, a new or merged team | «люди или процессы» check; mediator duty; five dysfunctions, team session; trust; DISC as a labelled hint | `team.md` |
| 7 Здесь и сейчас | what a report just said in a live conversation | fixed contract ≤120 words: what is happening, 2–3 labelled replies, one «не делать» | as needed |
| 8 Разбор | a people conversation that already happened | plan vs fact against the course algorithm; what broke and what it cost; next conversation with phrases | as needed |

## Shared rules (all modes)

- Course models and vocabulary only (D4); the course's own prohibitions are hard rules (no «почему» inside corrective
  feedback, no advice in coaching, coaching not for D1/D2, no ultimatum the manager will not carry out).
- A level is diagnosed for a person × a task, as a hypothesis with the signals behind it and one way to check it;
  never a label for the person in general, never stored (D6). People by role, not by name.
- Reading a written message: the course gives behavioural signals; what transfers to text is marked, everything else
  is «вывод, не из курса». One message is a weak sample; the answer names what to verify in conversation.
- One question per message; a draft with labelled hypotheses beats a second question.
- Russian output, coach tone: direct, specific, no lectures; ready phrases in Russian.
- Out of scope: the course exam, legal and HR procedure, sending anything anywhere.

## Files

```
skills/leadership-coach/
  SKILL.md                         # triggers, other-side table, router, eight mode contracts, shared rules
  references/situational.md        # D1–D4 diagnosis and signals, S1–S4, task setting and delegation, excuses
  references/feedback-control.md   # control points, decision tree, positive / corrective feedback, escalation,
                                   #   dismissal talk, manipulations
  references/motivation.md         # determining motivation, factors, diagnostic conversation, burnout
  references/development.md        # development stages, roles, mentoring steps, coaching and GROW, questions
  references/hiring.md             # К-М-Ц, interview structure, STAR / PARLA, funnel, decision
  references/team.md               # conflict check, trust, five dysfunctions, team session, DISC
dev/                               # this spec, scenarios, RED / GREEN runs, review notes, gate (bash dev/check.sh)
```

Knowledge source at build time: the cited extractions in the course's Codex service folder
(`…/Лидерство и управление людьми/skill-dev/research-2026-10-19/`, built from decks, workbook, transcripts and
homework handouts), spot-checked against the slide renders. Section-to-source traces are written next to them,
not into the repo. No real team names anywhere in the repo; an uncommitted name check runs before every commit.

## Testing (writing-skills TDD)

Twelve scenarios in `dev/scenarios.md` (two for modes 1, 2 and 4; one for each other mode; one managing-up
routing case), realistic bank/IT situations, not the owner's real cases. RED: fresh Sonnet agents, no skill, no
tools; answers verbatim in `dev/baseline/`, judged per criterion with quotes. GREEN: same messages with the skill
read by path; answers in `dev/with-skill/`, judged the same way; the builder re-reads at least three raw answers
against the verdicts. One source-fidelity lens (Opus) over SKILL.md and references. Review budget ≤3 agents per
round. REFACTOR until the criteria hold and the gate passes.

## Deployment

Repo `~/Downloads/Project/leadership-coach-skill`, private GitHub `TPuHo4u/leadership-coach-skill`. Symlinks
(after RED): `~/.agents/skills/leadership-coach → <repo>/skills/leadership-coach`,
`~/.claude/skills/leadership-coach → ../../.agents/skills/leadership-coach`. DEVLOG.md in the repo; one pointer
entry in the course DEVLOG. negotiation-coach is not edited on this authorization; a one-line handoff there is
offered to the owner.
