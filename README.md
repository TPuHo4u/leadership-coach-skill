# leadership-coach

A personal Claude Code / Codex skill that applies the course «Лидерство и управление людьми» to a manager's real
work with their own people: reading and answering a report's message, setting and handing over tasks, control and
feedback, motivation, development and coaching, hard conversations up to dismissal, hiring, team conflicts and team
diagnosis, live help during a conversation («он сказал …, что ответить?») and a debrief afterwards. Self-contained:
all course knowledge lives in `skills/leadership-coach/references/`.

- `skills/leadership-coach/` — the skill (SKILL.md + references). Symlinked from `~/.agents/skills/leadership-coach`
  and `~/.claude/skills/leadership-coach`.
- `dev/` — spec, test scenarios with criteria, baseline (no skill) and with-skill runs, review notes, package gate
  (`bash dev/check.sh`).

Sibling of [negotiation-coach](https://github.com/TPuHo4u/negotiation-coach-skill): this skill covers the people the
user leads — their own reports, team and candidates, even when those can refuse; anything that needs agreement from
someone outside the user's line (their own manager on resources or dates, peers, adjacent teams) belongs to
negotiation-coach. Answers never cite the course materials, and the skill keeps no notes or
labels about named people. The course exam has its own trainer and is out of scope here.
